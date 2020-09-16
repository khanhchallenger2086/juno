<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Product;
use App\Model\Product_category;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function home()
    {
        $category_parent = Category::where('parent', 0)->where('deleted_at', null)->limit(3)->get();
        $all = (new Product)->ProductOfCat_8Item();
        // return view('Frontend.Home.home');
        return view('Frontend.Home.home', [
            'category_parent' => $category_parent,
            'all' => $all
        ]);
    }
}
