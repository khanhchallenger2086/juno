@extends('Backend.master')
@section('content')
@if (session()->has('msg'))
<p class="btn btn-success mb-2">{{session('msg')}}</p>

@endif
<div class="table-agile-info">

    <div class="panel panel-default">
        <div class="panel-heading">
            Tất cả form liên hệ
        </div>
        <div>
            <table class="table table-parent">
                <thead>
                    <tr>
                        <th> Tên</th>
                        <th> Email</th>
                        <th> Phone</th>
                        <th> Mô tả</th>
                        <th> Tùy chọn</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($list as $item)
                    <tr>
                        <td>{{ $item->name }}</td>
                        <td>{{ $item->email }}</td>
                        <td>{{ $item->phone }}</td>
                        <td>{{ $item->description }}</td>
                        <td>
                            <a class="btn btn-danger" onclick="return confirm('Bạn có muốn form liên hệ này không ?')"
                                href="{{ Route('contact.delete',$item->id) }}">Xóa</a>
                        </td>
                    </tr>
                    @endforeach
                    @if (json_decode($list) == [])
                    <tr>
                        <td colspan="6" class="text-center">Không có form liên hệ nào</td>
                    </tr>
                    @endif
                </tbody>

            </table>
        </div>
    </div>
</div>

@endsection
