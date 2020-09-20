@extends('Backend.master')
@section('content')
@if (session()->has('msg'))
<p class="btn btn-success mb-2">{{session('msg')}}</p>
@endif

<div class="table-agile-info">
    <div class="panel panel-default">
        <div class="panel-heading">
            {{ isset($edit) ? 'Sửa sản phẩm' : 'Thêm sản phẩm mới' }}
        </div>
        <div class="form">
            <form class="pt-4 pb-4 cmxform form-horizontal" method="post" action="{{$action}}" enctype="multipart/form-data">
                {{-- Bị lặp code ở hàm xem lại và viết ra hàm chung --}}
                @if (isset($edit))
                <div class="form-group ">
                    <label for="cname" class="control-label col-lg-3">Mã sản phẩm</label>
                    <div class="col-lg-6">
                        <input class="form-control" name="code" readonly value="{{ isset($product) ? $product->code : "" }}" type="text"
                            placeholder="Url">
                    </div>
                </div>
                @endif

                <div class="form-group ">
                    <label for="cname" class="control-label col-lg-3">Tên</label>
                    <div class="col-lg-6">
                        <input class="form-control" name="name" value="{{ isset($product) ? $product->name  : "" }}" id="name-product" type="text"
                            placeholder="Tên Sản Phẩm" autocomplete="off">
                        {{-- <p>{{ $errors->get('name') ? $errors->first('name') : "" }}</p> --}}
                        <p class="text-danger">@error('name') {{ $errors->first('name') }} @enderror</p>
                    </div>
                </div>

                @if (!isset($edit))
                    <div class="form-group">
                        <label for="curl" class="control-label col-lg-3">Màu sắc</label>
                        <div class="col-lg-6">
                            <ul class="color-1" style="list-style-type:none;overflow-y: scroll;height:150px">
                                @foreach ($color as $item)
                                <li style="display: flex;align-item:center;">
                                        <input type="checkbox" value="{{$item->name}}" id="checkbox{{$item->id}}-color" name="color[]">
                                        <label style="flex:1" for="checkbox{{$item->id}}-color"> {{$item->name}}</label>
                                </li>
                                @endforeach
                            </ul>
                            <p class="text-danger">@error('color') {{ $errors->first('color') }} @enderror</p>
                        </div>
                    </div>


                    <div class="form-group ">
                        <div class="p-0 col-lg-12">
                            <div class="offset-lg-3 col-lg-6 ">
                                <div class="box-input1">
                                    <div class="box-input-inner1"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12 p-0">
                            <p for="cname" style="font-weight: 700;" class="control-label col-lg-3">Kích thước</p>
                            <div class="col-lg-6 ">
                                <div style="border:1px solid #ccc;border-radius:5px">
                                    {{-- <input class="ml-2" style="width:100%" type="text" id="input-color1" /> --}}
                                    <input type="hidden" value="" name="size" id="input-color-hidden1">
                                    <input type="text" list="size" id="input-color1" multiple   style="width:100%" value="{{ isset($product) ? $product->material : "" }}" autocomplete="off"/>
                                    <datalist id="size">
                                        @foreach ($size as $item_size)
                                            <option>{{$item_size}}</option>
                                        @endforeach
                                    </datalist>
                                </div>
                                <p class="text-danger">@error('size') {{ $errors->first('size') }} @enderror</p>
                            </div>
                        </div>
                    </div>
@endif

@if (isset($edit))
<div class="form-group ">
    <label for="cname" class="control-label col-lg-3">Đường link Url</label>
    <div class="col-lg-6">
        <input class="form-control" name="uri" value="{{ isset($product) ? $product->uri : "" }}" type="text" placeholder="Url">
    </div>
</div>
@endif


<div class="form-group">
    <p style="font-weight: 700;" class="col-lg-3 control-label">Hình chính</p>
    <div class="col-lg-6">
        <div class="custom-file">
            <label class="custom-file-label text-dark" for="inputGroupFile01"></label>
            <input type="file" class=" custom-file-input" name="image_main[]" multiple id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
            <p class="text-danger">@error('image_main') {{ $errors->first('image_main') }} @enderror</p>
        </div>
    </div>
</div>

<div class="form-group">
    <p style="font-weight: 700;" class="col-lg-3 control-label text-dark">Hình chi tiết</p>
    <div class="col-lg-6">
        <div class="custom-file">
            <label class="custom-file-label" for="inputGroupFile02"></label>
            <input type="file" class=" custom-file-input" name="image_detail[]" multiple id="inputGroupFile02"
                aria-describedby="inputGroupFileAddon02">
            <p class="text-danger">@error('image_detail') {{ $errors->first('image_detail') }} @enderror</p>
        </div>
    </div>
</div>

<div class="form-group ">
    <label for="ccomment" class="control-label col-lg-3">Mô tả</label>
    <div class="col-lg-6">
        <textarea id="summernote" class="form-control" name="description">{{ isset($product) ? $product->description : "" }}</textarea>
    </div>
</div>

{{-- <div class="form-group ">
    <label for="curl" class="control-label col-lg-3">Kiểu dáng</label>
    <div class="col-lg-6">
        <input class="form-control" type="text" value="{{ isset($product) ? $product->style : "" }}" name="style" placeholder="Kiểu dáng">
        <p class="text-danger">@error('style') {{ $errors->first('style') }} @enderror</p>
    </div>
</div> --}}

<div class="form-group ">
    <label for="curl" class="control-label col-lg-3">Kiểu dáng</label>
    <div class="col-lg-6">
        {{-- <input class="form-control" type="text" value="{{ isset($product) ? $product->style : "" }}" name="style" placeholder="Kiểu dáng"> --}}
        <input type="text" list="style" class="form-control" name="style" value="{{ isset($product) ? $product->style : "" }}" autocomplete="off"/>
        <datalist id="style">
            @foreach ($style as $item_style)
                <option>{{$item_style}}</option>
            @endforeach
        </datalist>
        <p class="text-danger">@error('style') {{ $errors->first('style') }} @enderror</p>
    </div>
</div>


<div class="form-group ">
    <label for="curl" class="control-label col-lg-3">Chất liệu</label>
    <div class="col-lg-6">
        {{-- <input class="form-control" type="text" value="{{ isset($product) ? $product->style : "" }}" name="style" placeholder="Kiểu dáng"> --}}
        <input type="text" list="material"   class="form-control" name="material"  value="{{ isset($product) ? $product->material : "" }}" autocomplete="off"/>
        <datalist id="material">
            @foreach ($material as $item_material)
                <option>{{$item_material}}</option>
            @endforeach
        </datalist>
        <p class="text-danger">@error('material') {{ $errors->first('material') }} @enderror</p>
    </div>
</div>

{{--
<div class="form-group ">
    <label for="curl" class="control-label col-lg-3">Chất liệu</label>
    <div class="col-lg-6">
        <input class="form-control" type="text" value="{{ isset($product) ? $product->material : "" }}" name="material" placeholder="Chất liệu">
        <p class="text-danger">@error('material') {{ $errors->first('material') }} @enderror</p>
    </div>
</div> --}}

<div class="form-group category">
    <label for="curl" class="control-label col-lg-3">Danh mục</label>
    <div class="col-lg-6">
        <ul class="category" style="list-style-type:none;overflow-y: scroll;height:150px">
            @foreach ($category as $item)
            <?php $category_son = DB::table('categories')->where('parent',$item->id)->get() ?>
            <li>
                <div>
                    <i  class="fa fa-angle-right next-more" aria-hidden="true"></i>
                <input type="checkbox" value="{{$item->id}}" @if (isset($product)) @if (in_array((string) $item->id,
                    $product->list_category)) checked @endif @endif id="checkbox{{$item->id}}-category" name="id_category[]">
                    <label for="checkbox{{$item->id}}-category">{{$item->name}}</label>
                </div>
                @if (isset($category_son))
                <ul style="list-style-type:none" class="d-none">
                    @foreach ($category_son as $item_son)
                    <li>
                        <input type="checkbox" value="{{$item_son->id}}" @if (isset($product)) @if (in_array((string) $item_son->id,
                            $product->list_category)) checked @endif @endif id="checkbox{{$item_son->id}}-category"
                            name="id_category[]">
                            <label for="checkbox{{$item_son->id}}-category"> {{$item_son->name}}</label>
                    </li>
                    @endforeach
                </ul>
                @endif
            </li>
            @endforeach
        </ul>
        <p class="text-danger">@error('id_category') {{ $errors->first('id_category') }} @enderror</p>
    </div>
</div>

<div class="form-group">
    <div class="col-lg-offset-3 col-lg-6">
        @csrf
        @method($method)
        <button class="btn btn-primary" type="button" id="submit"> {{ isset($edit) ? "Sửa" : "Thêm" }} </button>
        <a class="btn btn-default" href="{{ route("product.index") }}" type="button">Quay lại</a>
    </div>
</div>
</form>
</div>
</div>
</div>
@endsection
