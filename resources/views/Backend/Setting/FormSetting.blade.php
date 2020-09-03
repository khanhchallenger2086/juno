@extends('Backend.master')
@section('content')
@if (session()->has('msg'))
<p class="btn btn-success mb-2">{{session('msg')}}</p>

@endif
<div class="table-agile-info">
    <div class="panel panel-default">
        <div class="panel-heading">
            Cập nhập mặc định
        </div>
        <div class="form">
            <form class="pt-4 pb-4 cmxform form-horizontal" method="post" action="/update/setting/{{$setting->setting}}">
                {{-- Bị lặp code ở hàm xem lại và viết ra hàm chung --}}
                <div class="form-group ">
                    <label for="cname" class="control-label col-lg-3">Số điện thoại</label>
                    <div class="col-lg-6">
                        <input class="form-control" name="phone" value="{{ $setting->phone }}" type="text" placeholder="Tên Sản Phẩm">
                    </div>
                </div>

                <div class="form-group ">
                    <label for="cname" class="control-label col-lg-3">Số điện thoại hỗ trợ</label>
                    <div class="col-lg-6">
                        <input class="form-control" name="phone_support" value="{{ $setting->phone_support }}" type="text" placeholder="Tên Sản Phẩm">
                    </div>
                </div>

                <div class="form-group ">
                    <label for="cname" class="control-label col-lg-3">Tên</label>
                    <div class="col-lg-6">
                        <input class="form-control" name="name" value="{{ $setting->name }}" type="text" placeholder="Tên Sản Phẩm">
                    </div>
                </div>

                <div class="form-group ">
                    <label for="cname" class="control-label col-lg-3">Địa chỉ</label>
                    <div class="col-lg-6">
                        <input class="form-control" name="address" value="{{ $setting->address }}" type="text" placeholder="Tên Sản Phẩm">
                    </div>
                </div>

                <div class="form-group ">
                    <label for="cname" class="control-label col-lg-3">Link Facebook</label>
                    <div class="col-lg-6">
                        <input class="form-control" name="link_fb" value="{{ $setting->link_fb }}" type="text" placeholder="Tên Sản Phẩm">
                    </div>
                </div>

                <div class="form-group ">
                    <label for="cname" class="control-label col-lg-3">Link Zalo</label>
                    <div class="col-lg-6">
                        <input class="form-control" name="link_zalo" value="{{ $setting->link_zalo }}" type="text" placeholder="Tên Sản Phẩm">
                    </div>
                </div>

                <div class="form-group ">
                    <label for="cname" class="control-label col-lg-3">Link Youtube</label>
                    <div class="col-lg-6">
                        <input class="form-control" name="link_youtube" value="{{ $setting->link_youtube }}" type="text" placeholder="Tên Sản Phẩm">
                    </div>
                </div>

                <div class="form-group ">
                    <label for="cname" class="control-label col-lg-3">Link instagram</label>
                    <div class="col-lg-6">
                        <input class="form-control" name="link_instagram" value="{{ $setting->link_instagram }}" type="text"
                            placeholder="Tên Sản Phẩm">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-lg-offset-3 col-lg-6">
                        @csrf
                        <button class="btn btn-primary" type="button" id="submit"> Cập nhập </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
