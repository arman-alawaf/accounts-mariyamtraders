<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'company_name', 'phone', 'email', 'address'];

    public function customerTypes()
    {
        return $this->hasMany(CustomerType::class);
    }
}
