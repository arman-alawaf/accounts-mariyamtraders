@extends('layouts.app')

@section('content')
<div class="print-area">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>Buy Details</h4>
                    <a href="{{ route('buys.index') }}" class="btn btn-secondary">Back</a>
                    <button onclick="window.print()" class="btn btn-primary float-end">Print</button>
                </div>

                <div class="card-body">
                    <h5>Supplier: {{ $buy->supplier->name }}</h5>
                    <p>Date: {{ $buy->date ? \Carbon\Carbon::parse($buy->date)->format('Y-m-d H:i') : $buy->created_at->format('Y-m-d H:i') }}</p>

                    <h5>Buy Items</h5>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Unit</th>
                                <th>Amount</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Note</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($buy->buyItems as $item)
                                <tr>
                                    <td>{{ $item->product->name }}</td>
                                    <td>{{ $item->unit->name }}</td>
                                    <td>{{ $item->amount }}</td>
                                    <td>{{ $item->quantity }}</td>
                                    <td>{{ $item->amount * $item->quantity }}</td>
                                    <td>{{ $item->note }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <th colspan="2">Subtotal</th>
                                <th>{{ $buy->buyItems->sum('amount') }}</th>
                                <th>{{ $buy->buyItems->sum('quantity') }}</th>
                                <th>{{ $buy->buyItems->sum(function($item) { return $item->amount * $item->quantity; }) }}</th>
                                <th></th>
                            </tr>
                        </tfoot>
                    </table>

                    <h5>Payment Items</h5>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Pay Type</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($buy->payment->paymentItems as $item)
                                <tr>
                                    <td>{{ $item->paytype->name }}</td>
                                    <td>{{ $item->amount }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Subtotal Payment Amount</th>
                                <th>{{ $buy->payment->paymentItems->sum('amount') }}</th>
                            </tr>
                        </tfoot>
                    </table>

                    <div class="mt-3">
                        <p><strong>Total Paid:</strong> {{ $buy->payment->paymentItems->sum('amount') }}</p>
                        <p><strong>Total Due:</strong> {{ $buy->buyItems->sum(function($item) { return $item->amount * $item->quantity; }) - $buy->payment->paymentItems->sum('amount') }}</p>
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
        padding-top:200px;
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