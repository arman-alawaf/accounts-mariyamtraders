<?php

namespace App\Http\Controllers;

use App\Models\ExpenseName;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class ExpenseNameController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $expenseNames = ExpenseName::select(['id', 'name', 'created_at'])->orderBy('id', 'desc');
            return DataTables::of($expenseNames)
                ->addIndexColumn()
                ->editColumn('created_at', function ($expenseName) {
                    return $expenseName->created_at->setTimezone('Asia/Dhaka')->format('g:i A, j F Y');
                })
                ->addColumn('action', function ($expenseName) {
                    return '<a href="' . route('expense_names.edit', $expenseName->id) . '" class="btn btn-warning btn-sm">Edit</a>
                            <form action="' . route('expense_names.destroy', $expenseName->id) . '" method="POST" style="display:inline;">
                                ' . csrf_field() . '
                                ' . method_field('DELETE') . '
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm(\'Are you sure?\')">Delete</button>
                            </form>';
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('admin.expense_names.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.expense_names.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        ExpenseName::create($request->only(['name']));

        return redirect()->route('expense_names.index')->with('success', 'Expense Name created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $expenseName = ExpenseName::findOrFail($id);
        return view('admin.expense_names.show', compact('expenseName'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $expenseName = ExpenseName::findOrFail($id);
        return view('admin.expense_names.edit', compact('expenseName'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $expenseName = ExpenseName::findOrFail($id);

        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $expenseName->update($request->only(['name']));

        return redirect()->route('expense_names.index')->with('success', 'Expense Name updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $expenseName = ExpenseName::findOrFail($id);
        $expenseName->delete();

        return redirect()->route('expense_names.index')->with('success', 'Expense Name deleted successfully.');
    }
}
