@extends('Backend.master')
@section('content')
@if (session()->has('msg'))
<p class="btn btn-success mb-2">{{session('msg')}}</p>

@endif
<div class="table-agile-info">
    <div class="popup d-none">
        <button style="margin-top: -36px;margin-right: 14px;" class="btn btn-danger float-right" onclick="off_box()">X</button>
        <form class="cmxform form-horizontal " id="commentForm" method="get" action="" novalidate="novalidate">
            {{-- đặt name và id khi nút xem được bấm  --}}
            <input class="form-control" type="hidden" id="id_product" data-id="">
            <input class="form-control" type="hidden" id="name_table_son" data-name="">

            <div class="form-group ">
                <label for="cname" class="control-label col-lg-3">Màu sắc</label>
                <div class="col-lg-6">
                    <input class=" form-control" type="text" id="color" placeholder="Post a question?" value="" required>
                </div>
            </div>
            <div class="form-group ">
                <label for="cemail" class="control-label col-lg-3">Kích thước</label>
                <div class="col-lg-6">
                    <input class="form-control" type="text" id="size" placeholder="Post a question?" value="" required>
                </div>
            </div>
            <div class="form-group ">
                <label for="curl" class="control-label col-lg-3">Giá bán</label>
                <div class="col-lg-6">
                    <input class="form-control" type="number" id="price" value="" required>
                </div>
            </div>
            <div class="form-group ">
                <label for="ccomment" class="control-label col-lg-3">Giá thị trường</label>
                <div class="col-lg-6">
                    <input class="form-control" type="number" id="price_market" value="" required />
                </div>
            </div>
            <div class="text-center">
                <p class="d-none msg mb-2 btn btn-danger">Vui lòng nhập đủ thông tin trước khi cập nhập</p>
            </div>
        </form>
    </div>
    <a class="btn btn-warning mb-2" href="{{route('product.create')}}">Thêm mới sản phẩm</a>
    <div class="panel panel-default">
        <div class="panel-heading">
            Tất cả sản phẩm
        </div>
        <div>
            <table class="table table-parent">
                <thead>
                    <tr>
                        <th> Mã</th>
                        <th> Tên</th>
                        <th> Hình ảnh</th>
                        <th> Kiểu dáng</th>
                        <th> Chất liệu</th>
                        <th> Tùy chỉnh</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($list as $item)
                    <tr>
                        <td>{{ $item->code }}</td>
                        <td>{{ $item->name }}</td>
                        <td><img width="50" height="50" src="/backend/images/juno/{{ substr($item->image_main, 0, strpos($item->image_main,";")) }}"
                                alt=""> </td>
                        <td>{{ $item->style }}</td>
                        <td>{{ $item->material }}</td>
                        <td>
                            <a class="btn btn-primary openvariant" href="#" data-id="{{$item->id}}">Xem</a>
                            <a class="btn btn-primary" href="{{ Route('product.edit',$item->id) }}">Sửa</a>
                            <a class="btn btn-danger" onclick="return confirm('Bạn có muốn xóa sản phẩm này không ?')"
                                href="{{ Route('product.delete',$item->id) }}">Xóa</a>
                        </td>
                    </tr>

                    <tr class="variant variant{{$item->id}}">
                        <td style="padding: 20px 10px!important" colspan="6">
                            <a onclick="open_box()" href="#" class="btn btn-success">Thêm Chi Tiết</a>
                            <a href="#" class="btn btn-danger float-right mr-3 offvariant">X</a>
                            <table class="table table-sonn table-son{{$item->id}} mb-0">
                                <thead>
                                    <tr>
                                        <th>Màu sắc</th>
                                        <th>Kích thước</th>
                                        <th>Giá Bán</th>
                                        <th>Giá Thị Trường</th>
                                        <th>Số lượng</th>
                                        <th>Tùy Chọn</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @if ($item->list_variant != [])
                                    <td class="no-data d-none text-center" colspan="6">Không có dữ liệu
                                    </td>
                                    @foreach ($item->list_variant as $item_variant)
                                    <tr>
                                        <td>{{$item_variant->color}}</td>
                                        <td>{{$item_variant->size}}</td>
                                        <td>{{ number_format((float) $item_variant->price).' VND' }}</td>
                                        <td>{{ number_format((float) $item_variant->price_market).' VND'}}</td>
                                        <td></td>
                                        <td>
                                            <a class="btn btn-primary update-variant" data-id="{{$item_variant->id}}" href="#">Cập nhập</a>
                                            <a class="btn btn-primary remove_variant" data-id="{{$item_variant->id}}" href="#">Xóa</a>
                                        </td>
                                    </tr>


                                    @endforeach
                                    @else
                                    <td class="no-data text-center" colspan="6">Không có dữ liệu
                                    </td>
                                    @endif

                                </tbody>
                            </table>
                        </td>
                    </tr>
                    @endforeach
                    @if ($list == [])
                    <tr>
                        <td colspan="6" class="text-center">Không có sản phẩm</td>
                    </tr>
                    @endif
                </tbody>

            </table>
            {{-- $i đại diện cho page lun  --}}
            @if ($count > 1)
            <div class="text-right mr-5">
                <ul class="pagination">
                    @if ($page > 0)
                    <li class="page-item"><a class="page-link" href="?page={{$page - 1}}">
                            <</a> </li> @endif @for ($i=$page - 3; $i < $count; $i++) @if ($i> -1 && $i < $page + 4) <li class="page-item"><a
                                        class="page-link @if ($page == $i) bg-success @endif" href="?page={{$i}}">{{$i}}</a></li>
                    @endif
                    @endfor

                    @if ($page != $count - 1 )
                    <li class="page-item"><a class="page-link" href="?page={{$page + 1}}">></a></li>
                    @endif
                </ul>
            </div>
            @endif
        </div>
    </div>
</div>

@endsection
