<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Model\Contact;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    public function index() {
        $list = Contact::get();
        return view('Backend.Contact.Contact',['list'=>$list,'ActiveContact' => 1]);
    }

    public function contact_delete($id) {
        Contact::find($id)->delete();
        return redirect('/admin/contact');
    }
}
