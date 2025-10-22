<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BuyExpenseItem extends Model
{
    protected $fillable = ['buy_id', 'expense_name_id', 'amount'];

    public function buy()
    {
        return $this->belongsTo(Buy::class);
    }

    public function expenseName()
    {
        return $this->belongsTo(ExpenseName::class);
    }
}
