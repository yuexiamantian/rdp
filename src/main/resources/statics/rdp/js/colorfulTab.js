!function(c){c.fn.colorfulTab=function(a){var l=c(this),s=c.extend({theme:"",backgroundImage:!1,overlayColor:"#000",overlayOpacity:".6"},a);return c(".hidebtn").bind("click",function(){c(".ui-layout-south").css("overflow","hidden"),c(this).hasClass("off")?(c(this).removeClass("off"),c(".ui-layout-south").animate({height:"298"}),c("#rdes").animate({bottom:40,height:"-=260px"})):(c(this).addClass("off"),c(".ui-layout-south").animate({height:40}),c("#rdes").animate({bottom:0,height:"+=260px"}))}),this.each(function(){l.addClass(s.theme);var a,t=l.find(".colorful-tab-menu-item.active"),r=l.find(".colorful-tab-menu-item"),i=l.find(".colorful-tab-content"),e=l.find(".colorful-tab-menu-item a");function n(a,t){for(var e=(e=a.replace("#","")).match(new RegExp("(.{"+e.length/3+"})","g")),o=0;o<e.length;o++)e[o]=parseInt(1==e[o].length?e[o]+e[o]:e[o],16);return void 0!==t&&e.push(t),""+e.join(",")}1==!s.backgroundImage?(a=t.attr("tab-color"),l.css("background",a)):(l.addClass("colorful-tab-background-image"),t=t.attr("tab-background"),l.css("background","linear-gradient( rgba("+n(s.overlayColor,s.overlayOpacity)+"), rgba("+n(s.overlayColor,s.overlayOpacity)+") ),url("+t+")")),c(e).click(function(a){var t=c(this).attr("href"),e=c(this).text(),o=c(this).parent();o.hasClass("active")||(r.removeClass("active"),o.addClass("active"),i.removeClass("active"),c(t).addClass("active"),l.attr("active-tab",e),l.addClass("active"),1==!s.backgroundImage?(e=o.attr("tab-color"),l.css("background",e)):(o=o.attr("tab-background"),l.css("background","linear-gradient( rgba("+n(s.overlayColor,s.overlayOpacity)+"), rgba("+n(s.overlayColor,s.overlayOpacity)+") ),url("+o+")")),setTimeout(function(){l.removeClass("active")},800)),c(".hidebtn").hasClass("off")&&(c(".hidebtn").removeClass("off"),c(".rt-config").animate({bottom:18}),c("#rdes").animate({bottom:0,height:"+=40px"})),a.preventDefault()})})}}(jQuery);