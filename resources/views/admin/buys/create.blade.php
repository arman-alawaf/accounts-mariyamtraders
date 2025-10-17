@extends('layouts.app')

@section('content')
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Create New Buy</div>

                <div class="card-body">
                    <form id="buyForm" action="{{ route('buys.store') }}" method="POST">
                        @csrf

                        <div class="mb-3">
                            <label for="supplier_id" class="form-label">Supplier</label>
                            <select class="form-control select2" id="supplier_id" name="supplier_id" required>
                                <option value="">Select Supplier</option>
                                @foreach($suppliers as $supplier)
                                    <option value="{{ $supplier->id }}">{{ $supplier->name }}</option>
                                @endforeach
                            </select>
                            @error('supplier_id') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-3">
                            <label for="supplier_type_id" class="form-label">Supplier Type</label>
                            <select class="form-control select2" id="supplier_type_id" name="supplier_type_id">
                                <option value="">Select Supplier Type</option>
                            </select>
                            @error('supplier_type_id') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-3">
                            <label for="date" class="form-label">Date</label>
                            <input type="date" class="form-control" id="date" name="date" value="{{ date('Y-m-d') }}" required>
                            @error('date') <div class="text-danger">{{ $message }}</div> @enderror
                        </div>

                        <h5>Buy Items</h5>
                        <div id="buyItems">
                            <div class="buy-item mb-3 border p-3">
                                <div class="row">
                                    <div class="col-md-2">
                                        <label>Product</label>
                                        <select class="form-control select2 product-select" name="buy_items[0][product_id]" required>
                                            <option value="">Select Product</option>
                                            @foreach($products as $product)
                                                <option value="{{ $product->id }}">{{ $product->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Unit</label>
                                        <select class="form-control select2 unit-select" name="buy_items[0][unit_id]" required>
                                            <option value="">Select Unit</option>
                                            @foreach($units as $unit)
                                                <option value="{{ $unit->id }}">{{ $unit->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Quantity</label>
                                        <input type="number" class="form-control quantity" name="buy_items[0][quantity]" required>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Unit Price</label>
                                        <input type="number" step="0.01" class="form-control unit-price" name="buy_items[0][unit_price]" required>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Amount</label>
                                        <input type="number" step="0.01" class="form-control amount" name="buy_items[0][amount]" readonly required>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Note</label>
                                        <input type="text" class="form-control" name="buy_items[0][note]">
                                    </div>
                                    <div class="col-md-1">
                                        <button type="button" class="btn btn-danger remove-item" style="margin-top: 30px;">Remove</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" id="addBuyItem" class="btn btn-secondary">Add Buy Item</button>

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
                                        <label>Paid Amount</label>
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
                            <h6>Total Paid: <span id="totalPaid">0.00</span></h6>
                            <h6>Due Amount: <span id="dueAmount">0.00</span></h6>
                        </div>

                        <div class="mt-4">
                            <button type="submit" class="btn btn-primary">Create Buy</button>
                            <a href="{{ route('buys.index') }}" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
let buyItemIndex = 1;
let paymentItemIndex = 1;

$(document).ready(function() {
    $('.select2').select2({
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

    // Load supplier types when supplier is selected
    $('#supplier_id').on('change', function() {
        var supplierId = $(this).val();
        var supplierTypeSelect = $('#supplier_type_id');

        if (supplierId) {
            $.ajax({
                url: '/supplier-types-by-supplier/' + supplierId,
                type: 'GET',
                success: function(data) {
                    supplierTypeSelect.empty();
                    supplierTypeSelect.append('<option value="">Select Supplier Type</option>');
                    $.each(data, function(key, value) {
                        supplierTypeSelect.append('<option value="' + value.id + '">' + value.number + '</option>');
                    });
                }
            });
        } else {
            supplierTypeSelect.empty();
            supplierTypeSelect.append('<option value="">Select Supplier Type</option>');
        }
    });

    // Auto calculate buy item amounts and totals
    $(document).on('input', '.unit-price, .quantity', function() {
        var row = $(this).closest('.buy-item');
        var unitPrice = parseFloat(row.find('.unit-price').val()) || 0;
        var quantity = parseFloat(row.find('.quantity').val()) || 0;
        var amount = unitPrice * quantity;
        row.find('.amount').val(amount.toFixed(2));

        calculateSubtotal();
    });

    // Calculate subtotal
    function calculateSubtotal() {
        var subtotal = 0;
        $('.buy-item .amount').each(function() {
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

document.getElementById('addBuyItem').addEventListener('click', function() {
    const buyItems = document.getElementById('buyItems');
    const template = document.querySelector('.buy-item');
    const newItem = template.cloneNode(true);
    const selects = newItem.querySelectorAll('select');
    selects.forEach(select => {
        select.name = select.name.replace(/\[\d+\]/, '[' + buyItemIndex + ']');
        select.value = '';
        if ($(select).hasClass('select2-hidden-accessible')) {
            $(select).select2('destroy');
        }
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
        input.name = input.name.replace(/\[\d+\]/, '[' + buyItemIndex + ']');
        input.value = '';
    });
    buyItems.appendChild(newItem);
    buyItemIndex++;
});

document.getElementById('addPaymentItem').addEventListener('click', function() {
    const paymentItems = document.getElementById('paymentItems');
    const template = document.querySelector('.payment-item');
    const newItem = template.cloneNode(true);
    const selects = newItem.querySelectorAll('select');
    selects.forEach(select => {
        select.name = select.name.replace(/\[\d+\]/, '[' + paymentItemIndex + ']');
        select.value = '';
        if ($(select).hasClass('select2-hidden-accessible')) {
            $(select).select2('destroy');
        }
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
        input.name = input.name.replace(/\[\d+\]/, '[' + paymentItemIndex + ']');
        input.value = '';
    });
    paymentItems.appendChild(newItem);
    paymentItemIndex++;
});

document.addEventListener('click', function(e) {
    if (e.target.classList.contains('remove-item')) {
        e.target.closest('.buy-item').remove();
    }
    if (e.target.classList.contains('remove-payment')) {
        e.target.closest('.payment-item').remove();
    }
});
</script>
@endsection