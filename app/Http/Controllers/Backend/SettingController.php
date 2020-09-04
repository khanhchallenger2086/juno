<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SettingController extends Controller
{
    function setting()
    {
        $setting = DB::table('setting')->where('setting', '1')->first();
        return view('Backend.Setting.FormSetting', ['setting' => $setting, 'ActiveSetting' => 1 ]);
    }

    function update_setting(Request $request, $setting)
    {
        $setting = $request->all();
        unset($setting['_token']);
        $setting['setting'] = '1';
        DB::table('setting')->update($setting);
        return redirect()->back()->with(['msg' => 'Cập nhập thành công']);
    }
}
