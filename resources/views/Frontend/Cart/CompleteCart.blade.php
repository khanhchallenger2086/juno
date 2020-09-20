@extends('Frontend.master')
@section('content')
    <div style="margin: 30px 0px;" class="container-fluid text-center">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="text-default"> Hoàn tất đơn hàng </h3>
                <p> Mã đơn hàng của bạn là  {{$code}} <p>
                <p> Cảm ơn bạn đã đặt hàng </p>
                <p> Đơn hàng  của bạn đã được gửi về email của bạn </p>
            </div>
        </div>
    </div>
@endsection
