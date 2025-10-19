@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h4>Customer Type Details</h4>
                    <a href="{{ route('customer_types.index') }}" class="btn btn-secondary">Back</a>
                </div>

                <div class="card-body">
                    <table class="table table-bordered">
                        <tr>
                            <th>ID</th>
                            <td>{{ $customerType->id }}</td>
                        </tr>
                        <tr>
                            <th>Customer Name</th>
                            <td>{{ $customerType->customer->name ?? 'N/A' }}</td>
                        </tr>
                        <tr>
                            <th>TransactionMethod</th>
                            <td>{{ $customerType->number }}</td>
                        </tr>
                        <tr>
                            <th>Created At</th>
                            <td>{{ $customerType->created_at->setTimezone('Asia/Dhaka')->format('g:i A, j F Y') }}</td>
                        </tr>
                        <tr>
                            <th>Updated At</th>
                            <td>{{ $customerType->updated_at->setTimezone('Asia/Dhaka')->format('g:i A, j F Y') }}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection