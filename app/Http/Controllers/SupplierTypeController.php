<?php

namespace App\Http\Controllers;

use App\Models\SupplierType;
use App\Models\Supplier;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class SupplierTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $supplierTypes = SupplierType::with('supplier')->select(['id', 'supplier_id', 'number', 'created_at'])->orderBy('id', 'desc');
            return DataTables::of($supplierTypes)
                ->addIndexColumn()
                ->addColumn('supplier_name', function ($supplierType) {
                    return $supplierType->supplier ? $supplierType->supplier->name : 'N/A';
                })
                ->editColumn('created_at', function ($supplierType) {
                    return $supplierType->created_at->setTimezone('Asia/Dhaka')->format('g:i A, j F Y');
                })
                ->addColumn('action', function ($supplierType) {
                    return '<a href="' . route('supplier_types.edit', $supplierType->id) . '" class="btn btn-warning btn-sm">Edit</a>
                            <form action="' . route('supplier_types.destroy', $supplierType->id) . '" method="POST" style="display:inline;">
                                ' . csrf_field() . '
                                ' . method_field('DELETE') . '
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm(\'Are you sure?\')">Delete</button>
                            </form>';
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('admin.supplier_types.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $suppliers = Supplier::all();
        return view('admin.supplier_types.create', compact('suppliers'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'supplier_id' => 'required|exists:suppliers,id',
            'number' => 'required|string|max:255|unique:supplier_types,number',
        ]);

        SupplierType::create($request->only(['supplier_id', 'number']));

        return redirect()->route('supplier_types.index')->with('success', 'Supplier Type created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $supplierType = SupplierType::with('supplier')->findOrFail($id);
        return view('admin.supplier_types.show', compact('supplierType'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $supplierType = SupplierType::findOrFail($id);
        $suppliers = Supplier::all();
        return view('admin.supplier_types.edit', compact('supplierType', 'suppliers'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $supplierType = SupplierType::findOrFail($id);

        $request->validate([
            'supplier_id' => 'required|exists:suppliers,id',
            'number' => 'required|string|max:255|unique:supplier_types,number,' . $id,
        ]);

        $supplierType->update($request->only(['supplier_id', 'number']));

        return redirect()->route('supplier_types.index')->with('success', 'Supplier Type updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $supplierType = SupplierType::findOrFail($id);
        $supplierType->delete();

        return redirect()->route('supplier_types.index')->with('success', 'Supplier Type deleted successfully.');
    }

    /**
     * Get supplier types by supplier ID for AJAX requests.
     */
    public function getBySupplier($supplierId)
    {
        $supplierTypes = SupplierType::where('supplier_id', $supplierId)->get(['id', 'number']);
        return response()->json($supplierTypes);
    }
}
