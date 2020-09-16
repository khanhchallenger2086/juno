<!DOCTYPE html>

<head>
    <title> Catite Template | Home :: w3layouts</title>
    <meta name="CSRF-TOKEN" content="{{csrf_token()}}">
    {{-- <meta content="{{crsf_token()}}" name="csrf-param" /> --}}
    @include('frontend.widgets.head')
</head>

{{-- <body>
    <!--header start-->
    @include('frontend.widgets.header')
    <!--header end-->

    <!--main content start-->
    <section style="height: 100vh" id="main-content">
        <section class="wrapper">
            @yield('content')
        </section>
    </section>

     <!--footer start-->
     @include('frontend.widgets.footer')
     <!--footer end-->

    <!--main content end-->
    @include('frontend.widgets.script')
</body> --}}

<body id="juno-template" class="index">
    {{-- <script src="{{ asset('backend/js/jquery.min.js')}}" type="text/javascript"></script> --}}
    <div id="mm-0" class="mm-page mm-slideout">
        <div class="main-body">
            <div>
                <main class="main-index">
                    <div class="bg-body"></div>
                    <!--header start-->
                    @include('frontend.widgets.header')
                    <!--header end-->

                    <!--main content start-->
                    @include('frontend.widgets.cart')
                    @yield('content')

                    <!--footer start-->
                    @include('frontend.widgets.footer')
                    <!--footer end-->

                    <!--main content end-->
                    @include('frontend.widgets.script')

                </main>
            </div>
        </div>
    </div>

</body>

</html>
