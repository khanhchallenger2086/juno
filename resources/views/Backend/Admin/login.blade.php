<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<head>
    @include('backend.widgets.head')
</head>
<body>
<div class="log-w3">
<div class="w3layouts-main">
    <?php
        if (isset($error)) {
            echo '<p style="display: block; margin-bottom:10px" class="btn btn-danger">' . $error . '</p>';
        }
        ?>
	<h2>Đăng nhập</h2>
        <form action="{{ route('auth.login') }}" method="post">
			<input type="email" class="ggg" name="email" placeholder="Nhập email" required="">
			<input type="password" class="ggg" name="password" placeholder="Nhập password" required="">
			<span><input type="checkbox" />Ghi nhớ đăng nhập</span>
			<h6><a href="#">Quên mật khẩu?</a></h6>
                <button class="btn btn-primary">Đăng nhập</button>
                @csrf
		</form>
        <p>Bạn chưa có tài khoản ?<a href="registration.html">Tạo tài khoản</a></p>
</div>
</div>
@include('backend.widgets.script')
</body>
</html>
