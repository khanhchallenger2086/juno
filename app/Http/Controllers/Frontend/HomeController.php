<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Product;
use App\Model\Product_category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    public function home()
    {
        $setting = DB::table('setting')->first();
        $category_parent = Category::where('parent', 0)->where('deleted_at', null)->limit(3)->get();
        $all = (new Product)->ProductOfCat_8Item();
        // return view('Frontend.Home.home');
        return view('Frontend.Home.home', [
            'category_parent' => $category_parent,
            'all' => $all,
            'setting' => $setting
        ]);
    }

    public function searchInput(Request $rq) {
        if ($rq->searchInput == 'g') {
            $param = 'Giày';
            $product = Product::where('name', 'LIKE', '%' . $param . '%')->limit(3)->get();
        } elseif ($rq->searchInput == 't') {
            $param = 'Túi';
            $product = Product::where('name', 'LIKE', '%' . $param . '%')->limit(3)->get();
        } else {
            $product = 0;
        }

        return response()->json(['product' => $product,200]);
    }
}
