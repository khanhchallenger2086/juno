<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class ProductVariant extends Model
{
    protected $table = 'product_variants';

    // public function Product()
    // {
    //     return $this->belongsTo(Product::class, 'id_product', 'id');
    // }
}