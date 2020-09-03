@extends('Backend.master')
@section('content')
@if (session()->has('msg'))
<p class="btn btn-success mb-2">{{session('msg')}}</p>

@endif
<div class="table-agile-info">
    <div class="panel panel-default">
        <div class="panel-heading">
            {{ isset($edit) ? 'Sửa Màu ' : 'Thêm màu mới' }}
        </div>
        <div class="form">
            <form class="pt-4 pb-4 cmxform form-horizontal" method="post" action="{{$action}}" enctype="multipart/form-data">
                {{-- Bị lặp code ở hàm xem lại và viết ra hàm chung --}}

                <div class="form-group ">
                    <label for="cname" class="control-label col-lg-3">Tên màu</label>
                    <div class="col-lg-6">
                        <input class="form-control" name="name" value="{{ isset($color) ? $color->name : "" }}" type="text" placeholder="Tên Màu">
                        <p class="text-danger">@error('name') {{ $errors->first('name') }} @enderror</p>
                    </div>
                </div>

                <div class="form-group">
                    <p style="font-weight: 700;" class="col-lg-3 control-label">Hình</p>
                    <div class="col-lg-6">
                        <div class="custom-file">
                            <label class="custom-file-label text-dark" for="inputGroupFile01"></label>
                            <input type="file" class=" custom-file-input" name="image[]" id="inputGroupFile01"
                                aria-describedby="inputGroupFileAddon01">
                            <p class="text-danger">@error('image') {{ $errors->first('image') }} @enderror</p>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-lg-offset-3 col-lg-6">
                        @csrf
                        @method($method)
                        <button class="btn btn-primary" type="button" id="submit"> {{ isset($edit) ? "Sửa" : "Thêm" }} </button>
                        <a class="btn btn-default" href="{{ route("color.index") }}" type="button">Quay lại</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
