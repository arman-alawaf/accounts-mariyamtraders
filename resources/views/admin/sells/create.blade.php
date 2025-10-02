@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Create New Sell</div>

                <div class="card-body">
                    <form id="sellForm" action="{{ route('sells.store') }}" method="POST">
                        @csrf

                        <div class="mb-3">
                            <label for="customer_id" class="form-label">Customer</label>
                            <select class="form-control select2" id="customer_id" name="customer_id" required>
                                <option value="">Select Customer</option>
                                @foreach($customers as $customer)
                                    <option value="{{ $customer->id }}">{{ $customer->name }}</option>
                                @endforeach
                            </select>
                            @error('customer_id') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>

                        <h5>Sell Items</h5>
                        <div id="sellItems">
                            <div class="sell-item mb-3 border p-3">
                                <div class="row">
                                    <div class="col-md-2">
                                        <label>Product</label>
                                        <select class="form-control select2 product-select" name="sell_items[0][product_id]" required>
                                            <option value="">Select Product</option>
                                            @foreach($products as $product)
                                                <option value="{{ $product->id }}">{{ $product->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Unit</label>
                                        <select class="form-control select2 unit-select" name="sell_items[0][unit_id]" required>
                                            <option value="">Select Unit</option>
                                            @foreach($units as $unit)
                                                <option value="{{ $unit->id }}">{{ $unit->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Amount</label>
                                        <input type="number" step="0.01" class="form-control" name="sell_items[0][amount]" required>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Quantity</label>
                                        <input type="number" class="form-control" name="sell_items[0][quantity]" required>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Note</label>
                                        <input type="text" class="form-control" name="sell_items[0][note]">
                                    </div>
                                    <div class="col-md-1">
                                        <button type="button" class="btn btn-danger remove-item" style="margin-top: 30px;">Remove</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" id="addSellItem" class="btn btn-secondary">Add Sell Item</button>

                        <h5 class="mt-4">Payment Items</h5>
                        <div id="paymentItems">
                            <div class="payment-item mb-3 border p-3">
                                <div class="row">
                                    <div class="col-md-5">
                                        <label>Pay Type</label>
                                        <select class="form-control select2" name="payment_items[0][paytype_id]" required>
                                            <option value="">Select Pay Type</option>
                                            @foreach($payTypes as $payType)
                                                <option value="{{ $payType->id }}">{{ $payType->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-5">
                                        <label>Amount</label>
                                        <input type="number" step="0.01" class="form-control" name="payment_items[0][amount]" required>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-danger remove-payment" style="margin-top: 30px;">Remove</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" id="addPaymentItem" class="btn btn-secondary">Add Payment Item</button>

                        <div class="mt-4">
                            <button type="submit" class="btn btn-primary">Create Sell</button>
                            <a href="{{ route('sells.index') }}" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
let sellItemIndex = 1;
let paymentItemIndex = 1;

document.getElementById('addSellItem').addEventListener('click', function() {
    const sellItems = document.getElementById('sellItems');
    const newItem = document.querySelector('.sell-item').cloneNode(true);
    const selects = newItem.querySelectorAll('select');
    selects.forEach(select => {
        select.name = select.name.replace('[0]', '[' + sellItemIndex + ']');
        select.selectedIndex = 0;
    });
    const inputs = newItem.querySelectorAll('input');
    inputs.forEach(input => {
        input.name = input.name.replace('[0]', '[' + sellItemIndex + ']');
        input.value = '';
    });
    sellItems.appendChild(newItem);
    sellItemIndex++;
});

document.getElementById('addPaymentItem').addEventListener('click', function() {
    const paymentItems = document.getElementById('paymentItems');
    const newItem = document.querySelector('.payment-item').cloneNode(true);
    const selects = newItem.querySelectorAll('select');
    selects.forEach(select => {
        select.name = select.name.replace('[0]', '[' + paymentItemIndex + ']');
        select.selectedIndex = 0;
    });
    const inputs = newItem.querySelectorAll('input');
    inputs.forEach(input => {
        input.name = input.name.replace('[0]', '[' + paymentItemIndex + ']');
        input.value = '';
    });
    paymentItems.appendChild(newItem);
    paymentItemIndex++;
});

$(document).ready(function() {
    $('.select2').select2({
        minimumResultsForSearch: -1, // Always show search
        placeholder: 'Search...',
        allowClear: true,
        width: '100%',
        matcher: function(params, data) {
            if ($.trim(params.term) === '') {
                return data;
            }
            if (typeof data.text === 'undefined') {
                return null;
            }
            if (data.text.toLowerCase().indexOf(params.term.toLowerCase()) > -1) {
                return data;
            }
            return null;
        }
    });
});

document.getElementById('addSellItem').addEventListener('click', function() {
    const sellItems = document.getElementById('sellItems');
    const template = document.querySelector('.sell-item');
    const newItem = template.cloneNode(true);
    const selects = newItem.querySelectorAll('select');
    selects.forEach(select => {
        select.name = select.name.replace(/\[\d+\]/, '[' + sellItemIndex + ']');
        select.value = '';
        // Remove existing Select2
        if ($(select).hasClass('select2-hidden-accessible')) {
            $(select).select2('destroy');
        }
        // Reinitialize
        $(select).select2({
            minimumResultsForSearch: -1,
            placeholder: 'Search...',
            allowClear: true,
            width: '100%',
            matcher: function(params, data) {
                if ($.trim(params.term) === '') {
                    return data;
                }
                if (typeof data.text === 'undefined') {
                    return null;
                }
                if (data.text.toLowerCase().indexOf(params.term.toLowerCase()) > -1) {
                    return data;
                }
                return null;
            }
        });
    });
    const inputs = newItem.querySelectorAll('input');
    inputs.forEach(input => {
        input.name = input.name.replace(/\[\d+\]/, '[' + sellItemIndex + ']');
        input.value = '';
    });
    sellItems.appendChild(newItem);
    sellItemIndex++;
});

document.getElementById('addPaymentItem').addEventListener('click', function() {
    const paymentItems = document.getElementById('paymentItems');
    const template = document.querySelector('.payment-item');
    const newItem = template.cloneNode(true);
    const selects = newItem.querySelectorAll('select');
    selects.forEach(select => {
        select.name = select.name.replace(/\[\d+\]/, '[' + paymentItemIndex + ']');
        select.value = '';
        // Remove existing Select2
        if ($(select).hasClass('select2-hidden-accessible')) {
            $(select).select2('destroy');
        }
        // Reinitialize
        $(select).select2({
            minimumResultsForSearch: -1
        });
    });
    const inputs = newItem.querySelectorAll('input');
    inputs.forEach(input => {
        input.name = input.name.replace(/\[\d+\]/, '[' + paymentItemIndex + ']');
        input.value = '';
    });
    paymentItems.appendChild(newItem);
    paymentItemIndex++;
});

document.addEventListener('click', function(e) {
    if (e.target.classList.contains('remove-item')) {
        e.target.closest('.sell-item').remove();
    }
    if (e.target.classList.contains('remove-payment')) {
        e.target.closest('.payment-item').remove();
    }
});
</script>
@endsection