@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>Buys Management</h4>
                    <a href="{{ route('buys.create') }}" class="btn btn-primary">Create New Buy</a>
                </div>

                <div class="card-body">
                    @if(session('success'))
                        <div class="alert alert-success">{{ session('success') }}</div>
                    @endif

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Supplier</th>
                                <th>Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($buys as $buy)
                                <tr>
                                    <td>{{ $buy->id }}</td>
                                    <td>{{ $buy->supplier->name }}</td>
                                    <td>{{ $buy->created_at->format('Y-m-d') }}</td>
                                    <td>
                                        <a href="{{ route('buys.show', $buy) }}" class="btn btn-info btn-sm">View</a>
                                        <form action="{{ route('buys.destroy', $buy) }}" method="POST" style="display:inline;">
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