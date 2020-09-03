<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Model\Customer;
use App\Model\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public $model;

    public function __construct()
    {
        $this->model = new Order;
    }

    public function index()
    {
        $ListOrder = $this->model->GetListOrder();
        return view('Backend.Order.Order', [
            'list' => $ListOrder
        ]);
    }

    public function info_customer()
    {
        try {
            $customer = Customer::find($_GET['id']);
            return [
                'update' => 1,
                'customer' =>  $customer
            ];
        } catch (\Throwable $th) {
            return ['update' => 0];
        }
    }


    public function delete($id)
    {
        $product = Order::find($id);
        $product->deleted_at = date("Y-m-d H:i:s", strtotime('+7 hours'));
        $product->save();

        return redirect()->route('order.index')->with(['msg' => 'Xóa đơn hàng thành công']);
    }

    public function trash()
    {
        $list = Order::whereNotNull('deleted_at')->get();
        if (json_decode($list) != []) {
            return view('Backend.Order.TrashOrder', ['list' => $list]);
        } else {
            return redirect()->route('order.index')->with(["msg" => "Bạn chưa xóa đơn hàng nào"]);
        }
    }

    public function restore_trash(request $request)
    {
        foreach ($request->all() as $id) {
            $category = order::find($id);
            $category->deleted_at = null;
            $category->save();
        }
        return redirect()->back()->with(["msg" => "Phục Hồi Thành Công"]);
    }

    public function destroy_trash($id)
    {
        order::find($id)->delete();
        $list = order::whereNotNull('deleted_at')->get();
        if (json_decode($list) != []) {
            return redirect()->back()->with(["msg" => "Xóa Thành Công"]);
        } else {
            return redirect()->route('order.index')->with(["msg" => "Xóa Thành Công"]);
        }
    }
}