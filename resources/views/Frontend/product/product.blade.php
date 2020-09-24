@extends('Frontend.master')

@section('content')
<div class="breadcrumb-shop">
    <div class="padding-lf-40 clearfix">
        <div class=" ">
            <ol class="breadcrumb breadcrumb-arrows clearfix">
                <li><a href="/home" target="_self"><i class="icofont-home"></i> Trang chủ</a></li>
            <li><a href="{{ route('p.product','tat-ca-san-pham') }}" target="_self">Danh mục</a></li>
            <li class="active"><span>{{ isset($name) ? "Tất cả " . $name : "Tất cả sản phẩm" }}</span></li>
            </ol>
        </div>
    </div>		</div>
{{-- <ol class="breadcrumb breadcrumb-arrows clearfix">
    <li><a href="/" target="_self"><i class="fa fa-home"></i> Trang chủ</a></li>
    <li><a href="/collections" target="_self">Danh mục</a></li>
    <li class="active"><span>Tất cả Giày</span></li>
</ol> --}}
<div class="padding-lf-40 clearfix">
			<div id="collection-body" class="wrap-collection-body clearfix">
				<div class="wrap-collection-title clearfix">
					<div class="heading-collection clearfix">
						<div class="col-md-8 col-sm-12 col-xs-12">
							<h1 class="title">
                                {{ isset($name) ? "Tất cả "  . $name : "Tất cả sản phẩm" }}					</h1>
							{{-- <div class="append-search visible-xs">  </div> --}}
						</div>
						<div class="col-md-4 col-sm-12 col-xs-12">
							<div class="outerSort">
								<div class="borderFilterMobile visbile-xs visible-sm filterSmallScreen">
									<a class="filterClick">
										<i class="fa fa-filter"></i>
										<span class="visible-xs">Bộ lọc</span>
									</a>
								</div>
								{{-- <div class="borderFilterMobile option browse-tags">
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
								</div> --}}
							</div>
						</div>
					</div>
                </div>
            {{-- Bộ lọc --}}
                <div class="filter-custom hidden-sm hidden-xs removeMobile">
                    <span>BỘ LỌC</span>

                    <div class="groupFilterNew">
                        <div class="titleFilter clearfix">
                            <div class="layered_subtitle dropdown-filter">
                                <span>Màu sắc</span>
                                <span class="icon-control">
                                    <i style="color: black" class="icofont-rounded-down"></i>
                                </span>
                            </div>
                            <div class="layered_subtitle dropdown-filter eachTagFilter" style="display: block;">
                                <span>Kích cỡ</span>
                                <span class="icon-control">
                                    <i style="color: black" class="icofont-rounded-down"></i>
                                </span>
                            </div>
                            <div class="layered_subtitle dropdown-filter eachTagFilter" style="display: block;">
                                <span>Kiểu dáng</span>
                                <span class="icon-control">
                                    <i style="color: black" class="icofont-rounded-down"></i>
                                </span>
                            </div>
                            <div class="layered_subtitle dropdown-filter eachTagFilter" style="display: block;">
                                <span>Chất liệu</span>
                                <span class="icon-control">
                                    <i style="color: black" class="icofont-rounded-down"></i>
                                </span>
                            </div>
                        </div>
                    <input type="hidden" id="id_category" value="{{$id_category}}">
                        <div class="contentFilter clearfix">
                            <div class="filter-color s-filter">
                                <ul id="filterColor"  class="color-2 check-box-list">
                                    @foreach ($color as $item_color)
                                    <li>
                                    {{-- <input type="hidden" class="kind" value="color"> --}}
                                    <input value="{{$item_color->name}}" class="filter" type="checkbox" id="color1{{$item_color->id}}" value="Đen" name="color-filter" >
                                        <label title="{{$item_color->name}}" for="color1{{$item_color->id}}">
                                            <span class="button"><img src="/backend/images/juno/{{$item_color->image}}" style="width:100%"></span>
                                        </label>
                                    </li>
                                    @endforeach
                                </ul>
                            </div>
                            <div class="filter-size s-filter eachTagFilter" style="display: block;">
                                <ul id="filterSize" class="check-box-list clearfix">
                                    @foreach ($size as $item_size)
                                    <li>
                                    {{-- <input type="hidden" class="kind" value="size"> --}}
                                    <input type="checkbox" class="filter" id="size{{$item_size}}" value="{{$item_size}}" >
                                        <label for="size{{$item_size}}">
                                            <span class="button"></span>
                                            {{$item_size}}
                                        </label>
                                    </li>
                                    @endforeach
                                </ul>
                            </div>
                            <div class="filter-style filter-height s-filter eachTagFilter" style="display: block;">
                                <ul id="filterStyle" class="check-box-list clearfix">
                                    @foreach ($style as $item_style)
                                    <li>
                                    {{-- <input type="hidden" class="kind" value="style"> --}}
                                    <input type="checkbox" class="filter" id="style{{$item_style}}" value="{{$item_style}}" >
                                        <label for="style{{$item_style}}">
                                            <span class="button"></span>
                                            {{$item_style}}
                                        </label>
                                    </li>
                                    @endforeach
                                </ul>
                            </div>
                            <div class="filter-material s-filter eachTagFilter" style="display: block;">
                                <ul id="filterMaterial" class="check-box-list clearfix">
                                    @foreach ($material as $item_material)
                                    <li>
                                    {{-- <input type="hidden" class="kind" value="material"> --}}
                                    <input type="checkbox" class="filter" id="material{{$item_material}}" value="{{$item_material}}">
                                        <label for="material{{$item_material}}">
                                            <span class="button"></span>
                                            {{$item_material}}
                                        </label>
                                    </li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>


                    <div class="append-search"></div>
                    <div class="append-url hide"><span class="url-color">?tag=do?hong</span></div>
                </div>

				<div class="clearfix filter-here 177-50">
        <div class="content-product-list product-list filter clearfix">
            @foreach ($list as $item)
            <?php
                $variant = DB::table('product_variants')->where('deleted_at',null)->where('id_product',$item->id)->get();
                $variant = array_column($variant->toArray(),'color');
                $variant = array_unique($variant);
            ?>
            <div class="product-resize col-md-3 col-sm-3 col-xs-6 pro-loop animated zoomIn fixheight">
                <div class="product-block" data-anmation="4">
                    <div class="product-img image-resize fixheight">
                    <a href="{{ route('p.product-detail',$item->uri) }}" >
                            <picture>
                            <img class="img-loop lazyload" src="/backend/images/juno/{{ explode(';',$item->image_main)[0] }}" >
                            </picture>

                            <picture>
                                <img class="img-loop img-hover lazyload" src="/backend/images/juno/{{ explode(';',$item->image_detail)[0] }}" >
                            </picture>
                        </a>
                    </div>
                    <div class="product-detail clearfix">
                        <div class="variantColor">
                            <ul>
                            @foreach ($variant as $item_variant)
                            <?php
                                $image_variant = DB::table('colors')->where('deleted_at',null)->where('name',$item_variant)->first()->image;
                            ?>
                                <li class="active" >
                                    <a href="" >
                                    <img class="lazyload" src="/backend/images/juno/{{$image_variant}}" >
                                    </a>
                                </li>
                                @endforeach

                            </ul>
                        </div>
                        <div class="box-pro-detail">
                            <h3 class="pro-name">
                                <a href="{{ route('p.product-detail',$item->uri) }}" title="Giày xăng đan quai ngang bản to SD01057">
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
                        <a class="styleBtnBuy" href="{{ Route('p.product-detail',$item->uri ?? "ko co uri") }}"><i
                            class="icofont-shopping-cart"></i>Mua Ngay</a>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
                            {{-- {{ $list->links() }} --}}
                            <p id="no-product-default" class="text-center">{{ $list->toArray() == [] ? "Không có sản phẩm nào" : ''  }}</p>

        <?php

        ?>
        @if ($list->toArray() != [])
        <div class="text-center mt-4">
            <a class="btn btn-default more" data-page=""  >Xem thêm</a>
        </div>
        @endif
        <input type="hidden" value="{{$uri}}" id="sale" >
        <input type="hidden" value="{{$amount}}" id="amount" >
					<div class="btnLoadMore" style="display: none;">
						<img src="images/down-arrow.png" alt="Down Arrow"><br>
						<a href="javascript:void(0);">Xem thêm, còn nhiều sản phẩm đẹp lắm!</a>
					</div>
				</div>

			</div>
        </div>
        @endsection
