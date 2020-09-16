<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Product;
use Facade\Ignition\DumpRecorder\Dump;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function cart_detail() {
        $category_parent = (new Category)->CategoryParent();
        $all = (new Product)->ProductOfCat_8Item();
        return view('Frontend.Cart.CartDetail',[
            'category_parent' => $category_parent,
            'all' => $all,
        ]);
    }

    public function payment() {
        $cart = session()->get('cart') ?? [];
        if ($cart == []) {
            return redirect()->route('c.cart-detail');
        } else {
            return view('Frontend.Cart.Payment');
        }
    }
}
