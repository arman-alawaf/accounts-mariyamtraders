<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PaymentItem extends Model
{
    protected $fillable = ['payment_id', 'paytype_id', 'amount', 'date'];

    public function payment()
    {
        return $this->belongsTo(Payment::class);
    }

    public function paytype()
    {
        return $this->belongsTo(PayType::class);
    }
}
