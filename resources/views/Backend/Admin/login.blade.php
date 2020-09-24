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
            @csrf
			<input type="email" class="ggg" name="email" placeholder="Email" required="">
			<input type="password" class="ggg" name="password" placeholder="Password" required="">
                <div class="text-center"><button class="btn btn-primary">Đăng nhập</button></div>
		</form>
</div>
</div>
@include('backend.widgets.script')
</body>
</html>
