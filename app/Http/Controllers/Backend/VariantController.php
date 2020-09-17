<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class VariantController extends Controller
{
    public function remove_variant()
    {
        try {
            DB::delete('delete from product_variants where `id` = ?', [$_GET['id']]);
            return ['update' => 1];
        } catch (\Throwable $th) {
            return ['update' => 0];
        }
    }

    public function add_variant()
    {
        try {
            // dd($_GET);
            $_GET['image'] = DB::table('colors')->where('name',$_GET['color'])->first()->image;
            $id =  DB::table('product_variants')->insertGetId($_GET);
            if ($_GET['price_market'] == 0) {
                DB::update('update products set sale = 0 where id = ?', [$_GET['id_product']]);
            } else {
                DB::update('update products set sale = 1 where id = ?', [$_GET['id_product']]);
            }
            return [
                'update' => 1,
                'color' => $_GET['color'],
                'size' => $_GET['size'],
                'price' => $_GET['price'],
                'price_market' => $_GET['price_market'],
                'id_variant' => $id
            ];
        } catch (\Throwable $th) {
            return ['update' => 0];
        }
    }

    public function update_variant()
    {
        try {
            // $variant = DB::select('select * from product_variants where id = ?', [$_GET['id']]);
            $variant = DB::table('product_variants')->where('id', $_GET['id'])->first();
            return [
                'update' => 1,
                'variant' =>  $variant
            ];
        } catch (\Throwable $th) {
            return ['update' => 0];
        }
    }

    public function updated_variant()
    {
        try {
            DB::update('update product_variants set image=?,color=?,size = ?,price = ?, price_market = ? where `id` = ?', [
                DB::table('colors')->where('name',$_GET['color'])->first()->image
                ,$_GET['color']
                , $_GET['size']
                , $_GET['price']
                , $_GET['price_market'],
                $_GET['id']]);
            // $a =  DB::update('UPDATE `product_variants` SET `size` = 100 WHERE `id` = 93');
            $id_product = DB::table('product_variants')->where('id',$_GET['id'])->first()->id_product;
            if ($_GET['price_market'] == 0) {
                DB::update('update products set sale = 0 where id = ?', [$id_product]);
            } else {
                DB::update('update products set sale = 1 where id = ?', [$id_product]);
            }
            return [
                'update' => 1,
                'variant' =>  $_GET,
                'a' => $_GET['id']
            ];
        } catch (\Throwable $th) {
            return ['update' => 0];
        }
    }
}
