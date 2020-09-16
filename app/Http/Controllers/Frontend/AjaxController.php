<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Model\Product;
use App\Model\ProductVariant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class AjaxController extends Controller
{
    public function add_cart_ajax(Request $Rq)
    {
        // session()->flush();
        $total_price = 0;
        $total_buy = 0;

        $product = Product::with('ListVariant')->whereHas('ListVariant', function ($a) use ($Rq) {
            $a->where('id', $Rq->id);
        })->get();

        $variant = ProductVariant::where('id', $Rq->id)->first();
        $product = $product[0];
        $product->variant = $variant->toArray();

        $cart = session()->get('cart') ?? [];
        if (array_key_exists($variant->id, $cart) && $cart[$variant->id]->variant['size'] == $variant->size) {
            $cart[$variant->id]->buy += $Rq->buy;

            foreach ($cart as $item_cart) {
                $total_price += $item_cart->variant['price'] * $item_cart->buy;
                $total_buy += $item_cart->buy;
            }

            session()->put('total_buy', $total_buy);
            session()->put('cart', $cart);

            return response()->json([
                'cart' => $cart,
                'count' =>  $total_buy,
                'total_price' => number_format($total_price). 'đ'
            ], 200);
        } else {
            $product->buy = $Rq->buy;
            $cart[$variant->id] = $product;

            foreach ($cart as $item_cart) {
                $total_price += $item_cart->variant['price'] * $item_cart->buy;
                $total_buy += $item_cart->buy;
            }

            session()->put('total_buy', $total_buy);
            session()->put('cart', $cart);

            return response()->json([
                'id' =>  $Rq->id,
                'add' => 1,
                'cart' => $cart,
                'product' => $product,
                'count' =>  $total_buy,
                'total_price' => number_format($total_price) . 'đ'
            ], 200);
        }
    }

    public function delete_cart_ajax(Request $Rq)
    {
        $total_price = 0;
        $total_buy =   0;
        $cart = session()->get('cart') ?? [];
        // $total_buy = $total_buy - $cart[$Rq->id]->buy;
        // $total_buy =  session()->get('total_buy') ?? 0;
        // $total_buy = $total_buy - $cart[$Rq->id]->buy;
        unset($cart[$Rq->id]);
        if ($cart != []) {
            foreach ($cart as $item_cart) {
                $total_price += $item_cart->variant['price'] * $item_cart->buy;
                $total_buy += $item_cart->buy;
            }
        }

        session()->put('total_buy', $total_buy);
        session()->put('cart', $cart);
        return response()->json([
            'delete' => 1,
            'count' =>  $total_buy,
            'count_cart' => count($cart),
            'total_price' => number_format($total_price),
        ], 200);
    }

    public function update_cart(Request $Rq) {
        $total_price = 0;
        $total_buy = 0;
        $cart = session()->get('cart') ?? [];
        if (isset($cart[$Rq->id])) {
            $cart[$Rq->id]->buy = $Rq->buy;

        }

        foreach ($cart as $item_cart) {
            $total_price += $item_cart->variant['price'] * $item_cart->buy;
            $total_buy += $item_cart->buy;
        }

        return response()->json([
            'id' => $Rq->id,
            'buy' =>  $Rq->buy,
            'price' => number_format($cart[$Rq->id]->variant['price'] * $Rq->buy),
            'total_price' => number_format($total_price),
            'total_buy' => $total_buy
        ], 200);
    }

    public function filter(request $Rq) {

        $color =  $Rq->color ?? [];
        $size =  $Rq->size ?? [];
        $style =  $Rq->style ?? [];
        $material =  $Rq->material ?? [];
        $id_category = $Rq->id_category;

        $list = Product::with('ListVariant')->with('ListCategory');

        if ($style != []) {
            $list = $list->whereIn('style',$style);
        }

        if ($material != []) {
            $list = $list->whereIn('material',$material);
        }

        if ($size != []) {
            $list = $list->whereHas('ListVariant', function ($table) use ($size) {
                $table->whereIn('size', $size);
            });
        }

        if ($color != []) {
            $list = $list->whereHas('ListVariant', function ($table) use ($color) {
                $table->whereIn('color', $color);
            });
        }

        if ($id_category != "") {
            $list->whereHas('ListCategory',function ($table) use($id_category) {
                $table->where('id_category',$id_category);
            });
        }

        $page = $Rq->page;
        $more = $Rq->more;

        if ($more == "more") {
            $page = $page * 8 ;
            $list = $list->where('deleted_at',null)->offset($page)->limit(8)->get();
        } else {
            $list = $list->where('deleted_at',null)->offset($page)->limit(8)->get();
        }
        // var_dump($color);
        // var_dump($style);
        // var_dump($material);
        // var_dump($size);
        return response()->json([
            'list' => $list,
            'size' =>  implode(', ',$size),
            'style' => implode(', ',$style),
            'material' => implode(', ',$material),
            'color' => implode(', ',$color),
            'more' => $more,
            'page' => $Rq->page,
            'amount' => $Rq->amount
        ], 200);
    }
}
