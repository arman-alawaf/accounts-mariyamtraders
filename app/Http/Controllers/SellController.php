<?php

namespace App\Http\Controllers;

use App\Models\Sell;
use App\Models\SellItem;
use App\Models\Payment;
use App\Models\PaymentItem;
use App\Models\Customer;
use App\Models\Product;
use App\Models\Unit;
use App\Models\PayType;
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
            $sells = Sell::with('customer')->select(['id', 'customer_id', 'created_at'])->orderBy('id', 'desc');

            return DataTables::of($sells)
                ->addIndexColumn()
                ->addColumn('customer_name', function ($sell) {
                    return $sell->customer ? $sell->customer->name : 'N/A';
                })
                ->editColumn('created_at', function ($sell) {
                    return $sell->created_at->setTimezone('Asia/Dhaka')->format('g:i A, j F Y');
                })
                ->addColumn('action', function ($sell) {
                    return '<a href="' . route('sells.show', $sell->id) . '" class="btn btn-info btn-sm">View</a>
                            <form action="' . route('sells.destroy', $sell->id) . '" method="POST" style="display:inline;">
                                ' . csrf_field() . '
                                ' . method_field('DELETE') . '
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm(\'Are you sure?\')">Delete</button>
                            </form>';
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
        return view('admin.sells.create', compact('customers', 'products', 'units', 'payTypes'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'customer_id' => 'required|exists:customers,id',
            'customer_type_id' => 'nullable|exists:customer_types,id',
            'sell_items' => 'required|array|min:1',
            'sell_items.*.product_id' => 'required|exists:products,id',
            'sell_items.*.unit_id' => 'required|exists:units,id',
            'sell_items.*.unit_price' => 'required|numeric|min:0',
            'sell_items.*.quantity' => 'required|integer|min:1',
            'sell_items.*.note' => 'nullable|string',
            'payment_items' => 'required|array|min:1',
            'payment_items.*.paytype_id' => 'required|exists:pay_types,id',
            'payment_items.*.amount' => 'required|numeric|min:0',
        ]);

        DB::transaction(function () use ($request) {
            $payment = Payment::create();

            $sell = Sell::create([
                'customer_id' => $request->customer_id,
                'customer_type_id' => $request->customer_type_id,
                'payment_id' => $payment->id
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
        });

        return redirect()->route('sells.index')->with('success', 'Sell created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $sell = Sell::with('customer', 'sellItems.product', 'sellItems.unit', 'payment.paymentItems.paytype')->findOrFail($id);
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
}
