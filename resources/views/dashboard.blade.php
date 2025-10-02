@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    {{ __('You are logged in!') }}

                    <p>Your role: {{ auth()->user()->role }}</p>

                    @if(auth()->user()->role === 'admin')
                        <a href="{{ route('admin') }}" class="btn btn-primary">Admin Panel</a>
                    @endif

                    @if(auth()->user()->role === 'manager')
                        <a href="{{ route('manager') }}" class="btn btn-secondary">Manager Panel</a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection