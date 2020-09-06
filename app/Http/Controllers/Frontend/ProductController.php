<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Product;
use App\Model\Product_category;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function product() {
        $category_parent = (new Category)->CategoryParent();
        $all = (new product)->ProductOfCat_8Item();
        $list = Product::where('deleted_at',null)->paginate(8);

        return view('Frontend.product.product',[
            'category_parent' => $category_parent,
            'all' => $all,
            'list' => $list
        ]);
    }


    public function product_detail($uri) {
        $category_parent = (new Category)->CategoryParent();
        $all = (new product)->ProductOfCat_8Item();
        $OneProduct = Product::where('uri',$uri)->first();
        dd($OneProduct);

        return view('Frontend.product.product-detail',[
            'category_parent' => $category_parent,
            'all' => $all,
        ]);
    }
}
