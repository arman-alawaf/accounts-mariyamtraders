@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>Pay Types Management</h4>
                    <a href="{{ route('pay_types.create') }}" class="btn btn-primary">Add New Pay Type</a>
                </div>

                <div class="card-body">
                    @if(session('success'))
                        <div class="alert alert-success">{{ session('success') }}</div>
                    @endif

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($payTypes as $payType)
                                <tr>
                                    <td>{{ $payType->id }}</td>
                                    <td>{{ $payType->name }}</td>
                                    <td>
                                        <a href="{{ route('pay_types.show', $payType) }}" class="btn btn-info btn-sm">View</a>
                                        <a href="{{ route('pay_types.edit', $payType) }}" class="btn btn-warning btn-sm">Edit</a>
                                        <form action="{{ route('pay_types.destroy', $payType) }}" method="POST" style="display:inline;">
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