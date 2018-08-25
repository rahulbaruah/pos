<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SalesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('sales')
            ->update([
			'vat_percent' => setting_by_key("vat"),
			'scharge_percent' => setting_by_key("scharge"),
			'currency' => setting_by_key("currency"),
			's_title' => setting_by_key("title"),
			's_address' => setting_by_key("address"),
			's_phone' => setting_by_key("phone"),
			's_gstin' => setting_by_key("gstin"),
			]);
    }
}
