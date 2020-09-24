@extends('Backend.master')
@section('content')
@if (session()->has('msg'))
<p class="btn btn-success mb-2">{{session('msg')}}</p>

@endif
<div class="table-agile-info">
    <div class="popup d-none">
        <h4 class="text-center mb-2">Thông tin khách hàng</h4>
        <form class="cmxform form-horizontal " id="commentForm" method="get" action="" novalidate="novalidate">
            <div class="form-group ">
                <label for="cname" class="control-label col-lg-3">Họ tên</label>
                <div class="col-lg-6">
                    <input class=" form-control" type="text" readonly id="name" value="" required>
                </div>
            </div>
            <div class="form-group ">
                <label for="cemail" class="control-label col-lg-3">Số điện thoại</label>
                <div class="col-lg-6">
                    <input class="form-control" type="text" readonly id="phone" value="" required>
                </div>
            </div>
            <div class="form-group ">
                <label for="curl" class="control-label col-lg-3">Email</label>
                <div class="col-lg-6">
                    <input class="form-control" type="email" readonly id="email" value="1212" required>
                </div>
            </div>
            <div class="form-group ">
                <label for="ccomment" class="control-label col-lg-3">Địa chỉ</label>
                <div class="col-lg-6">
                    <input class="form-control" type="number" readonly id="address" value="" required />
                </div>
            </div>
        </form>
        <div class="text-center"><button class="btn btn-danger " onclick="off_box()">Đóng</button></div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            Tất cả đơn hàng
        </div>
        <div>
            <table class="table table-parent">
                <thead>
                    <tr>
                        <th> Mã đơn hàng</th>
                        <th> Tổng đơn hàng</th>
                        <th> PT thanh toán</th>
                        <th> Trạng thái</th>
                        <th> Tùy chỉnh</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($list as $item)
                    <tr>
                        <td>{{ $item->code }}</td>
                        <td>{{ number_format($item->total_order) . ' VND' }}</td>
                        <td>{{ $item->payment_method }}</td>
                        <td>{{ $item->payment_status == 1 ? "Đã thanh toán" : "Chưa thanh toán" }}</td>
                        <td>
                            <a class="btn btn-primary info_customer" href="#"  data-id="{{ $item->id_customer }}">Thông tin KH</a>
                            <a class="btn btn-primary openvariant" href="#" data-id="{{$item->id}}">Chi tiết</a>
                            <a class="btn btn-success" href="{{route('order.complete',$item->id)}}" data-id="{{$item->id}}">Hoàn Tất</a>
                            <a class="btn btn-danger" onclick="return confirm('Bạn có muốn xóa đơn hàng này không ?')"
                                href="{{ Route('order.delete',$item->id) }}">Xóa</a>
                        </td>
                    </tr>

                    <tr class="variant variant{{$item->id}}">
                        <td style="padding: 20px 10px!important" colspan="6">
                            <a href="#" class="btn btn-danger float-right mr-3 offvariant">X</a>
                            <table class="table table-sonn table-son{{$item->id}} mb-0">
                                <thead>
                                    <tr>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá </th>
                                        <th>Số lượng</th>
                                        <th>Tổng tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($item->order_detail as $item_order_detail)
                                    <tr>
                                        <td>{{$item_order_detail->name_product}}</td>
                                        <td>{{ number_format((float)$item_order_detail->price_product). ' VND'}}</td>
                                        <td>{{ $item_order_detail->amount }}</td>
                                        <td>{{  number_format($item_order_detail->price_product * $item_order_detail->amount) . ' VND' }}</td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    @endforeach
                    @if ($list == [])
                    <tr>
                        <td colspan="6" class="text-center">Không có đơn hàng</td>
                    </tr>
                    @endif
                </tbody>

            </table>
        </div>
    </div>
</div>

@endsection
