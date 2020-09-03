<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Product_category extends Model
{
    protected $table = 'product_categories';
    protected $fillable = ['id_category', 'id_product'];
}