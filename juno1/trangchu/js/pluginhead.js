/* 360do */
!function(e,t){"object"==typeof exports&&"undefined"!=typeof module?t(exports):"function"==typeof define&&define.amd?define(["exports"],t):t(e.SpriteSpin={})}(this,function(e){"use strict";var t=function(){return function(e){this.data=e}}();function n(e){var n=t.prototype;for(var a in e)if(e.hasOwnProperty(a)){if(n[a])throw new Error("API method is already defined: "+a);n[a]=e[a]}return n}var a,r,i,o=window.jQuery||window.$;function s(e){var t=e.touches,n=e;return void 0===e.touches&&void 0!==e.originalEvent&&(t=e.originalEvent.touches),void 0!==t&&t.length>0&&(n=t[0]),{x:n.clientX||0,y:n.clientY||0}}function u(e,t,n){if(!(r||(a||(a=document.createElement("canvas")),a&&a.getContext&&(r=a.getContext("2d")))))return!1;if(t*n<=1048576)return!1;a.width=a.height=1,r.fillStyle="#FF00FF",r.fillRect(0,0,1,1),r.drawImage(e,1-t,0);try{var i=r.getImageData(0,0,1,1).data;return 255===i[0]&&0===i[1]&&255===i[2]}catch(e){return!1}}function l(e){var t=Math.floor(e.width||e.frameWidth||e.target.innerWidth()),n=Math.floor(e.height||e.frameHeight||e.target.innerHeight());return{aspect:t/n,height:n,width:t}}function c(e){var t=l(e);if("function"!=typeof window.getComputedStyle)return t;var n=window.getComputedStyle(e.target[0]);return n.width?(t.width=Math.floor(Number(n.width.replace("px",""))),t.height=Math.floor(t.width/t.aspect),t):t}function d(e){var t=Math.floor(e.frameWidth||e.width||e.target.innerWidth()),n=Math.floor(e.frameHeight||e.height||e.target.innerHeight());return{aspect:t/n,height:n,width:t}}function f(e,t,n){var a="fit"===e,r="fill"===e,i={width:"100%",height:"100%",top:0,left:0,bottom:0,right:0,position:"absolute",overflow:"hidden"};if(!e||"stretch"===e)return i;var o=t.aspect>=n.aspect,s=t.width,u=t.height;return(a&&o||r&&!o)&&(s=n.width,u=n.width/t.aspect),(r&&o||a&&!o)&&(u=n.height,s=n.height*t.aspect),s=Math.floor(s),u=Math.floor(u),i.width=s,i.height=u,i.top=Math.floor((n.height-u)/2),i.left=Math.floor((n.width-s)/2),i.right=i.left,i.bottom=i.top,i}function m(e){return e.naturalWidth?{height:e.naturalHeight,width:e.naturalWidth}:((i=i||new Image).src=e.src,{height:i.height,width:i.width})}function h(e,t){return 1===e.length?[g(e[0],t)]:function(e,t){for(var n=[],a=0;a<e.length;a++){var r=g(e[a],{frames:1,framesX:1,detectSubsampling:t.detectSubsampling});r.id=a,n.push(r)}return n}(e,t)}function g(e,t){var n={id:0,sprites:[]};!function(e,t,n){var a=m(e);n.isSubsampled=t.detectSubsampling&&u(e,a.width,a.height),n.width=a.width,n.height=a.height,n.sampledWidth=a.width/(n.isSubsampled?2:1),n.sampledHeight=a.height/(n.isSubsampled?2:1)}(e,t,n);for(var a=t.frames,r=Number(t.framesX)||a,i=Math.ceil(a/r),o=Math.floor(n.width/r),s=Math.floor(n.height/i),l=n.isSubsampled?2:1,c=0;c<a;c++){var d=c%r*o,f=Math.floor(c/r)*s;n.sprites.push({id:c,x:d,y:f,width:o,height:s,sampledX:d/l,sampledY:f/l,sampledWidth:o/l,sampledHeight:s/l})}return n}function p(e,t,n,a){for(var r=a*t+n,i=0,o=null,s=null;s=e[i];){if(!(r>=s.sprites.length)){o=s.sprites[r];break}r-=s.sprites.length,i++}return{sprite:o,sheet:s}}function v(e,t){for(var n=0;n<t.length;n++)if(t[n]===e)return n}function w(){}function b(e){var t,n=e.source;t="string"==typeof n?[n]:n;for(var a=[],r=e.preloadCount||t.length,i=e.initiated||w,o=e.progress||w,s=e.complete||w,u=0,l=!1,c=!1,d=function(){u+=1,o({index:v(this,a),loaded:u,total:t.length,percent:Math.round(u/t.length*100)}),(c=c||this===a[0])&&!l&&u>=r&&(l=!0,s(a))},f=0,m=t;f<m.length;f++){var h=m[f],g=new Image;a.push(g),g.onload=g.onabort=g.onerror=d,g.src=h}i(a)}function x(e,t,n){for(e=String(e);e.length<t;)e=String(n)+e;return e}function y(e,t){var n,a,r,i=0,o=0,s=0,u=0,l=t.digits||2;t.frame&&(i=t.frame[0],o=t.frame[1]),t.lane&&(s=t.lane[0],u=t.lane[1]);var c=[];for(n=s;n<=u;n+=1)for(a=i;a<=o;a+=1)r=(r=e.replace("{lane}",x(n,l,0))).replace("{frame}",x(a,l,0)),c.push(r);return c}var k="spritespin",M=["mousedown","mousemove","mouseup","mouseenter","mouseover","mouseleave","dblclick","mousewheel","touchstart","touchmove","touchend","touchcancel","selectstart","gesturestart","gesturechange","gestureend"],X=["onInit","onProgress","onLoad","onFrameChanged","onFrame","onDraw","onComplete","onDestroy"],F=["dragstart"],S={source:void 0,width:void 0,height:void 0,frames:void 0,framesX:void 0,lanes:1,sizeMode:void 0,renderer:"canvas",lane:0,frame:0,frameTime:40,animate:!0,retainAnimate:!1,reverse:!1,loop:!0,stopFrame:0,wrap:!0,wrapLane:!1,sense:1,senseLane:void 0,orientation:"horizontal",detectSubsampling:!0,preloadCount:void 0,responsive:void 0,plugins:["360","drag"]};function T(){}function z(e){return console&&console[e]?function(){for(var e=[],t=0;t<arguments.length;t++)e[t]=arguments[t];return console.log.apply(console,e)}:T}var Y=z("log"),C=z("warn"),R=z("error");function E(e){return Array.isArray(e)?e:[e]}function P(e,t,n){return e>n?n:e<t?t:e}function A(e,t,n,a){for(;e>n;)e-=a;for(;e<t;)e+=a;return e}function W(e){return e.preventDefault(),!1}function D(e,t,n){n&&e.bind(t+"."+k,function(t){n.apply(e,[t,e.spritespin("data")])})}function H(e){e.unbind("."+k)}function I(e){return(window.devicePixelRatio||1)/(e.webkitBackingStorePixelRatio||e.mozBackingStorePixelRatio||e.msBackingStorePixelRatio||e.oBackingStorePixelRatio||e.backingStorePixelRatio||1)}var L=Object.freeze({$:o,getCursorPosition:s,detectSubsampling:u,getOuterSize:l,getComputedSize:c,getInnerSize:d,getInnerLayout:f,measure:h,findSpecs:p,naturalSize:m,preload:b,sourceArray:y,noop:T,log:Y,warn:C,error:R,toArray:E,clamp:P,wrap:A,prevent:W,bind:D,unbind:H,isFunction:function(e){return"function"==typeof e},pixelRatio:I});function O(e){e.target.attr("unselectable","on").css({width:"",height:"","-ms-user-select":"none","-moz-user-select":"none","-khtml-user-select":"none","-webkit-user-select":"none","user-select":"none"});var t=e.responsive?c(e):l(e),n=f(e.sizeMode,d(e),t);e.target.css({width:t.width,height:t.height,position:"relative",overflow:"hidden"}),e.stage.css(n).hide(),e.canvas&&(e.canvas.css(n).hide(),e.canvasRatio=e.canvasRatio||I(e.context),"number"==typeof n.width&&"number"==typeof n.height?(e.canvas[0].width=n.width*e.canvasRatio||t.width,e.canvas[0].height=n.height*e.canvasRatio||t.height):(e.canvas[0].width=t.width*e.canvasRatio,e.canvas[0].height=t.height*e.canvasRatio),e.context.scale(e.canvasRatio,e.canvasRatio))}function q(e,t){return e.state=e.state||{},e.state[t]=e.state[t]||{},e.state[t]}function B(e,t){var n=q(e,"plugin");return n[t]=n[t]||{},n[t]}function N(e,t){return!!q(e,"flags")[t]}function j(e,t,n){q(e,"flags")[t]=!!n}function U(e){return q(e,"playback")}function _(e){U(e).handler&&(Q(e),function(e){e.frame+=e.reverse?-1:1,e.frame=A(e.frame,0,e.frames-1,e.frames),e.loop||e.frame!==e.stopFrame||J(e)}(e),Z(e))}function Q(e){var t=U(e);t.lastFrame=e.frame,t.lastLane=e.lane}function Z(e){var t=U(e);t.lastFrame===e.frame&&t.lastLane===e.lane||e.target.trigger("onFrameChanged",e),e.target.trigger("onFrame",e),e.target.trigger("onDraw",e)}function G(e,t,n){Q(e),null!=t&&function(e,t){e.frame=Number(t),e.frame=e.wrap?A(e.frame,0,e.frames-1,e.frames):P(e.frame,0,e.frames-1)}(e,t),null!=n&&function(e,t){e.lane=e.wrapLane?A(t,0,e.lanes-1,e.lanes):P(t,0,e.lanes-1)}(e,n),Z(e)}function J(e){e.animate=!1;var t=U(e);null!=t.handler&&(window.clearInterval(t.handler),t.handler=null)}function K(e){var t=U(e);!t.handler||e.animate&&t.frameTime===e.frameTime||J(e),e.animate&&!t.handler&&(t.frameTime=e.frameTime,t.handler=window.setInterval(function(){return _(e)},t.frameTime))}function V(e){e.animate=!0,K(e)}var ee={};function te(e,t){if(!ee[e])return t=t||{},ee[e]=t,t;R('Plugin name "'+e+'" is already taken')}function ne(e){return ee[e]}function ae(e){!function(e){e.mods&&(C('"mods" option is deprecated, use "plugins" instead'),e.plugins=e.mods,delete e.mods);e.behavior&&(C('"behavior" option is deprecated, use "plugins" instead'),e.plugins.push(e.behavior),delete e.behavior);e.module&&(C('"module" option is deprecated, use "plugins" instead'),e.plugins.push(e.module),delete e.module)}(e);for(var t=0;t<e.plugins.length;t+=1){var n=e.plugins[t];if("string"==typeof n){var a=ne(n);a?e.plugins[t]=a:R("No plugin found with name "+n)}}}var re=o,ie=0,oe={};function se(e){for(var t in oe)oe.hasOwnProperty(t)&&e(oe[t])}var ue=function(){function e(){se(function(e){e.responsive&&ce(e)})}ue=function(){};for(var t=function(e){re(window.document).bind(e+"."+k,function(t){!function(e,t){se(function(n){for(var a=0,r=n.plugins;a<r.length;a++){var i=r[a];"function"==typeof i[e]&&i[e].apply(n.target,[t,n])}})}("document"+e,t)})},n=0,a=M;n<a.length;n++){t(a[n])}var r=null;re(window).on("resize",function(){window.clearTimeout(r),r=window.setTimeout(e,100)})};function le(e){var t=e.target;H(t);for(var n=0,a=F;n<a.length;n++){D(t,m=a[n],W)}for(var r=0,i=e.plugins;r<i.length;r++){for(var o=i[r],s=0,u=M;s<u.length;s++){D(t,m=u[s],o[m])}for(var l=0,c=X;l<c.length;l++){D(t,m=c[l],o[m])}}D(t,"onLoad",function(e,t){K(t)});for(var d=0,f=X;d<f.length;d++){var m;D(t,m=f[d],e[m])}}function ce(e){ae(e),le(e),O(e),e.source=E(e.source),e.loading=!0,e.target.addClass("loading").trigger("onInit",e),b({source:e.source,preloadCount:e.preloadCount,progress:function(t){e.progress=t,e.target.trigger("onProgress",e)},complete:function(t){e.images=t,e.loading=!1,e.frames=e.frames||t.length,function(e){e.images||(e.metrics=[]),e.metrics=h(e.images,e);var t=p(e.metrics,e.frames,0,0);t.sprite&&(e.frameWidth=t.sprite.width,e.frameHeight=t.sprite.height)}(e),O(e),e.stage.show(),e.target.removeClass("loading").trigger("onLoad",e).trigger("onFrame",e).trigger("onDraw",e).trigger("onComplete",e)}})}function de(e){var t=this,n=e.target,a=re.extend({},S,e);if(a.source=a.source||[],a.plugins=a.plugins||[],n.find("img").each(function(){Array.isArray(a.source)||(a.source=[]),a.source.push(re(t).attr("src"))}),n.empty().addClass("spritespin-instance").append("<div class='spritespin-stage'></div>"),"canvas"===a.renderer){var r=document.createElement("canvas");r.getContext&&r.getContext("2d")?(a.canvas=re(r).addClass("spritespin-canvas"),a.context=r.getContext("2d"),n.append(a.canvas),n.addClass("with-canvas")):a.renderer="image"}return a.target=n,a.stage=n.find(".spritespin-stage"),n.data(k,a),function(e){ie+=1,e.id=String(ie),oe[e.id]=e}(a),a}function fe(e){ue();var t=e.target.data(k);t?re.extend(t,e):t=de(e),ce(t)}function me(e){!function(e){delete oe[e.id]}(e),J(e),e.target.trigger("onDestroy",e),H(e.target),e.target.removeData(k)}function he(e){return q(e,"input")}function ge(e,t){var n=s(e),a=he(t);a.oldX=a.currentX,a.oldY=a.currentY,a.currentX=n.x,a.currentY=n.y,void 0!==a.oldX&&void 0!==a.oldY||(a.oldX=a.currentX,a.oldY=a.currentY),void 0!==a.startX&&void 0!==a.startY||(a.startX=a.currentX,a.startY=a.currentY,a.clickframe=t.frame,a.clicklane=t.lane),a.dX=a.currentX-a.startX,a.dY=a.currentY-a.startY,a.ddX=a.currentX-a.oldX,a.ddY=a.currentY-a.oldY,a.ndX=a.dX/t.target.innerWidth(),a.ndY=a.dY/t.target.innerHeight(),a.nddX=a.ddX/t.target.innerWidth(),a.nddY=a.ddY/t.target.innerHeight()}function pe(e){var t=he(e);t.startX=t.startY=void 0,t.currentX=t.currentY=void 0,t.oldX=t.oldY=void 0,t.dX=t.dY=0,t.ddX=t.ddY=0,t.ndX=t.ndY=0,t.nddX=t.nddY=0}function ve(e,t){for(var n=0,a=t;n<a.length;n++){var r=a[n];if(e[r]||r in e)return r}return t[0]}o.fn[k]=function(e,n){var a=this;if("data"===e)return this.data(k);if("api"===e){var r=this.data(k);return r.api=r.api||new t(r),r.api}if("destroy"===e)return o(this).each(function(){var e=o(a).data(k);e&&me(e)});if(2===arguments.length&&"string"==typeof e){var i={};i[e]=n,e=i}if("object"==typeof e)return e.target=e.target||o(this),fe(e),e.target;throw new Error("Invalid call to spritespin")},n({isPlaying:function(){return null!=U(this.data).handler},isLooping:function(){return this.data.loop},toggleAnimation:function(){this.isPlaying()?this.stopAnimation():this.startAnimation()},stopAnimation:function(){this.data.animate=!1,J(this.data)},startAnimation:function(){this.data.animate=!0,K(this.data)},loop:function(e){return this.data.loop=e,K(this.data),this},currentFrame:function(){return this.data.frame},updateFrame:function(e){return G(this.data,e),this},skipFrames:function(e){var t=this.data;return G(t,t.frame+(t.reverse?-e:+e)),this},nextFrame:function(){return this.skipFrames(1)},prevFrame:function(){return this.skipFrames(-1)},playTo:function(e,t){var n=this.data;if((t=t||{}).force||n.frame!==e){if(t.nearest){var a=e-n.frame,r=e>n.frame?a-n.frames:a+n.frames,i=Math.abs(a)<Math.abs(r)?a:r;n.reverse=i<0}return n.animate=!0,n.loop=!1,n.stopFrame=e,K(n),this}}});var we={requestFullscreen:ve(document.documentElement,["requestFullscreen","webkitRequestFullScreen","mozRequestFullScreen","msRequestFullscreen"]),exitFullscreen:ve(document,["exitFullscreen","webkitExitFullscreen","webkitCancelFullScreen","mozCancelFullScreen","msExitFullscreen"]),fullscreenElement:ve(document,["fullscreenElement","webkitFullscreenElement","webkitCurrentFullScreenElement","mozFullScreenElement","msFullscreenElement"]),fullscreenEnabled:ve(document,["fullscreenEnabled","webkitFullscreenEnabled","mozFullScreenEnabled","msFullscreenEnabled"]),fullscreenchange:ve(document,["onfullscreenchange","onwebkitfullscreenchange","onmozfullscreenchange","onMSFullscreenChange"]).replace(/^on/,""),fullscreenerror:ve(document,["onfullscreenerror","onwebkitfullscreenerror","onmozfullscreenerror","onMSFullscreenError"]).replace(/^on/,"")},be=we.fullscreenchange+"."+k+"-fullscreen";function xe(){o(document).unbind(be)}var ye="orientationchange."+k+"-fullscreen";function ke(){o(window).unbind(ye)}function Me(){return document[we.fullscreenElement]}function Xe(){return!!Me()}function Fe(e,t){t=t||{};var n,a=e.width,r=e.height,i=e.source,s=e.sizeMode,u=e.responsive,l=function(){e.width=window.screen.width,e.height=window.screen.height,e.source=t.source||i,e.sizeMode=t.sizeMode||"fit",e.responsive=!1,ce(e)};n=function(){var t;Xe()?(l(),t=l,ke(),o(window).bind(ye,t)):(xe(),ke(),e.width=a,e.height=r,e.source=i,e.sizeMode=s,e.responsive=u,ce(e))},xe(),o(document).bind(be,n),(e.target[0]||document.documentElement)[we.requestFullscreen]()}n({fullscreenEnabled:function(){return document[we.fullscreenEnabled]},fullscreenElement:Me,exitFullscreen:function(){return document[we.exitFullscreen]()},toggleFullscreen:function(e){!function(e,t){Xe()?this.apiRequestFullscreen(t):this.exitFullscreen()}(this.data,e)},requestFullscreen:function(e){Fe(this.data,e)}}),function(){function e(e,t){if(!t.loading&&t.stage.is(":visible")){ge(e,t);var n,a,r=he(t),i=t.target,o=i.offset();"horizontal"===t.orientation?(n=i.innerWidth()/2,a=r.currentX-o.left):(n=i.innerHeight()/2,a=r.currentY-o.top),G(t,t.frame+(a>n?1:-1))}}te("click",{name:"click",mouseup:e,touchend:e})}(),function(){var e="drag";function t(t){return B(t,e)}function n(e,n){var a=t(n);if(!n.loading&&!N(n,"dragging")&&n.stage.is(":visible")){var r=(new Date).getTime();a.startAt&&r-a.startAt>200&&e.preventDefault(),a.startAt=r,a.wasPlaying=!!U(n).handler,a.frame=n.frame||0,a.lane=n.lane||0,j(n,"dragging",!0),ge(e,n)}}function a(e,n){N(n,"dragging")&&(j(n,"dragging",!1),pe(n),n.retainAnimate&&t(n).wasPlaying&&V(n))}function r(e,n){var a=t(n),r=he(n);if(N(n,"dragging")){ge(e,n);var i=function(e){return"number"==typeof e.orientation?e.orientation*Math.PI/180:"horizontal"===e.orientation?0:Math.PI/2}(n),o=Math.sin(i),s=Math.cos(i),u=(r.nddX*s-r.nddY*o)*n.sense||0,l=(r.nddX*o+r.nddY*s)*(n.senseLane||n.sense)||0;a.frame+=n.frames*u,a.lane+=n.lanes*l;n.frame,n.lane;G(n,Math.floor(a.frame),Math.floor(a.lane)),J(n)}}te("drag",{name:"drag",mousedown:n,mousemove:r,mouseup:a,documentmousemove:r,documentmouseup:a,touchstart:n,touchmove:r,touchend:a,touchcancel:a}),te("move",{name:"move",mousemove:function(e,t){n(e,t),r(e,t)},mouseleave:a,touchstart:n,touchmove:r,touchend:a,touchcancel:a})}(),function(){var e="hold";function t(t){return B(t,e)}function n(e,n){N(n,"loading")||N(n,"dragging")||!n.stage.is(":visible")||(!function(e){var n=t(e);n.frameTime=e.frameTime,n.animate=e.animate,n.reverse=e.reverse}(n),ge(e,n),j(n,"dragging",!0),n.animate=!0,K(n))}function a(e,n){j(n,"dragging",!1),pe(n),J(n),function(e){var n=t(e);e.frameTime=n.frameTime,e.animate=n.animate,e.reverse=n.reverse}(n),K(n)}function r(e,t){if(N(t,"dragging")){ge(e,t);var n,a,r=he(t),i=t.target,o=i.offset();"horizontal"===t.orientation?(n=i.innerWidth()/2,a=(r.currentX-o.left-n)/n):(n=t.height/2,a=(r.currentY-o.top-n)/n),t.reverse=a<0,a=a<0?-a:a,t.frameTime=80*(1-a)+20,("horizontal"===t.orientation&&r.dX<r.dY||"vertical"===t.orientation&&r.dX<r.dY)&&e.preventDefault()}}te(e,{name:e,mousedown:n,mousemove:r,mouseup:a,mouseleave:a,touchstart:n,touchmove:r,touchend:a,touchcancel:a,onFrame:function(e,t){t.animate=!0,K(t)}})}(),function(){var e="swipe";function t(t){return B(t,e)}function n(e,t,n){return e[t]||n}function a(e,t){t.loading||N(t,"dragging")||(ge(e,t),j(t,"dragging",!0))}function r(e,t){N(t,"dragging")&&(ge(e,t),G(t,t.frame,t.lane))}function i(e,n){if(N(n,"dragging")){j(n,"dragging",!1);var a,r,i=t(n),o=he(n),s=n.frame,u=n.lane,l=i.snap,c=i.fling;"horizontal"===n.orientation?(a=o.ndX,r=o.ddX):(a=o.ndY,r=o.ddY),a>=l||r>=c?s=n.frame-1:(a<=-l||r<=-c)&&(s=n.frame+1),pe(n),G(n,s,u),J(n)}}te(e,{name:e,onLoad:function(e,a){var r=t(a);r.fling=n(a,"swipeFling",10),r.snap=n(a,"swipeSnap",.5)},mousedown:a,mousemove:r,mouseup:i,mouseleave:i,touchstart:a,touchmove:r,touchend:i,touchcancel:i})}(),function(){te("360",{name:"360",onLoad:function(e,t){t.stage.find(".spritespin-frames").detach(),"image"===t.renderer&&$(t.images).addClass("spritespin-frames").appendTo(t.stage)},onDraw:function(e,t){var n=p(t.metrics,t.frames,t.frame,t.lane),a=n.sheet,r=n.sprite;if(a&&r){var i=t.source[a.id],o=t.images[a.id];if("canvas"===t.renderer){t.canvas.show();var s=t.canvas[0].width/t.canvasRatio,u=t.canvas[0].height/t.canvasRatio;return t.context.clearRect(0,0,s,u),void t.context.drawImage(o,r.sampledX,r.sampledY,r.sampledWidth,r.sampledHeight,0,0,s,u)}var l=r.sampledWidth/t.stage.innerWidth(),c=r.sampledHeight/t.stage.innerHeight(),d=Math.floor(-r.sampledX*c),f=Math.floor(-r.sampledY*l),m=Math.floor(a.sampledWidth*l),h=Math.floor(a.sampledHeight*c);"background"!==t.renderer?($(t.images).hide(),$(o).show().css({position:"absolute",top:d,left:f,"max-width":"initial",width:m,height:h})):t.stage.css({"background-image":"url('"+i+"')","background-position":f+"px "+d+"px","background-repeat":"no-repeat","-webkit-background-size":m+"px "+h+"px","-moz-background-size":m+"px "+h+"px","-o-background-size":m+"px "+h+"px","background-size":m+"px "+h+"px"})}}})}(),function(){var e="blur";function t(t){return B(t,e)}function n(e,t,n){return e[t]||n}var a=[];function r(e){var n=t(e);n.timeout=window.setTimeout(function(){!function(e){var n=t(e);if(function(e){var n=t(e);window.clearTimeout(n.timeout),n.timeout=null}(e),!n.context)return;var o=0;n.context.clearRect(0,0,e.width,e.height);for(var s=0,u=n.steps;s<u.length;s++){var l=u[s];l.live=Math.max(l.live-l.step,0),l.alpha=Math.max(l.live-.25,0),i(e,n,l),o+=l.alpha+l.d}n.cssBlur&&function(e,t){var n="blur("+Math.min(Math.max(t/2-4,0),1.5)+"px)";e.css({"-webkit-filter":n,filter:n})}(n.canvas,o);(function(e){a.length=0;for(var t=0;t<e.length;t+=1)e[t].alpha<=0&&a.push(t);for(var n=0,r=a;n<r.length;n++){var i=r[n];e.splice(i,1)}})(n.steps),n.steps.length&&r(e)}(e)},n.frameTime)}function i(e,t,n){if(!(n.alpha<=0)){var a=p(e.metrics,e.frames,e.frame,e.lane),r=a.sheet,i=a.sprite;if(r&&i){e.source[r.id];var o=e.images[r.id];if(!1!==o.complete){t.canvas.show();var s=t.canvas[0].width/e.canvasRatio,u=t.canvas[0].height/e.canvasRatio;t.context.clearRect(0,0,s,u),t.context.drawImage(o,i.sampledX,i.sampledY,i.sampledWidth,i.sampledHeight,0,0,s,u)}}}}te(e,{name:e,onLoad:function(e,a){var r=t(a);r.canvas=r.canvas||o("<canvas class='blur-layer'></canvas>"),r.context=r.context||r.canvas[0].getContext("2d"),r.steps=r.steps||[],r.fadeTime=Math.max(n(a,"blurFadeTime",200),1),r.frameTime=Math.max(n(a,"blurFrameTime",a.frameTime),16),r.trackTime=null,r.cssBlur=!!n(a,"blurCss",a.frameTime);var i=d(a),s=a.responsive?c(a):l(a),u=f(a.sizeMode,i,s);r.canvas[0].width=a.width*a.canvasRatio,r.canvas[0].height=a.height*a.canvasRatio,r.canvas.css(u).show(),r.context.scale(a.canvasRatio,a.canvasRatio),a.target.append(r.canvas)},onFrameChanged:function(e,n){var a=t(n);!function(e){var n=t(e),a=U(e),r=Math.abs(e.frame-a.lastFrame);r=r>=e.frames/2?e.frames-r:r,n.steps.unshift({frame:e.frame,lane:e.lane,live:1,step:n.frameTime/n.fadeTime,d:r,alpha:0})}(n),null==a.timeout&&r(n)}})}(),function(){var e=Math.max,t=Math.min,n="ease";function a(e){return B(e,n)}function r(e,t,n){return e[t]||n}function i(e,t){N(t,"dragging")&&(s(t),function(e){var t=a(e);t.samples.push({time:(new Date).getTime(),frame:e.frame,lane:e.lane});for(;t.samples.length>t.maxSamples;)t.samples.shift()}(t))}function o(e,t){for(var n,r=a(t),i=r.samples,o=0,l=0,c=0,d=0,f=i;d<f.length;d++){var m=f[d];if(n){var h=m.time-n.time;if(h>r.abortTime)return o=l=c=0,s(t);l+=m.frame-n.frame,o+=m.lane-n.lane,c+=h,n=m}else n=m}i.length=0,c&&(r.lane=t.lane,r.lanes=0,r.laneStep=o/c*r.updateTime,r.frame=t.frame,r.frames=0,r.frameStep=l/c*r.updateTime,u(t))}function s(e){var t=a(e);null!=t.handler&&(window.clearTimeout(t.handler),t.handler=null)}function u(e){var t=a(e);t.handler=window.setTimeout(function(){!function(e){var t=a(e);t.lanes+=t.laneStep,t.frames+=t.frameStep,t.laneStep*=t.damping,t.frameStep*=t.damping;var n=Math.floor(t.frame+t.frames),r=Math.floor(t.lane+t.lanes);G(e,n,r),N(e,"dragging")?s(e):Math.abs(t.frameStep)>.005||Math.abs(t.laneStep)>.005?u(e):s(e)}(e)},t.updateTime)}te(n,{name:n,onLoad:function(n,i){var o=a(i);o.maxSamples=e(r(i,"easeMaxSamples",5),0),o.damping=e(t(r(i,"easeDamping",.9),.999),0),o.abortTime=e(r(i,"easeAbortTime",250),16),o.updateTime=e(r(i,"easeUpdateTime",i.frameTime),16),o.samples=[],o.steps=[]},mousemove:i,mouseup:o,mouseleave:o,touchmove:i,touchend:o,touchcancel:o})}(),function(){var e="gallery";function t(t){return B(t,e)}function n(e,t,n){return e[t]||n}te(e,{name:e,onLoad:function(e,a){var r=t(a);r.images=[],r.offsets=[],r.frame=a.frame,r.speed=n(a,"gallerySpeed",500),r.opacity=n(a,"galleryOpacity",.25),r.stage=n(a,"galleryStage",o("<div></div>")),r.stage.empty().addClass("gallery-stage").prependTo(a.stage);for(var i=0,s=0,u=a.images;s<u.length;s++){var h=u[s],g=m(h),p=a.height/g.height,v=o(h);r.stage.append(v),r.images.push(v),r.offsets.push(-i+(a.width-h.width*p)/2),i+=a.width,v.css({"max-width":"initial",opacity:r.opacity,width:a.width,height:a.height})}var w=d(a),b=a.responsive?c(a):l(a),x=f(a.sizeMode,w,b);r.stage.css(x).css({width:i,left:r.offsets[r.frame]}),r.images[r.frame].animate({opacity:1},{duration:r.speed})},onDraw:function(e,n){var a=t(n),r=he(n),i=N(n,"dragging");a.frame===n.frame||i?(i||a.dX!==r.dX)&&(a.dX=r.dX,a.ddX=r.ddX,a.stage.stop(!0,!0).css({left:a.offsets[a.frame]+a.dX})):(a.stage.stop(!0,!1).animate({left:a.offsets[n.frame]},{duration:a.speed}),a.images[a.frame].animate({opacity:a.opacity},{duration:a.speed}),a.frame=n.frame,a.images[a.frame].animate({opacity:1},{duration:a.speed}),a.stage.animate({left:a.offsets[a.frame]}))}})}(),function(){var e="panorama";function t(t){return B(t,e)}te(e,{name:e,onLoad:function(e,n){var a=t(n),r=n.metrics[0];if(r){"horizontal"===n.orientation?(a.scale=n.target.innerHeight()/r.sampledHeight,n.frames=r.sampledWidth):(a.scale=n.target.innerWidth()/r.sampledWidth,n.frames=r.sampledHeight);var i=Math.floor(r.sampledWidth*a.scale),o=Math.floor(r.sampledHeight*a.scale);n.stage.css({"background-image":"url("+n.source[r.id]+")","background-repeat":"repeat-both","-webkit-background-size":i+"px "+o+"px","-moz-background-size":i+"px "+o+"px","-o-background-size":i+"px "+o+"px","background-size":i+"px "+o+"px"})}},onDraw:function(e,n){var a=t(n),r="horizontal"===n.orientation?1:0,i=r?0:1,o=n.frame%n.frames,s=Math.round(r*o*a.scale),u=Math.round(i*o*a.scale);n.stage.css({"background-position":s+"px "+u+"px"})}})}(),function(){var e="zoom";function t(t){return B(t,e)}function a(e,t,n){return e[t]||n}function r(e,n){var a=t(n);if(a.stage.is(":visible")){e.preventDefault(),j(n,"dragging",!1);var r=s(e),i=r.x/n.width,o=r.y/n.height;null==a.oldX&&(a.oldX=i,a.oldY=o),null==a.currentX&&(a.currentX=i,a.currentY=o);var u=i-a.oldX,l=o-a.oldY;a.oldX=i,a.oldY=o,e.type.match(/touch/)&&(u=-u,l=-l),a.currentX=P(a.currentX+u,0,1),a.currentY=P(a.currentY+l,0,1),G(n,n.frame,n.lane)}}function i(e,n){e.preventDefault();var a=t(n),i=(new Date).getTime();a.clickTime?i-a.clickTime>a.doubleClickTime?a.clickTime=i:(a.clickTime=void 0,l(n)&&r(e,n)):a.clickTime=i}function u(e,n){t(n).stage.is(":visible")&&r(e,n)}function l(e){var n=t(e);if(!n.stage)throw new Error("zoom module is not initialized or is not available.");return n.stage.is(":visible")?(n.stage.fadeOut(),e.stage.fadeIn(),!1):(n.stage.fadeIn(),e.stage.fadeOut(),!0)}te(e,{name:e,mousedown:i,touchstart:i,mousemove:u,touchmove:u,onInit:function(e,n){var r=t(n);r.source=a(n,"zoomSource",n.source),r.doubleClickTime=a(n,"zoomDoubleClickTime",500),r.stage=r.stage||o("<div class='zoom-stage'></div>"),r.stage.css({width:"100%",height:"100%",top:0,left:0,bottom:0,right:0,position:"absolute"}).appendTo(n.target).hide()},onDestroy:function(e,n){var a=t(n);a.stage&&(a.stage.remove(),delete a.stage)},onDraw:function(e,n){var a=t(n),r=n.lane*n.frames+n.frame,i=a.source[r],o=p(n.metrics,n.frames,n.frame,n.lane),s=a.currentX,u=a.currentY;if(null==s&&(s=a.currentX=.5,u=a.currentY=.5),i)s=Math.floor(100*s),u=Math.floor(100*u),a.stage.css({"background-repeat":"no-repeat","background-image":"url('"+i+"')","background-position":s+"% "+u+"%"});else if(o.sheet&&o.sprite){var l=o.sprite,c=o.sheet,d=n.source[c.id],f=-Math.floor(l.sampledX+s*(l.sampledWidth-n.width)),m=-Math.floor(l.sampledY+u*(l.sampledHeight-n.height)),h=c.sampledWidth,g=c.sampledHeight;a.stage.css({"background-image":"url('"+d+"')","background-position":f+"px "+m+"px","background-repeat":"no-repeat","-webkit-background-size":h+"px "+g+"px","-moz-background-size":h+"px "+g+"px","-o-background-size":h+"px "+g+"px","background-size":h+"px "+g+"px"})}}}),n({toggleZoom:function(){l(this.data)}})}();var Se=L;e.Utils=Se,e.sourceArray=y,e.Api=t,e.extendApi=n,e.instances=oe,e.applyEvents=le,e.boot=ce,e.create=de,e.createOrUpdate=fe,e.destroy=me,e.namespace=k,e.eventNames=M,e.callbackNames=X,e.eventsToPrevent=F,e.defaults=S,e.getInputState=he,e.updateInput=ge,e.resetInput=pe,e.applyLayout=O,e.getPlaybackState=U,e.updateFrame=G,e.stopAnimation=J,e.applyAnimation=K,e.startAnimation=V,e.registerPlugin=te,e.registerModule=function(e,t){C('"registerModule" is deprecated, use "registerPlugin" instead'),te(e,t)},e.getPlugin=ne,e.applyPlugins=ae,e.getState=q,e.getPluginState=B,e.is=N,e.flag=j,Object.defineProperty(e,"__esModule",{value:!0})});
/* Picbox */
!function(e){function n(n){y.hideFlash&&e.each(["object","embed"],function(t,i){e(i).each(function(){n&&(this._picbox=this.style.visibility),this.style.visibility=n?"hidden":this._picbox})}),O.style.display="";var o=n?"bind":"unbind";e(document)[o]("keydown",t),e(document)[o]("mousewheel",d),e(document)[o]("mousemove",i),e(M)[o]("mouseover",function(){s(1)}),e(M)[o]("mouseout",s)}function t(n){return n=n.keyCode,e.inArray(n,y.closeKeys)>=0?f():e.inArray(n,y.nextKeys)>=0?u():e.inArray(n,y.previousKeys)>=0&&r()}function i(){o([M,F,zoomBtn,K])}function o(n,t){clearTimeout(T),e(n).fadeIn(),n=t?e.merge(n,t):n,T=setTimeout(function(){e(n).fadeOut()},y.controlsFadeDelay)}function s(n){n=1==n?"unbind":"bind",e(document)[n]("mousemove",i),clearTimeout(T)}function r(){return a(b,!0)}function u(){return a(w,!0)}function a(n,t){return n>=0&&(S=n,g=v[n][0],b=(S||(y.loop?v.length:0))-1,w=(S+1)%v.length||(y.loop?0:-1),p(),O.className="pbLoading",e(E).css("display","none"),v[S][1]?e(N).html(v[S][1]).show():e(N).html("").hide(),e(j).html((v.length>1&&y.counterText||"").replace(/{x}/,S+1).replace(/{y}/,v.length)),b>=0&&(Y.src=v[b][0],e(F).removeClass(P)),w>=0&&(_.src=v[w][0],e(K).removeClass(P)),(Q=new Image).onload=function(){!function(n){c();var t=X.width()-y.margins,i=X.height()-y.margins,s=1;Q.width>t||Q.height>i?(s=Math.min(t/Q.width,i/Q.height),e(zoomBtn).removeClass(P),I=!1):(e(zoomBtn).addClass(P),I=!0);D=L=s,l(s,n),e(E).attr("src",g),e(E).css("display",""),O.className="",o([M],[F,zoomBtn,K])}(t)},Q.src=g),!1}function l(n,t){var i=n/D;k=z-(z-k)*i,C=B-(B-C)*i,D=n,i=Q.width*n;var o=Q.height*n,s=k-i/2>>0,r=C-o/2>>0;return t=t?0:y.resizeDuration,n=0==n?function(){e(E).hide()}:function(){},e(E).animate({width:i,height:o,top:r,left:s},{queue:!1,duration:t,easing:y.resizeEasing,complete:n}),!1}function c(){k=z,C=B}function d(n,t){return e(zoomBtn).addClass(H),l(D+t*D/10)}function h(){return D!=L||k!=z||C!=B||I?(e(zoomBtn).removeClass(H),c(),l(L)):(e(zoomBtn).addClass(H),l(1))}function p(){Q.onload=function(){},Q.src=Y.src=_.src=g,e(E).stop(),e([F,K]).addClass(P),e(zoomBtn).removeClass(H)}function f(){return S>=0&&(p(),S=b=w=-1,l(0),n(),e(M).stop().hide(),e(O).stop().fadeOut()),!1}function m(n){var t=[].slice.call(arguments,1),i=0;return(n=e.event.fix(n||window.event)).type="mousewheel",n.wheelDelta&&(i=n.wheelDelta/120),n.detail&&(i=-n.detail/3),t.unshift(n,i),e.event.handle.apply(this,t)}var y,v,g,b,w,x,z,B,k,C,D,L,T,I,O,A,E,F,K,M,N,j,X=e(window),S=-1,q=null==window.XMLHttpRequest&&null!=ActiveXObject,Q={},Y=new Image,_=new Image,H="pbzoomed",P="pbgreyed";e(document).ready(function(){e(document.body).append(e([O=e('<div id="pbOverlay" />').click(f).append(A=e('<div id="pbCloseBtn" />')[0])[0],E=e('<img id="pbImage" />').dblclick(h)[0],M=e('<div id="pbBottom" />').append([N=e('<div id="pbCaption" />')[0],e('<div id="pbNav" />').append([F=e('<a id="pbPrevBtn" href="#" />').click(r)[0],zoomBtn=e('<a id="pbZoomBtn" href="#" />').click(h)[0],K=e('<a id="pbNextBtn" href="#" />').click(u)[0]])[0],j=e('<div id="pbNumber" />')[0]])[0]]).css("display","none")),(x=q||O.currentStyle&&"fixed"!=O.currentStyle.position)&&e([O,A,E,M]).css("position","absolute"),e(E).tinyDrag(function(){var n=e(E),t=n.position();k=t.left-X.scrollLeft()+n.width()/2,C=t.top-X.scrollTop()+n.height()/2,e(zoomBtn).addClass(H)})}),e.picbox=function(t,o,s){return y=e.extend({loop:!1,overlayOpacity:1,overlayFadeDuration:200,resizeDuration:300,resizeEasing:"swing",controlsFadeDelay:3e3,counterText:!1,hideFlash:!0,closeKeys:[27,88,67],previousKeys:[37,80],nextKeys:[39,78],margins:0},s||{}),"string"==typeof t&&(t=[[t,o]],o=0),e(O).css("opacity",0).fadeTo(y.overlayFadeDuration,y.overlayOpacity),e(M).css("display",""),i(),function(){var n={x:X.scrollLeft(),y:X.scrollTop()};z=X.width()/2,B=X.height()/2,x&&(z+=n.x,B+=n.y,e(O).css({left:n.x,top:n.y,width:X.width(),height:X.height()})),e(E).css({top:B,left:z,width:"1px",height:"1px"})}(),n(1),v=t,y.loop=y.loop&&v.length>1,a(o)},e.fn.picbox=function(n,t,i){t=t||function(e){return[e.href,e.title]},i=i||function(){return!0};var o=this;return e(o).unbind("click").click(function(){var s=this,r=[];filteredLinks=e.grep(o,function(e){return i.call(s,e)});for(var u=0;u<filteredLinks.length;u++)r[u]=t(filteredLinks[u]);return e.picbox(r,e.inArray(this,filteredLinks),n)}),o},e.fn.tinyDrag=function(n){return e.tinyDrag(this,n)},e.tinyDrag=function(n,t){function i(e){var t=e.pageX;return e=e.pageY,u?n.css({left:r.x+(t-s.x),top:r.y+(e-s.y)}):(l(t-s.x)>1||l(e-s.y)>1)&&(u=!0),!1}function o(){a.unbind("mousemove",i).unbind("mouseup"),u&&t&&t()}var s,r,u,a=e(document),l=Math.abs;return n.mousedown(function(e){return u=!1,s={x:e.pageX,y:e.pageY},r={x:parseInt(n.css("left")),y:parseInt(n.css("top"))},a.mousemove(i).mouseup(o),!1}),n};var R=["DOMMouseScroll","mousewheel"];e.event.special.mousewheel={setup:function(){if(this.addEventListener)for(var e=R.length;e;)this.addEventListener(R[--e],m,!1);else this.onmousewheel=m},teardown:function(){if(this.removeEventListener)for(var e=R.length;e;)this.removeEventListener(R[--e],m,!1);else this.onmousewheel=null}},e.fn.extend({mousewheel:function(e){return e?this.bind("mousewheel",e):this.trigger("mousewheel")},unmousewheel:function(e){return this.unbind("mousewheel",e)}})}(jQuery),/android|iphone|ipod|series60|symbian|windows ce|blackberry/i.test(navigator.userAgent)||jQuery(function(e){e("a[rel^='lightbox']").picbox({},null,function(e){return this==e||this.rel.length>8&&this.rel==e.rel})});
/* Cookie Created */
var cookieList=getCookie(),hrefParam=document.location.search+document.location.hash,utm_source=hrefParam.match(/utm_source=\w*/i),fbad=hrefParam.match(/fbclid=\w*/i),gglead=hrefParam.match(/gclid=\w*/i),click_id=hrefParam.match(/click_id=\w*/i);null!=cookieList.cityads?null!==utm_source?"cityads"===utm_source[0].split("=")[1]&&createClickIDCookie(click_id=hrefParam.match(/click_id=\w*/i)[0].split("=")[1],30):(null!==utm_source&&"cityads"!==utm_source[0].split("=")[1]||null!==gglead||null!==fbad)&&deleteCookie("cityads"):null!==utm_source&&null!==click_id&&"cityads"===utm_source[0].split("=")[1]&&createClickIDCookie(click_id[0].split("=")[1],30);function createClickIDCookie(e,i){var t=new Date,c="; expires="+t.toGMTString();null!=i&&(t.setTime(t.getTime()+24*i*60*60*1e3),c="; expires="+t.toGMTString()),null!=e&&(document.cookie="cityads="+e+c+";path=/")}function deleteCookie(e){document.cookie=e+"=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;"}function getCookie(){var e=new Object;return document.cookie.split(";").forEach(function(i){var t=i.substr(0,i.indexOf("=")).trim(),c=i.substr(i.indexOf("=")+1);e[t]=c}),e}