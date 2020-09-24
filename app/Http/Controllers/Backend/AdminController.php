<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Model\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    public function login() {
        if (session()->has('login')) {
            return redirect()->route('home');
        } else {
            return view('Backend.Admin.login');
        }
    }

    public function post_login(Request $Rq) {
        $email = $Rq->email;
        $password = $Rq->password;
        if (Auth::attempt(['email' => $email, 'password' => $password])) {
            $id = User::where('email',$email)->first()->id;
            session()->put('login',true);
            session()->put('id_user',$id);
            return redirect()->route('home');
        } else {
            return view('backend.admin.login',['error'=>'Sai mật khẩu hoặc tài khoản']);
            // return redirect()->route('auth.login');
        }
    }

    public function logout() {
        session()->flush();
        return redirect()->route('auth.signin');
    }

    public function home() {
        if (!session()->has('login')) {
            return redirect()->route('auth.signin');
        } else {
            return view('backend.admin.home', ['ActiveHome' => 1]);
        }

        // if (session()->has('login')) {
        //     return view('backend.admin.home', ['ActiveHome' => 1]);
        // } else {
        //     return redirect()->route('auth.signin');
        // }
    }
}
