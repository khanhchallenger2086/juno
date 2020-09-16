<?php

namespace App\Model;

use App\Model\ProductVariant;
use App\Model\Product_category;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Product extends Model
{
    protected $table = 'products';
    protected $hidden = ["updated_at"];
    protected $fillable = ['code', 'style', 'material', "description", "name", "image_main", "image_detail", "updated_at", "uri"];
    protected $guarded = ['id'];

    // relationship of one product -> return variant of product
    public function ListVariant()
    {
        return $this->hasMany(ProductVariant::class, 'id_product', 'id')->where('deleted_at', null);
    }

    public function ListCategory()
    {
        return $this->hasMany(Product_category::class, 'id_product', 'id')->where('deleted_at', null);
    }


    // method Model
    // public function GetListProduct()
    // {
    //     $ar = [];
    //     $list = $this->where('deleted_at', null)->get();
    //     foreach ($list as $item) {
    //         $item->ListVariant; // lấy xong sẽ bỏ vào relation của json item đó , nếu decode ra sẽ có ***
    //         $ar[] = json_decode($item);
    //     }
    //     return $ar;
    // }

    public function GetListProduct($list)
    {
        $ar = [];
        foreach ($list as $item) {
            $item->list_variant = $item->ListVariant; // lấy xong sẽ bỏ vào relation của json item đó , nếu decode ra sẽ có ***
            $item->list_category =  array_column($item->ListCategory->toArray(), 'id_category');
            $ar[] = $item;
        }
        return $ar;
    }

    public function ProductOfCat_8Item()
    {
        $category_parent = Category::where('parent', 0)->where('deleted_at', null)->limit(3)->get();

        $all = []; // trả về 3 danh mục 8 sản phẩm , load 3 th ở category
        foreach ($category_parent as $item_parent) {
            $pro_cat = Product_category::where('id_category', '=', $item_parent->id)->where('deleted_at', null)->limit(8)->get();
            $ar = []; // muốn ar rỗng thay đổi sau mỗi lần lặp danh mục cha thì đặt nó vào trong foreach
            foreach ($pro_cat as $v_pro_cat) {
                $v_pro_cat->OneProduct; // quan hệ // xóa rùi
                $v_pro_cat->OneVariant; // quan hệ
                $product = json_decode($v_pro_cat);
                $product->one_product[0]->one_variant = $product->one_variant;
                $ar[] = $product->one_product[0];
            }
            $all[$item_parent->id] = $ar;
        }

        return $all;
    }
}
