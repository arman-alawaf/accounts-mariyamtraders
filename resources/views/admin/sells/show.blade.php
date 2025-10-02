@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>Sell Details</h4>
                    <a href="{{ route('sells.index') }}" class="btn btn-secondary">Back</a>
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
                                <th>Amount</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Note</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($sell->sellItems as $item)
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
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection