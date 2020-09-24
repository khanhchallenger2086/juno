@extends('Frontend.master')


@section('content')
<div id="carouselExampleSlidesOnly" style="z-index: -1" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="d-block w-100" src="{{asset('/backend/images/juno/banner.jpg')}}" alt="First slide">
      </div>
    </div>
  </div>
<!-- phần lặp sản phẩm -->
<section id="sectionHomeTabCollection1" class="clearfix section section-collection">
    <div class="container-fluid">
        @foreach ($category_parent as $item_parent)
        <?php
                $category_son = DB::table('categories')->where('parent','=',$item_parent->id)->where('deleted_at',null)->limit(4)->get();
                // $ar_id = array_column($category_son->toArray(),'id');
                // $ar_id[] = $item_parent->id;
                // $product = DB::table('products')->join('product_categories','id_product','=','id')->get();
            ?>
        <div style="margin-bottom:50px">
            <div class="sectionTitleTab clearfix">
                {{-- danh mục --}}
                <h2>
                <a href="{{ Route('p.product',$item_parent->uri ?? "ko co uri") }}"> {{$item_parent->name}} </a>
                </h2>
                <div class="outerTabTitle">
                    <ul class="tabTitle">
                        @foreach ($category_son as $item_son)
                        <li data-slide="tab1_slide1">
                            <a data-toggle="tab" href="{{ Route('p.product',$item_son->uri ?? "ko co uri") }}" > {{$item_son->name}} </a>
                        </li>
                        @endforeach
                    </ul>
                </div>
            </div>

            {{-- sản phẩm --}}
            <div class="sectionContentTab styleArrowSlick">
                <div class="tab-content">
                    <div id="tabcollection-A1" class="clearfix tab-pane in active" data-get="true" data-slide="tab1_slide1">
                        <div class="product-lists-home">
                            @foreach ($all[$item_parent->id] as $item_product)
                            <div class="product-resize col-xs-6 col-sm-3 pro-loop fixheight">
                                <div class="product-block" data-anmation="1">
                                    <div class="product-img image-resize fixheight" >
                                        <a href="{{ Route('p.product-detail',$item_product->uri ?? "ko co uri") }}"
                                            title="Mã sản phẩm: {{ $item_product->code }}">
                                            <picture>
                                                <img class="img-loop lazyload"
                                                    src="/backend/images/juno/{{ explode(";",$item_product->image_main)[0] }}"
                                                    alt=" Giày cao gót slingback khóa trang trí lục giác j " />
                                            </picture>
                                            <picture>
                                                <img class="img-loop img-hover lazyload"
                                                    src="/backend/images/juno/{{ explode(";",$item_product->image_detail)[0] }}"
                                                    alt=" Giày cao gót slingback khóa trang trí lục giác j " />
                                            </picture>
                                        </a>
                                    </div>
                                    <?php
                                        $ar = array_column($item_product->one_variant,'color');
                                        $ar = array_count_values($ar); // check trùng value trong mảng
                                        $ar2 = [];
                                        foreach ($ar as $key => $value) {
                                            $ar2[] = DB::table('colors')->where('deleted_at')->where('name',$key)->first()->image;
                                        }
                                    ?>
                                    <div class="product-detail clearfix">
                                        <div class="variantColor">
                                            <ul>
                                                @foreach ($ar2 as $v_ar2)
                                                <li data-filter="Xám" data-color="?color=xam">
                                                    <a href="#">
                                                        <img class="lazyload" src="/backend/images/juno/{{$v_ar2}}" alt="color_xam_" />
                                                    </a>
                                                </li>
                                                @endforeach
                                            </ul>
                                        </div>
                                        <div class="box-pro-detail">
                                            <h3 class="pro-name">
                                                <a href="{{ Route('p.product-detail',$item_product->uri ?? "#") }}"
                                                    title="Giày cao gót slingback khóa trang trí lục giác j">
                                                    {{$item_product->name}}
                                                </a>
                                            </h3>
                                            <div class="box-pro-prices">
                                                <p class="pro-price highlight">
                                                    {{ $item_product->one_variant != [] ? number_format($item_product->one_variant[0]->price) . '₫' : '0₫' }}
                                                    <span
                                                        style="color:red;text-decoration: line-through;">{{ $item_product->one_variant != [] && $item_product->one_variant[0]->price_market != 0 ? number_format($item_product->one_variant[0]->price_market) . '₫' : '' }}</span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="activeLabelStatus">
                                        <div class="labelNewNew styleTogetherLabel">MẪU MỚI</div>
                                    </div>
                                    <div class="actionLoop visible-lg">
                                        <a class="styleBtnBuy" href="{{ Route('p.product-detail',$item_product->uri ?? "#") }}"><i
                                            class="icofont-shopping-cart"></i>Mua Ngay</a>
                                    </div>
                                </div>
                            </div>
                            @endforeach

                        </div>
                    </div>

                    {{-- <div id="tabcollection-A2" class="clearfix tab-pane" data-get="false" data-slide="tab1_slide2">
                    <div class="product-lists-home"></div>
                </div>

                <div id="tabcollection-A3" class="clearfix tab-pane" data-get="false" data-slide="tab1_slide3">
                    <div class="product-lists-home"></div>
                </div>

                <div id="tabcollection-A4" class="clearfix tab-pane" data-get="false" data-slide="tab1_slide4">
                    <div class="product-lists-home"></div>
                </div>

                <div id="tabcollection-A5" class="clearfix tab-pane" data-get="false" data-slide="tab1_slide5">
                    <div class="product-lists-home"></div>
                </div> --}}
                </div>
            </div>

        </div>
        @endforeach

    </div>

</section>

@endsection
