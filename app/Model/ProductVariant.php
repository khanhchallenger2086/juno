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

    public function ListCategory()
    {
        return $this->hasMany(Product_category::class, 'id_product', 'id_product')->where('deleted_at', null);
    }
}
