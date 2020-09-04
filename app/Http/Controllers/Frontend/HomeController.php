<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Product;
use App\Model\Product_category;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function home() {
        $category_parent = Category::where('parent',0)->where('deleted_at',null)->limit(3)->get();

        $all = [];
        foreach ($category_parent as $item_parent) {
            $pro_cat = Product_category::where('id_category','=',$item_parent->id)->where('deleted_at',null)->limit(8)->get();

                $ar = []; // muốn ar rỗng thay đổi sau mỗi lần lặp danh mục cha thì đặt nó vào trong foreach
                foreach ($pro_cat as $v_pro_cat) {
                    $v_pro_cat->OneProduct; // quan hệ
                    $v_pro_cat->OneVariant; // quan hệ
                    $product = json_decode($v_pro_cat);
                    $product->one_product[0]->one_variant = $product->one_variant;
                    $ar[] = $product->one_product[0];
                }
                $all[$item_parent->id] = $ar;
        }

        return view('Frontend.Home.home',[
            'category_parent' => $category_parent,
            'all' => $all
        ]);
    }
}
