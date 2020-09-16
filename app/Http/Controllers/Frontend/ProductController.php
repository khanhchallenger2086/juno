<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Color;
use App\Model\Product;
use App\Model\Product_category;
use App\Model\ProductVariant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public function product($uri)
    {
        $category_parent = (new Category)->CategoryParent();
        $all = (new product)->ProductOfCat_8Item();
        if ($uri == 'tat-ca-san-pham') {
            $id = "";
            $list = Product::where('deleted_at',null)->offset(0)->limit(8)->get();
            $name = 'sản phẩm';
            $amount = DB::select('select count(*) page from `products` where deleted_at is null');
            $amount = array_column($amount, 'page')[0] / 8;
        } else {
            $id = Category::where('deleted_at',null)->where('uri',$uri)->first()->id;
            $name = Category::where('deleted_at',null)->where('uri',$uri)->first()->name;
            $list = Product::with('ListCategory')->where('deleted_at',null)->whereHas('ListCategory',function($a) use($id) {
                $a->where('id_category',$id);
            })->offset(0)->limit(8)->get();
            $amount = DB::select('select count(*) page from `products` p join `product_categories` c on p.id  = c.id_product  where  c.deleted_at is null and c.id_category = ?', [$id]);
            $amount = array_column($amount, 'page')[0] / 8;
        }

        // $style = Product::whereNotNull('style')->groupBy('style')->pluck('style')->all();
        if ($id != "") {
            $style = Product::whereHas('ListCategory',function($a) use($id) {
                $a->where('id_category',$id);
            })->whereNotNull('style')->groupBy('style')->pluck('style')->all();

            $material = Product::whereHas('ListCategory',function($a) use($id) {
                $a->where('id_category',$id);
            })->whereNotNull('material')->groupBy('material')->pluck('material')->all();
            $size = ProductVariant::whereHas('ListCategory',function($a) use($id) {
                $a->where('id_category',$id);
            })->whereNotNull('size')->groupBy('size')->pluck('size')->all();
        } else {
            $style = Product::whereNotNull('style')->groupBy('style')->pluck('style')->all();
            $size = ProductVariant::groupBy('size')->pluck('size')->all();
            $material = Product::whereNotNull('material')->groupBy('material')->pluck('material')->all();
        }
        $color = Color::get()->all();

        return view('Frontend.Product.product', [
            'category_parent' => $category_parent,
            'all' => $all,
            'list' => $list,
            'name' => $name,
            'style' => $style ?? [],
            'material' => $material ?? [],
            'size' => $size ?? [],
            'color' => $color ?? [],
            'id_category' => $id,
            'amount' => ceil($amount)
        ]);
    }


    public function product_detail($uri)
    {
        $category_parent = (new Category)->CategoryParent(); // lặp danh mục menu
        $all = (new product)->ProductOfCat_8Item(); // lặp danh mục có sản phẩm
        $OneProduct = Product::where('uri', $uri)->first();
        $OneProduct->ListVariant;

        return view('Frontend.Product.product-detail', [
            'category_parent' => $category_parent,
            'all' => $all,
            'list' => json_decode($OneProduct)
        ]);
    }
}
