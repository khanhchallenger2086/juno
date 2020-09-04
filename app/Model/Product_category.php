<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use App\Model\Product;
use App\Model\ProductVariant;


class Product_category extends Model
{
    protected $table = 'product_categories';
    protected $fillable = ['id_category', 'id_product'];

    public function OneProduct()
    {
        return $this->hasMany(Product::class, 'id', 'id_product')->where('deleted_at', null);
    }

    public function OneVariant()
    {
        return $this->hasMany(ProductVariant::class, 'id_product', 'id_product')->where('deleted_at', null);
    }
}
