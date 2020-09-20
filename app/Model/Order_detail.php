<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Order_detail extends Model
{
    protected $table = 'order_details';
    protected $fillable = ['id_order','id_product','name_product','price_product','total_price','amount','created_at','deleted_at'];
}
