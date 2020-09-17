$.ajaxSetup({
    headers: {
        "X-CSRF-TOKEN": $("meta[name=CSRF-TOKEN]").attr("content"),
    },
});

$(document).ready(function () {
    // khoá nút back and next browser
    // window.history.pushState(null, "", window.location.href);
    // window.onpopstate = function() {
    //     window.history.pushState(null, "", window.location.href);
    // };

    $(".product-description").click(function () {
        $(this).find("span").toggleClass("active_label");
        $(this).find(".description-content").slideToggle();
    });

    $(document).on("click",".color input",function () { // cho input nhấp ko cho label , label thì bị nhấp 2 cái
        ToggleLabel($(this).parent('.color') , $(".color"));
    });

    $(document).on("click",".size input",function () { // cho input nhấp ko cho label , label thì bị nhấp 2 cái
        ToggleLabel($(this).parents('.size'), $(".size"));
    });



    $("#add-to-cart").click(function () {
        open_cart();
        AddCardAjax($(this));
    });

    $(".bg-body").click(function () {
        off_cart();
    });

    $(".site-close-handle").click(function () {
        off_cart();
    });


    $("#open_cart").click(function () {
        open_cart();
    });

    $(document).on("click",".delete_cart",function () {
        DeleteCardAjax($(this));
    });


    // $(".delete_cart").on('click',function () {
    //     DeleteCardAjax($(this));

    // });

    $(".qtyplus").click(function(){
        plus_buy($(this));
        ajax_plus($(this));
    });

    $(".qtyminus").click(function(){
        minus_buy($(this));
        ajax_plus($(this));
    });

    $(".more-text").click(function(){
        $(".viewMoreProduct").toggleClass('height');
    });

    // $(document).on('click','.contentFilter label',function(){
    //     // filter($(this));
    //     $('.contentFilter div').each(function(){
    //         if ($(this).find('input').is(':checked')) {
    //             console.log($(this).find('.filter').val());
    //         }
    //     });
    // });

    $('.contentFilter input').change(function(){
        filter(0,"");
    });

    $(document).on('click','.append-search-remove',function(){
        var MyClass = $(this).siblings('input').val();
        $(MyClass).find('input').prop('checked',false);
        $(this).parent('span').remove();
        filter(0,"");
    });

    $(document).on('click','.more',function(){
        // $page =  $('.more').data('page');
        $page = $('.more').attr('data-page');

        if ($page == "") {
            $('.more').attr('data-page',0);
        } else {
            if (parseInt($page) < $('#amount').val()) {
                $('.more').attr('data-page',parseInt($page) + 1);
            }
        }

        filter($page,"more");
    });

    $('#mc-embedded-subscribe').click(function(){
        if (validateEmail($('#send-email').val())) {

            var url = "/send-mail";
            var data = {
                email: $('#send-email').val()
            };
            $.post(url, data)
                .done(function (data) {
                    alert('thành công');
                })
                .fail(function (data) {
                    console.log("thất bại");
                });
        } else {
            $('.check-mail').removeClass('d-none');
        }
    });
});

window.onload = function (){
    $('.more').attr('data-page',0);
}

function validateEmail(email) {
    const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}

function filter($page,$more) {
    let sColor = [], sSize = [], sStyle = [], sMaterial = [];
    var amount = $('#amount').val();

    sColor = $.map($('#filterColor input:checked'), function(ar, i) {
        return $(ar).val();
    });
    sSize = $.map($('#filterSize input:checked'), function(ar, i) {
        return $(ar).val();
    });
    sStyle = $.map($('#filterStyle input:checked'), function(ar, i) {
        return $(ar).val();
    });
    sMaterial = $.map($('#filterMaterial input:checked'), function(ar, i) {
        return $(ar).val();
    });

    var url = "/filter";
    var data = {
        color : sColor,
        size : sSize,
        style : sStyle,
        material : sMaterial,
        id_category: $('#id_category').val(),
        page : $page,
        more: $more,
        amount: amount,
        sale : $('#sale').val()
    };

    $.get(url, data)
        .done(function (data) {
            if (data.color != "") {
                $(".append-search .x-color").remove();
                $(".append-search").append(`
                    <span class="x-color">Màu sắc: <b>${data.color}</b><input type="hidden" value=".filter-color"><span class="append-search-remove"> <span></span></span></span>
                `);
            } else {
                $(".append-search .x-color").remove();
            }

            if (data.size != "") {
                $(".append-search .x-size").remove();
                $(".append-search").append(`
                    <span class="x-size">Kích cỡ: <b>${data.size}</b><input type="hidden" value=".filter-size" ><span class="append-search-remove"> <span></span></span></span>
                `);
            } else {
                $(".append-search .x-size").remove();
            }

            if (data.material != "") {
                $(".append-search .x-material").remove();
                $(".append-search").append(`
                    <span class="x-material">Chất liệu: <b>${data.material}</b><input type="hidden" value=".filter-material" ><span class="append-search-remove"> <span></span></span></span>
                `);
            } else {
                $(".append-search .x-material").remove();
            }

            if (data.style != "") {
                $(".append-search .x-style").remove();
                $(".append-search").append(`
                    <span class="x-style">Kiểu dáng: <b>${data.style}</b><input type="hidden" value=".filter-style" ><span class="append-search-remove"> <span></span></span></span>
                `);
            } else {
                $(".append-search .x-style").remove();
            }

            // var obj = data.list;
            if ($more == "") {
                $('.more').attr('data-page',1);
            }

            // if (data.list.length != 0) {
            var list = data.list
            console.log(list);
                if (data.more == 'more') {
                    if (list.length != 0) {
                        list.forEach(function($item){
                            $image =  ($item.list_variant.map(x => x.image)).filter((value, index, array) => array.indexOf(value) === index);
                                $('.content-product-list').append(`
                                        <div class="product-resize col-md-3 col-sm-3 col-xs-6 pro-loop animated zoomIn fixheight">
                                        <div class="product-block" data-anmation="4">
                                            <div class="product-img image-resize fixheight">
                                            <a href="/product-detail/${$item.uri}" >
                                                    <picture>
                                                    <img class="img-loop lazyload" src="/backend/images/juno/${ ($item.image_main).split(';')[0] }" >
                                                    </picture>

                                                    <picture>
                                                        <img class="img-loop img-hover lazyload" src="/backend/images/juno/${ ($item.image_detail).split(';')[0] }" >
                                                    </picture>
                                                </a>
                                            </div>
                                            <div class="product-detail clearfix">
                                                <div class="variantColor variantColor${$item.id}">
                                                    <ul>
                                                    </ul>
                                                </div>
                                                <div class="box-pro-detail">
                                                    <h3 class="pro-name">
                                                        <a href="/product-detail/${$item.uri}" title="Giày xăng đan quai ngang bản to SD01057">
                                                            ${$item.name}
                                                        </a>
                                                    </h3>
                                                    <div class="box-pro-prices">
                                                        <p class="pro-price highlight">
                                                            ${$item.list_variant[0].price}đ
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="activeLabelStatus">
                                                <div class="trendingNew">Chỉ bán online</div>
                                            </div>
                                            <div class="actionLoop visible-lg">
                                                <a class="quickView styleBtnBuy notClick" data-handle="/products/giay-xang-dan-quai-ngang-ban-to-sd01057"><i class="fa fa-shopping-cart"></i> Mua nhanh</a>
                                                <a class="styleBtnBuy" href="/product-detail/${$item.uri}"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                            </div>
                                        </div>
                                    </div>
                                `);

                                $image.forEach(function($item_image){
                                    $('.variantColor'+ $item.id +' ul').append(`
                                        <li class="active">
                                            <a href="" >
                                            <img class="lazyload" src="/backend/images/juno/${$item_image}">
                                            </a>
                                        </li>
                                    `);
                                });

                        });
                    }
                } else {
                    if (data.list.length != 0) {
                        $('.content-product-list div').remove();
                            list.forEach(function($item){
                                $image =  ($item.list_variant.map(x => x.image)).filter((value, index, array) => array.indexOf(value) === index);
                                            $('.content-product-list').append(`
                                                    <div class="product-resize col-md-3 col-sm-3 col-xs-6 pro-loop animated zoomIn fixheight">
                                                    <div class="product-block" data-anmation="4">
                                                        <div class="product-img image-resize fixheight">
                                                        <a href="/product-detail/${$item.uri}" >
                                                                <picture>
                                                                <img class="img-loop lazyload" src="/backend/images/juno/${ ($item.image_main).split(';')[0] }" >
                                                                </picture>

                                                                <picture>
                                                                    <img class="img-loop img-hover lazyload" src="/backend/images/juno/${ ($item.image_detail).split(';')[0] }" >
                                                                </picture>
                                                            </a>
                                                        </div>
                                                        <div class="product-detail clearfix">
                                                            <div class="variantColor variantColor${$item.id}">
                                                                <ul>
                                                                </ul>
                                                            </div>
                                                            <div class="box-pro-detail">
                                                                <h3 class="pro-name">
                                                                    <a href="/product-detail/${$item.uri}" title="Giày xăng đan quai ngang bản to SD01057">
                                                                        ${$item.name}
                                                                    </a>
                                                                </h3>
                                                                <div class="box-pro-prices">
                                                                    <p class="pro-price highlight">
                                                                        ${$item.list_variant[0].price}đ
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="activeLabelStatus">
                                                            <div class="trendingNew">Chỉ bán online</div>
                                                        </div>
                                                        <div class="actionLoop visible-lg">
                                                            <a class="quickView styleBtnBuy notClick" data-handle="/products/giay-xang-dan-quai-ngang-ban-to-sd01057"><i class="fa fa-shopping-cart"></i> Mua nhanh</a>
                                                            <a class="styleBtnBuy" href="/product-detail/${$item.uri}"><i class="fa fa-eye"></i> Xem chi tiết</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            `);

                                            $image.forEach(function($item_image){
                                                $('.variantColor'+ $item.id +' ul').append(`
                                                    <li class="active">
                                                        <a href="" >
                                                        <img class="lazyload" src="/backend/images/juno/${$item_image}">
                                                        </a>
                                                    </li>
                                                `);
                                            });

                                    });
                            // console.log(data.list.length);
                            // if (data.list.length == 8) {
                            //     $('.filter-here').append(`
                            //         <div class="text-center">
                            //             <a class="btn btn-primary more" data-page="0" data-amount="${data.amount}">Xem thêm</a>
                            //         </div>
                            //     `);
                            //     console.log($('.more').attr('data-page'));
                            //     // if (data.amount - 1 == $('.more').attr('data-page')) {
                            //     //     $('.more').remove();
                            //     // }
                            }   else {
                                $('.content-product-list div').remove();
                           $('.content-product-list').append(`
                               <div class="alert-no-filter">
                                   Không tìm thấy sản phẩm nào phù hợp!
                               </div>
                           `);
                       }
                }

        })
        .fail(function (data) {
            console.log("thất bại");
    });
}

function ToggleLabel($that, $all_that) {
    $all_that.find("label").css("border", "1px solid #ccc");
    $that.children("label").css("border", "1px solid");
    if ($that.find('.pro_price').val() != undefined) { // th color bấm và size cũng bấm
        var str = $that.find('.pro_price').val().replace(/(\d+)(\d{3})/, '$1'+','+'$2') + 'đ';
        $('.pro-price').text(str);
    }
}

function ajax_plus($obj) {
    var url = "/update-cart";
    var data = {
        buy: parseInt($obj.siblings('.buy').val()),
        id: $obj.data('id')
    };
    $.post(url, data)
        .done(function (data) {
            $('.price' + data.id).text(data.price + '₫');
            $('.total_price').text(data.total_price + '₫');
            $('.count-cart b').text(data.total_buy);
        })
        .fail(function (data) {
            console.log("thất bại");
        });
}

function plus_buy($obj) {
    var plus = parseInt($obj.siblings('.buy').val());
        $obj.siblings('.buy').val(plus + 1);
}

function minus_buy($obj) {
    var plus = parseInt($obj.siblings('.buy').val());
    if (plus > 1) {
        $obj.siblings('.buy').val(plus - 1);
    }
}

function open_cart() {
    $(".bg-body").fadeIn();
    $(".main-index").addClass("translateX");
}

function off_cart() {
    $(".bg-body").fadeOut();
    $(".main-index").removeClass("translateX");
}

// $(window).on('hashchange', function() {
//     console.log(12);
//     location.reload();
// });

function AddCardAjax($obj) {
    $(".no-product").remove();
    var url = $obj.data("api");
    var data = {
        id: $(".size input:checked").val(),
        buy: 1,
    };
    $.post(url, data)
        .done(function (data) {
            $("#total-view-cart").text(data.total_price);
            $(".count").text(data.count);
            if (data.add == 1) {
                $("#cart-view tbody").append(`
                <tr class="item_2" data-id="${data.product.id}">
                    <td class="img">
                        <a href="/products/giay-mules-mui-vuong" title="/products/giay-mules-mui-vuong"><img
                                src="/backend/images/juno/${
                                    data.product.image_main.split(";")[0]
                                }"
                                alt="${data.product.name}"></a>
                    </td>
                    <td>
                        <a class="pro-title-view" href="/products/giay-mules-mui-vuong" title="/products/giay-mules-mui-vuong">${
                            data.product.name
                        }</a>
                        <span class="pro-price-view">${
                            data.product.variant.price.toString().replace(/(\d+)(\d{3})/, '$1'+','+'$2') + 'đ'
                        }</span>
                        <del class="pro-price-del-view"></del>
                        <span class="variant">${data.product.variant.size} / ${
                    data.product.variant.color
                }</span>
                       <span class="delete_cart" data-id=${
                           data.product.variant.id
                       }>Xóa</span>
                    </td>
                </tr>
            `);

                // $(".delete_cart").click(function () {
                //     DeleteCardAjax($(this));
                // });
            }
        })
        .fail(function (data) {
            console.log("thất bại");
        });
}

function DeleteCardAjax($obj) {
    var url = "/delete-cart-ajax";
    var data = {
        id: $obj.data("id"),
    };
    // debugger;
    $.post(url, data)
        .done(function (data) {
            console.log(data.count);
            $("#total-view-cart").text(data.total_price);
            $('.total_price').text(data.total_price + '₫');
            $(".count-cart b").text(data.count);
            $(".count").text(data.count);
            if (data.delete == 1) {
                $obj.parent("td").parent("tr").remove();
            }

            if (data.count == 0) {
                $(".cart-buttons").remove();
                $(".empty-cart").removeClass('d-none');
                $("#cart-view tbody").append(`
                <tr class="no-product"><td>Hiện chưa có sản phẩm nào</td></tr>
            `);
            }

        })
        .fail(function (data) {
            console.log("thất bại");
        });
}

// function ClickColor() {
//     var url = $obj.data("api");
//     var data = {
//         color: $(".color input:checked").val(),
//         id: $obj.data("id"),
//     };
//     $.get(url, data)
//         .done(function (data) {
//             console.log("thành công");
//         })
//         .fail(function (data) {
//             console.log("thất bại");
//         });
// }


// function filter($obj) {
//     // if ($obj.siblings('input').prop('checked',true)) {
//     //     $obj.siblings('input').prop('checked',true);
//     //     console.log($obj.siblings('input').val());
//     // } else {
//     //     $obj.siblings('input').prop('checked',false);
//     //     console.log($obj.siblings('input').val());
//     // }
//     var url = "/filter";
//     if ($obj != 'reload') {
//         var data = {
//             filter: $obj.siblings('.filter').val(),
//             kind: $obj.siblings('.kind').val()
//         };
//     } else {
//         var data = {
//             kind: $obj
//         };
//     }
//     // debugger;
//     $.get(url, data)
//         .done(function (data) {
//             console.log(data.count);
//         })
//         .fail(function (data) {
//             console.log("thất bại");
//         });
// }
