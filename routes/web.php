<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Client\Request;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
// Route::get('/lang-{lang}', 'Frontend\LangController@lang');
// Route::get('/test', 'Frontend\LangController@test')->middleware('locale');

Route::get('/home', 'Frontend\HomeController@home');
Route::get('/filter', 'Frontend\AjaxController@filter');
Route::get('/product/{uri}', 'Frontend\ProductController@product')->name('p.product');
Route::get('/product-detail/{uri}', 'Frontend\ProductController@product_detail')->name('p.product-detail');

// cart detail
Route::get('/cart', 'Frontend\CartController@cart_detail')->name('c.cart-detail');

// payment
Route::get('/payment', 'Frontend\CartController@payment');

// Ajax
Route::post('/add-cart-ajax', 'Frontend\AjaxController@add_cart_ajax')->name('ajax.add-cart');
Route::post('/delete-cart-ajax', 'Frontend\AjaxController@delete_cart_ajax');
Route::post('/update-cart', 'Frontend\AjaxController@update_cart')->name('ajax.update-cart');
Route::post('/send-mail', 'Frontend\AjaxController@send_mail');


Route::prefix('admin')->group(function () {
    // Backend
    Route::get('/','Backend\AdminController@home')->name('home');

    // login
    Route::get('/login', 'Backend\AdminController@login')->name('auth.signin');
    Route::post('/post-login', 'Backend\AdminController@post_login')->name('auth.login');
    Route::get('/logout', 'Backend\AdminController@logout')->name('auth.logout');
    // product
    Route::get('product/check-name','Backend\productController@check_name')->name('product.check_name');
    Route::get('product/restore_trash', 'Backend\productController@restore_trash')->name('product.restore_trash');
    Route::get('product/{id}/destroy_trash', 'Backend\productController@destroy_trash')->name('product.destroy_trash'); // xóa cứng
    Route::get('product/trash', 'Backend\productController@trash')->name('product.trash');
    Route::get('product/{id}/delete', 'Backend\productController@delete')->name('product.delete'); // xóa mềm
    Route::resource('product', 'Backend\ProductController')->except('destroy', 'show');

    // category
    Route::get('category/restore_trash', 'Backend\CategoryController@restore_trash')->name('category.restore_trash');
    Route::get('category/{id}/destroy_trash', 'Backend\CategoryController@destroy_trash')->name('category.destroy_trash'); // xóa cứng
    Route::get('category/trash', 'Backend\CategoryController@trash')->name('category.trash');
    Route::get('category/{id}/delete', 'Backend\CategoryController@delete')->name('category.delete'); // xóa mềm
    Route::resource('category', 'Backend\CategoryController')->except('destroy', 'show');

    // order
    // info_customer
    Route::get('order/info_customer', 'Backend\OrderController@info_customer')->name('order.info_customer');
    Route::get('order/restore_trash', 'Backend\OrderController@restore_trash')->name('order.restore_trash');
    Route::get('order/{id}/destroy_trash', 'Backend\OrderController@destroy_trash')->name('order.destroy_trash'); // xóa cứng
    Route::get('order/trash', 'Backend\OrderController@trash')->name('order.trash');
    Route::get('order/{id}/delete', 'Backend\OrderController@delete')->name('order.delete'); // xóa mềm
    Route::resource('order', 'Backend\OrderController')->except('destroy', 'show', 'create', 'store', 'edit', 'update');

    // Setting
    Route::get('/setting', 'Backend\SettingController@setting');
    Route::post('/update/setting/{setting}', 'Backend\SettingController@update_setting');

    // variant
    Route::get('/add-variant', 'Backend\VariantController@add_variant');
    Route::get('/remove-variant', 'Backend\VariantController@remove_variant');
    Route::get('/update-variant', 'Backend\VariantController@update_variant');
    Route::get('/updated-variant', 'Backend\VariantController@updated_variant');

    // color product
    Route::get('color/{id}/destroy_color', 'Backend\ColorController@destroy_color')->name('color.destroy_color'); // xóa cứng
    Route::resource('color', 'Backend\ColorController')->except('destroy', 'show');
});
