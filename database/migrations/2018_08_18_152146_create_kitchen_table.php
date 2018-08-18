<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateKitchenTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('kitchen', function (Blueprint $table) {
            $table->increments('id');
			$table->integer('customer_id')->unsigned()->nullable();
			$table->integer('cashier_id')->unsigned()->nullable();
			$table->integer('table_no')->nullable();
			$table->text('comments')->nullable();
			$table->tinyInteger('status')->nullable();
			$table->string('type')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('kitchen');
    }
}
