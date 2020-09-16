<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LangController extends Controller
{
    var $langs = [
        'en' => 'English',
        'vi' => 'Tieng viet'
    ];

    public function lang($lang) {
        if (isset($this->langs[$lang])) {
            session()->put('lang',$lang);
        }
        return redirect()->back();
    }

    public function test() {
        return \App::getLocale();
    }
}
