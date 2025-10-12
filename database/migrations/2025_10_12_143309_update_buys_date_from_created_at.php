<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        DB::statement('UPDATE buys SET date = DATE(created_at) WHERE date IS NULL');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // No need to reverse this update as it's a data migration
    }
};
