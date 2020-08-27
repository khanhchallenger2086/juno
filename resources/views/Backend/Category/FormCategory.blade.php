@extends('Backend.master')
@section('content')
@if (session()->has('msg'))
<p class="btn btn-success mb-2">{{session('msg')}}</p>

@endif
<div class="table-agile-info">
    <div class="panel panel-default">
        <div class="panel-heading">
            {{ isset($edit) ? 'Sửa danh mục' : 'Thêm danh mục mới' }}
        </div>
        <div class="form">
            <form class="pt-4 pb-4 cmxform form-horizontal" method="post" action="{{$action}}" enctype="multipart/form-data">
                {{-- Bị lặp code ở hàm xem lại và viết ra hàm chung --}}

                <div class="form-group ">
                    <label for="cname" class="control-label col-lg-3">Tên danh mục</label>
                    <div class="col-lg-6">
                        <input class="form-control" name="name" value="{{ isset($category) ? $category->name : "" }}" id="name_category" type="text"
                            placeholder="Tên Sản Phẩm">
                        <p class="text-danger">@error('name') {{ $errors->first('name') }} @enderror</p>
                    </div>
                </div>

                <div class="form-group ">
                    <label for="cname" class="control-label col-lg-3">Uri</label>
                    <div class="col-lg-6">
                        <input class="form-control" name="uri" id="uri_category" value="{{ isset($category) ? $category->uri : "" }}" type="text"
                            placeholder="Tên Sản Phẩm">
                        <p class="text-danger">@error('Uri') {{ $errors->first('Uri') }} @enderror</p>
                    </div>
                </div>

                <div class="form-group ">
                    <p for="cname" class="control-label col-lg-3 font-weight-bold">Bí danh</p>
                    <div class="col-lg-6">
                        <select name="parent" class="form-control" id="">
                            <option value="0" {{ isset($category) ? $category->parent == 0 ? "selected" : "" : "" }}>Danh mục cha</option>
                            <option value="1" {{ isset($category) ? $category->parent == 1 ? "selected" : "" : "" }}>Danh mục con</option>
                        </select>
                        <p class="text-danger">@error('parent') {{ $errors->first('parent') }} @enderror</p>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-lg-offset-3 col-lg-6">
                        @csrf
                        @method($method)
                        <button class="btn btn-primary" type="button" id="submit"> {{ isset($edit) ? "Sửa" : "Thêm" }} </button>
                        <a class="btn btn-default" href="{{ route("category.index") }}" type="button">Quay lại</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
