<div id="site-nav--mobile" class="site-nav style--sidebar">
    <div id="site-cart" class="site-nav-container" tabindex="-1">
        <div class="site-nav-container-last">
            <p class="title">Giỏ hàng</p>
            <span class="textCartSide">Bạn đang có <b><span
                        class="count">{{ session()->has('cart') ? count(session()->get('cart')) : "0" }}</span></b> sản phẩm
                trong giỏ hàng.</span>
            <div class="cart-view clearfix">
                <table id="clone-item-cart" class="table-clone-cart">
                    <tbody>
                        <tr class="item_2 hidden">
                            <td class="img">
                                <a href title><img src alt /></a>
                                <span class="hidden labelGiftInCart">HÀNG TẶNG</span>
                            </td>
                            <td>
                                <a class="pro-title-view" href title></a>
                                <span class="pro-price-view"></span>
                                <del class="pro-price-del-view"></del>
                                <span class="variant"></span>
                                <span class="pro-quantity-view"></span>
                                <span class="remove_link remove-cart removePro"> </span>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table id="cart-view">
                    <tbody class="has-cart">
                        @if (session()->get('cart') != [])
                        <?php
                            $total_price = 0;
                        ?>
                        @foreach (session()->get('cart') as $item_cart)
                        <?php
                            $total_price += (int) $item_cart->variant['price'] * $item_cart->buy;
                        ?>
                        <tr class="item_2" data-id="{{$item_cart->id}}">
                            <td >
                                <a href="{{route('p.product-detail',$item_cart->uri)}}" title="{{$item_cart->name}}"><img
                                        src="/backend/images/juno/{{explode(";",$item_cart->image_main)[0]}}"
                                        alt="{{$item_cart->name}}"></a>
                            </td>
                            <td>
                                <a class="pro-title-view" href="/products/giay-mules-mui-vuong" title="/products/giay-mules-mui-vuong">Giày mules mũi
                                    vuông</a>
                                <span class="pro-price-view">{{number_format($item_cart->variant['price']) . "₫"}}</span>
                                <del class="pro-price-del-view"></del>
                                <span class="variant">{{$item_cart->variant['size']}} / {{$item_cart->variant['color']}}</span>
                                <span class="delete_cart" data-id="{{$item_cart->variant['id']}}">Xóa</span>
                            </td>
                        </tr>

                        @endforeach
                        @else
                        <tr class="no-product">
                            <td>Hiện chưa có sản phẩm nào</td>
                        </tr>
                        @endif
                    </tbody>

                </table>
                <span class=" line"></span>
                <table class="table-total">
                    <tbody>
                        <tr>
                            <td class="text-left"><b>TỔNG TIỀN TẠM TÍNH:</b></td>
                            <td class="text-right" id="total-view-cart">{{ isset($total_price)  ? number_format($total_price) . "₫" : '0₫'}} </td>
                        </tr>
                        <tr>
                            <td colspan="2"><a href="/payment" class="checkLimitCart linktocheckout button dark">Tiến hành đặt
                                    hàng</a></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <a href="/cart" class="linktocart button dark">Xem chi tiết giỏ hàng <i style="font-size:16px"
                                        class="icofont-shopping-cart"></i></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- <div id="site-search" class="site-nav-container" tabindex="-1">
            <div class="site-nav-container-last">
              <p class="title">Tìm kiếm</p>
              <div class="search-box wpo-wrapper-search">
                <form action="/search" class="searchform searchform-categoris ultimate-search navbar-form">
                  <div class="wpo-search-inner">
                    <input type="hidden" name="type" value="product" />
                    <input
                      required
                      id="inputSearchAuto"
                      name="q"
                      maxlength="40"
                      autocomplete="off"
                      class="searchinput input-search search-input"
                      type="text"
                      size="20"
                      placeholder="Tìm kiếm sản phẩm..."
                    />
                  </div>
                  <button type="submit" class="btn-search btn" id="search-header-btn">
                    <svg
                      version="1.1"
                      class="svg search"
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
                  </button>
                </form>
                <div id="ajaxSearchResults" class="smart-search-wrapper ajaxSearchResults" style="display: none">
                  <div class="resultsContent"></div>
                </div>
              </div>
            </div>
          </div> -->
    <button id="site-close-handle" class="site-close-handle" aria-label="Đóng" title="Đóng">
        <i style="font-size: 20px" class="icofont-ui-close"></i>
    </button>
</div>
