<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Category;
use App\Model\Contact;
use App\Model\Product;
use Illuminate\Support\Facades\DB;

class ContactController extends Controller
{
    public function contact() {
        $setting = DB::table('setting')->first();
        $category_parent = (new Category)->CategoryParent();
        $all = (new Product)->ProductOfCat_8Item();
        return view('Frontend.Contact.Contact',[
            'category_parent' => $category_parent,
            'all' => $all,
            'setting' => $setting
        ]);
    }

    public function post_contact(Request $rq) {
        $contact =  Contact::create();
        $contact->name = $rq->name;
        $contact->phone = $rq->phone;
        $contact->description = $rq->description;
        $contact->email = $rq->email;
        $contact->save();

        return redirect('/contact');
    }
}
