<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return redirect()->route('login');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::middleware('auth')->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});

Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('/admin', function () {
        return view('admin.index');
    })->name('admin');
    Route::resource('admin/users', App\Http\Controllers\UserController::class)->names([
        'index' => 'admin.users.index',
        'create' => 'admin.users.create',
        'store' => 'admin.users.store',
        'show' => 'admin.users.show',
        'edit' => 'admin.users.edit',
        'update' => 'admin.users.update',
        'destroy' => 'admin.users.destroy',
    ]);
    Route::resource('customers', App\Http\Controllers\CustomerController::class)->names([
        'index' => 'customers.index',
        'create' => 'customers.create',
        'store' => 'customers.store',
        'show' => 'customers.show',
        'edit' => 'customers.edit',
        'update' => 'customers.update',
        'destroy' => 'customers.destroy',
    ]);
    Route::resource('customer_types', App\Http\Controllers\CustomerTypeController::class)->names([
        'index' => 'customer_types.index',
        'create' => 'customer_types.create',
        'store' => 'customer_types.store',
        'show' => 'customer_types.show',
        'edit' => 'customer_types.edit',
        'update' => 'customer_types.update',
        'destroy' => 'customer_types.destroy',
    ]);
    Route::get('customer-types-by-customer/{customerId}', [App\Http\Controllers\CustomerTypeController::class, 'getByCustomer'])->name('customer_types.by_customer');
    Route::resource('suppliers', App\Http\Controllers\SupplierController::class)->names([
        'index' => 'suppliers.index',
        'create' => 'suppliers.create',
        'store' => 'suppliers.store',
        'show' => 'suppliers.show',
        'edit' => 'suppliers.edit',
        'update' => 'suppliers.update',
        'destroy' => 'suppliers.destroy',
    ]);
    Route::resource('supplier_types', App\Http\Controllers\SupplierTypeController::class)->names([
        'index' => 'supplier_types.index',
        'create' => 'supplier_types.create',
        'store' => 'supplier_types.store',
        'show' => 'supplier_types.show',
        'edit' => 'supplier_types.edit',
        'update' => 'supplier_types.update',
        'destroy' => 'supplier_types.destroy',
    ]);
    Route::get('supplier-types-by-supplier/{supplierId}', [App\Http\Controllers\SupplierTypeController::class, 'getBySupplier'])->name('supplier_types.by_supplier');
    Route::resource('pay_types', App\Http\Controllers\PayTypeController::class)->names([
        'index' => 'pay_types.index',
        'create' => 'pay_types.create',
        'store' => 'pay_types.store',
        'show' => 'pay_types.show',
        'edit' => 'pay_types.edit',
        'update' => 'pay_types.update',
        'destroy' => 'pay_types.destroy',
    ]);
    Route::resource('sells', App\Http\Controllers\SellController::class)->names([
        'index' => 'sells.index',
        'create' => 'sells.create',
        'store' => 'sells.store',
        'show' => 'sells.show',
        'edit' => 'sells.edit',
        'update' => 'sells.update',
        'destroy' => 'sells.destroy',
    ]);
    Route::get('sells/{sell}/add-installment', [App\Http\Controllers\SellController::class, 'addInstallment'])->name('sells.add_installment');
    Route::post('sells/{sell}/add-installment', [App\Http\Controllers\SellController::class, 'storeInstallment'])->name('sells.store_installment');
    Route::resource('buys', App\Http\Controllers\BuyController::class)->names([
        'index' => 'buys.index',
        'create' => 'buys.create',
        'store' => 'buys.store',
        'show' => 'buys.show',
        'edit' => 'buys.edit',
        'update' => 'buys.update',
        'destroy' => 'buys.destroy',
    ]);
    Route::get('buys/{buy}/add-installment', [App\Http\Controllers\BuyController::class, 'addInstallment'])->name('buys.add_installment');
    Route::post('buys/{buy}/add-installment', [App\Http\Controllers\BuyController::class, 'storeInstallment'])->name('buys.store_installment');
    Route::get('reports', [App\Http\Controllers\ReportController::class, 'index'])->name('reports.index');
    Route::resource('expense_names', App\Http\Controllers\ExpenseNameController::class)->names([
        'index' => 'expense_names.index',
        'create' => 'expense_names.create',
        'store' => 'expense_names.store',
        'show' => 'expense_names.show',
        'edit' => 'expense_names.edit',
        'update' => 'expense_names.update',
        'destroy' => 'expense_names.destroy',
    ]);
});

Route::middleware(['auth', 'manager'])->group(function () {
    Route::get('/manager', function () {
        return view('manager.index');
    })->name('manager');
});

Route::middleware(['auth', 'admin_or_manager'])->group(function () {
    Route::resource('products', App\Http\Controllers\ProductController::class)->names([
        'index' => 'products.index',
        'create' => 'products.create',
        'store' => 'products.store',
        'show' => 'products.show',
        'edit' => 'products.edit',
        'update' => 'products.update',
        'destroy' => 'products.destroy',
    ]);
    Route::resource('units', App\Http\Controllers\UnitController::class)->names([
        'index' => 'units.index',
        'create' => 'units.create',
        'store' => 'units.store',
        'show' => 'units.show',
        'edit' => 'units.edit',
        'update' => 'units.update',
        'destroy' => 'units.destroy',
    ]);
});
