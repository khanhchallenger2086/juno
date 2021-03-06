@extends('Frontend.master')

@section('content')
<div id="product" class="productDetail-page">
    <div class="breadcrumb-shop clearfix">
        <div class="padding-lf-40 clearfix">
            <div class=" ">
                <ol class="breadcrumb breadcrumb-arrows clearfix">
                    <li><a href="/home" target="_self"><i class="icofont-home"></i> Trang chủ</a></li>
                <li class="active"><span> {{$list->name}}</span></li>
                </ol>
            </div>
        </div>
    </div>
    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
        <div class="container">
            <div class="row product-detail-wrapper">
                <div class="clearfix product-detail-main pr_style_01">
                    <div class="col-md-8 col-sm-7 col-xs-12">
                        <div class="gallery clearfix">
                            <div class="pics clearfix">
                                <div class="row">
                                    <div class="thumbs col-md-3">
                                        <?php
                                            $image_main = explode(";",$list->image_main);
                                            $image_detail = explode(";",$list->image_detail);
                                            array_pop($image_main);
                                            array_pop($image_detail);
                                        ?>
                                        @foreach ($image_main as $item_main)
                                        <div class="preview"> <a href="#" class="img-box" data-full="/backend/images/juno/{{$item_main}}"
                                                data-title="Spring 2013 | Luna + Hill"> <img src="/backend/images/juno/{{$item_main}}" /> </a>
                                        </div>
                                        @endforeach
                                    </div>

                                    <div class="col-md-9">
                                        <a href="/backend/images/juno/{{$item_main}}" class="full" title="Spring 2013 | Luna + Hill">
                                            <!-- first image is viewable to start -->
                                            <img src="/backend/images/juno/{{$item_main}}"> </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix removeMobile">

                            <div class="viewMoreProduct">
                                @foreach ($image_detail as $item_detail)
                                <p><img src="/backend/images/juno/{{$item_detail}}">
                                </p>
                                @endforeach
                            </div>
                            <div class="cloneCmt">
                                <div id="product-review" class="clearfix comment">

                                    {{-- <a class="btn btn-default btn--view-more">
                                        <span class="less-text">Thu gọn <i class="fa fa-chevron-up"></i></span>
                                        <span class="more-text">Xem thêm <i class="fa fa-chevron-down"></i></span>
                                    </a> --}}
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php
                        $created_at = strtotime($list->created_at);
                        $now = strtotime(date("Y-m-d H:i:s", strtotime('+7 hours')));
                        $oneweek = 86400 * 7;
                        if ($now - $created_at < $oneweek ) {
                            $new_product = 1;
                        }
                        // if (session()->has('cart')) {
                        // dd(session()->get('cart'));
                        // }
                    ?>
                    <div class="col-md-4 col-sm-5 col-xs-12 product-content-desc rightHeightProduct" id="detail-product">
                        <div class="product-title">
                            <h1>{{$list->name}}</h1>
                            <span class="skuCode">Mã: <b>{{$list->code}}</b></span>
                            <span class="pro-soldold">
                                Trạng thái:
                                <span class="statusProductNew">{{ isset($new_product) ? "Mẫu mới" : "" }} </span>


                                {{-- <span class="statusProduct">Còn hàng</span> --}}
                            </span>
                            {{-- <span class="reviewProduct ">
                                Xếp hạng:
                                <span>
                                    <img src="images/icon-star-rank_92de60964388463a84c576970508b193.jpg" alt="Star 1">
                                    <img src="images/icon-star-rank_92de60964388463a84c576970508b193.jpg" alt="Star 2">
                                    <img src="images/icon-star-rank_92de60964388463a84c576970508b193.jpg" alt="Star 3">
                                    <img src="images/icon-star-rank_92de60964388463a84c576970508b193.jpg" alt="Star 4">
                                    <img src="images/icon-star-rank-grey_f72ac67c793947e389bd31d4287a7fca.jpg" alt="Star 5">
                                </span>
                            </span> --}}
                        </div>
                        <div class="product-price" id="price-preview" data-price-min="455000">
                            <span class="pro-price">{{ isset($list->list_variant) ? number_format($list->list_variant[0]->price) . "₫" : "0₫" }}</span></div>
                        <div class="vat-price">(Giá đã bao gồm VAT)</div>
                        <span id="proDis" class="hide">-455000</span>
                        <?php
                                $color = array_column($list->list_variant,"color");
                                $color = array_count_values($color);
                            ?>


                        <script type="text/javascript">
                            var str = <?php echo json_encode($list->list_variant) ?>;
                            $(document).ready(function(){
                                $(".color input").click(function(){
                                    var click_color = $(this).val();
                                    var ar = $(str).filter(function(i,v){
                                         return  v.color === click_color
                                    });

                                    if (ar) {
                                        $(".size-1").children().remove();
                                        ar.each(function(){ // $(this) là của ar đang lâp
                                            $(".size-1").append(`
                                            <div class="n-sd swatch-element size">
                                                <label for="id${$(this)[0].id}">
                                                    <input value="${$(this)[0].price}" class="pro_price" type="hidden">
                                                    <input value="${$(this)[0].id}" id="id${$(this)[0].id}" type="radio" name="size">
                                                    <span>${$(this)[0].size}</span>
                                                    </label>
                                                </div>
                                            `);
                                        });
                                        $(".size label")[0].click();
                                    }
                                });
                                $(".color-1 label")[0].click();
                            });
                        </script>

                        <form id="add-item-form" action="/cart/add" method="post" class="variants clearfix">

                            <div class="select-swatch clearfix ">
                                <div id="variant-swatch-0" class="borderImgRadius color_each swatch clearfix modifyClick" data-option="option1"
                                    data-option-index="0">
                                    <div class="header">
                                        Màu sắc

                                    </div>
                                    <div class="select-swap color-1">
                                        @foreach ($color as $key => $item)
                                        <?php
                                            $image = DB::table('colors')->where("deleted_at",null)->where("name",$key)->first()->image;
                                            ?>
                                        <div class="swatch-element color den">
                                            <label for="id-{{$key}}" class="den">
                                                <img src="/backend/images/juno/{{ $image }}" alt="Đen">
                                            </label>
                                            <input id="id-{{$key}}" value="{{$key}}" type="radio" name="color">
                                        </div>
                                        @endforeach
                                    </div>
                                </div>

                                <div id="variant-swatch-1" class=" swatch clearfix" data-option="option2" data-option-index="1">
                                    <div class="header">
                                        Kích thước
                                        <span class="guideSize">
                                            <a href="#" data-toggle="modal" data-target="#modalSize">Hướng dẫn tính size giày</a>
                                        </span>

                                    </div>
                                    <div class="select-swap size-1">
                                        <?php $ar = []; ?>
                                        @foreach ($list->list_variant as $item)
                                        @if (!in_array($item->size,$ar))
                                        <div data-value="39" class="n-sd swatch-element size">
                                            <label>
                                                <input value="{{$item->size}}" type="radio" name="size">
                                                <span>{{$item->size}}</span>
                                            </label>
                                        </div>
                                        <?php $ar[] = $item->size?>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                                <a data-api="{{route('ajax.add-cart')}}" data-id="{{ $list->id}}" id="add-to-cart" class=" d-block text-center"
                                    name="add">Mua
                                    ngay</a>
                            </div>

                            {{-- <div class="selector-actions">
                                <div class="quantity-area clearfix hide">
                                    <input type="button" value="-" onclick="minusQuantity()" class="qty-btn">
                                    <input type="text" id="quantity" name="quantity" value="1" min="1" class="quantity-selector">
                                    <input type="button" value="+" onclick="plusQuantity()" class="qty-btn">
                                </div>
                                <div class="wrap-addcart clearfix">
                                    <input type="hidden" id="inventory-variant-buyer" value="50">

                                    <button type="button" id="add-to-cart" class="add-to-cartProduct btn-addtocart" name="add">Mua ngay</button>
                                </div>
                                <div class="btnStoreNew false">
                                </div>
                            </div>
                            <div class="product-action-bottom visible-xs">
                                <div class="input-bottom hide">
                                    <input id="quan-input" type="number" value="1" min="1">
                                </div>

                                <button data-handle="/products/giay-sandal-mui-vuong-got-vuong-anh-kim-loai" type="button" id="add-to-cartbottom"
                                    class="add-cart-bottom">Thêm vào giỏ hàng</button>
                                <div class="btnStoreDetailMobile">
                                </div>
                            </div> --}}
                        </form>
                        <ul class="policyProduct">
                            <li>
                                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
                                    y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                                    <g>
                                        <g>
                                            <path d="M476.158,231.363l-13.259-53.035c3.625-0.77,6.345-3.986,6.345-7.839v-8.551c0-18.566-15.105-33.67-33.67-33.67h-60.392
                                 V110.63c0-9.136-7.432-16.568-16.568-16.568H50.772c-9.136,0-16.568,7.432-16.568,16.568V256c0,4.427,3.589,8.017,8.017,8.017
                                 c4.427,0,8.017-3.589,8.017-8.017V110.63c0-0.295,0.239-0.534,0.534-0.534h307.841c0.295,0,0.534,0.239,0.534,0.534v145.372
                                 c0,4.427,3.589,8.017,8.017,8.017c4.427,0,8.017-3.589,8.017-8.017v-9.088h94.569c0.008,0,0.014,0.002,0.021,0.002
                                 c0.008,0,0.015-0.001,0.022-0.001c11.637,0.008,21.518,7.646,24.912,18.171h-24.928c-4.427,0-8.017,3.589-8.017,8.017v17.102
                                 c0,13.851,11.268,25.119,25.119,25.119h9.086v35.273h-20.962c-6.886-19.883-25.787-34.205-47.982-34.205
                                 s-41.097,14.322-47.982,34.205h-3.86v-60.393c0-4.427-3.589-8.017-8.017-8.017c-4.427,0-8.017,3.589-8.017,8.017v60.391H192.817
                                 c-6.886-19.883-25.787-34.205-47.982-34.205s-41.097,14.322-47.982,34.205H50.772c-0.295,0-0.534-0.239-0.534-0.534v-17.637
                                 h34.739c4.427,0,8.017-3.589,8.017-8.017s-3.589-8.017-8.017-8.017H8.017c-4.427,0-8.017,3.589-8.017,8.017
                                 s3.589,8.017,8.017,8.017h26.188v17.637c0,9.136,7.432,16.568,16.568,16.568h43.304c-0.002,0.178-0.014,0.355-0.014,0.534
                                 c0,27.996,22.777,50.772,50.772,50.772s50.772-22.776,50.772-50.772c0-0.18-0.012-0.356-0.014-0.534h180.67
                                 c-0.002,0.178-0.014,0.355-0.014,0.534c0,27.996,22.777,50.772,50.772,50.772c27.995,0,50.772-22.776,50.772-50.772
                                 c0-0.18-0.012-0.356-0.014-0.534h26.203c4.427,0,8.017-3.589,8.017-8.017v-85.511C512,251.989,496.423,234.448,476.158,231.363z
                                 M375.182,144.301h60.392c9.725,0,17.637,7.912,17.637,17.637v0.534h-78.029V144.301z M375.182,230.881v-52.376h71.235
                                 l13.094,52.376H375.182z M144.835,401.904c-19.155,0-34.739-15.583-34.739-34.739s15.584-34.739,34.739-34.739
                                 c19.155,0,34.739,15.583,34.739,34.739S163.99,401.904,144.835,401.904z M427.023,401.904c-19.155,0-34.739-15.583-34.739-34.739
                                 s15.584-34.739,34.739-34.739c19.155,0,34.739,15.583,34.739,34.739S446.178,401.904,427.023,401.904z M495.967,299.29h-9.086
                                 c-5.01,0-9.086-4.076-9.086-9.086v-9.086h18.171V299.29z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path d="M144.835,350.597c-9.136,0-16.568,7.432-16.568,16.568c0,9.136,7.432,16.568,16.568,16.568
                                 c9.136,0,16.568-7.432,16.568-16.568C161.403,358.029,153.971,350.597,144.835,350.597z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path d="M427.023,350.597c-9.136,0-16.568,7.432-16.568,16.568c0,9.136,7.432,16.568,16.568,16.568
                                 c9.136,0,16.568-7.432,16.568-16.568C443.591,358.029,436.159,350.597,427.023,350.597z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path d="M332.96,316.393H213.244c-4.427,0-8.017,3.589-8.017,8.017s3.589,8.017,8.017,8.017H332.96
                                 c4.427,0,8.017-3.589,8.017-8.017S337.388,316.393,332.96,316.393z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path d="M127.733,282.188H25.119c-4.427,0-8.017,3.589-8.017,8.017s3.589,8.017,8.017,8.017h102.614
                                 c4.427,0,8.017-3.589,8.017-8.017S132.16,282.188,127.733,282.188z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path d="M278.771,173.37c-3.13-3.13-8.207-3.13-11.337,0.001l-71.292,71.291l-37.087-37.087c-3.131-3.131-8.207-3.131-11.337,0
                                 c-3.131,3.131-3.131,8.206,0,11.337l42.756,42.756c1.565,1.566,3.617,2.348,5.668,2.348s4.104-0.782,5.668-2.348l76.96-76.96
                                 C281.901,181.576,281.901,176.501,278.771,173.37z" />
                                        </g>
                                    </g>
                                </svg>
                                <span class="infoPolicy">
                                    <h5>
                                        MIỄN PHÍ GIAO HÀNG TOÀN QUỐC
                                    </h5>
                                    <span>(Sản phẩm trên 300,000đ)</span>
                                </span>
                            </li>
                            <li>
                                <svg id="Layer_35" enable-background="new 0 0 64 64" height="512" viewBox="0 0 64 64" width="512"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="m62.22 41c.48-.532.78-1.229.78-2 0-1.654-1.346-3-3-3h-3v-19h-26v15h-2.515c-1.846 0-3.583.71-4.899 2h-2.586v-2h-20v22h20v-2h2.764l2.522 1.261c.966.483 2.049.739 3.13.739h1.584v9h26v-9h3c1.654 0 3-1.346 3-3 0-.771-.301-1.468-.78-2 .48-.532.78-1.229.78-2s-.301-1.468-.78-2c.48-.532.78-1.229.78-2s-.301-1.468-.78-2zm-1.22 6c0 .552-.448 1-1 1h-3v-2h3c.552 0 1 .448 1 1zm-11.92 14h-10.16c-.441-3.059-2.861-5.479-5.92-5.92v-8.184c2.303 3.659 6.367 6.104 11 6.104s8.697-2.445 11-6.104v8.184c-3.059.441-5.479 2.861-5.92 5.92zm-9.858-22.742c.531 1.587 2.014 2.742 3.778 2.742h2c1.103 0 2 .897 2 2v2h-4c-1.103 0-2-.897-2-2h-2c0 2.206 1.794 4 4 4v2h2v-2h4v-4c0-2.206-1.794-4-4-4h-2c-1.103 0-2-.897-2-2v-2h4c1.103 0 2 .897 2 2h2c0-2.206-1.794-4-4-4v-2h-2v2h-2.278c-.347-.595-.985-1-1.722-1h-2.521c2.023-1.897 4.706-3 7.521-3 6.065 0 11 4.935 11 11s-4.935 11-11 11-11-4.935-11-11h2c1.645 0 3.137-.666 4.222-1.742zm17.778 5.742v-2h3c.552 0 1 .448 1 1s-.448 1-1 1zm3-6c.552 0 1 .448 1 1s-.448 1-1 1h-3v-2zm-5-15.101c-1.956-.399-3.5-1.943-3.899-3.899h3.899zm-18.101-3.899c-.399 1.956-1.943 3.5-3.899 3.899v-3.899zm-3.899 5.92c3.059-.441 5.479-2.861 5.92-5.92h10.16c.441 3.059 2.861 5.479 5.92 5.92v8.184c-2.303-3.659-6.367-6.104-11-6.104-3.993 0-7.765 1.869-10.22 5h-.78zm-30 9.08h10v18h-10zm16 3.586-2.414 2.414 2.414 2.414v9.586h-4v-18h4zm10.416 14.414c-.772 0-1.545-.183-2.235-.528l-2.945-1.472h-3.236v-8.414l-1.586-1.586 1.586-1.586v-2.414h3.414l.535-.535c.944-.944 2.2-1.465 3.536-1.465h10.515c0 2.206-1.794 4-4 4h-3.414l-.535.535c-.945.944-2.2 1.465-3.536 1.465h-2.515v2h2.515c1.244 0 2.435-.33 3.485-.935v10.935zm3.584 5.101c1.956.399 3.5 1.943 3.899 3.899h-3.899zm18.101 3.899c.399-1.956 1.943-3.5 3.899-3.899v3.899zm8.899-9h-3v-2h3c.552 0 1 .448 1 1s-.448 1-1 1z" />
                                    <path
                                        d="m6.924 29.183c.523.415 1.161.632 1.812.632.32 0 .644-.053.958-.159.975-.332 1.704-1.123 1.952-2.117.281-1.123-.123-2.317-1.03-3.044-2.302-1.845-3.586-4.469-3.614-7.39-.05-4.923 3.697-9.315 8.531-10 3.84-.547 7.564 1.107 9.711 4.237l-3.658 3.658h11.414v-11.414l-3.474 3.474c-3.394-4.274-8.749-6.549-14.243-5.969-7.586.792-13.709 7.133-14.242 14.747-.366 5.224 1.777 10.089 5.883 13.345zm-3.889-13.204c.468-6.661 5.822-12.207 12.456-12.9.494-.052.987-.077 1.478-.077 4.629 0 8.982 2.274 11.614 6.149l.679 1.001 1.738-1.738v4.586h-4.586l1.353-1.353-.386-.665c-2.47-4.254-7.228-6.552-12.13-5.858-5.903.837-10.311 5.996-10.25 12 .035 3.532 1.585 6.704 4.364 8.931.299.239.433.632.341.999-.083.331-.328.597-.656.708-.147.049-.531.135-.884-.146-3.58-2.84-5.45-7.082-5.131-11.637z" />
                                </svg>

                                <span class="infoPolicy">
                                    <h5>
                                        ĐỔI TRẢ DỄ DÀNG
                                    </h5>
                                    <span>(Đổi trả 90 ngày cho Giày; 30 ngày cho Túi; 7 ngày cho Phụ kiện nếu lỗi nhà sản xuất)</span>
                                </span>
                            </li>
                            <li>
                                <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
                                    y="0px" viewBox="0 0 480 480" style="enable-background:new 0 0 480 480;" xml:space="preserve">
                                    <g>
                                        <g>
                                            <path d="M160,0C93.726,0,40,53.726,40,120v88c0.035,30.913,25.087,55.965,56,56h8v-16h-8c-22.08-0.026-39.974-17.92-40-40v-88
                                 c0-57.438,46.562-104,104-104s104,46.562,104,104v88c-0.026,22.08-17.92,39.974-40,40h-8v16h8c30.913-0.035,55.965-25.087,56-56
                                 v-88C280,53.726,226.274,0,160,0z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path d="M65.928,377.032l5.848-9.208l-13.512-8.576l-5.848,9.216c-17.687,27.872-16.374,63.76,3.304,90.264V480h16v-24
                                 c0.001-1.817-0.617-3.581-1.752-5C52.96,429.738,51.337,400.02,65.928,377.032z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path d="M440,0H336c-22.08,0.026-39.974,17.92-40,40v80c0.026,22.08,17.92,39.974,40,40h16v32
                                 c-0.001,3.235,1.947,6.153,4.936,7.392c0.971,0.405,2.012,0.611,3.064,0.608c2.122,0,4.156-0.844,5.656-2.344L403.312,160H440
                                 c22.08-0.026,39.974-17.92,40-40V40C479.974,17.92,462.08,0.026,440,0z M464,120c0,13.255-10.745,24-24,24h-40
                                 c-2.122,0-4.156,0.844-5.656,2.344L368,172.688V152c0-4.418-3.582-8-8-8h-24c-13.255,0-24-10.745-24-24V40
                                 c0-13.255,10.745-24,24-24h104c13.255,0,24,10.745,24,24V120z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <rect x="336" y="40" width="56" height="16" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <rect x="408" y="40" width="32" height="16" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <rect x="336" y="72" width="104" height="16" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <rect x="336" y="104" width="56" height="16" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path d="M267.584,368.464l-5.848-9.216l-13.512,8.576l5.848,9.216c14.592,22.985,12.969,52.701-4.04,73.96
                                 c-1.135,1.419-1.753,3.183-1.752,5v24h16v-21.272C283.958,432.224,285.271,396.336,267.584,368.464z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path d="M472,272h-72c-30.016,0.035-54.666,23.729-55.888,53.72L320,369.128V336c-0.035-30.913-25.087-55.965-56-56h-29.24
                                 l-0.216-0.168L234.4,280H216c-8.837,0-16-7.163-16-16v-18.824c24.719-14.272,39.962-40.633,40-69.176v-64
                                 c-0.012-13.255-3.31-26.3-9.6-37.968c-2.015-3.712-6.569-5.219-10.4-3.44L84.592,134.304c-2.804,1.32-4.593,4.141-4.592,7.24V176
                                 c0.038,28.543,15.281,54.904,40,69.176V264c0,8.837-7.163,16-16,16H56c-30.913,0.035-55.965,25.087-56,56v144h16V336
                                 c0.026-22.08,17.92-39.974,40-40h25.456l72.04,100.656c1.48,2.069,3.856,3.31,6.4,3.344H160c2.518,0,4.889-1.186,6.4-3.2l76-100.8
                                 H264c22.08,0.026,39.974,17.92,40,40v64c0.004,4.418,3.589,7.997,8.007,7.993c2.902-0.003,5.575-1.576,6.985-4.113L356.704,336
                                 h45.864l-78,144h18.2L420.8,336h3.2c30.913-0.035,55.965-25.087,56-56C480,275.582,476.418,272,472,272z M96,176v-29.376
                                 l123.528-58.128C222.483,95.98,224,103.954,224,112v64c0,35.346-28.654,64-64,64C124.654,240,96,211.346,96,176z M160.168,378.496
                                 L135.48,344h50.688L160.168,378.496z M198.272,328H124l-22.904-32H104c17.673,0,32-14.327,32-32v-11.688
                                 c15.622,4.917,32.378,4.917,48,0V264c0,17.673,14.327,32,32,32h6.4L198.272,328z M424,320h-63.2
                                 c3.825-18.613,20.198-31.979,39.2-32h63.2C459.375,306.613,443.002,319.979,424,320z" />
                                        </g>
                                    </g>
                                </svg>
                                <span class="infoPolicy">
                                    <h5>
                                        TỔNG ĐÀI BÁN HÀNG 1800 1162
                                    </h5>
                                    <span>(Miễn phí từ 8h00 - 21:00 mỗi ngày)</span>
                                </span>
                            </li>
                        </ul>
                        <div class="product-description">
                            <div class="title-bl">
                                <h2>
                                    Thông số sản phẩm
                                    <span style="float:right" class="active_label"><i class="icofont-rounded-down"></i></span>
                                </h2>
                            </div>
                            <div class="description-content" style="display: block;">
                                <div class="main_details">
                                    <ul>
                                        <li>
                                            <span class="infobe">Mã sản phẩm:</span>
                                            <span class="infoaf">{{$list->code}}</span>
                                        </li>
                                        <li>
                                            <span class="infobe">Kiểu dáng:</span>
                                            <span class="infoaf">{{$list->style}}</span>
                                        </li>
                                        <li>
                                            <span class="infobe">Chất liệu:</span>
                                            <span class="infoaf">{{$list->material}}</span>
                                        </li>
                                        <?php
                                            $color = array_column($list->list_variant,"color");
                                            $color = array_count_values($color);
                                            $text_color = "";
                                                ?>

                                        @foreach ($color as $key => $item)
                                        <?php $text_color .=  $key . "-"  ?>
                                        @endforeach
                                        <li>
                                            <span class="infobe">Màu sắc:</span>
                                            <span class="infoaf">
                                                {{ isset($text_color) ? rtrim($text_color,"-") : "" }}
                                            </span>
                                        </li>
                                        <li>
                                            <?php $ar = []; $text_size = "" ?>
                                            @foreach ($list->list_variant as $item)
                                            @if (!in_array($item->size,$ar))
                                            <?php $text_size .= $item->size . "-"  ?>
                                            <?php $ar[] = $item->size?>
                                            @endif
                                            @endforeach

                                            <span class="infobe">Kích cỡ:</span>
                                            <span class="infoaf">
                                                {{ isset($text_size) ? rtrim($text_size,"-") : "" }}
                                            </span>

                                        </li>
                                        <li>
                                            <span class="infobe">Xuất xứ:</span>
                                            <span class="infoaf">Việt Nam</span>
                                        </li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <div class="product-description">
                            <div class="title-bl">
                                <h2>
                                    Mô tả sản phẩm
                                    <span style="float:right"><i class="icofont-rounded-down"></i></span>
                                </h2>
                            </div>
                            <div class="description-content">
                                <div class="description-productdetail">
                                    <?php
                                        echo isset($list->description) ? $list->description : "";
                                    ?>
                                </div>
                            </div>
                        </div>
                        <div class="product-description">
                            <div class="title-bl">
                                <h2>
                                    Chính sách đổi trả
                                    <span style="float:right"><i class="icofont-rounded-down"></i></span>
                                </h2>
                            </div>
                            <div class="description-content">
                                <div class="description-productdetail">
                                    <p><strong>JUNO hiện đang áp dụng chính sách Đổi/Trả cho các sản phẩm như sau:</strong></p>
                                    <p>- Trong vòng 90 ngày kể từ ngày nhận sản phẩm Giày</p>
                                    <p>- Trong vòng 30 ngày kể từ ngày nhận sản phẩm Túi, Ví</p>
                                    <p>- Trong vòng 7 ngày đối với sản phẩm Khuyến mãi, Giảm giá (có giá trị thanh toán dưới 250,000 đồng</p>
                                    <p>- Phụ kiện (chỉ áp dụng với mắt kính, trang sức) và túi canvas được đổi/trả trong 7 ngày trong trường hợp có
                                        lỗi sản xuất </p>
                                    <p>- Không áp dụng đổi trả Online với đơn hàng tại hệ thống Cửa hàng Đại lý và Cửa hàng Juno tại TTTM Sense City
                                        Phạm Văn Đồng</p>
                                    <p style="padding-left: 30px;" data-mce-style="padding-left: 30px;"><a
                                            data-mce-href="../pages/chinh-sach-doi-tra-va-hoan-tien"
                                            href="../pages/chinh-sach-doi-tra-va-hoan-tien"><span style="text-decoration: underline;"
                                                data-mce-style="text-decoration: underline;"><strong>Xem chi tiết hơn tại đây</strong></span></a></p>
                                    <p style="padding-left: 90px;" data-mce-style="padding-left: 90px;"><br></p>
                                </div>
                            </div>
                        </div>
                        <div class="product-description">
                            <div class="title-bl">
                                <h2>
                                    Hướng dẫn bảo quản
                                    <span style="float:right"><i class="icofont-rounded-down"></i></span>
                                </h2>
                            </div>
                            <div class="description-content">
                                <div class="description-productdetail">
                                    <p><a data-mce-href="https://juno.vn/pages/huong-dan-bao-quan-giay"
                                            href="https://juno.vn/pages/huong-dan-bao-quan-giay" target="_blank" rel="noopener noreferrer"
                                            title="Hướng dãn bảo quản giày">HƯỚNG DẪN BẢO QUẢN GIÀY &gt;&gt; Xem chi tiết</a><br data-mce-bogus="1">
                                    </p>
                                    <p><a data-mce-href="https://juno.vn/pages/huong-dan-bao-quan-tui-xach"
                                            href="https://juno.vn/pages/huong-dan-bao-quan-tui-xach" target="_blank" rel="noopener noreferrer"
                                            title="Hướng dẫn bảo quản túi xách">HƯỚNG DẪN BẢO QUẢN TÚI XÁCH &gt;&gt; Xem chi tiết</a></p>
                                    <p><a data-mce-href="https://juno.vn/pages/huong-dan-bao-quan-phu-kien"
                                            href="https://juno.vn/pages/huong-dan-bao-quan-phu-kien" target="_blank" rel="noopener noreferrer"
                                            title="Hướng dẫn bảo quản phụ kiện">HƯỚNG DẪN BẢO QUẢN PHỤ KIỆN &gt;&gt; Xem chi tiết</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="juno-recommender" id="342901-2-1">
                            <script src="js/hoian.recommender.js" async>
                            </script>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
