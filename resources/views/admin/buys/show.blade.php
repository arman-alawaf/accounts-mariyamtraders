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
                    <p>Date: {{ $buy->date ? \Carbon\Carbon::parse($buy->date)->format('d M Y') : $buy->created_at->format('d M Y') }}</p>

                    <h5>Buy Items</h5>
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
                            @foreach($buy->buyItems as $item)
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
                                <th>{{ $buy->buyItems->sum('quantity') }}</th>
                                <th></th>
                                <th>{{ $buy->buyItems->sum(function($item) { return $item->unit_price * $item->quantity; }) }}</th>
                                <th></th>
                            </tr>
                            @if($buy->discount > 0)
                            <tr>
                                <th colspan="5">Discount</th>
                                <th>{{ $buy->discount }}</th>
                                <th></th>
                            </tr>
                            <tr>
                                <th colspan="5">Total After Discount</th>
                                <th>{{ $buy->buyItems->sum(function($item) { return $item->unit_price * $item->quantity; }) - $buy->discount }}</th>
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

                    <div class="row justify-content-center">
                    <div class="col-md-4 mt-3 card p-2">
                        <p><strong>Subtotal:</strong> {{ $buy->buyItems->sum(function($item) { return $item->unit_price * $item->quantity; }) }}</p>
                        @if($buy->discount > 0)
                        <p><strong>Discount:</strong> {{ $buy->discount }}</p>
                        <p><strong>Total:</strong> {{ $buy->total_amount }}</p>
                        @else
                        <p><strong>Total:</strong> {{ $buy->buyItems->sum(function($item) { return $item->unit_price * $item->quantity; }) }}</p>
                        @endif
                        <p><strong>Total Paid:</strong> {{ $buy->paid_amount }}</p>
                        <p><strong>Total Due:</strong> {{ $buy->due_amount }}</p>
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