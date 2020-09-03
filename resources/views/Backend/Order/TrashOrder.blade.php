@extends('Backend.master')
@section('content')
@if (session()->has('msg'))
<p class="btn btn-success mb-2">{{session('msg')}}</p>
@endif
<div class="table-agile-info">
    <div class="panel panel-default">
        <div class="panel-heading text-left">
            Đơn hàng đã xóa
        </div>
        <form action="{{route('order.restore_trash')}}" method="get">
            <div>
                <table class="table table-parent trash">
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="all-input"></th>
                            <th> Mã đơn hàng</th>
                            <th> Tổng tiền</th>
                            <th> Phương thức thanh toán</th>
                            <th> Trạng thái đơn hàng</th>
                            <th> Ghi chú khách hàng</th>
                            <th> Thời gian xóa</th>
                            <th> Tùy chọn </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($list as $item)
                        <tr>
                            <td><input type="checkbox" name="{{$item->name}} {{$item->id}}" value="{{$item->id}}"></td>
                            <td>{{ $item->code }}</td>
                            <td>{{ $item->total_order }}</td>
                            <td>{{ $item->payment_method }}</td>
                            <td>{{ $item->payment_status == 1 ? "Đã thanh toán" : "Chưa thanh toán" }}</td>
                            <td>{{ $item->note_from_customer }}</td>
                            <td>{{ $item->deleted_at }}</td>
                            <td><a onclick="return confirm('Bạn có chắc xóa thẳng sản phẩm luôn không ??')" class="btn btn-danger"
                                    href="{{route('order.destroy_trash',$item->id)}}">Xóa Thẳng</a></td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="text-center "><button type="submit" class="mb-2 btn btn-primary">Phục hồi</button><a class=" mb-2 ml-2 btn btn-secondary"
                    href="{{route('order.index')}}">Quay về</a></div>
        </form>
    </div>
</div>

@endsection
