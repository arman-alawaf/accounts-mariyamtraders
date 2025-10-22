<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sell extends Model
{
    protected $fillable = ['customer_id', 'customer_type_id', 'payment_id', 'total_amount', 'paid_amount', 'due_amount', 'discount'];

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    public function customerType()
    {
        return $this->belongsTo(CustomerType::class);
    }

    public function sellItems()
    {
        return $this->hasMany(SellItem::class);
    }

    public function payment()
    {
        return $this->belongsTo(Payment::class);
    }

    public function sellExpenseItems()
    {
        return $this->hasMany(SellExpenseItem::class);
    }
}
