var timeOut_modalCart;
var viewout = true;
var check_show_modal = true;
var add_item_show_modalCart = function(id) {
	if( check_show_modal ) {
		check_show_modal = false;
		timeOut_modalCart = setTimeout(function(){ 
			check_show_modal = true;
		}, 3000);
		if ( $('.addtocart-modal').hasClass('clicked_buy') ) {
			var quantity = $('#quantity').val();
		} else {
			var quantity = 1;
		}
		var params = {
			type: 'POST',
			url: '/cart/add.js',
			async: true,
			data: 'quantity=' + quantity + '&id=' + id,
			dataType: 'json',
			success: function(line_item) {
				//	if ( jQuery(window).width() >= 768 ) {
				getCartModal();					
				jQuery('#myCart').modal('show');				
				jQuery('.modal-backdrop').css({'height':jQuery(document).height(),'z-index':'99'});
				//	} else {
				//		window.location = '/cart';
				//	}
				$('.addtocart-modal').removeClass('clicked_buy');
			},
			error: function(XMLHttpRequest, textStatus) {
				alert('Sản phẩm bạn vừa mua đã vượt quá tồn kho');
			}
		};
		jQuery.ajax(params);
	}
}
var plusQuantity = function() {
	if ( jQuery('input[name="quantity"]').val() != undefined ) {
		var currentVal = parseInt(jQuery('input[name="quantity"]').val());
		if (!isNaN(currentVal)) {
			jQuery('input[name="quantity"]').val(currentVal + 1);
		} else {
			jQuery('input[name="quantity"]').val(1);
		}
	}else {
		console.log('error: Not see elemnt ' + jQuery('input[name="quantity"]').val());
	}
}
var minusQuantity = function() {
	if ( jQuery('input[name="quantity"]').val() != undefined ) {
		var currentVal = parseInt(jQuery('input[name="quantity"]').val());
		if (!isNaN(currentVal) && currentVal > 1) {
			jQuery('input[name="quantity"]').val(currentVal - 1);
		}
	}else {
		console.log('error: Not see elemnt ' + jQuery('input[name="quantity"]').val());
	}
}
function checkPromotion(){
	jQuery.getJSON('/cart.js', function(cart, textStatus) {
		if(cart) {
			if (cart.item_count >= 5){
				$(".wrap-addcart").removeClass("hasPro30");
				$(".modalBuyMobile").removeClass("hasPro30-mobile");
				$("#add-to-cart-promotion").css("display","none");
				$("#buyNowModalMobilePromotion30").css("display","none");
			}else{
				$(".wrap-addcart").addClass("hasPro30");
				$(".modalBuyMobile").addClass("hasPro30-mobile");
				$("#add-to-cart-promotion").css("display","initial");
				$("#buyNowModalMobilePromotion30").css("display","initial");
			}
		}
	});
}
function getCartModal(){
	var cart = null;
	jQuery('#cartform').hide();
	jQuery('#myCart #exampleModalLabel').text("Giỏ hàng");
	jQuery.getJSON('/cart.js', function(cart, textStatus) {
		if(cart) {
			/*if (cart.item_count >= 5){
				$(".wrap-addcart").removeClass("hasPro30");
				$(".modalBuyMobile").removeClass("hasPro30-mobile");
				$("#add-to-cart-promotion").css("display","none");
				$("#buyNowModalMobilePromotion30").css("display","none");
			}else{
				$(".wrap-addcart").addClass("hasPro30");
				$(".modalBuyMobile").addClass("hasPro30-mobile");
				$("#add-to-cart-promotion").css("display","initial");
				$("#buyNowModalMobilePromotion30").css("display","initial");
			}*/
			jQuery('#cartform').show();
			jQuery('.line-item:not(.original)').remove();
			jQuery.each(cart.items,function(i,item){
				var total_line = 0;
				var total_line = item.quantity * item.price;
				tr = jQuery('.original').clone().removeClass('original').appendTo('table#cart-table tbody');
				if(item.image != null)
					tr.find('.item-image').html("<img src=" + Haravan.resizeImage(item.image,'medium') + ">");
				else
					tr.find('.item-image').html("<img src='https://file.hstatic.net/1000003969/file/no_image_9f47ef2d167b4323b79ba7320cb631ae.jpg'>");
				vt = item.variant_options;
				if(vt.indexOf('Default Title') != -1)
					vt = '';
				tr.find('.item-title').children('a').html(item.product_title + '<br><span>' + vt + '</span>').attr('href', item.url);
				tr.find('.item-quantity').html("<input id='quantity1' name='updates[]' min='1' type='number' value=" + item.quantity + " class='' />");
				if ( typeof(formatMoney) != 'undefined' ){
					tr.find('.item-price').html(Haravan.formatMoney(total_line, formatMoney));
				}else {
					tr.find('.item-price').html(Haravan.formatMoney(total_line, ''));
				}
				tr.find('.item-delete').html("<a href='javascript:void(0);' onclick='deleteCart(" + (i+1) + ")' ><i class='fa fa-times'></i></a>");
			});
			jQuery('.item-total').html(Haravan.formatMoney(cart.total_price, formatMoney));
			jQuery('.modal-title').children('b').html(cart.item_count);
			jQuery('.count-holder .count').html(cart.item_count );
			jQuery('.textCartSide b').html(cart.item_count );
			if(cart.item_count == 0){				
				jQuery('#exampleModalLabel').html('Giỏ hàng của bạn đang trống. Mời bạn tiếp tục mua hàng.');
				jQuery('#cart-view').html('<tr><td>Hiện chưa có sản phẩm</td></tr>');
				jQuery('#cartform').hide();
			}
			else{			
				jQuery('#exampleModalLabel').html('Bạn có ' + cart.item_count + ' sản phẩm trong giỏ hàng.');
				jQuery('#cartform').removeClass('hidden');
				jQuery('#cart-view').html('');
			}
			if ( jQuery('#cart-pos-product').length > 0 ) {
				jQuery('#cart-pos-product span').html(cart.item_count + ' sản phẩm');
			}
			jQuery.each(cart.items,function(i,item){
				clone_item(item,i);
			});
			jQuery('#total-view-cart').html(Haravan.formatMoney(cart.total_price, formatMoney));
			setTimeout(function(){
				$.each(cart.items, function(i,v){
					if (v.sku.indexOf("BB") != -1 || v.sku.indexOf("CG") != -1 || v.sku.indexOf("SD") != -1 || v.sku.indexOf("DK") != -1 || v.sku.indexOf("DE") != -1 || v.sku.indexOf("TT") != -1 || v.sku.indexOf("DX") != -1){
						if (v.price == 0){
							var idV = v.variant_id;
							$("#cart-view .item_2[data-id="+idV+"]").find('.labelGiftInCart').removeClass("hidden");
						}
					}
				});
			},500)
		} else{
			jQuery('#exampleModalLabel').html('Giỏ hàng của bạn đang trống. Mời bạn tiếp tục mua hàng.');
			if ( jQuery('#cart-pos-product').length > 0 ) {
				jQuery('#cart-pos-product span').html(cart.item_count + ' sản phẩm');
			}
			jQuery('#cart-view').html('<tr><td>Hiện chưa có sản phẩm</td></tr>');
			jQuery('#cartform').hide();
		}
	});
	$('#site-overlay').addClass("active");
	$('.main-body').addClass("sidebar-move");
	$('#site-nav--mobile').addClass("active");
	$('#site-nav--mobile').removeClass("show-filters").removeClass("show-search").addClass("show-cart");
}
function clone_item(product,i){
	var item_product = jQuery('#clone-item-cart').find('.item_2');
	if ( product.image == null ) {
		item_product.find('img').attr('src','https://file.hstatic.net/1000003969/file/no_image_9f47ef2d167b4323b79ba7320cb631ae.jpg').attr('alt', product.url);
	} else {
		item_product.find('img').attr('src',Haravan.resizeImage(product.image,'medium')).attr('alt', product.url);
	}
	item_product.find('a:not(.remove-cart)').attr('href', product.url).attr('title', product.url);
	item_product.find('.pro-title-view').html(product.title);
	item_product.find('.pro-price-view').html(Haravan.formatMoney(product.price,formatMoney));
	if (product.price_original != product.price){
		item_product.find('.pro-price-del-view').html(Haravan.formatMoney(product.price_original,formatMoney));
	}
	item_product.find('.pro-quantity-view').html(product.quantity);
	item_product.find('.remove-cart').html("<a href='javascript:void(0);' onclick='deleteCart(" + (i+1) + ")' >Xóa</a>");
	item_product.find('.remove-cart').attr("data-variant",product.variant_id);
	item_product.attr('data-id', product.variant_id);
	var title = '';
	if(product.variant_options.indexOf('Default Title') == -1){
		$.each(product.variant_options,function(i,v){
			title = title + v + ' / ';
		});
		title = title + '@@';
		title = title.replace(' / @@','')
		item_product.find('.variant').html(title);
	}else {
		item_product.find('.variant').html('');
	}
	item_product.clone().removeClass('hidden').prependTo('#cart-view');
}
$("#site-cart-handle").click(function(){
	$.ajax({
		type: 'get',
		url:"/cart.js",
		dataType: 'json',
		async: true,
		success: function(data){
			$.each(data.items, function(i,v){
				if (v.sku.indexOf("BB") != -1 || v.sku.indexOf("CG") != -1 || v.sku.indexOf("SD") != -1 || v.sku.indexOf("DK") != -1 || v.sku.indexOf("DE") != -1 || v.sku.indexOf("TT") != -1 || v.sku.indexOf("DX") != -1){
					if (v.price == 0){
						var idV = v.variant_id;
						$("#cart-view .item_2[data-id="+idV+"]").find('.labelGiftInCart').removeClass("hidden");
					}
				}
			});
		}
	});
});
function deleteCart(line){
	var params = {
		type: 'POST',
		url: '/cart/change.js',
		data: 'quantity=0&line=' + line,
		dataType: 'json',
		success: function(cart) {
			getCartModal();
		},
		error: function(XMLHttpRequest, textStatus) {
			Haravan.onError(XMLHttpRequest, textStatus);
		}
	};
	jQuery.ajax(params);
}
jQuery(document).on("click","#update-cart-modal",function(event){
	event.preventDefault();
	if (jQuery('#cartform').serialize().length <= 5) return;
	jQuery(this).html('Đang cập nhật');
	var params = {
		type: 'POST',
		url: '/cart/update.js',
		data: jQuery('#cartform').serialize(),
		dataType: 'json',
		success: function(cart) {
			if ((typeof callback) === 'function') {
				callback(cart);
			} else {
				getCartModal();
			}
			jQuery('#update-cart-modal').html('Cập nhật');
		},
		error: function(XMLHttpRequest, textStatus) {
			Haravan.onError(XMLHttpRequest, textStatus);
		}
	};
	jQuery.ajax(params);
});
function fixHeightProduct(data_parent, data_target, data_image) {
	var box_height = 0;
	var box_image = 0;
	var boxtarget = data_parent + ' ' + data_target;
	var boximg = data_parent + ' ' + data_target + ' ' + data_image;
	jQuery(boximg).css('height', 'auto');
	jQuery($(boxtarget)).css('height', 'auto');
	jQuery($(boxtarget)).removeClass('fixheight');
	jQuery($(boxtarget)).each(function() {
		if (jQuery(this).find($(data_image)).height() > box_image) {
			box_image = jQuery(this).find($(data_image)).height();
		}
	});
	if (box_image > 0) {
		jQuery(boximg).height(box_image);
	}
	jQuery($(boxtarget)).each(function() {
		if (jQuery(this).height() > box_height) {
			box_height = jQuery(this).height();
		}
	});
	jQuery($(boxtarget)).addClass('fixheight');
	if (box_height > 0) {
		jQuery($(boxtarget)).height(box_height);
	}
	try {
		fixheightcallback();
	} catch (ex) {}
}
jQuery(document).ready(function(){

/*
	var random = sessionStorage.getItem('random')
	if (random == null){
	 random = Math.random();
		if (random < 0.5) {
	    sessionStorage.setItem('random', 'hide');
		} else {
			sessionStorage.setItem('random', 'show');
		}		
	}
	if (sessionStorage.getItem('random') ==  'hide') {
		$( ".juno-recommender" ).addClass('hide-random');
	}
*/


	if ($(window).width() > 768){
		jQuery('.loopProductDetailCollection .image-resize').imagesLoaded(function() {
			fixHeightProduct('.loopProductDetailCollection', '.product-resize', '.imgDetail');
			jQuery(window).resize(function() {
				fixHeightProduct('.loopProductDetailCollection', '.product-resize', '.imgDetail');
			});
		});
	}
	jQuery('.sectionContentTab .image-resize').imagesLoaded(function() {
		fixHeightProduct('.sectionContentTab', '.product-resize', '.image-resize');
		jQuery(window).resize(function() {
			fixHeightProduct('.sectionContentTab', '.product-resize', '.image-resize');
		});
	});
	jQuery('.wrapper-collection-1 .content-product-list .image-resize').imagesLoaded(function() {
		fixHeightProduct('.wrapper-collection-1 .content-product-list', '.product-resize', '.image-resize');
		jQuery(window).resize(function() {
			fixHeightProduct('.wrapper-collection-1 .content-product-list', '.product-resize', '.image-resize');
		});
	});
	jQuery('.wrapper-collection-2 .content-product-list .image-resize').imagesLoaded(function() {
		fixHeightProduct('.wrapper-collection-2 .content-product-list', '.product-resize', '.image-resize');
		jQuery(window).resize(function() {
			fixHeightProduct('.wrapper-collection-2 .content-product-list', '.product-resize', '.image-resize');
		});
	});
	jQuery('#collection-body .content-product-list .image-resize').imagesLoaded(function() {
		fixHeightProduct('#collection-body .content-product-list', '.product-resize', '.image-resize');
		jQuery(window).resize(function() {
			fixHeightProduct('#collection-body .content-product-list', '.product-resize', '.image-resize');
		});
	});
	jQuery('.list-productRelated .content-product-list .image-resize').imagesLoaded(function() {
		fixHeightProduct('.list-productRelated .content-product-list', '.product-resize', '.image-resize');
		jQuery(window).resize(function() {
			fixHeightProduct('.list-productRelated .content-product-list', '.product-resize', '.image-resize');
		});
	});
	jQuery('.list-slider-banner .image-resize').imagesLoaded(function() {
		fixHeightProduct('.list-slider-banner', '.product-resize', '.image-resize');
		jQuery(window).resize(function() {
			fixHeightProduct('.list-slider-banner', '.product-resize', '.image-resize');
		});
	});
	jQuery('.search-list-results .image-resize').imagesLoaded(function() {
		fixHeightProduct('.search-list-results', '.product-resize', '.image-resize');
		jQuery(window).resize(function() {
			fixHeightProduct('.search-list-results', '.product-resize', '.image-resize');
		});
	});
	if (jQuery(window).width() < 768) {
		jQuery('.main-footer .footer-col .footer-title').on('click', function(){
			jQuery(this).toggleClass('active').parent().find('.footer-content').stop().slideToggle('medium');
		});
		$('a.btn-fter').click(function(e){
			if ( $(this).attr('aria-expanded') == 'false' ) {
				e.preventDefault();
				$(this).attr('aria-expanded','true');
				$('.main-footer').addClass('bg-active');
			} else {
				$(this).attr('aria-expanded','false');
				$('.main-footer').removeClass('bg-active');
			}
		});
	}
	$('#home-slider .owl-carousel').owlCarousel({
		items:1,
		nav: false,
		dots: true,
		lazyLoad:true,
		touchDrag: true,
		responsive:{
			0:{
				items:1
			},
			768:{
				items:1
			},
			1024:{
				items:1
			}
		}
	});
	jQuery('#collection-slide').owlCarousel({
		items:4,
		nav:true,
		dots:false,
		responsive:{
			0:{
				items:2,
				margin: 15
			},
			480:{
				items:2,
				margin: 15
			},
			768:{
				items:3,
				margin: 15
			},
			992:{
				items:4,
				margin: 30
			},
			1200:{
				items:5,
				margin: 30
			}
		},
		pagination: false,
		slideSpeed : 800,
		addClassActive: true,
		scrollPerPage: false,
		touchDrag: true,
		autoplay: false,
		loop: false,
	});
	$('.list-slider-banner').slick({
		centerMode: true,
		centerPadding: '60px',
		slidesToShow: 3,
		responsive: [
			{
				breakpoint: 768,
				settings: {
					arrows: true,
					centerMode: true,
					centerPadding: '40px',
					slidesToShow: 3
				}
			},
			{
				breakpoint: 480,
				settings: {
					arrows: true,
					centerMode: true,
					centerPadding: '40px',
					slidesToShow: 1
				}
			}
		]
	});
});
$(document).on("click", "span.icon-subnav", function(){
	if ($(this).parent().hasClass('active')) {
		$(this).parent().removeClass('active');
		$(this).siblings('ul').slideUp();
	} else {
		if( $(this).parent().hasClass("level0") || $(this).parent().hasClass("level1")){
			$(this).parent().siblings().find("ul").slideUp();
			$(this).parent().siblings().removeClass("active");
		}
		$(this).parent().addClass('active');
		$(this).siblings('ul').slideDown();
	}
});
jQuery(document).on("click", ".back-to-top", function(){
	jQuery(this).removeClass('show');
	jQuery('html, body').animate({
		scrollTop: 0			
	}, 800);
});
jQuery(window).scroll(function() {
	if ( jQuery('.back-to-top').length > 0 && jQuery(window).scrollTop() > 500 ) {
		jQuery('.back-to-top').addClass('show');
	} else {
		jQuery('.back-to-top').removeClass('show');
	}
	if (jQuery(window).width() < 768) {
		var scroll = $(window).scrollTop();
		if (scroll < 320) {
			$(".main-header").removeClass("scroll-menu");	
		} else {
			$(".main-header").addClass("scroll-menu");		
		}
	} else {
		var height_header =	$('.main-header').height();
		if( jQuery(window).scrollTop() >= height_header ) {			
			jQuery('.main-header').addClass('affix-mobile');
		}	else {
			jQuery('.main-header').removeClass('affix-mobile');
		}
	}
});
$('a[data-spy=scroll]').click(function(){
	event.preventDefault() ;
	$('body').animate({scrollTop: ($($(this).attr('href')).offset().top - 20) + 'px'}, 500);
})
function smoothScroll(a, b){
	$('body,html').animate({
		scrollTop : a
	}, b);
}
var buy_now = function(id) {
	var quantity = 1;
	var params = {
		type: 'POST',
		url: '/cart/add.js',
		data: 'quantity=' + quantity + '&id=' + id,
		dataType: 'json',
		success: function(line_item) {
			window.location = '/checkout';
		},
		error: function(XMLHttpRequest, textStatus) {
			Haravan.onError(XMLHttpRequest, textStatus);
		}
	};
	jQuery.ajax(params);
}
$(document).on('click','.tree-menu .tree-menu-lv1',function(){
	$this = $(this).find('.tree-menu-sub');
	$('.tree-menu .has-child .tree-menu-sub').not($this).slideUp('fast');
	$(this).find('.tree-menu-sub').slideToggle('fast');
	$(this).toggleClass('menu-collapsed');
	$(this).toggleClass('menu-uncollapsed');
	var $this1 = $(this);
	$('.tree-menu .has-child').not($this1).removeClass('menu-uncollapsed');
});
jQuery('.title_block').click(function(){
	$(this).next().slideToggle('medium');
});    
$(document).on("click",".dropdown-filter", function(){
	if ( $(this).parent().attr('aria-expanded') == 'false' ) {
		$(this).parent().attr('aria-expanded','true');
	} else {
		$(this).parent().attr('aria-expanded','false');
	}
});
$('.ultimate-search').submit(function(e) {
	e.preventDefault();
	var q = $(this).find('input[name=q]').val();
	if(q.indexOf('script') > -1 || q.indexOf('>') > -1 || q.indexOf('$') > -1){
		alert('Từ khóa của bạn có chứa mã độc hại ! Vui lòng nhập lại key word khác');
		$(this).find('input[name=q]').val('');
	}else{
		var query = "/search?type=product&q=" + q;
		window.location = query;
		/*var q_follow = 'product';
		var query = encodeURIComponent('(title:product**' + q + ')||(sku:product**' + q + ')');
		if( !q ) {
			window.location = '/search?type='+ q_follow +'&q=*';
			return;
		}	
		else {
			window.location = '/search?type=' + q_follow +'&q=filter=' + query;
			return;
		}*/
	}
});
var $input = $('.ultimate-search input[type="text"]');
$input.bind('keyup change paste propertychange', function() {
	var key = $(this).val(),
			$parent = $(this).parents('.wpo-wrapper-search'),
			$results = $(this).parents('.wpo-wrapper-search').find('.smart-search-wrapper');
	if(key.indexOf('script') > -1 || key.indexOf('>') > -1 || key.indexOf('$') > -1){
		alert('Từ khóa của bạn có chứa mã độc hại ! Vui lòng nhập lại key word khác');
		$(this).val('');
	}else{
		if(key.length > 0 ){
			$(this).attr('data-history', key);
			var q_follow = 'product',
					str = '';
			str = '/search?q=filter=((title:product**' + key + ')||(sku:product**' + key + '))&view=ultimate-product';
			$.ajax({
				url: str,
				type: 'GET',
				async: true,
				success: function(data){
					$results.find('.resultsContent').html(data);
				}
			})
			$results.fadeIn();
		}else{
			$results.fadeOut();
		}
	}
})
$('input[name="follow"]').on('change', function(){
	$('.ultimate-search input[type="text"]').trigger('change');
})
$('input[name="follow_mobile"]').on('change', function(){
	$('.ultimate-search input[type="text"]').trigger('change');
})
$('body').click(function(evt) {
	var target = evt.target;
	if (target.id !== 'ajaxSearchResults' && target.id !== 'inputSearchAuto') {
		$(".ajaxSearchResults").hide();
	}
	if (target.id !== 'ajaxSearchResults-mb' && target.id !== 'inputSearchAuto-mb') {
		$(".ajaxSearchResults").hide();
	}
});
$('body').on('click', '.ultimate-search input[type="text"]', function() {
	if ($(this).is(":focus")) {
		if ($(this).val() != '') {
			$(".ajaxSearchResults").show();
		}
	} else {

	}
})



