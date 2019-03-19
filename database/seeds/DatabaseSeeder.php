<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name' => 'Admin',
            'email' => 'admin@xcraft.co',
            'password' => bcrypt('password'),
        ]);
		
		DB::table('settings')->insert([
			['key' => 'title', 'label' => 'Site Title', 'value' => ''],
			['key' => 'phone', 'label' => 'Phone', 'value' => ''],
			['key' => 'email', 'label' => 'Email', 'value' => ''],
			['key' => 'address', 'label' => 'Address', 'value' => ''],
			['key' => 'country', 'label' => 'Country', 'value' => ''],
			['key' => 'timing1', 'label' => 'Monday To Saturday', 'value' => '11-30 am to 10-30pm'],
			['key' => 'sunday', 'label' => 'Sunday', 'value' => 'open'],
			['key' => 'facebook', 'label' => 'Facebook', 'value' => ''],
			['key' => 'twitter', 'label' => 'Twitter', 'value' => ''],
			['key' => 'vat', 'label' => 'GST(%)', 'value' => 5],
			['key' => 'scharge', 'label' => 'Service Charge (%)', 'value' => 0],
			['key' => 'delivery_cost', 'label' => 'Delivery Cost', 'value' => 0],
			['key' => 'currency', 'label' => 'Currency', 'value' => 'Rs.'],
			['key' => 'lng', 'label' => 'Longitude', 'value' => ''],
			['key' => 'lat', 'label' => 'Latitude', 'value' => ''],
			['key' => 'stripe', 'label' => 'Stripe Payment', 'value' => 'no'],
			['key' => 'frontend', 'label' => 'Hide Frontend', 'value' => 'yes'],
			['key' => 'promotions', 'label' => 'Receipt Message', 'value' => 'this is a receipt message edit'],
			['key' => 'discount', 'label' => 'Discount', 'value' => 0],
			['key' => 'printer1', 'label' => 'Printer 1', 'value' => ''],
			['key' => 'printer2', 'label' => 'Printer 2', 'value' => ''],
			['key' => 'gstin', 'label' => 'GSTIN', 'value' => ''],
			['key' => 'r_email_1', 'label' => 'Report Email 1', 'value' => ''],
			['key' => 'r_email_2', 'label' => 'Report Email 2', 'value' => '']
		]);
    }
}
