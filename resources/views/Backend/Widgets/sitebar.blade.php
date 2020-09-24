<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <?php
            $id_user = session()->get('id_user');
            $id_role = DB::table('user')->where('id',$id_user)->first()->id_role;
            // $name_role = DB::table('roles')->where('id',$id_role)->first()->name;
        ?>
            <ul class="sidebar-menu" id="nav-accordion">
                @if ($id_role == 1 || $id_role == 4)
                <li>
                    <a class="{{ isset($ActiveHome) ? 'active' : '' }}" href="/admin">
                        <i class="fa fa-dashboard"></i>
                        <span>Trang chủ</span>
                    </a>
                </li>
                @endif
                @if ($id_role == 1 || $id_role == 2)
                <li class="sub-menu">
                    <a class="{{ isset($ActiveProduct) ? 'active' : '' }}" href="javascript:;">
                        <i class="fa fa-product-hunt"></i>
                        <span>Sản phẩm</span>
                    </a>
                    <ul class="sub">
                        <li><a class="{{ isset($ActiveListProduct) ? 'active' : '' }}" href="{{ Route('product.index') }}">Danh sách sản phẩm</a></li>
                        <li><a class="{{ isset($ActiveCreateProduct) ? 'active' : '' }}" href="{{ Route('product.create') }}">Thêm sản phẩm</a></li>
                        <li><a class="{{ isset($ActiveTrashProduct) ? 'active' : '' }}" href="{{ Route('product.trash') }}">Sản phẩm đã xóa</a></li>
                        <li><a class="{{ isset($ActiveListColor) ? 'active' : '' }}" href="{{ Route('color.index') }}">Thêm màu cho sản phẩm</a></li>
                    </ul>
                </li>
                @endif
                @if ($id_role == 1 || $id_role == 4)
                <li class="sub-menu">
                    <a class="{{ isset($ActiveCategory) ? 'active' : '' }}" href="javascript:;">
                        <i class="fa fa-bars"></i>
                        <span>Danh mục</span>
                    </a>
                    <ul class="sub">
                        <li><a class="{{ isset($ActiveListCategory) ? 'active' : '' }}" href="{{ Route('category.index') }}">Danh sách danh mục</a></li>
                        <li><a class="{{ isset($ActiveCreateCategory) ? 'active' : '' }}" href="{{ Route('category.create') }}">Thêm danh mục</a></li>
                        <li><a class="{{ isset($ActiveTrashCategory) ? 'active' : '' }}" href="{{ Route('category.trash') }}">Danh mục đã xóa</a></li>
                    </ul>
                </li>
                @endif
                @if ($id_role == 1 || $id_role == 3)
                <li class="sub-menu">
                    <a class="{{ isset($ActiveOrder) ? 'active' : '' }}" href="javascript:;">
                        <i class="fa fa-first-order"></i>
                        <span>Đơn hàng</span>
                    </a>
                    <ul class="sub">
                        <li><a class="{{ isset($ActiveListOrder) ? 'active' : '' }}" href="{{ Route('order.index') }}">Danh sách đơn hàng</a></li>
                        <li><a class="{{ isset($ActiveTrashOrder) ? 'active' : '' }}" href="{{ Route('order.trash') }}">Đơn hàng đã xóa</a></li>
                    </ul>
                </li>
                @endif
                @if ($id_role == 1)
                <li class="sub-menu">
                    <a class="{{ isset($ActiveUser) ? 'active' : '' }}"  href="/admin/user">
                        <i class="fa fa-user"></i>
                        <span>Tài khoản</span>
                    </a>
                </li>
                @endif
                @if ($id_role == 1)
                <li class="sub-menu">
                    <a class="{{ isset($ActiveContact) ? 'active' : '' }}"  href="/admin/contact">
                        <i class="fa fa-compress"></i>
                        <span>Liên hệ</span>
                    </a>
                </li>
                @endif
                @if ($id_role == 1 || $id_role == 4)
                <li class="sub-menu">
                    <a class="{{ isset($ActiveSetting) ? 'active' : '' }}"  href="/admin/setting">
                        <i class="fa fa-cog"></i>
                        <span>Cài đặt mặc định</span>
                    </a>
                </li>
                @endif
            </ul>
        </div>
        <!-- sidebar menu end-->
    </div>
</aside>
