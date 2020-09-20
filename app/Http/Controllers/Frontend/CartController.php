<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Customer;
use App\Model\Order;
use App\Model\Order_detail;
use App\Model\Product;
use Facade\Ignition\DumpRecorder\Dump;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

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

    public function complete_payment(Request $rq) {
        $category_parent = Category::where('parent', 0)->where('deleted_at', null)->limit(3)->get();
        $all = (new Product)->ProductOfCat_8Item();

        $cart = session()->get('cart') ?? [];

        if ($cart != []) {
            $total_order = 0;
            $rq->validate(
                [
                    'name' => 'required',
                    'phone' => 'required',
                    'address' => 'required',
                    'email' => 'required',
                ],
                [
                    "name.required" => 'Vui lòng nhập tên người nhận',
                    'phone.required' => 'Vui lòng nhập số điện thoại',
                    'address.required' => 'Vui lòng nhập địa chỉ',
                    'email.required' => 'Vui lòng nhập địa chỉ email',
                ]
            );
            foreach ($cart as $item_cart) {
                $total_order += $item_cart->variant['price'] * $item_cart->buy;
            }

            $post = $rq->all();
            $post["updated_at"] = null;
            $post["created_at"] = date("Y-m-d H:i:s", strtotime('+7 hours'));
            $id = Customer::create($post)->id;

            $order = [];
            $order['id_customer'] = $id;
            $order['code'] = "DHL" . date("His");
            $order['total_order'] = $total_order;
            $order['payment_method'] = $rq->payment;
            $order['payment_status'] = 0;
            $order["created_at"] = date("Y-m-d H:i:s", strtotime('+7 hours'));
            $order["updated_at"] = null;
            $order = Order::create($order);
            $id_order =  $order->id;
            $code_order =  $order->code;

            foreach ($cart as $key => $item_cart) {
                Order_detail::create([
                    'id_order' => $id_order,
                    'id_product' => $item_cart->id,
                    'name_product' => $item_cart->name,
                    'price_product' => $item_cart->variant['price'],
                    'total_price' => $item_cart->variant['price'] * $item_cart->buy,
                    'amount' => $item_cart->buy,
                    'created_at' => date("Y-m-d H:i:s", strtotime('+7 hours')),
                    'updated_at' => null
                ]);
            }

            session()->forget('cart');
            session()->forget('total_buy');

            $data = [
                'code_order' => $code_order,
            ];
            Mail::send('EmailCart', $data, function ($message) use($rq) {
                $message->sender('khanhchallenger2086@gmail.com', 'Lâm khánh');
                $message->to($rq->email, $rq->name);
                $message->subject('Đơn hàng của bạn');
            });

            return view('Frontend.Cart.CompleteCart',[
                'category_parent' => $category_parent,
                'all' => $all,
                'code' => $code_order
            ]);

        } else {
            return redirect()->route('c.cart-detail');
        }
    }
}
