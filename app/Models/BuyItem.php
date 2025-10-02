<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BuyItem extends Model
{
    protected $fillable = ['buy_id', 'product_id', 'note', 'unit_id', 'amount', 'quantity'];

    public function buy()
    {
        return $this->belongsTo(Buy::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }
}
