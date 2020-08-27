<?php

namespace App\Model;

use App\Model\ProductVariant;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Product extends Model
{
    protected $table = 'products';
    protected $hidden = ["updated_at"];
    protected $fillable = ['code', 'style', 'material', "description", "name", "image_main", "image_detail", "id_category", "updated_at", "uri"];

    // relationship of one product -> return variant of product
    public function ListVariant()
    {
        return $this->hasMany(ProductVariant::class, 'id_product', 'id')->where('deleted_at', null);
    }

    // method Model
    public function GetListProduct()
    {
        $ar = [];
        $list = $this::where('deleted_at', null)->get();
        foreach ($list as $item) {
            $item->ListVariant; // lấy xong sẽ bỏ vào relation của json item đó , nếu decode ra sẽ có ***
            $ar[] = json_decode($item);
        }
        return $ar;
    }
}