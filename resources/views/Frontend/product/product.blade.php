@extends('Frontend.master')

@section('content')
<ol class="breadcrumb breadcrumb-arrows clearfix">
    <li><a href="/" target="_self"><i class="fa fa-home"></i> Trang chủ</a></li>
    <li><a href="/collections" target="_self">Danh mục</a></li>
    <li class="active"><span>Tất cả Giày</span></li>
</ol>
<div class="padding-lf-40 clearfix">
			<div id="collection-body" class="wrap-collection-body clearfix">
				<div class="wrap-collection-title clearfix">
					<div class="heading-collection clearfix">
						<div class="col-md-8 col-sm-12 col-xs-12">
							<h1 class="title">
                        Tất cả Giày							</h1>
							<div class="append-search visible-xs"><span class="x-size">Size: <b> 34</b><span class="append-search-remove"><span></span></span></span></div>
						</div>
						<div class="col-md-4 col-sm-12 col-xs-12">
							<div class="outerSort">
								<div class="borderFilterMobile visbile-xs visible-sm filterSmallScreen">
									<a class="filterClick">
										<i class="fa fa-filter"></i>
										<span class="visible-xs">Bộ lọc</span>
									</a>
								</div>
								<div class="borderFilterMobile option browse-tags">
									<label class="lb-filter" for="sort-by">Sắp xếp theo:</label>
									<span class="custom-dropdown custom-dropdown--grey">
										<span class="visible-xs btnSortMobile">
											<i class="fa fa-sort"></i>
										</span>
										<select class="sort-by custom-dropdown__select">
											<option value="manual" data-filter="manual">Tùy chọn</option>
											<option value="price-ascending" data-filter="&amp;sortby=(price:product=asc)">Giá: Tăng dần</option>
											<option value="price-descending" data-filter="&amp;sortby=(price:product=desc)">Giá: Giảm dần</option>
											<option value="created-descending" data-filter="&amp;sortby=(updated_at:product=desc)">Mới nhất</option>
											<option value="best-selling" data-filter="&amp;sortby=(sold_quantity:product=desc)">Bán chạy nhất</option>
										</select>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix filter-here 177-50">
        <div class="content-product-list product-list filter clearfix">
            @foreach ($list as $item)
            <div class="product-resize col-md-3 col-sm-3 col-xs-6 pro-loop animated zoomIn fixheight" style="height: 326px;">
                <div class="product-block" data-anmation="4">
                    <div class="product-img image-resize fixheight" style="height: 217px;">
                        <a href="/products/giay-xang-dan-quai-ngang-ban-to-sd01057?color=do_do" title="Mã sản phẩm: SD01057">
                            <picture>
                                <img class="img-loop lazyload" src="images/do-do_sd01057_1_grande.jpg" data-src="//product.hstatic.net/1000003969/product/do-do_sd01057_1_grande.jpg" alt=" Giày xăng đan quai ngang bản to SD01057 ">
                            </picture>

                            <picture>
                                <img class="img-loop img-hover lazyload" src="images/do-do_sd01057_2_grande.jpg" data-src="//product.hstatic.net/1000003969/product/do-do_sd01057_2_grande.jpg" alt=" Giày xăng đan quai ngang bản to SD01057 ">
                            </picture>
                        </a>
                    </div>
                    <div class="product-detail clearfix">
                        <div class="variantColor">
                            <ul>

                <li class="active" data-filter="do_do" data-color="?color=do_do">
                    <a href="/products/giay-xang-dan-quai-ngang-ban-to-sd01057?color=do_do" data-img="https://product.hstatic.net/1000003969/product/do-do_sd01057_3.jpg" data-img-hover="https://product.hstatic.net/1000003969/product/do-do_sd01057_1.jpg">
                        <img class="lazyload" src="images/color_do_do_sd01057_f899e61f66b2410899deeda0c9b89015_small.jpg" data-src="//product.hstatic.net/1000003969/product/color_do_do_sd01057_f899e61f66b2410899deeda0c9b89015_small.jpg" alt="Đỏ đô">
                    </a>
                </li>

                <li class data-filter="xanh_xam" data-color="?color=xanh_xam">
                    <a href="/products/giay-xang-dan-quai-ngang-ban-to-sd01057?color=do_do" data-img="https://product.hstatic.net/1000003969/product/xanh-xam_sd01057_3.jpg" data-img-hover="https://product.hstatic.net/1000003969/product/xanh-xam_sd01057_1.jpg">
                        <img class="lazyload" src="images/color_xanh_xam_sd01057_0bf61ab77c3b485e95d2da5130645de7_small.jpg" data-src="//product.hstatic.net/1000003969/product/color_xanh_xam_sd01057_0bf61ab77c3b485e95d2da5130645de7_small.jpg" alt="Xanh xám">
                    </a>
                </li>

                <li class data-filter="den" data-color="?color=den">
                    <a href="/products/giay-xang-dan-quai-ngang-ban-to-sd01057?color=do_do" data-img="https://product.hstatic.net/1000003969/product/den_sd01057_3.jpg" data-img-hover="https://product.hstatic.net/1000003969/product/den_sd01057_1.jpg">
                        <img class="lazyload" src="images/color_den_sd01057_eb92681bf7054f038159d3875a570118_small.jpg" data-src="//product.hstatic.net/1000003969/product/color_den_sd01057_eb92681bf7054f038159d3875a570118_small.jpg" alt="Đen">
                    </a>
                </li>
                            </ul>
                        </div>
                        <div class="box-pro-detail">
                            <h3 class="pro-name">
                                <a href="/products/giay-xang-dan-quai-ngang-ban-to-sd01057?color=do_do" title="Giày xăng đan quai ngang bản to SD01057">
                                    Giày xăng đan quai ngang bản to SD01057
                                </a>
                            </h3>
                            <div class="box-pro-prices">
                                <p class="pro-price highlight">
                                    350,000₫
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="activeLabelStatus">



                        <div class="trendingNew">Chỉ bán online</div>

                    </div>
                    <div class="actionLoop visible-lg">
                        <a class="quickView styleBtnBuy notClick" data-handle="/products/giay-xang-dan-quai-ngang-ban-to-sd01057"><i class="fa fa-shopping-cart"></i> Mua nhanh</a>
                        <a class="styleBtnBuy" href="/products/giay-xang-dan-quai-ngang-ban-to-sd01057?color=do_do"><i class="fa fa-eye"></i> Xem chi tiết</a>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
                            {{ $list->links() }}
					<div class="btnLoadMore" style="display: none;">
						<img src="images/down-arrow.png" alt="Down Arrow"><br>
						<a href="javascript:void(0);">Xem thêm, còn nhiều sản phẩm đẹp lắm!</a>
					</div>
				</div>

			</div>
        </div>
        @endsection
