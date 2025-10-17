<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SellItem extends Model
{
    protected $fillable = ['sell_id', 'product_id', 'note', 'unit_id', 'amount', 'quantity', 'unit_price'];

    public function sell()
    {
        return $this->belongsTo(Sell::class);
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
