@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>Sells Management</h4>
                    <a href="{{ route('sells.create') }}" class="btn btn-primary">Create New Sell</a>
                </div>

                <div class="card-body">
                    @if(session('success'))
                        <div class="alert alert-success">{{ session('success') }}</div>
                    @endif

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Customer</th>
                                <th>Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($sells as $sell)
                                <tr>
                                    <td>{{ $sell->id }}</td>
                                    <td>{{ $sell->customer->name }}</td>
                                    <td>{{ $sell->created_at->format('Y-m-d') }}</td>
                                    <td>
                                        <a href="{{ route('sells.show', $sell) }}" class="btn btn-info btn-sm">View</a>
                                        <form action="{{ route('sells.destroy', $sell) }}" method="POST" style="display:inline;">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</button>
                                        </form>
                                    </td>
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