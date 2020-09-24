
@extends('Frontend.master')
@section('content')
<div style="margin:20px 0px" class="layout-pageContact">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-sm-12 col-xs-12 box-heading-contact">

				<div class="box-map">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.9535674349904!2d106.71301411533402!3d10.7380621628357!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f222dc4cac3%3A0xed02c790aba9167a!2zSlVOTyBOZ3V54buFbiBUaOG7iyBUaOG6rXA!5e0!3m2!1svi!2s!4v1555663624868!5m2!1svi!2s" width="100%" height="700" frameborder="0" style="border:0" allowfullscreen=""></iframe>
				</div>


			</div>
			<div class="col-md-6 col-sm-12 col-xs-12  wrapbox-content-page-contact">
				<div class="header-page-contact clearfix">
					<h1>Liên hệ</h1>
				</div>
				<div class="box-info-contact">
					<ul class="list-info">
						<li>
							<p>Địa chỉ chúng tôi</p>
							<p><strong>313 Nguyễn Thị Thập, Phường Tân Phú, Quận 7, Tp. Hồ Chí Minh.</strong></p>
						</li>
						<li>
							<p>Email chúng tôi</p>
							<p><strong>cskh@juno.vn</strong></p>
						</li>
						<li>
							<p>Điện thoại</p>
							<p><strong>1800 1160</strong></p>
						</li>
						<li>
							<p>Thời gian làm việc</p>
							<p><strong>Thứ 2 đến Thứ 6 từ 8h30 đến 17h30</strong></p>
						</li>
					</ul>
				</div>
				<div class="box-send-contact">
					<h2>Gửi thắc mắc cho chúng tôi</h2>
					<div id="col-left contactFormWrapper">
						<form accept-charset="UTF-8" action="/post-contact" class="contact-form" method="post">

						<div class="contact-form">
							<div class="row">
								<div class="col-sm-12 col-xs-12">
									<div class="input-group">
										<input required="" type="text" name="name" class="form-control" placeholder="Tên của bạn" aria-describedby="basic-addon1">
									</div>
								</div>
								<div class="col-sm-6 col-xs-12">
									<div class="input-group">
										<input required="" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" type="email" name="email" class="form-control" placeholder="Email của bạn" aria-describedby="basic-addon1">
									</div>
								</div>
								<div class="col-sm-6 col-xs-12">
									<div class="input-group">
										<input pattern="[0-9]{10,12}" maxlength="10" minlength="10" onkeypress="validate(event)" required="" type="tel" name="phone" class="form-control" placeholder="Số điện thoại của bạn" aria-describedby="basic-addon1">
									</div>
								</div>
								<div class="col-sm-12 col-xs-12">
									<div class="input-group">
										<textarea name="description" placeholder="Nội dung"></textarea>
									</div>
                                </div>
                                @csrf
								<div class="col-xs-12">
									<button class="button dark">Gửi cho chúng tôi</button>
								</div>
							</div>
						</div>

<input id="bf4024c3b06547ed9caa2b48d6bcfea5" name="g-recaptcha-response" type="hidden" value="03AGdBq24yVyLbplzowUp6ULgQnv986fEirJHro6b8bgT5E8VtggtaqK3rVTL86dCfjMI0nJ-EALwqJaf0J9gmS5g_ON9uOjZ8yTnpFj7uNziTP5LRS40qrq-_aIsXSbMbAFo7sLWkDqXGCQwDSEMQL5hVtyYuUE-YhFy7lJzQDfQm92kCvA06h9v7m9ilBtPK0PAflDWP3t7VRxcjGVQYw_uDAGoweDxGcQKAt2_cjn7UJ_AL2-sU6F5RzrXLQ1zBpIIGSyaZOaBq0n8x83erTiyF4fVO1yPvhQ7br4gvlFhSfre92FhgACiiYQWjMK6uYRDuWgVoHsgzNazhP79QuvrNBcZ5VkgpEqCHg-tcF6Sjo2UqlRavIGeWTlOPKKlQmkO_C43diW84h-xA56NA4-dI0hLQpCJhP9vXf1ZaFsL3H8jAZuUg1qGjV9FwTZSybjfJnKlRuRnoFIidnhfFCo1KEC5g6Ag8i4FIuc91uTIqFHJF_ILaXJk"><script src="https://www.google.com/recaptcha/api.js?render=6LdD18MUAAAAAHqKl3Avv8W-tREL6LangePxQLM-"></script><script>grecaptcha.ready(function() {grecaptcha.execute('6LdD18MUAAAAAHqKl3Avv8W-tREL6LangePxQLM-', {action: 'submit'}).then(function(token) {document.getElementById('bf4024c3b06547ed9caa2b48d6bcfea5').value = token;});});</script></form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection
