<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SaleItem extends Model
{
	use SoftDeletes;
	
    /**
     * setup variable mass assignment.
     *
     * @var array
     */
	 
	protected $dates = ['deleted_at'];
	
    protected $fillable = [
        'product_id',
        'price',
        'size',
        'quantity',
        'p_qty',
    ];

    public function getSubtotalAttribute()
    {
        return $this->attributes['price'] * $this->attributes['quantity'];
    }

    public function trackings()
    {
        return $this->morphOne('App\InventoryTracking', 'trackable');
    }

    public function product()
    {
        return $this->belongsTo('App\Product');
    }
}
