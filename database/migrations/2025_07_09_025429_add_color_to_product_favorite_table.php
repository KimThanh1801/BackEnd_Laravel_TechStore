<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('product_favorite', function (Blueprint $table) {
            $table->string('color')->default('black')->after('product_id');
        });
    }

    public function down(): void
    {
        Schema::table('product_favorite', function (Blueprint $table) {
            $table->dropColumn('color');
        });
    }
};