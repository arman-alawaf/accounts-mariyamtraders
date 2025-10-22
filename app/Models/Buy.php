<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Buy extends Model
{
    protected $fillable = ['supplier_id', 'supplier_type_id', 'payment_id', 'total_amount', 'paid_amount', 'due_amount', 'discount'];

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }

    public function supplierType()
    {
        return $this->belongsTo(SupplierType::class);
    }

    public function buyItems()
    {
        return $this->hasMany(BuyItem::class);
    }

    public function payment()
    {
        return $this->belongsTo(Payment::class);
    }

    public function buyExpenseItems()
    {
        return $this->hasMany(BuyExpenseItem::class);
    }
}
