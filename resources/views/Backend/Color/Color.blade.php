@extends('Backend.master')
@section('content')
@if (session()->has('msg'))
<p class="btn btn-success mb-2">{{session('msg')}}</p>

@endif

<div class="table-agile-info">

    <a class="btn btn-warning mb-2" href="{{route('color.create')}}">Thêm màu mới</a>
    <div class="panel panel-default">
        <div class="panel-heading">
            Tất cả các màu sắc của sản phẩm
        </div>
        <div>
            <table class="table table-parent">
                <thead>
                    <tr>
                        <th> Mã </th>
                        <th> Tên màu</th>
                        <th> Hình của màu </th>
                        <th> Ngày tạo </th>
                        <th> Tùy chọn </th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($list as $item)
                    <tr>
                        <td>{{ $item->id }}</td>
                        <td>{{ $item->name }}</td>
                        <td><img width="50" height="50" src="/backend/images/juno/{{ $item->image }}" alt=""> </td>
                        <td>{{ $item->created_at }}</td>
                        <td>
                            <a class="btn btn-primary" href="{{ Route('color.edit',$item->id) }}">Sửa</a>
                            <a class="btn btn-danger" onclick="return confirm('Bạn có muốn xóa màu này không ?')"
                                href="{{ Route('color.destroy_color',$item->id) }}">Xóa</a>
                        </td>
                    </tr>
                    @endforeach
                    @if (json_decode($list) == [])
                    <tr>
                        <td colspan="6" class="text-center">Không có màu nào</td>
                    </tr>
                    @endif
                </tbody>

            </table>
        </div>
    </div>
</div>

@endsection
