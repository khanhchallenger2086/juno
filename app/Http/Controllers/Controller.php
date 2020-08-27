<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use SebastianBergmann\Environment\Console;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function process_image($file)
    {
        $full_image = "";

        foreach ($file as $value) {
            $name_image = $value->getClientOriginalName();
            $ext = substr($name_image, strrpos($name_image, '.'));
            $name = 'IMG' . rand(0, 999) . rand(0, 999) . rand(0, 999) . $ext;
            $value->move('backend/images/juno/', $name);
            $full_image .= $name . ';';
        }

        return rtrim($full_image, ';');
    }
}