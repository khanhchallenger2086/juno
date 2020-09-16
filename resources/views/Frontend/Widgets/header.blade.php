<!-- top nav -->
<div id="topbar" class="clearfix hidden-xs">
    <div class="container-fluid clearfix">
        <div class="no-padding col-xs-12 col-sm-8 col-md-6 hidden-xs">
            <div class="innerTopLeft">
                <ul>
                    <li>
                        <a href="tel:18001162">
                            <span class="iconTop icon-1-top"></span>
                            <span class="title-info-top"><b>1800 1162</b> (miễn phí)</span>
                        </a>
                    </li>
                    <li>
                        <a href="/blogs/he-thong-cua-hang?itm_source=ftr&amp;itm_medium=shrm&amp;itm_campaign=normal&amp;itm_content=ch">
                            <span class="iconTop icon-2-top"></span>
                            <span class="title-info-top">Hệ thống <b>81</b> Showroom</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="no-padding col-xs-12 col-sm-4 col-md-6">
            <div id="open_cart" class="innerTopRight">
                <span class="title-info-top"><i style="font-size:20px" class="icofont-shopping-cart"></i>Giỏ hàng <span>(<span class="count">
                            {{ session()->has('total_buy') ? session()->get('total_buy') : "0" }} </span>)</span></span>
            </div>
        </div>
    </div>
</div>
<div class="outerHeightHeader">
    <!-- header -->
    <header id="site-header" class="main-header clearfix affix-mobile">
        <div class="no-padding hidden-xs col-sm-12 col-md-2">
            <div class="header-mid wrap-flex-align">
                <div class="wrap-logo" itemscope itemtype="http://schema.org/Organization">
                    <a href="/" itemprop="url">
                        <img itemprop="logo" src="{{ asset('/frontend/images/logo.svg') }}" alt="JUNO" class="img-responsive logoimg" />
                    </a>
                </div>
                <!-- <div class="header-wrap-icon visible-sm">
                  <span id="site-search-handle" class="icon-search" aria-label="Tìm kiếm" title="Tìm kiếm">
                      <a href="/search">
                      <span class="search-menu" aria-hidden="true">
                          <svg
                          version="1.1"
                          class="svg-search"
                          xmlns="http://www.w3.org/2000/svg"
                          xmlns:xlink="http://www.w3.org/1999/xlink"
                          x="0px"
                          y="0px"
                          viewBox="0 0 24 27"
                          style="enable-background: new 0 0 24 27"
                          xml:space="preserve"
                          >
                          <path
                              d="M10,2C4.5,2,0,6.5,0,12s4.5,10,10,10s10-4.5,10-10S15.5,2,10,2z M10,19c-3.9,0-7-3.1-7-7s3.1-7,7-7s7,3.1,7,7S13.9,19,10,19z"
                          />
                          <rect x="17" y="17" transform="matrix(0.7071 -0.7071 0.7071 0.7071 -9.2844 19.5856)" width="4" height="8" />
                          </svg>
                      </span>
                      </a>
                  </span>
                  <span class="icon-cart" title="Giỏ hàng">
                      <a href="/cart">
                      <span class="cart-menu" aria-hidden="true">
                          <svg
                          version="1.1"
                          class="svg-cart"
                          xmlns="http://www.w3.org/2000/svg"
                          xmlns:xlink="http://www.w3.org/1999/xlink"
                          x="0px"
                          y="0px"
                          viewBox="0 0 24 27"
                          style="enable-background: new 0 0 24 27"
                          xml:space="preserve"
                          >
                          <g>
                              <path d="M0,6v21h24V6H0z M22,25H2V8h20V25z" />
                          </g>
                          <g>
                              <path d="M12,2c3,0,3,2.3,3,4h2c0-2.8-1-6-5-6S7,3.2,7,6h2C9,4.3,9,2,12,2z" />
                          </g>
                          </svg>
                          <span class="count-holder">
                          <span class="count">0</span>
                          </span>
                      </span>
                      </a>
                  </span>
                  <span class="hamburger-menu hidden-xs">
                      <a href="#menu-mobile">
                      <span class="bar"></span>
                      </a>
                  </span>
                  </div> -->
            </div>
        </div>
        <div class="no-padding col-xs-12 hidden-sm hidden-xs col-md-8">
            <div class="menu-desktop hidden-sm hidden-xs">
                <div class="wrap-logo wrap-logp-mb">
                    <a href="/home">
                    {{-- <img height="23" src="{{ asset('/frontend/images/logo.svg') }}" alt="JUNO" class="img-responsive logoimg" /> --}}
                    </a>
                </div>
                <div id="nav">
                    <nav class="main-nav text-center">
                        <ul class="clearfix">
                            <li class=" ">
                                <a href="/collections/san-pham-moi-nhat?itm_source=homepage&amp;itm_medium=menu&amp;itm_campaign=normal&amp;itm_content=newin"
                                    title="Hàng Mới Về">
                                    Hàng Mới Về
                                </a>
                            </li>
                            @foreach ($category_parent as $item_parent)
                            <?php
                    $category_son = DB::table('categories')->where('parent',$item_parent->id)->where('deleted_at',null)->get();
                            $count = 0;
                ?>
                            <li class=" ">
                                <a href="/collections/giay?itm_source=homepage&amp;itm_medium=menu&amp;itm_campaign=normal&amp;itm_content=giay"
                                    title="Giày">
                                    {{$item_parent->name}}
                                    <i style="font-size: 14px" class="icofont-simple-down"></i>
                                </a>
                                <ul class="sub_menu megaMenu">
                                    <div class="col-xs-12 col-sm-3">
                                        @foreach ($category_son as $item_son)
                                        <li class>
                                            <a href="https://juno.vn/collections/giay-cao-got?itm_source=homepage&amp;itm_medium=menu&amp;itm_campaign=normal&amp;itm_content=cg"
                                                title="Giày cao gót">
                                                {{$item_son->name}}
                                            </a>
                                        </li>
                                        @endforeach
                                    </div>
                                    <div class="col-xs-12 col-sm-9">
                                        @foreach ($all[$item_parent->id] as $item_all)
                                        @if ($count < 3) <div class="col-xs-12 col-sm-4">
                                            <div class="itemImgMega">
                                                <div class="boxImgMega">
                                                <a href="{{ route('p.product-detail',$item_all->uri) }}">
                                                        <img class="lazyload" src="../backend/images/juno/{{ explode(";",$item_all->image_main)[0] }}"
                                                            alt="Giày" />
                                                    </a>
                                                </div>
                                                <div class="boxNameMega">
                                                <a href="{{ route('p.product-detail',$item_all->uri) }}"> {{$item_all->name }} </a>
                                                </div>
                                            </div>
                                    </div>
                                    <?php $count++ ?>
                                    @endif
                                    @endforeach
                </div>
                </ul>
                </li>
                @endforeach
                <li class=" ">
                    <a href="https://juno.vn/collections/list-collections?itm_source=homepage&amp;itm_medium=menu&amp;itm_campaign=normal&amp;itm_content=bosuutap"
                        title="Bộ Sưu Tập">
                        Bộ Sưu Tập
                    </a>
                </li>
                <li class=" ">
                    <a href="/pages/khachhangthanthiet?itm_source=homepage&amp;itm_medium=menu&amp;itm_campaign=normal&amp;itm_content=membership"
                        title="Membership">
                        Membership
                    </a>
                </li>
                </ul>
                </nav>
            </div>
        </div>
</div>
<div class="no-padding col-xs-12 hidden-sm hidden-xs col-md-2">
    <div class="searchFormHeader">
        <form class="searchHeader searchDesktop" action="/search">
            <input type="hidden" name="type" value="product" />
            <input type="text" name="q" class="searchInput" placeholder="Bạn cần tìm gì..." value />
            <i class="icofont-search btnSearch"></i>
        </form>
        <div id="resultSearchDesktop" class="resultDesktop">
            <div class="innerResultDesktop"></div>
        </div>
    </div>
</div>
</header>
</div>
