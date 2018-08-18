<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class KitchenItem extends Model
{
    protected $table = 'kitchen_items';
	
	protected $fillable = [
        'product_id',
        'size',
        'quantity',
        'p_qty',
    ];
	
	public function product()
    {
        return $this->belongsTo('App\Product');
    }
}
