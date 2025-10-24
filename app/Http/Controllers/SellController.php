<?php

namespace App\Http\Controllers;

use App\Models\Sell;
use App\Models\SellItem;
use App\Models\SellExpenseItem;
use App\Models\Payment;
use App\Models\PaymentItem;
use App\Models\Customer;
use App\Models\Product;
use App\Models\Unit;
use App\Models\PayType;
use App\Models\ExpenseName;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\DataTables;

class SellController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $sells = Sell::with('customer')->select(['id', 'customer_id', 'created_at', 'due_amount'])->orderBy('id', 'desc');

            return DataTables::of($sells)
                ->addIndexColumn()
                ->addColumn('customer_name', function ($sell) {
                    return $sell->customer ? $sell->customer->name : 'N/A';
                })
                ->editColumn('created_at', function ($sell) {
                    return $sell->created_at->setTimezone('Asia/Dhaka')->format('g:i A, j F Y');
                })
                ->addColumn('action', function ($sell) {
                    $actions = '<a href="' . route('sells.show', $sell->id) . '" class="btn btn-info btn-sm">View</a>';

                    if ($sell->due_amount > 0) {
                        $actions .= ' <a href="' . route('sells.add_installment', $sell->id) . '" class="btn btn-warning btn-sm">Add Instalment</a>';
                    }

                    $actions .= '
                        <form action="' . route('sells.destroy', $sell->id) . '" method="POST" style="display:inline;">
                            ' . csrf_field() . '
                            ' . method_field('DELETE') . '
                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm(\'Are you sure?\')">Delete</button>
                        </form>';

                    return $actions;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('admin.sells.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $customers = Customer::all();
        $products = Product::all();
        $units = Unit::all();
        $payTypes = PayType::all();
        $expenseNames = ExpenseName::all();
        return view('admin.sells.create', compact('customers', 'products', 'units', 'payTypes', 'expenseNames'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'customer_id' => 'required|exists:customers,id',
            'customer_type_id' => 'nullable|exists:customer_types,id',
            'discount' => 'nullable|numeric|min:0',
            'sell_items' => 'required|array|min:1',
            'sell_items.*.product_id' => 'required|exists:products,id',
            'sell_items.*.unit_id' => 'required|exists:units,id',
            'sell_items.*.unit_price' => 'required|numeric|min:0',
            'sell_items.*.quantity' => 'required|integer|min:1',
            'sell_items.*.note' => 'nullable|string',
            'expense_items' => 'nullable|array',
            'expense_items.*.expense_name_id' => 'required_with:expense_items|exists:expense_names,id',
            'expense_items.*.amount' => 'required_with:expense_items|numeric|min:0',
            'payment_items' => 'required|array|min:1',
            'payment_items.*.paytype_id' => 'required|exists:pay_types,id',
            'payment_items.*.amount' => 'required|numeric|min:0',
        ]);

        DB::transaction(function () use ($request) {
            $payment = Payment::create();

            // Calculate total amount from sell items
            $totalAmount = 0;
            foreach ($request->sell_items as $item) {
                $totalAmount += $item['unit_price'] * $item['quantity'];
            }

            // Calculate paid amount from payment items
            $paidAmount = 0;
            foreach ($request->payment_items as $item) {
                $paidAmount += $item['amount'];
            }

            $discount = $request->discount ?? 0;
            $totalAmountAfterDiscount = $totalAmount - $discount;
            $dueAmount = $totalAmountAfterDiscount - $paidAmount;

            $sell = Sell::create([
                'customer_id' => $request->customer_id,
                'customer_type_id' => $request->customer_type_id,
                'payment_id' => $payment->id,
                'total_amount' => $totalAmountAfterDiscount,
                'paid_amount' => $paidAmount,
                'due_amount' => $dueAmount,
                'discount' => $discount
            ]);

            foreach ($request->sell_items as $item) {
                SellItem::create([
                    'sell_id' => $sell->id,
                    'product_id' => $item['product_id'],
                    'unit_id' => $item['unit_id'],
                    'amount' => $item['unit_price'] * $item['quantity'],
                    'unit_price' => $item['unit_price'],
                    'quantity' => $item['quantity'],
                    'note' => $item['note'] ?? null,
                ]);
            }

            foreach ($request->payment_items as $item) {
                PaymentItem::create([
                    'payment_id' => $payment->id,
                    'paytype_id' => $item['paytype_id'],
                    'amount' => $item['amount'],
                ]);
            }

            if ($request->has('expense_items') && is_array($request->expense_items)) {
                foreach ($request->expense_items as $item) {
                    SellExpenseItem::create([
                        'sell_id' => $sell->id,
                        'expense_name_id' => $item['expense_name_id'],
                        'amount' => $item['amount'],
                    ]);
                }
            }
        });

        return redirect()->route('sells.index')->with('success', 'Sell created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $sell = Sell::with('customer', 'sellItems.product', 'sellItems.unit', 'payment.paymentItems.paytype', 'sellExpenseItems.expenseName')->findOrFail($id);
        return view('admin.sells.show', compact('sell'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        // For simplicity, not implementing edit
        abort(404);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        // For simplicity, not implementing update
        abort(404);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $sell = Sell::findOrFail($id);
        $sell->delete(); // Cascade will handle

        return redirect()->route('sells.index')->with('success', 'Sell deleted successfully.');
    }

    /**
     * Show the form for adding an installment payment.
     */
    public function addInstallment(Sell $sell)
    {
        if ($sell->due_amount <= 0) {
            return redirect()->route('sells.index')->with('error', 'No due amount for this sell.');
        }

        $payTypes = PayType::all();
        return view('admin.sells.add_installment', compact('sell', 'payTypes'));
    }

    /**
     * Store the installment payment.
     */
    public function storeInstallment(Request $request, Sell $sell)
    {
        $request->validate([
            'payment_items' => 'required|array|min:1',
            'payment_items.*.paytype_id' => 'required|exists:pay_types,id',
            'payment_items.*.amount' => 'required|numeric|min:0',
            'payment_items.*.date' => 'required|date',
        ]);

        DB::transaction(function () use ($request, $sell) {
            $totalInstallmentAmount = 0;
            foreach ($request->payment_items as $item) {
                $totalInstallmentAmount += $item['amount'];
            }

            if ($totalInstallmentAmount > $sell->due_amount) {
                throw new \Exception('Installment amount cannot exceed due amount.');
            }

            foreach ($request->payment_items as $item) {
                PaymentItem::create([
                    'payment_id' => $sell->payment_id,
                    'paytype_id' => $item['paytype_id'],
                    'amount' => $item['amount'],
                    'date' => $item['date'],
                ]);
            }

            $sell->update([
                'paid_amount' => $sell->paid_amount + $totalInstallmentAmount,
                'due_amount' => $sell->due_amount - $totalInstallmentAmount,
            ]);
        });

        return redirect()->route('sells.index')->with('success', 'Installment payment added successfully.');
    }
}
