<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Product;
use App\Model\ProductVariant;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public $model = "";

    public function __construct()
    {
        $this->model = new Product;
    }

    public function index()
    {
        $ListProduct = $this->model->GetListProduct();

        return view('Backend.Product.Products', [
            'list' => $ListProduct
        ]);
    }


    public function create()
    {
        // product::create([
        //     'code' => 'khanh',
        //     'style' => 'thoi trang'
        // ]);
        $category = Category::where('parent', 0)->get();
        return view('Backend.Product.FormProduct', [
            'category' => $category,
            'method' => 'post',
            'action' => route('product.store')
        ]);
    }


    public function store(Request $request)
    {
        $request->validate(
            [
                'name' => 'required',
                'size' => 'required',
                'color' => 'required',
                'image_main' => 'required',
                'image_detail' => 'required',
                'style' => 'required',
                'material' => 'required',
                'id_category' => 'required',
            ],
            [
                'name.required' => 'Vui lòng nhập tên sản phẩm',
                'size.required' => 'Vui lòng nhập kích thước',
                'color.required' => 'Vui lòng nhập màu sắc',
                'image_main.required' => 'Vui lòng nhập ảnh đại diện',
                'image_detail.required' => 'Vui lòng nhập ảnh chi tiết',
                'style.required' => 'Vui lòng nhập kiểu dáng',
                'material.required' => 'Vui lòng nhập chất liệu',
                'id_category.required' => 'Vui lòng nhập danh mục',
            ]

        );

        $main_image =  $this->process_image($request->image_main);
        $detail_image =  $this->process_image($request->image_detail);

        // set value $_POST form
        $post = $request->all();
        $post['uri'] = str_replace(" ", "-", $request->name);
        $post['code'] = "DH" . date("His");
        $post["id_category"] = implode(";", $request->id_category);
        $post["image_main"] = $main_image . ";";
        $post["image_detail"] = $detail_image . ";";
        $post["updated_at"] = null;
        $post["created_at"] = date("Y-m-d H:i:s", strtotime('+7 hours'));

        $id = Product::create($post)->id;
        $color = explode(";", $request->color);
        $size = explode(";", $request->size);

        $ar = [];
        foreach ($color as $v_color) {
            if ($v_color != "") {
                foreach ($size as $v_size) {
                    if ($v_size != "") {
                        $ar[] = [
                            'color' => $v_color,
                            'size' => $v_size
                        ];
                    }
                }
            }
        }

        foreach ($ar as $item) {
            ProductVariant::insert([
                'color' => $item['color'],
                'size' => $item['size'],
                "id_product" => $id,
                "created_at" => date("Y-m-d H:i:s")
            ]);
        }

        return redirect()->back()->with(["msg" => "Thêm thành công"]);
    }


    public function edit($id)
    {
        $product = Product::find($id);
        $category = Category::where('parent', 0)->get();
        return view('Backend.Product.FormProduct', [
            'category' => $category,
            'edit' => 'Sửa sản phẩm',
            'product' => $product,
            'method' => 'put',
            'action' => Route('product.update', $product->id)
        ]);
    }

    public function update(Request $request, $id)
    {
        $product = Product::find($id);

        if (isset($request->image_main)) {
            $image_main_old = explode(";", rtrim($product->image_main, ";"));
            foreach ($image_main_old as $value) {
                unlink('backend/images/juno/' . $value);
            }
        }

        if (isset($request->image_detail)) {
            $image_detail_old = explode(";", rtrim($product->image_detail, ";"));
            foreach ($image_detail_old as $value) {
                unlink('backend/images/juno/' . $value);
            }
        }

        $product->name =  $request->name ?? $product->name;
        $product->image_main = $request->image_main ? $this->process_image($request->image_main) . ";" : $product->image_main;
        $product->image_detail = $request->image_detail ? $this->process_image($request->image_detail) . ";" : $product->image_detail;
        $product->description = $request->description ?? $product->description;
        $product->style = $request->style ?? $product->style;
        $product->material = $request->material ?? $product->material;
        $product->uri = $request->uri ?? $product->uri;
        $product->id_category = implode(";", $request->id_category) ?? $product->id_category;
        $product->updated_at = date("Y-m-d H:i:s", strtotime('+7 hours'));

        $product->save();

        return redirect()->route('product.index')->with(["msg" => "Sửa thành công"]);
    }

    public function delete($id)
    {
        $product = Product::find($id);
        $product->deleted_at = date("Y-m-d H:i:s", strtotime('+7 hours'));
        $product->save();
        return redirect()->route('product.index')->with(["msg" => "Xóa thành công"]);
    }

    // thùng rác
    public function trash()
    {
        $list = product::whereNotNull('deleted_at')->get();
        // var_dump(bool empty($list));
        if (json_decode($list) != []) {
            return view('Backend.Product.TrashProduct', ['list' => $list]);
        } else {
            return redirect()->route('product.index')->with(["msg" => "Bạn chưa xóa sản phẩm nào"]);
        }
    }

    public function restore_trash(request $request)
    {
        foreach ($request->all() as $id) {
            $product = product::find($id);
            $product->deleted_at = null;
            $product->save();
        }
        return redirect()->back()->with(["msg" => "Phục Hồi Thành Công"]);
    }

    public function destroy_trash($id)
    {
        product::find($id)->delete();
        $list = product::whereNotNull('deleted_at')->get();
        if (json_decode($list) != []) {
            return redirect()->back()->with(["msg" => "Xóa Thành Công"]);
        } else {
            return redirect()->route('product.index')->with(["msg" => "Xóa Thành Công"]);
        }
    }
}