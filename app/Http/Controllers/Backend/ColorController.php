<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Model\Color;
use Illuminate\Http\Request;

class ColorController extends Controller
{
    public function index()
    {
        $list = Color::get();
        return view('Backend.Color.Color', ['list' => $list , 'ActiveProduct' => 1, 'ActiveListColor' => 1]);
    }

    public function create()
    {
        return view('Backend.Color.FormColor', [
            'method' => 'post',
            'action' => route('color.store')
        ]);
    }

    public function store(Request $request)
    {
        $request->validate(
            [
                'name' => 'required',
                'image' => 'required',
            ],
            [
                'name.required' => 'Vui lòng nhập tên màu',
                'image.required' => 'Vui lòng nhập hình ảnh'
            ]
        );
        $post = $request->all();
        $post['image'] = $this->process_image($request->image);
        $post['updated_at'] = null;
        $post['created_at'] = date("Y-m-d H:i:s", strtotime('+7 hours'));
        Color::create($post);

        return redirect()->back()->with(['msg' => 'Thêm màu thành công']);
    }

    public function edit($id)
    {
        $color = Color::find($id);
        return view('Backend.Color.FormColor', [
            'action' => Route('color.update', $color->id),
            'method' => 'put',
            'color' =>  $color,
            'edit' => 'Sửa màu'
        ]);
    }

    public function update(Request $request, $id)
    {
        $color = Color::find($id);

        if (isset($request->image)) {
            if (file_exists('backend/images/juno/' . $color->image)) {
                unlink('backend/images/juno/' . $color->image);
            }
        }

        $color->name =  $request->name ?? $color->name;
        $color->image = $request->image ? $this->process_image($request->image)  : $color->image;
        $color->updated_at = date("Y-m-d H:i:s", strtotime('+7 hours'));

        $color->save();

        return redirect()->route('color.index')->with(["msg" => "Sửa thành công"]);
    }

    public function destroy_color($id)
    {
        Color::find($id)->delete();
        return redirect()->back()->with(['msg' => 'Xóa thành công']);
    }
}
