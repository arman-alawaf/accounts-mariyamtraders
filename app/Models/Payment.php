<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    protected $fillable = ['sell_id', 'buy_id'];

    public function sell()
    {
        return $this->belongsTo(Sell::class);
    }

    public function buy()
    {
        return $this->belongsTo(Buy::class);
    }

    public function paymentItems()
    {
        return $this->hasMany(PaymentItem::class);
    }
}
