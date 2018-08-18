<?php

namespace App;

use DB;
use Illuminate\Database\Eloquent\Model;

class Kitchen extends Model
{
    protected $table = 'kitchen';
	
	protected $fillable = [
        'customer_id',
        'cashier_id',
		'table_no',        
        'type',
        'status',
        'comments',
    ];
	
	public function items()
    {
        return $this->hasMany('App\KitchenItem' , 'kitchen_id');
    }

    public function cashier()
    {
        return $this->belongsTo('App\User', 'cashier_id');
    }

    public function customer()
    {
        return $this->belongsTo('App\Customer');
    }
	
	public static function createAll($input_form)
    {
        return DB::transaction(
            function () use ($input_form) {
                // create object item
                $items = collect($input_form['items'])->map(
                    function ($item) {
                        return new KitchenItem($item);
                    }
                );
                $sales = self::create($input_form);
                $sales->items()->saveMany($items);

                // $trackings = $sales->items->each(function ($item) use ($input_form) {
                // $tracking = new InventoryTracking([
                    // 'product_id' => $item['product_id'],
                // ]);

                // // update qty
                // $product = Product::find($item['product_id']);
                // $product->quantity -= $item['quantity'];
                // $product->save();
                // $item->trackings()->save($tracking);
                // });

                return $sales;
            }
        );
    }
}
