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

                        <div class="mb-3">
                            <label for="customer_type_id" class="form-label">Customer Type</label>
                            <select class="form-control select2" id="customer_type_id" name="customer_type_id">
                                <option value="">Select Transaction Method</option>
                            </select>
                            @error('customer_type_id') <div class="text-danger">{{ $message }}</div> @enderror
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
                                        <label>Quantity</label>
                                        <input type="number" class="form-control quantity" name="sell_items[0][quantity]" required>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Unit Price [BDT]</label>
                                        <input type="number" step="0.01" class="form-control unit-price" name="sell_items[0][unit_price]" required>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Total Amount [BDT]</label>
                                        <input type="number" step="0.01" class="form-control amount" name="sell_items[0][amount]" readonly required>
                                    </div>
                                    <div class="col-md-2">
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

                        <div class="mt-3">
                            <h6>Subtotal: <span id="subtotal">0.00</span></h6>
                        </div>

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
                                        <label>Received Amount [BDT]</label>
                                        <input type="number" step="0.01" class="form-control" name="payment_items[0][amount]" required>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-danger remove-payment" style="margin-top: 30px;">Remove</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" id="addPaymentItem" class="btn btn-secondary">Add Payment Item</button>

                        <div class="mt-3">
                            <h6>Total Received [BDT]: <span id="totalPaid">0.00</span></h6>
                            <h6>Receivable Amount [BDT]: <span id="dueAmount">0.00</span></h6>
                        </div>

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

    // Load customer types when customer is selected
    $('#customer_id').on('change', function() {
        var customerId = $(this).val();
        var customerTypeSelect = $('#customer_type_id');

        if (customerId) {
            $.ajax({
                url: '/customer-types-by-customer/' + customerId,
                type: 'GET',
                success: function(data) {
                    customerTypeSelect.empty();
                    customerTypeSelect.append('<option value="">Select Customer Type</option>');
                    $.each(data, function(key, value) {
                        customerTypeSelect.append('<option value="' + value.id + '">' + value.number + '</option>');
                    });
                }
            });
        } else {
            customerTypeSelect.empty();
            customerTypeSelect.append('<option value="">Select Customer Type</option>');
        }
    });

    // Auto calculate sell item amounts and totals
    $(document).on('input', '.unit-price, .quantity', function() {
        var row = $(this).closest('.sell-item');
        var unitPrice = parseFloat(row.find('.unit-price').val()) || 0;
        var quantity = parseFloat(row.find('.quantity').val()) || 0;
        var amount = unitPrice * quantity;
        row.find('.amount').val(amount.toFixed(2));

        calculateSubtotal();
    });

    // Calculate subtotal
    function calculateSubtotal() {
        var subtotal = 0;
        $('.sell-item .amount').each(function() {
            subtotal += parseFloat($(this).val()) || 0;
        });
        $('#subtotal').text(subtotal.toFixed(2));
        calculateDueAmount();
    }

    // Calculate total paid and due amount
    $(document).on('input', '.payment-item input[name*="[amount]"]', function() {
        calculateTotalPaid();
    });

    function calculateTotalPaid() {
        var totalPaid = 0;
        $('.payment-item input[name*="[amount]"]').each(function() {
            totalPaid += parseFloat($(this).val()) || 0;
        });
        $('#totalPaid').text(totalPaid.toFixed(2));
        calculateDueAmount();
    }

    function calculateDueAmount() {
        var subtotal = parseFloat($('#subtotal').text()) || 0;
        var totalPaid = parseFloat($('#totalPaid').text()) || 0;
        var dueAmount = subtotal - totalPaid;
        $('#dueAmount').text(dueAmount.toFixed(2));
    }
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