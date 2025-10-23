@extends('layouts.app')

@section('content')
<div class="print-area">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>Sell Details</h4>
                    <a href="{{ route('sells.index') }}" class="btn btn-secondary">Back</a>
                    <button onclick="window.print()" class="btn btn-primary float-end">Print</button>
                </div>

                <div class="card-body">
                    <h5>Customer: {{ $sell->customer->name }}</h5>
                    <p>Date: {{ $sell->created_at->format('d M Y') }}</p>

                    <h5>Sell Items</h5>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Unit</th>
                                <th>Quantity</th>
                                <th>Unit Price [BDT]</th>
                                <th>Total [BDT]</th>
                                <th>Note</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($sell->sellItems as $item)
                                <tr>
                                    <td>{{ $item->product->name }}</td>
                                    <td>{{ $item->unit->name }}</td>
                                    <td>{{ $item->quantity }}</td>
                                    <td>{{ $item->unit_price }}</td>
                                    <td>{{ $item->unit_price * $item->quantity }}</td>
                                    <td>{{ $item->note }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <th colspan="2">Subtotal</th>
                                <th>{{ $sell->sellItems->sum('quantity') }}</th>
                                <th></th>
                                <th>{{ $sell->sellItems->sum(function($item) { return $item->unit_price * $item->quantity; }) }}</th>
                                <th></th>
                            </tr>
                            @if($sell->discount > 0)
                            <tr>
                                <th colspan="4">Discount</th>
                                <th>{{ $sell->discount }}</th>
                                <th></th>
                            </tr>
                            <tr>
                                <th colspan="4">Total After Discount</th>
                                <th>{{ $sell->sellItems->sum(function($item) { return $item->unit_price * $item->quantity; }) - $sell->discount }}</th>
                                <th></th>
                            </tr>
                            @endif
                        </tfoot>
                    </table>

                    <h5>Payment Items</h5>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Pay Type</th>
                                <th>Amount [BDT]</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($sell->payment->paymentItems as $item)
                                <tr>
                                    <td>{{ $item->paytype->name }}</td>
                                    <td>{{ $item->amount }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Subtotal Payment Amount</th>
                                <th>{{ $sell->payment->paymentItems->sum('amount') }}</th>
                            </tr>
                        </tfoot>
                    </table>

                    @if($sell->sellExpenseItems->count() > 0)
                    <h5>Expense Items</h5>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Expense Name</th>
                                <th>Amount [BDT]</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($sell->sellExpenseItems as $item)
                                <tr>
                                    <td>{{ $item->expenseName->name }}</td>
                                    <td>{{ $item->amount }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Total Expenses</th>
                                <th>{{ $sell->sellExpenseItems->sum('amount') }}</th>
                            </tr>
                        </tfoot>
                    </table>
                    @endif

                    <div class="row justify-content-center">
                    <div class="col-md-4 mt-3 card p-2">
                        <p><strong>Subtotal:</strong> {{ $sell->sellItems->sum(function($item) { return $item->unit_price * $item->quantity; }) }}</p>
                        @if($sell->discount > 0)
                        <p><strong>Discount:</strong> {{ $sell->discount }}</p>
                        <p><strong>Total:</strong> {{ $sell->total_amount }}</p>
                        @else
                        <p><strong>Total:</strong> {{ $sell->sellItems->sum(function($item) { return $item->unit_price * $item->quantity; }) }}</p>
                        @endif
                        @if($sell->sellExpenseItems->count() > 0)
                        <p><strong>Total Expenses:</strong> {{ $sell->sellExpenseItems->sum('amount') }}</p>
                        <p><strong>Grand Total:</strong> {{ $sell->total_amount + $sell->sellExpenseItems->sum('amount') }}</p>
                        @endif
                        <p><strong>Total Received:</strong> {{ $sell->paid_amount }}</p>
                        <p><strong>Total Receivable:</strong> {{ $sell->due_amount }}</p>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
@endsection

<style>
    .print-area {
        /* position: absolute; */
        left: 0;
        top: 0;
        width: 220mm;
        height: 297mm;
        background-image: url({{ asset('pad.jpg') }});
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        -webkit-print-color-adjust: exact;
        print-color-adjust: exact;
        color-adjust: exact;
        padding-top:160px;
        margin:0px auto;
    }
@media print {
    @page {
        size: A4;
        margin: 0;
    }
    body * {
        visibility: hidden;
    }
    .print-area, .print-area * {
        visibility: visible;
    }
    .print-area {
        position: absolute;
        left: 0;
        top: 0;
        width: 210mm;
        height: 297mm;
        background-image: url({{ asset('pad.jpg') }});
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        -webkit-print-color-adjust: exact;
        print-color-adjust: exact;
        color-adjust: exact;
    }
    .container {
        background: transparent;
        padding: 20mm;
        width: 100%;
        height: 100%;
    }
    .card {
        background: transparent;
        box-shadow: none;
        border: none;
    }
    .card-header, .card-body {
        background: transparent;
    }
    .btn {
        display: none !important;
    }
    .table {
        width: 100%;
        margin-bottom: 20px;
        background: rgba(255, 255, 255, 0.9);
    }
    .table th, .table td {
        border: 1px solid #000;
        padding: 8px;
        background: rgba(255, 255, 255, 0.9);
    }
    .mt-3 {
        margin-top: 20px;
        background: rgba(255, 255, 255, 0.9);
        padding: 10px;
    }
}
</style>