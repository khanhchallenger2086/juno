<!DOCTYPE html>

<head>
    <title>Visitors an Admin Panel Category Bootstrap Responsive Website Template | Home :: w3layouts</title>
    @include('backend.widgets.head')
</head>

<body>
    <!--header start-->
    @include('backend.widgets.header')
    <!--header end-->
    <!--sidebar start-->
    @include('backend.widgets.sitebar')

    <!--sidebar end-->
    <!--main content start-->
    <section style="height: 100vh" id="main-content">
        <section class="wrapper">
            @yield('content')
        </section>
    </section>
    <!--main content end-->
    @include('backend.widgets.script')
</body>

</html>
