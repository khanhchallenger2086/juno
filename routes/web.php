<?php

use Illuminate\Support\Facades\Route;

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
// Backend
Route::get('/home', function () {
    return view('backend.admin.home');
});

// product
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

// variant
Route::get('/add-variant', 'Backend\VariantController@add_variant');
Route::get('/remove-variant', 'Backend\VariantController@remove_variant');
Route::get('/update-variant', 'Backend\VariantController@update_variant');
Route::get('/updated-variant', 'Backend\VariantController@updated_variant');