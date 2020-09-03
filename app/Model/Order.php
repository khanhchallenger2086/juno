<?php

namespace App\Model;

use App\Model\Order_detail;
use App\Model\Customer;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table = 'orders';

    public function OrderDetail()
    {
        return $this->hasMany(Order_detail::class, 'id_order', 'id')->where('deleted_at', null);
    }

    public function Customer()
    {
        return $this->hasMany(Customer::class, 'id', 'id_customer')->where('deleted_at', null); // hasOne hay hasMany đều đúng
    }

    public function GetListOrder()
    {
        $ar = [];
        $list = $this::where('deleted_at', null)->get();
        foreach ($list as $item) {
            $item->OrderDetail; // lấy xong sẽ bỏ vào relation của json item đó , nếu decode ra sẽ có ***
            $item->Customer;
            $ar[] = json_decode($item);
        }
        return $ar;
    }
}