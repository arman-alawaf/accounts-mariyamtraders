<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SupplierType extends Model
{
    protected $fillable = ['supplier_id', 'number'];

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }
}
