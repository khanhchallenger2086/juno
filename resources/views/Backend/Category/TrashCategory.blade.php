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
        <form action="{{route('category.restore_trash')}}" method="get">
            <div>
                <table class="table table-parent trash">
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="all-input"></th>
                            <th> Tên danh mục</th>
                            <th> Uri</th>
                            <th> Bí danh</th>
                            <th> Thời gian xóa</th>
                            <th> Tùy chọn </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($list as $item)
                        <tr>
                            <td><input type="checkbox" name="{{$item->name}} {{$item->id}}" value="{{$item->id}}"></td>
                            <td>{{ $item->name }}</td>
                            <td>{{ $item->uri }}</td>
                            <td>{{ $item->parent == 0 ? "Danh mục cha" : "Danh mục con" }}</td>
                            <td>{{ $item->deleted_at }}</td>
                            <td><a onclick="return confirm('Bạn có chắc xóa thẳng sản phẩm luôn không ??')" class="btn btn-danger"
                                    href="{{route('category.destroy_trash',$item->id)}}">Xóa Thẳng</a></td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="text-center "><button type="submit" class="mb-2 btn btn-primary">Phục hồi</button><a class=" mb-2 ml-2 btn btn-secondary"
                    href="{{route('category.index')}}">Quay về</a></div>
        </form>
    </div>
</div>

@endsection
