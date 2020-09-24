<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Model\Role;
use App\Model\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index() {
        $id_user = session()->get('id_user');
        $list = User::where('id','<>',1)->where('id','<>',$id_user)->get();
        $role = Role::get();
        // if (count($list->toArray()) == 1) {

        // }
        // dd($list);
        return view('Backend.User.user',[
            'ActiveUser' => 1,
            'list' => $list,
            'role' => $role
        ]);
    }

    // id user bằng 1 thì dc sửa hết , còn ko thì xét cái role truyền lên bằng 1 thì ko dc sửa
    public function role(Request $rq) {
        $id_user = session()->get('id_user');
        if ($id_user == 1) {
        $user =  User::find($rq->id_user);
        $user->id_role = $rq->role;
        $user->save();

        return response()->json([
            'name_role' => Role::find($rq->role)->name,
        ]);
        } else {
            if ($rq->role == 1) {
                return response('',200);
            } else {
                $user =  User::find($rq->id_user);
                $user->id_role = $rq->role;
                $user->save();

                return response('',200);
            }
        }
    }

    public function delete_role($id) {
        if ($id != 1) {
            User::find($id)->delete();
            return redirect('/admin/user');
        } else {
            return redirect('/admin/user');
        }
    }


    public function user_create() {
        $roles = Role::get();
        return view('Backend.User.FormUser',[
            'role' => $roles
        ]);
    }

    public function user_save(request $rq) {
        $rq->validate(
            [
                'name' => 'required',
                'password' => 'required',
                'email' => 'required|unique:user,email',
                'id_role' => 'required',
            ],
            [
                "name.required" => 'Vui lòng nhập tên người dùng',
                'password.required' => 'Vui lòng nhập mật khẩu',
                'email.unique' => 'Tên đã tồn tại ',
                'email.required' => 'Vui lòng nhập email',
                'id_role.required' => 'Vui lòng nhập',
            ]
        );

        $user = User::create();
        $user->name = $rq->name;
        $user->password = bcrypt($rq->password);
        $user->email = $rq->email;
        $user->id_role = $rq->id_role;
        $user->save();

        return redirect('/admin/user')->with(['msg' => "Thêm Thành công"]);
    }
}
