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
                    <p>Date: {{ $sell->created_at->format('Y-m-d H:i') }}</p>

                    <h5>Sell Items</h5>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Unit</th>
                                <th>Quantity</th>
                                <th>Unit Price</th>
                                <th>Total</th>
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
                                <th colspan="3">Subtotal</th>
                                <th>{{ $sell->sellItems->sum('quantity') }}</th>
                                <th></th>
                                <th>{{ $sell->sellItems->sum(function($item) { return $item->unit_price * $item->quantity; }) }}</th>
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

                    <div class="row justify-content-center">
                    <div class="col-md-4 mt-3 card p-2">
                        <p><strong>Total:</strong> {{ $sell->sellItems->sum(function($item) { return $item->unit_price * $item->quantity; }) }}</p>
                        <p><strong>Total Paid:</strong> {{ $sell->payment->paymentItems->sum('amount') }}</p>
                        <p><strong>Total Due:</strong> {{ $sell->sellItems->sum(function($item) { return $item->unit_price * $item->quantity; }) - $sell->payment->paymentItems->sum('amount') }}</p>
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