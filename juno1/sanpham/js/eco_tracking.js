"undefined"==typeof eco_cps&&(eco_cps={get_query:function(e){if(""==e)return{};for(var c={},o=0;o<e.length;++o){var t=e[o].split("=",2);1==t.length?c[t[0]]="":c[t[0]]=decodeURIComponent(t[1].replace(/\+/g," "))}return c}(window.location.search.substr(1).split("&")),save_traffic_id:function(){for(var e=["utm_source","aff_source"],c=null,o=0;o<e.length;o++)null!=c&&0!=c.trim().length||(c=eco_cps.get_query[e[o]]);c&&(c=c.toLowerCase()),null!=c&&"ecomobi"==c?(eco_cps.save_cookie("utm_source",c),eco_cps.save_cookie("traffic_id",eco_cps.get_query.traffic_id),eco_cps.save_cookie("click_time",Date.now()),eco_cps.save_cookie("click_link",window.location.href)):null!=c&&"ecomobi"!=c&&eco_cps.delete_traffic_id()},get_traffic_id:function(){return eco_cps.get_cookie("traffic_id")},get_utm_source:function(){return eco_cps.get_cookie("utm_source")},delete_traffic_id:function(){eco_cps.delete_cookie("utm_source"),eco_cps.delete_cookie("traffic_id"),eco_cps.delete_cookie("click_time"),eco_cps.delete_cookie("click_link")},delete_cookie:function(e){e="eco_"+e;var c=new Date;c.setTime(c.getTime()-2592e6);var o="expires="+c.toUTCString();document.cookie=e+"=;"+o+";path=/"},save_cookie:function(e,c){e="eco_"+e;var o=new Date;o.setTime(o.getTime()+2592e6);var t="expires="+o.toUTCString();document.cookie=e+"="+c+";"+t+";path=/"},get_cookie:function(e){for(var c=(e="eco_"+e)+"=",o=decodeURIComponent(document.cookie).split(";"),t=0;t<o.length;t++){for(var i=o[t];" "==i.charAt(0);)i=i.substring(1);if(0==i.indexOf(c))return i.substring(c.length,i.length)}return""}}),eco_cps.save_traffic_id();