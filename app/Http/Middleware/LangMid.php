<?php

namespace App\Http\Middleware;

use Closure;

class LangMid
{

    public function handle($request, Closure $next)
    {
        if(session()->has('lang')) {
            \App::setLocale(session()->get('lang'));
        }
        return $next($request);
    }
}
