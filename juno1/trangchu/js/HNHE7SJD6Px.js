if (self.CavalryLogger) { CavalryLogger.start_js(["WwSiG"]); }

__d("Dock",["csx","ArbiterMixin","BlueBar","ChatQuietLinks","CSS","DataStore","DOM","Event","Parent","Scroll","Style","Toggler","Vector","emptyFunction","isKeyActivation","shield"],(function(a,b,c,d,e,f,g){function c(){}Object.assign(c,b("ArbiterMixin"),{MIN_HEIGHT:140,INITIAL_FLYOUT_HEIGHT_OFFSET:10,init:function(a){this.init=b("emptyFunction");this.rootEl=a;this.calculateViewportDimensions();b("ChatQuietLinks").removeEmptyHrefs(this.rootEl);b("Event").listen(a,"click",this._onClick.bind(this));var c=a.querySelector(".fbNubButton");c&&b("Event").listen(c,"keypress",this._onKeyPress.bind(this));b("Event").listen(window,"resize",this._onWindowResize.bind(this));b("Toggler").subscribe(["show","hide"],function(c,d){d=d.getActive();if(!b("DOM").contains(a,d))return;if(b("CSS").hasClass(d,"fbNub"))this.notifyNub(d,c),c==="show"&&this._resizeNubFlyout(d);else{d=b("Parent").byClass(d,"fbNubFlyout");d&&b("CSS").conditionClass(d,"menuOpened",c==="show")}}.bind(this));this.inform("init",{},"persistent")},calculateViewportDimensions:function(){return this.viewportDimensions=b("Vector").getViewportDimensions()},getFlyoutHeightOffset:function(){if(this.flyoutHeightOffset)return this.flyoutHeightOffset;this.flyoutHeightOffset=this.INITIAL_FLYOUT_HEIGHT_OFFSET+b("Vector").getElementDimensions(this.rootEl).y;var a=b("BlueBar").getBar();if(a){var c=b("Style").isFixed(a)?"viewport":"document";this.flyoutHeightOffset+=b("Vector").getElementPosition(a,c).y+b("Vector").getElementDimensions(a).y}return this.flyoutHeightOffset},toggle:function(a){var c=this._findFlyout(a);if(!c)return;this.subscribe("init",function(){b("Toggler").toggle(a)})},show:function(a){this.subscribe("init",function(){b("Toggler").show(a)})},showNub:function(a){b("CSS").show(a)},hide:function(a){this.subscribe("init",function(){var c=b("Toggler").getInstance(a);b("DOM").contains(a,c.getActive())&&c.hide()})},hideNub:function(a){b("CSS").hide(a),this.hide(a)},setUseMaxHeight:function(a,c){b("CSS").conditionClass(a,"maxHeight",c!==!1),this._resizeNubFlyout(a)},_resizeNubFlyout:function(a){var c=this._findFlyout(a);if(!c||b("CSS").hasClass(a,"placeholder")||!(b("CSS").hasClass(a,"openToggler")||b("CSS").hasClass(a,"opened")))return;var d=b("DOM").find(c,"div.fbNubFlyoutOuter"),e=b("DOM").find(d,"div.fbNubFlyoutInner"),f=b("DOM").find(e,"div.fbNubFlyoutBody"),g=b("CSS").hasClass(a,"canBeCompactTab"),h=b("Scroll").getTop(f),i=f.offsetHeight;b("Style").set(f,"height","auto");var j=b("Vector").getElementDimensions(c),k=b("Vector").getElementDimensions(f),l=this.getMaxFlyoutHeight(a);b("Style").set(c,"max-height",l+"px");b("Style").set(d,"max-height",l+"px");j=b("Vector").getElementDimensions(c);d=b("Vector").getElementDimensions(e);l=d.y-k.y;e=j.y-l;d=parseInt(f.style.height||f.clientHeight,10);d=e!==d;j.y>l&&d&&!g&&b("Style").set(f,"height",e+"px");b("CSS").removeClass(c,"swapDirection");var m=b("Vector").getElementPosition(c).x;b("CSS").conditionClass(c,"swapDirection",function(){if(m<0)return!0;return!j||!this.viewportDimensions?!1:m+j.x>this.viewportDimensions.x}.bind(this)());d&&h+i>=k.y?b("Scroll").setTop(f,f.scrollHeight):b("Scroll").setTop(f,h);this.notifyNub(a,"resize")},getMaxFlyoutHeight:function(a){a=this._findFlyout(a);var c=b("Vector").getElementPosition(a,"viewport");a=b("Vector").getElementDimensions(a);if(!this.viewportDimensions||!c)return 0;c=Math.max(this.MIN_HEIGHT,this.viewportDimensions.y-this.getFlyoutHeightOffset())-(this.viewportDimensions.y-c.y-a.y);return Math.max(c,0)},resizeAllFlyouts:function(){var a=this._getAllNubs(),b=a.length;while(b--)this._resizeNubFlyout(a[b])},_getAllNubs:function(){if(!this.rootEl)return[];var a=b("DOM").scry(this.rootEl,"div._50-v.openToggler:not(._s0f)");return a.concat(b("DOM").scry(this.rootEl,"div._50-v.opened:not(._s0f)"))},_onKeyPress:function(a){var c=a.getTarget();c=b("Parent").byClass(c,"fbNub");b("isKeyActivation")(a)&&c&&this.toggle(c)},_onClick:function(a){a=a.getTarget();var c=b("Parent").byClass(a,"fbNub");if(c){b("Parent").byClass(a,"adsNubFlyoutCloseButton")&&this.hide(c);if(b("Parent").byClass(a,"fbNubFlyoutTitlebar")){var d=b("Parent").byTag(a,"a");a=a.nodeName=="INPUT"&&a.getAttribute("type")=="submit";if(!d&&!a){this.hide(c);return!1}}this.notifyNub(c,"click")}},_onWindowResize:function(a){this.calculateViewportDimensions(),this.resizeAllFlyouts()},_findFlyout:function(a){return b("CSS").hasClass(a,"fbNubFlyout")?a:b("DOM").scry(a,"div.fbNubFlyout")[0]||null},registerNubController:function(a,c){b("DataStore").set(a,"dock:nub:controller",c),c.subscribe("nub/button/content-changed",b("shield")(this.inform,this,"resize",a)),c.subscribe("nub/flyout/content-changed",b("shield")(this._resizeNubFlyout,this,a))},unregisterNubController:function(a){b("DataStore").remove(a,"dock:nub:controller")},notifyNub:function(a,c,d){a=b("DataStore").get(a,"dock:nub:controller");a&&a.inform(c,d)}});e.exports=a.Dock||c}),null);
__d("DialogHideOnSuccess",["csx","CSS"],(function(a,b,c,d,e,f,g){a=function(){"use strict";function a(a){this._layer=a}var c=a.prototype;c.enable=function(){this._subscription=this._layer.subscribe("success",this._handle.bind(this))};c.disable=function(){this._subscription.unsubscribe(),this._subscription=null};c._handle=function(a,c){b("CSS").matchesSelector(c.getTarget(),"._s")&&this._layer.hide()};return a}();Object.assign(a.prototype,{_subscription:null});e.exports=a}),null);
__d("translateKey",["fbt","invariant"],(function(a,b,c,d,e,f,g,h){e.exports=a;var i={alt:g._("alt"),enter:g._("enter"),"delete":g._("delete"),shift:g._("shift"),opt:g._("opt"),ctrl:g._("ctrl"),cmd:g._("cmd"),esc:g._("esc"),tab:g._("tab"),up:g._("up"),down:g._("down"),right:g._("right"),left:g._("left"),page_up:g._("page up"),page_down:g._("page down"),home:g._("home"),end:g._("end")};function a(a){if(Object.prototype.hasOwnProperty.call(i,a))return i[a];a.length===1||h(0,2507);return a}}),null);
__d("AbstractDockingElement",["Arbiter","Event","FullScreen","Run","SubscriptionsHandler","onEnclosingPageletDestroy","queryThenMutateDOM","removeFromArray"],(function(a,b,c,d,e,f){f.register=a;var g=[],h=null;function i(){if(b("FullScreen").isFullScreen())return;b("queryThenMutateDOM")(function(){return g.forEach(function(a){return a.queryDOM()})},function(){return g.forEach(function(a){return a.updateWithCache()})},"AbstractDockingElement")}function j(){h||(h=new(b("SubscriptionsHandler"))(),h.addSubscriptions(b("Event").listen(window,"scroll",i),b("Event").listen(window,"resize",i),b("Run").onLeave(function(){while(g.length)k(g[0])})),h=h);return h}function k(a){try{a.onPageletDestroyed&&b("Arbiter").unsubscribe(a.onPageletDestroyed)}catch(a){}finally{a.onPageletDestroyed=null}if(!h||g.indexOf(a)===-1)return;b("removeFromArray")(g,a);if(g.length)return;h.release();h=null}function a(c,d,e){var a=j(),f={onPageletDestroyed:a.addSubscriptions(b("onEnclosingPageletDestroy")(c,function(){k(f)})),queryDOM:d,updateWithCache:e};g.push(f)}}),null);
__d("DirectionalDockingElement",["cx","AbstractDockingElement","Arbiter","CSS","DOM","Scroll","Style","UITinyViewportAction","UserAgent","ViewportBounds","getElementPosition","getStyleProperty","queryThenMutateDOM"],(function(a,b,c,d,e,f,g){var h=!0,i=!1,j=b("UserAgent").isBrowser("Safari < 10")||b("UserAgent").isBrowser("Mobile Safari < 10");a=function(){function a(a){this.$11=null,this.$5=0,this.$2=null,this.$7=!1,this.$12=a,this.$8=0,this.$11=null,this.$13=0,this.register(),this.$14=b("ViewportBounds").getTop(),b("Style").set(this.$12,"width",this.$12.getBoundingClientRect().width+"px"),this.$9=b("DOM").create("div"),b("CSS").addClass(this.$9,"_lwx"),b("Style").set(this.$9,"position","relative"),b("DOM").replace(this.$12,this.$9),b("DOM").appendContent(this.$9,this.$12),this.update()}var c=a.prototype;c.register=function(){b("AbstractDockingElement").register(this.getRoot(),this.__queryDOM.bind(this),this.__updateWithCache.bind(this))};c.subscribe=function(a,c,d){this.$1||(this.$1=new(b("Arbiter"))());return this.$1.subscribe(a,c,d)};c.destroy=function(){b("DOM").replace(this.$9,this.$12)};c.__queryDOM=function(){var a=-b("getElementPosition")(this.$9).y;a!==this.$13&&(this.$15=a>this.$13?i:h,this.$13=a);this.$6=this.$12.getBoundingClientRect();a=document;var c=a.body;a=a.documentElement;if(c&&a){var d=a.clientHeight;a=a.scrollHeight;this.$7=b("Scroll").getTop(c)+d>Math.max(d,a)}if(j){this.$11=b("getElementPosition")(this.$9);c=parseInt(b("getStyleProperty")(this.$12,"left"),10);this.$11&&!isNaN(c)&&c!==this.$11.x&&(this.$11=babelHelpers["extends"]({},this.$11,{x:c}))}this.$12.style.position==="fixed"&&(this.$5=b("getElementPosition")(this.$12).y+this.$13)};c.$16=function(a,c,d){if(c===this.$4&&a===this.$3&&d===this.$2)return;var e=a!==this.$3,f={};c!==this.$4&&(f.top=c+"px",this.$4=c);a!==this.$3&&(f.position=a,this.$3=a);j&&(d!==this.$2&&(f.left=typeof d==="number"?d+"px":"auto",this.$2=d));b("Style").apply(this.$12,f);e&&this.$1&&this.$1.inform("changedposition")};c.$17=function(){this.$16("fixed",this.$14,this.$11?this.$11.x:null)};c.$18=function(){this.$16("fixed",this.$8,this.$11?this.$11.x:null)};c.$19=function(){this.$16("absolute",this.$5,null)};c.unfixAndScrollBy=function(a){this.$5=Math.max(0,this.$5-a),this.$19()};c.translateY=function(a){var c=b("getElementPosition")(this.$12).y,d=b("getElementPosition")(this.$9).y;c=c-d;this.$5=a+c;this.$19()};c.__updateWithCache=function(){var a=Math.round(this.$6.height);a!==this.$10&&(b("Style").set(this.$9,"height",a+"px"),this.$10=a,this.$1&&this.$1.inform("changedheight"));if(this.$7)return;if(this.$13+this.$14<0||b("UITinyViewportAction").isTiny()){this.$5=0;this.$19();b("Arbiter").inform("reflow");return}this.$15===i&&this.$13+this.$8>=this.$5?this.$18():this.$15===h&&this.$13+this.$14<=this.$5?this.$17():this.$19();b("Arbiter").inform("reflow")};c.update=function(){var a=this;b("queryThenMutateDOM")(function(){a.__queryDOM()},function(){a.__updateWithCache()})};c.setOffset=function(a){return this.setOffsetAndTop(a,this.$14)};c.setOffsetAndTop=function(a,c){var d=this;b("queryThenMutateDOM")(function(){d.__queryDOM(),d.$8=Math.round(a),d.$14=c},function(){d.__updateWithCache()});return this};c.setTop=function(a){return this.setOffsetAndTop(this.$8,a)};c.getPlaceholder=function(){return this.$9};c.getRoot=function(){return this.$12};return a}();e.exports=a}),null);
__d("ContextualLayerAutoFlip",["ContextualLayerAlignmentEnum","ContextualLayerDimensions","DOMDimensions","Rect","Vector","getDocumentScrollElement"],(function(a,b,c,d,e,f){"use strict";function g(a,c){c=new(b("Rect"))(c).convertTo(a.domain);var d=Math.max(a.l,c.l);a=Math.min(a.r,c.r);return Math.max(a-d,0)}a=function(){function a(a){this._layer=a}var c=a.prototype;c.enable=function(){this._subscription=this._layer.subscribe("adjust",this._adjustOrientation.bind(this)),this._layer.isShown()&&this._layer.updatePosition()};c.disable=function(){this._subscription&&(this._subscription.unsubscribe(),this._subscription=null),this._layer.isShown()&&this._layer.updatePosition()};c._adjustOrientation=function(a,c){a=this.getValidPositions(c);if(!a.length){c.invalidate();return}var d=b("ContextualLayerDimensions").getViewportRect(this._layer),e=this._getValidAlignments(c),f,h,i;for(f=0;f<e.length;f++){c.setAlignment(e[f]);for(h=0;h<a.length;h++){c.setPosition(a[h]);i=b("ContextualLayerDimensions").getLayerRect(this._layer,c);if(d.contains(i))return}}var j=-1;if(c.getPreferMoreContentShownRect()){var k=b("DOMDimensions").getDocumentDimensions(),l=new(b("Rect"))(d).convertTo("document"),m=99999;for(h=0;h<a.length;h++){c.setPosition(a[h]);i=b("ContextualLayerDimensions").getLayerRect(this._layer,c);var n=new(b("Rect"))(i).convertTo("document");if(n.l>=0&&n.r<=k.width&&n.t>=43&&n.b<=k.height){var o=l.l-n.l,p=n.r-l.r,q=l.t-n.t;n=n.b-l.b;o=(o>0?o:0)+(p>0?p:0)+(q>0?q:0)+(n>0?n:0);o<m&&(j=h,m=o)}}}this.__setBestPosition(j,c,a);p=0;q=0;for(f=0;f<e.length;f++)c.setAlignment(e[f]),i=b("ContextualLayerDimensions").getLayerRect(this._layer,c),n=g(d,i),n>q&&(q=n,p=f);c.setAlignment(e[p])};c.__setBestPosition=function(a,b,c){a>=0?b.setPosition(c[a]):b.setPosition(c.includes("below")?"below":c[0])};c.getValidPositions=function(a){var c=[a.getPosition(),a.getOppositePosition()],d=this._layer.getContextScrollParent();if(d===window||d===b("getDocumentScrollElement")())return c;var e=this._layer.getContext(),f=b("Vector").getElementPosition(d,"viewport").y,g=b("Vector").getElementPosition(e,"viewport").y;if(a.isVertical())return c.filter(function(a){if(a==="above")return g>=f;else{a=f+d.offsetHeight;var b=g+e.offsetHeight;return b<=a}});else{a=f+d.offsetHeight;if(g>=f&&g+e.offsetHeight<=a)return c;else return[]}};c._getValidAlignments=function(a){var c=Array.from(b("ContextualLayerAlignmentEnum").values);a=a.getAlignment();var d=c.indexOf(a);d>0&&(c.splice(d,1),c.unshift(a));return c};return a}();Object.assign(a.prototype,{_subscription:null});e.exports=a}),null);
__d("LayerRemoveOnHide",["DOM"],(function(a,b,c,d,e,f){a=function(){"use strict";function a(a){this._layer=a}var c=a.prototype;c.enable=function(){this._subscription=this._layer.subscribe("hide",b("DOM").remove.bind(null,this._layer.getRoot()))};c.disable=function(){this._subscription&&(this._subscription.unsubscribe(),this._subscription=null)};return a}();Object.assign(a.prototype,{_subscription:null});e.exports=a}),null);
__d("ContextualDialogXUITheme",["cx"],(function(a,b,c,d,e,f,g){a={wrapperClassName:"_53ii",arrowDimensions:{offset:12,length:16}};e.exports=a}),null);