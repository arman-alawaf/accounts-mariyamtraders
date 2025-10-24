@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h4>Add Installment Payment for Sell #{{ $sell->id }}</h4>
                    <a href="{{ route('sells.index') }}" class="btn btn-secondary">Back to Sells</a>
                </div>

                <div class="card-body">
                    <div class="mb-3">
                        <strong>Customer:</strong> {{ $sell->customer->name ?? 'N/A' }}<br>
                        <strong>Total Amount:</strong> {{ number_format($sell->total_amount, 2) }}<br>
                        <strong>Paid Amount:</strong> {{ number_format($sell->paid_amount, 2) }}<br>
                        <strong>Due Amount:</strong> {{ number_format($sell->due_amount, 2) }}
                    </div>

                    @if(session('error'))
                        <div class="alert alert-danger">{{ session('error') }}</div>
                    @endif

                    <form action="{{ route('sells.store_installment', $sell) }}" method="POST">
                        @csrf

                        <div id="payment-items">
                            <div class="payment-item mb-3 border p-3">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label for="paytype_id_0" class="form-label">Payment Type</label>
                                        <select name="payment_items[0][paytype_id]" id="paytype_id_0" class="form-control" required>
                                            <option value="">Select Payment Type</option>
                                            @foreach($payTypes as $payType)
                                                <option value="{{ $payType->id }}">{{ $payType->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="amount_0" class="form-label">Amount</label>
                                        <input type="number" name="payment_items[0][amount]" id="amount_0" class="form-control" step="0.01" min="0" max="{{ $sell->due_amount }}" required>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="date_0" class="form-label">Date</label>
                                        <input type="date" name="payment_items[0][date]" id="date_0" class="form-control" value="{{ date('Y-m-d') }}" required>
                                    </div>
                                    <div class="col-md-3 d-flex align-items-end">
                                        <button type="button" class="btn btn-danger remove-item" style="display: none;">Remove</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button type="button" id="add-item" class="btn btn-secondary mb-3">Add Another Payment</button>

                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-primary">Add Installment</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
$(document).ready(function() {
    let itemCount = 1;

    $('#add-item').click(function() {
        const itemHtml = `
            <div class="payment-item mb-3 border p-3">
                <div class="row">
                    <div class="col-md-3">
                        <label for="paytype_id_${itemCount}" class="form-label">Payment Type</label>
                        <select name="payment_items[${itemCount}][paytype_id]" id="paytype_id_${itemCount}" class="form-control" required>
                            <option value="">Select Payment Type</option>
                            @foreach($payTypes as $payType)
                                <option value="{{ $payType->id }}">{{ $payType->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="amount_${itemCount}" class="form-label">Amount</label>
                        <input type="number" name="payment_items[${itemCount}][amount]" id="amount_${itemCount}" class="form-control" step="0.01" min="0" max="{{ $sell->due_amount }}" required>
                    </div>
                    <div class="col-md-3">
                        <label for="date_${itemCount}" class="form-label">Date</label>
                        <input type="date" name="payment_items[${itemCount}][date]" id="date_${itemCount}" class="form-control" value="{{ date('Y-m-d') }}" required>
                    </div>
                    <div class="col-md-3 d-flex align-items-end">
                        <button type="button" class="btn btn-danger remove-item">Remove</button>
                    </div>
                </div>
            </div>
        `;
        $('#payment-items').append(itemHtml);
        itemCount++;
        $('.remove-item').show();
    });

    $(document).on('click', '.remove-item', function() {
        $(this).closest('.payment-item').remove();
        if ($('.payment-item').length === 1) {
            $('.remove-item').hide();
        }
    });
});
</script>
@endpush