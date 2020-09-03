<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a class="active" href="/home">
                        <i class="fa fa-dashboard"></i>
                        <span>Trang chủ</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-product-hunt"></i>
                        <span>Sản phẩm</span>
                    </a>
                    <ul class="sub">
                        <li><a href="{{ Route('product.index') }}">Danh sách sản phẩm</a></li>
                        <li><a href="{{ Route('product.create') }}">Thêm sản phẩm</a></li>
                        <li><a href="{{ Route('product.trash') }}">Sản phẩm đã xóa</a></li>
                        <li><a href="{{ Route('color.index') }}">Thêm màu cho sản phẩm</a></li>
                    </ul>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-bars"></i>
                        <span>Danh mục</span>
                    </a>
                    <ul class="sub">
                        <li><a href="{{ Route('category.index') }}">Danh sách danh mục</a></li>
                        <li><a href="{{ Route('category.create') }}">Thêm danh mục</a></li>
                        <li><a href="{{ Route('category.trash') }}">Danh mục đã xóa</a></li>
                    </ul>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-first-order"></i>
                        <span>Đơn hàng</span>
                    </a>
                    <ul class="sub">
                        <li><a href="{{ Route('order.index') }}">Danh sách đơn hàng</a></li>
                        <li><a href="{{ Route('order.trash') }}">Đơn hàng đã xóa</a></li>
                    </ul>
                </li>

                <li class="sub-menu">
                    <a href="/setting">
                        <i class="fa fa-cog"></i>
                        <span>Cài đặt mặc định</span>
                    </a>
                </li>
            </ul>
        </div>
        <!-- sidebar menu end-->
    </div>
</aside>
