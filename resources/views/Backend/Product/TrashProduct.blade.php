@extends('Backend.master')
@section('content')
@if (session()->has('msg'))
<p class="btn btn-success mb-2">{{session('msg')}}</p>
@endif
<div class="table-agile-info">
    <div class="panel panel-default">
        <div class="panel-heading">
            Sản phẩm đã xóa
        </div>
        <form action="{{route('product.restore_trash')}}" method="get">
            <div>
                <table class="table table-parent trash">
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="all-input"></th>
                            <th> Mã sản phẩm</th>
                            <th> Tên sản phẩm</th>
                            <th> Hình ảnh</th>
                            <th> Thời gian xóa</th>
                            <th> Tùy chọn </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($list as $item)
                        <tr>
                            <td><input type="checkbox" name="{{$item->name}} {{$item->id}}" value="{{$item->id}}"></td>
                            <td>{{ $item->code }}</td>
                            <td>{{ $item->name }}</td>
                            <td><img width="50" height="50"
                                    src="/backend/images/juno/{{ substr($item->image_main, 0, strpos($item->image_main,";")) }}" alt=""> </td>
                            <td>{{ $item->deleted_at }}</td>
                            <td><a onclick="return confirm('Bạn có chắc xóa thẳng sản phẩm luôn không ??')" class="btn btn-danger"
                                    href="{{route('product.destroy_trash',$item->id)}}">Xóa Thẳng</a></td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="text-center "><button type="submit" class="mb-2 btn btn-primary">Phục hồi</button><a class=" mb-2 ml-2 btn btn-secondary"
                    href="{{route('product.index')}}">Quay về</a></div>
        </form>
    </div>
</div>

@endsection
