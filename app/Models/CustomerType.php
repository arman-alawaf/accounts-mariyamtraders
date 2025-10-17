<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CustomerType extends Model
{
    protected $fillable = ['customer_id', 'number'];

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }
}
