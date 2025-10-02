@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Manager Panel</div>

                <div class="card-body">
                    <p>Welcome to the Manager Panel.</p>
                    <a href="{{ route('products.index') }}" class="btn btn-primary">Manage Products</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection