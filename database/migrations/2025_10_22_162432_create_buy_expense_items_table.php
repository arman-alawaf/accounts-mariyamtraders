<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('buy_expense_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('buy_id')->constrained('buys')->onDelete('cascade');
            $table->foreignId('expense_name_id')->constrained('expense_names')->onDelete('cascade');
            $table->decimal('amount', 10, 2);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('buy_expense_items');
    }
};
