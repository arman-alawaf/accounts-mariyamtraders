<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SellExpenseItem extends Model
{
    protected $fillable = ['sell_id', 'expense_name_id', 'amount'];

    public function sell()
    {
        return $this->belongsTo(Sell::class);
    }

    public function expenseName()
    {
        return $this->belongsTo(ExpenseName::class);
    }
}
