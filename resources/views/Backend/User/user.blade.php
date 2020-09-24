@extends('Backend.master')
@section('content')
@if (session()->has('msg'))
<p class="btn btn-success mb-2">{{session('msg')}}</p>

@endif
<div class="table-agile-info  col-lg-7">
    <a class="btn btn-warning mb-2" href="{{route('user.create')}}">Thêm thành viên</a>
    <div class="panel panel-default">
        <div class="panel-heading">
            Tất cả tài khoản
        </div>
        <div>
            <table class="table table-parent">
                <thead>
                    <tr>
                        <th> Tên</th>
                        <th> Email</th>
                        <th> Phân quyền</th>
                        <th> Tùy chọn </th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                            $id_user = session()->get('id_user');
                            $id_role = DB::table('user')->where('id',$id_user)->first()->id_role;
                            // $name_role = DB::table('roles')->where('id',$id_role)->first()->name;
                        ?>
                    @foreach ($list as $item)
                    <tr>
                        <td>{{ $item->name }}</td>
                        <td>{{ $item->email }}</td>
                        <td>
                        <select @if($id_user != 1) @if($item->id_role == $id_role) disabled  @endif @endif data-id="{{$item->id}}" style="width:50%;" class="form-control" name="" id="role">
                                @foreach ($role as $item_role)
                                    <option @if($id_user != 1) @if($id_role == $item_role->id) disabled  @endif @endif value="{{$item_role->id}}"  {{ $item->id_role == $item_role->id ? "selected" : "" }}>{{$item_role->name}}</option>
                                @endforeach
                            </select>
                        </td>
                        <td>
                            <form action="{{route('role.delete',$item->id) }}" method="get">
                                <button @if($id_user != 1) @if($item->id_role == $id_role) disabled  @endif @endif class="btn btn-danger" onclick="return confirm('Bạn có muốn xóa người dùng này không ?')"
                                >Xóa</button>
                            </form>
                        </td>
                    </tr>

                    @endforeach
                </tbody>
            </table>
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
