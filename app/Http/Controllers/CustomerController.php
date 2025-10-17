<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $customers = Customer::select(['id', 'name', 'company_name', 'phone', 'email', 'address', 'created_at'])->orderBy('id', 'desc');
            return DataTables::of($customers)
                ->addIndexColumn()
                ->editColumn('created_at', function ($customer) {
                    return $customer->created_at->setTimezone('Asia/Dhaka')->format('g:i A, j F Y');
                })
                ->addColumn('action', function ($customer) {
                    return '<a href="' . route('customers.edit', $customer->id) . '" class="btn btn-warning btn-sm">Edit</a>
                            <form action="' . route('customers.destroy', $customer->id) . '" method="POST" style="display:inline;">
                                ' . csrf_field() . '
                                ' . method_field('DELETE') . '
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm(\'Are you sure?\')">Delete</button>
                            </form>';
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('admin.customers.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.customers.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'company_name' => 'nullable|string|max:255',
            'phone' => 'required|string|max:255',
            'email' => 'required|email|unique:customers',
            'address' => 'required|string',
        ]);

        Customer::create($request->only(['name', 'company_name', 'phone', 'email', 'address']));

        return redirect()->route('customers.index')->with('success', 'Customer created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $customer = Customer::findOrFail($id);
        return view('admin.customers.show', compact('customer'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $customer = Customer::findOrFail($id);
        return view('admin.customers.edit', compact('customer'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $customer = Customer::findOrFail($id);

        $request->validate([
            'name' => 'required|string|max:255',
            'company_name' => 'nullable|string|max:255',
            'phone' => 'required|string|max:255',
            // 'email' => 'required|email|unique:customers,email,' . $id,
            'address' => 'required|string',
        ]);

        $customer->update($request->only(['name', 'company_name', 'phone', 'email', 'address']));

        return redirect()->route('customers.index')->with('success', 'Customer updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $customer = Customer::findOrFail($id);
        $customer->delete();

        return redirect()->route('customers.index')->with('success', 'Customer deleted successfully.');
    }
}
