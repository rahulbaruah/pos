<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddVatPercentageToSalesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('sales', function (Blueprint $table) {
            $table->double('vat_percent', 10, 2)->after('vat')->nullable();
			$table->double('scharge_percent', 10, 2)->after('scharge')->nullable();
			$table->double('subtotal', 10, 2)->after('status')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('sales', function (Blueprint $table) {
            $table->dropColumn(['vat_percent', 'scharge_percent', 'subtotal']);
        });
    }
}
