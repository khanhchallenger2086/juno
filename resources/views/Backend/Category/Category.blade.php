@extends('Backend.master')
@section('content')
@if (session()->has('msg'))
<p class="btn btn-success mb-2">{{session('msg')}}</p>

@endif
<div class="table-agile-info">

    <a class="btn btn-warning mb-2" href="{{route('category.create')}}">Thêm mới danh mục</a>
    <div class="panel panel-default">
        <div class="panel-heading">
            Tất cả các danh mục
        </div>
        <div>
            <table class="table table-parent">
                <thead>
                    <tr>
                        <th> Tên danh mục</th>
                        <th> Uri</th>
                        <th> Bí danh</th>
                        <th> Ngày tạo</th>
                        <th> Tùy chọn</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($list as $item)
                    <tr>
                        <td>{{ $item->name }}</td>
                        <td>{{ $item->uri }}</td>
                        <td>@if ($item->parent == 0) Danh mục cha @else Danh mục con @endif</td>
                        <td>{{ $item->created_at }}</td>
                        <td>
                            <a class="btn btn-primary" href="{{ Route('category.edit',$item->id) }}">Sửa</a>
                            <a class="btn btn-danger" onclick="return confirm('Bạn có muốn xóa danh mục này không ?')"
                                href="{{ Route('category.delete',$item->id) }}">Xóa</a>
                        </td>
                    </tr>
                    @endforeach
                    @if ($list == [])
                    <tr>
                        <td colspan="6" class="text-center">Không có danh mục nào</td>
                    </tr>
                    @endif
                </tbody>

            </table>
        </div>
    </div>
</div>

@endsection
