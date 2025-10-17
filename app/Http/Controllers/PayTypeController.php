<?php

namespace App\Http\Controllers;

use App\Models\PayType;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class PayTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $payTypes = PayType::select(['id', 'name', 'created_at']);

            return DataTables::of($payTypes)
                ->addIndexColumn()
                ->editColumn('created_at', function ($payType) {
                    return $payType->created_at->setTimezone('Asia/Dhaka')->format('g:i A, j F Y');
                })
                ->addColumn('action', function ($payType) {
                    return '<a href="' . route('pay_types.edit', $payType->id) . '" class="btn btn-warning btn-sm">Edit</a>
                            <form action="' . route('pay_types.destroy', $payType->id) . '" method="POST" style="display:inline;">
                                ' . csrf_field() . '
                                ' . method_field('DELETE') . '
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm(\'Are you sure?\')">Delete</button>
                            </form>';
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('admin.pay_types.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.pay_types.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        PayType::create($request->only(['name']));

        return redirect()->route('pay_types.index')->with('success', 'PayType created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $payType = PayType::findOrFail($id);
        return view('admin.pay_types.show', compact('payType'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $payType = PayType::findOrFail($id);
        return view('admin.pay_types.edit', compact('payType'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $payType = PayType::findOrFail($id);

        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $payType->update($request->only(['name']));

        return redirect()->route('pay_types.index')->with('success', 'PayType updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $payType = PayType::findOrFail($id);
        $payType->delete();

        return redirect()->route('pay_types.index')->with('success', 'PayType deleted successfully.');
    }
}
