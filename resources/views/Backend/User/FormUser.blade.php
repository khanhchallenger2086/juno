@extends('Backend.master')
@section('content')
@if (session()->has('msg'))
<p class="btn btn-success mb-2">{{session('msg')}}</p>

@endif
<div class="table-agile-info col-lg-7">
    <div class="panel panel-default">
        <div class="panel-heading">
            Thêm Thành Viên Mới
        </div>
        <div class="form">
        <form class="pt-4 pb-4 cmxform form-horizontal" method="post" action="{{route('user.save')}}">
                {{-- Bị lặp code ở hàm xem lại và viết ra hàm chung --}}

                <div class="form-group ">
                    <label for="name" class="control-label col-lg-3">Tên</label>
                    <div class="col-lg-6">
                        <input class="form-control" name="name" value="{{Request::old('name')}}" value="" id="name" type="text"
                            placeholder="Tên Người Dùng">
                        <p class="text-danger">@error('name') {{ $errors->first('name') }} @enderror</p>
                    </div>
                </div>

                <div class="form-group ">
                    <label for="email" class="control-label col-lg-3">Email</label>
                    <div class="col-lg-6">
                    <input class="form-control" value="{{Request::old('email')}}" name="email" value="" id="email" type="text"
                            placeholder="Tên Người Dùng">
                        <p class="text-danger">@error('email') {{ $errors->first('email') }} @enderror</p>
                    </div>
                </div>

                <div class="form-group ">
                    <label for="password" class="control-label col-lg-3">Mật Khẩu</label>
                    <div class="col-lg-6">
                        <input class="form-control" name="password" value="{{Request::old('password')}}" id="password" type="password"
                            placeholder="Mật Khẩu">
                        <p class="text-danger">@error('password') {{ $errors->first('password') }} @enderror</p>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="id_role" class="control-label col-lg-3">Phân quyền</label>
                    <div class="col-lg-6">
                        <select class="form-control" name="id_role" id="id_role">
                            @foreach ($role as $item_role)
                                <option @if (session()->get('id_user') != 1) @if($item_role->id == 1) disabled @endif @endif value="{{$item_role->id}}"> {{$item_role->name}} </option>
                            @endforeach
                        </select>
                        <p class="text-danger">@error('id_role') {{ $errors->first('id_role') }} @enderror</p>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-lg-offset-3 col-lg-6">
                        @csrf
                        <button class="btn btn-primary" type="button" id="submit"> {{ isset($edit) ? "Sửa" : "Thêm" }} </button>
                        <a class="btn btn-default" href="/admin/user" type="button">Quay lại</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="col-lg-5">
    <div class="panel panel-default">
        <ul class="list-group">
            <li class="list-group-item text-center">CHÚ THÍCH</li>
            @foreach ($role as $item_role)
                @if ($item_role->id != 5)
                    <li class="list-group-item" data-toggle="collapse" data-target="#demo"><span style="font-weight:700">{{$item_role->name}}</span>
                    <div> {{$item_role->description}}</div>
                    </li>
                @endif
            @endforeach
        </ul>
    </div>
</div>
@endsection
