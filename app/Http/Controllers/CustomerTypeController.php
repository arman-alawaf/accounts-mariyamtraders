<?php

namespace App\Http\Controllers;

use App\Models\CustomerType;
use App\Models\Customer;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class CustomerTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $customerTypes = CustomerType::with('customer')->select(['id', 'customer_id', 'number', 'created_at'])->orderBy('id', 'desc');
            return DataTables::of($customerTypes)
                ->addIndexColumn()
                ->addColumn('customer_name', function ($customerType) {
                    return $customerType->customer ? $customerType->customer->name : 'N/A';
                })
                ->editColumn('created_at', function ($customerType) {
                    return $customerType->created_at->setTimezone('Asia/Dhaka')->format('g:i A, j F Y');
                })
                ->addColumn('action', function ($customerType) {
                    return '<a href="' . route('customer_types.edit', $customerType->id) . '" class="btn btn-warning btn-sm">Edit</a>
                            <form action="' . route('customer_types.destroy', $customerType->id) . '" method="POST" style="display:inline;">
                                ' . csrf_field() . '
                                ' . method_field('DELETE') . '
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm(\'Are you sure?\')">Delete</button>
                            </form>';
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('admin.customer_types.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $customers = Customer::all();
        return view('admin.customer_types.create', compact('customers'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'customer_id' => 'required|exists:customers,id',
            'number' => 'required|string|max:255|unique:customer_types,number',
        ]);

        CustomerType::create($request->only(['customer_id', 'number']));

        return redirect()->route('customer_types.index')->with('success', 'Customer Type created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $customerType = CustomerType::with('customer')->findOrFail($id);
        return view('admin.customer_types.show', compact('customerType'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $customerType = CustomerType::findOrFail($id);
        $customers = Customer::all();
        return view('admin.customer_types.edit', compact('customerType', 'customers'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $customerType = CustomerType::findOrFail($id);

        $request->validate([
            'customer_id' => 'required|exists:customers,id',
            'number' => 'required|string|max:255|unique:customer_types,number,' . $id,
        ]);

        $customerType->update($request->only(['customer_id', 'number']));

        return redirect()->route('customer_types.index')->with('success', 'Customer Type updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $customerType = CustomerType::findOrFail($id);
        $customerType->delete();

        return redirect()->route('customer_types.index')->with('success', 'Customer Type deleted successfully.');
    }

    /**
     * Get customer types by customer ID for AJAX requests.
     */
    public function getByCustomer($customerId)
    {
        $customerTypes = CustomerType::where('customer_id', $customerId)->get(['id', 'number']);
        return response()->json($customerTypes);
    }
}
