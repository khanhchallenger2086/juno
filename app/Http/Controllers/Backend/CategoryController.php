<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Model\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        $ListCategory = Category::where('deleted_at', null)->get();
        return view('Backend.Category.Category', [
            'list' => $ListCategory
        ]);
    }


    public function create()
    {
        $category_parent = Category::where('deleted_at', null)->where('parent', 0)->get();
        return view('Backend.Category.FormCategory', [
            'method' => 'post',
            'action' => route('category.store'),
            'category_parent' => $category_parent
        ]);
    }


    public function store(Request $request)
    {
        $request->validate(
            [
                'name' => 'required',
            ],
            [
                'name.required' => 'Vui lòng nhập tên danh mục',
            ]
        );
        $post = $request->all();
        $post['updated_at'] = null;
        $post['created_at'] = date("Y-m-d H:i:s", strtotime('+7 hours'));
        Category::create($post);

        return redirect()->back()->with(['msg' => 'Thêm danh mục thành công']);
    }


    public function edit($id)
    {
        $product = Category::find($id);
        $category_parent = Category::where('deleted_at', null)->where('parent', 0)->get();
        return view('Backend.Category.FormCategory', [
            'edit' => 'Sửa sản phẩm',
            'method' => 'put',
            'category' => $product,
            'category_parent' => $category_parent,
            'action' => Route('category.update', $product->id)
        ]);
    }

    public function update(Request $request, $id)
    {
        $product = Category::find($id);
        $product->name = $request->name;
        $product->uri = $request->uri;
        $product->parent = $request->parent;
        $product->updated_at =  date("Y-m-d H:i:s", strtotime('+7 hours'));
        $product->save();
        return redirect()->route('category.index')->with(['msg' => 'Sửa danh mục thành công']);
    }

    public function delete($id)
    {
        $product = Category::find($id);
        $product->deleted_at = date("Y-m-d H:i:s", strtotime('+7 hours'));
        $product->save();

        return redirect()->route('category.index')->with(['msg' => 'Xóa danh mục thành công']);
    }

    public function trash()
    {
        $list = Category::whereNotNull('deleted_at')->get();
        if (json_decode($list) != []) {
            return view('Backend.Category.TrashCategory', ['list' => $list]);
        } else {
            return redirect()->route('category.index')->with(["msg" => "Bạn chưa xóa danh mục nào"]);
        }
    }

    public function restore_trash(request $request)
    {
        foreach ($request->all() as $id) {
            $category = Category::find($id);
            $category->deleted_at = null;
            $category->save();
        }
        return redirect()->back()->with(["msg" => "Phục Hồi Thành Công"]);
    }

    public function destroy_trash($id)
    {
        Category::find($id)->delete();
        $list = Category::whereNotNull('deleted_at')->get();
        if (json_decode($list) != []) {
            return redirect()->back()->with(["msg" => "Xóa Thành Công"]);
        } else {
            return redirect()->route('category.index')->with(["msg" => "Xóa Thành Công"]);
        }
    }
}