@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>Business Reports</h4>
                </div>

                <div class="card-body">
                    <form method="GET" action="{{ route('reports.index') }}" class="mb-4">
                        <div class="row">
                            <div class="col-md-3">
                                <label for="filter">Filter Type</label>
                                <select name="filter" id="filter" class="form-control" onchange="toggleDateFields()">
                                    <option value="daily" {{ request('filter') == 'daily' ? 'selected' : '' }}>Daily</option>
                                    <option value="weekly" {{ request('filter') == 'weekly' ? 'selected' : '' }}>Weekly</option>
                                    <option value="monthly" {{ request('filter') == 'monthly' ? 'selected' : '' }}>Monthly</option>
                                    <option value="yearly" {{ request('filter') == 'yearly' ? 'selected' : '' }}>Yearly</option>
                                    <option value="datewise" {{ request('filter') == 'datewise' ? 'selected' : '' }}>Datewise</option>
                                </select>
                            </div>
                            <div class="col-md-3" id="startDateField" style="display: none;">
                                <label for="start_date">Start Date</label>
                                <input type="date" name="start_date" class="form-control" value="{{ request('start_date') }}">
                            </div>
                            <div class="col-md-3" id="endDateField" style="display: none;">
                                <label for="end_date">End Date</label>
                                <input type="date" name="end_date" class="form-control" value="{{ request('end_date') }}">
                            </div>
                            <div class="col-md-3">
                                <label>&nbsp;</label>
                                <button type="submit" class="btn btn-primary form-control">Filter</button>
                            </div>
                        </div>
                    </form>

                    <div class="row mb-4">
                        <div class="col-md-4">
                            <div class="card bg-success text-white">
                                <div class="card-body">
                                    <h5>Total Sales: ${{ number_format($sellTotal, 2) }}</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bg-danger text-white">
                                <div class="card-body">
                                    <h5>Total Buys: ${{ number_format($buyTotal, 2) }}</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card {{ $netProfit >= 0 ? 'bg-info' : 'bg-warning' }} text-white">
                                <div class="card-body">
                                    <h5>Net Profit: ${{ number_format($netProfit, 2) }}</h5>
                                </div>
                            </div>
                        </div>
                    </div>

                    <h5>Sales Report</h5>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Customer</th>
                                <th>Items</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($sells as $sell)
                                <tr>
                                    <td>{{ $sell->created_at->format('Y-m-d') }}</td>
                                    <td>{{ $sell->customer->name }}</td>
                                    <td>
                                        @foreach($sell->sellItems as $item)
                                            {{ $item->product->name }} ({{ $item->quantity }} {{ $item->unit->name }})<br>
                                        @endforeach
                                    </td>
                                    <td>${{ number_format($sell->sellItems->sum(function($item) { return $item->amount * $item->quantity; }), 2) }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                    <h5 class="mt-4">Buys Report</h5>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Supplier</th>
                                <th>Items</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($buys as $buy)
                                <tr>
                                    <td>{{ $buy->created_at->format('Y-m-d') }}</td>
                                    <td>{{ $buy->supplier->name }}</td>
                                    <td>
                                        @foreach($buy->buyItems as $item)
                                            {{ $item->product->name }} ({{ $item->quantity }} {{ $item->unit->name }})<br>
                                        @endforeach
                                    </td>
                                    <td>${{ number_format($buy->buyItems->sum(function($item) { return $item->amount * $item->quantity; }), 2) }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function toggleDateFields() {
    const filter = document.getElementById('filter').value;
    const startField = document.getElementById('startDateField');
    const endField = document.getElementById('endDateField');
    if (filter === 'datewise') {
        startField.style.display = 'block';
        endField.style.display = 'block';
    } else {
        startField.style.display = 'none';
        endField.style.display = 'none';
    }
}

document.addEventListener('DOMContentLoaded', toggleDateFields);
</script>
@endsection