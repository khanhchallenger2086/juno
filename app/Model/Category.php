<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'categories';
    protected $fillable = ["name", "parent", "updated_at", "uri", 'created_at'];

    public function CategoryParent() {
        return $this::where('parent', 0)->where('deleted_at', null)->limit(3)->get();
    }
}
