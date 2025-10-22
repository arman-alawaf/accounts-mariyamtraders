<?php

namespace App\Http\Controllers;

use App\Models\Buy;
use App\Models\BuyItem;
use App\Models\Payment;
use App\Models\PaymentItem;
use App\Models\Supplier;
use App\Models\Product;
use App\Models\Unit;
use App\Models\PayType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\DataTables;

class BuyController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $query = Buy::with('supplier')->select(['id', 'supplier_id', 'date', 'created_at'])->orderBy('id', 'desc');

            if ($request->has('date') && !empty($request->date)) {
                $query->whereDate('date', $request->date);
            }

            return DataTables::of($query)
                ->addIndexColumn()
                ->addColumn('supplier_name', function ($buy) {
                    return $buy->supplier ? $buy->supplier->name : 'N/A';
                })
                ->editColumn('date', function ($buy) {
                    return $buy->date ? $buy->date->format('Y-m-d') : 'N/A';
                })
                ->editColumn('created_at', function ($buy) {
                    return $buy->created_at->setTimezone('Asia/Dhaka')->format('g:i A, j F Y');
                })
                ->addColumn('action', function ($buy) {
                    return '<a href="' . route('buys.show', $buy->id) . '" class="btn btn-info btn-sm">View</a>
                            <form action="' . route('buys.destroy', $buy->id) . '" method="POST" style="display:inline;">
                                ' . csrf_field() . '
                                ' . method_field('DELETE') . '
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm(\'Are you sure?\')">Delete</button>
                            </form>';
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('admin.buys.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $suppliers = Supplier::all();
        $products = Product::all();
        $units = Unit::all();
        $payTypes = PayType::all();
        return view('admin.buys.create', compact('suppliers', 'products', 'units', 'payTypes'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'supplier_id' => 'required|exists:suppliers,id',
            'supplier_type_id' => 'nullable|exists:supplier_types,id',
            'date' => 'required|date',
            'discount' => 'nullable|numeric|min:0',
            'buy_items' => 'required|array|min:1',
            'buy_items.*.product_id' => 'required|exists:products,id',
            'buy_items.*.unit_id' => 'required|exists:units,id',
            'buy_items.*.unit_price' => 'required|numeric|min:0',
            'buy_items.*.quantity' => 'required|integer|min:1',
            'buy_items.*.note' => 'nullable|string',
            'payment_items' => 'required|array|min:1',
            'payment_items.*.paytype_id' => 'required|exists:pay_types,id',
            'payment_items.*.amount' => 'required|numeric|min:0',
        ]);

        DB::transaction(function () use ($request) {
            $payment = Payment::create();

            // Calculate total amount from buy items
            $totalAmount = 0;
            foreach ($request->buy_items as $item) {
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

            $buy = Buy::create([
                'supplier_id' => $request->supplier_id,
                'supplier_type_id' => $request->supplier_type_id,
                'payment_id' => $payment->id,
                'date' => $request->date,
                'total_amount' => $totalAmountAfterDiscount,
                'paid_amount' => $paidAmount,
                'due_amount' => $dueAmount,
                'discount' => $discount
            ]);

            foreach ($request->buy_items as $item) {
                BuyItem::create([
                    'buy_id' => $buy->id,
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
        });

        return redirect()->route('buys.index')->with('success', 'Buy created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $buy = Buy::with('supplier', 'buyItems.product', 'buyItems.unit', 'payment.paymentItems.paytype')->findOrFail($id);
        return view('admin.buys.show', compact('buy'));
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
        $buy = Buy::findOrFail($id);
        $buy->delete(); // Cascade will handle

        return redirect()->route('buys.index')->with('success', 'Buy deleted successfully.');
    }
}
