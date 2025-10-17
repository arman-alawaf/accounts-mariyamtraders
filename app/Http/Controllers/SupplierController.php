<?php

namespace App\Http\Controllers;

use App\Models\Supplier;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class SupplierController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $suppliers = Supplier::select(['id', 'name', 'company_name', 'phone', 'email', 'address', 'created_at'])->orderBy('id', 'desc');
            return DataTables::of($suppliers)
                ->addIndexColumn()
                ->editColumn('created_at', function ($supplier) {
                    return $supplier->created_at->setTimezone('Asia/Dhaka')->format('g:i A, j F Y');
                })
                ->addColumn('action', function ($supplier) {
                    return '<a href="' . route('suppliers.edit', $supplier->id) . '" class="btn btn-warning btn-sm">Edit</a>
                            <form action="' . route('suppliers.destroy', $supplier->id) . '" method="POST" style="display:inline;">
                                ' . csrf_field() . '
                                ' . method_field('DELETE') . '
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm(\'Are you sure?\')">Delete</button>
                            </form>';
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('admin.suppliers.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.suppliers.create');
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
            'email' => 'required|email|unique:suppliers',
            'address' => 'required|string',
        ]);

        Supplier::create($request->only(['name', 'company_name', 'phone', 'email', 'address']));

        return redirect()->route('suppliers.index')->with('success', 'Supplier created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $supplier = Supplier::findOrFail($id);
        return view('admin.suppliers.show', compact('supplier'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $supplier = Supplier::findOrFail($id);
        return view('admin.suppliers.edit', compact('supplier'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $supplier = Supplier::findOrFail($id);

        $request->validate([
            'name' => 'required|string|max:255',
            'company_name' => 'nullable|string|max:255',
            'phone' => 'required|string|max:255',
            // 'email' => 'required|email|unique:suppliers,email,' . $id,
            'address' => 'required|string',
        ]);

        $supplier->update($request->only(['name', 'company_name', 'phone', 'email', 'address']));

        return redirect()->route('suppliers.index')->with('success', 'Supplier updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $supplier = Supplier::findOrFail($id);
        $supplier->delete();

        return redirect()->route('suppliers.index')->with('success', 'Supplier deleted successfully.');
    }
}
