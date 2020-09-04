<!DOCTYPE html>

<head>
    <title> Catite Template | Home :: w3layouts</title>
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
    <div id="mm-0" class="mm-page mm-slideout">
        <div class="main-body">
            <div>
                <main class="main-index">

                    <!--header start-->
                    @include('frontend.widgets.header')
                    <!--header end-->

                    <!--main content start-->
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
