<?php

namespace App\Http\Controllers;

use App\Models\PayType;
use Illuminate\Http\Request;

class PayTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $payTypes = PayType::all();
        return view('admin.pay_types.index', compact('payTypes'));
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
