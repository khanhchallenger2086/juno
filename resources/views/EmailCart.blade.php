
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Đơn hàng từ JUNO</h2>
    <p>Mã đơn hàng: {{$code_order}}</p>
    <p>Phương thức thanh toán: {{$payment_method}}</p>
    <p>Trạng thái đơn hàng: Chưa thanh toán</p>
    <p>Tổng đơn hàng {{number_format($total_order) . " VNĐ"}}</p>
  <p>Các sản phẩm đã đặt</p>
  <table class="table">
    <thead>
      <tr style="background-color:green">
        <th style="padding: 5px 5px">Tên</th>
        <th style="padding: 5px 5px">Giá</th>
        <th style="padding: 5px 5px">Số lượng</th>
        <th style="padding: 5px 5px">Tổng</th>
      </tr>
    </thead>
    <tbody>
        @foreach ($product as $item_product)
      <tr>
        <td style="padding: 5px 5px">{{$item_product->name_product}}</td>
        <td style="padding: 5px 5px">{{number_format($item_product->price_product) . " VNĐ"}}</td>
        <td  style="padding: 5px 5px;text-align:center">{{$item_product->amount}}</td>
        <td style="padding: 5px 5px">{{number_format($item_product->total_price) . " VNĐ"}}</td>
      </tr>
      @endforeach
    </tbody>
  </table>

</div>

</body>
</html>
