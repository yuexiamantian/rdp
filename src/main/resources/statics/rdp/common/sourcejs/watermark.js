(function(watermark,$){
    window.watermarkdivs = [];
    // 加载水印
    var loadMark = function(settings) {
        var defaultSettings={
            watermark_txt:"TEST...",
            watermark_x:20,//水印起始位置x轴坐标
            watermark_y:20,//水印起始位置Y轴坐标
            watermark_rows:0,//水印行数
            watermark_cols:0,//水印列数
            watermark_x_space:100,//水印x轴间隔
            watermark_y_space:50,//水印y轴间隔
            watermark_font:'微软雅黑',//水印字体
            watermark_color:'black',//水印字体颜色
            watermark_fontsize:'18px',//水印字体大小
            watermark_alpha:0.15,//水印透明度，要求设置在大于等于0.003
            watermark_width:150,//水印宽度
            watermark_height:100,//水印长度
            watermark_angle:0,//水印倾斜度数
            watermark_flicker:0,//闪烁时长
            watermark_textAlign:'center'//文字对齐
        };
        //采用配置项替换默认值，作用类似jquery.extend
        if(arguments.length===1&&typeof arguments[0] ==="object" )
        {
            var src=arguments[0]||{};
            for(key in src)
            {
                if(src[key]&&defaultSettings[key]&&src[key]===defaultSettings[key])
                    continue;
                else if(src[key])
                    defaultSettings[key]=src[key];
            }
        }

        if (window.watermarkdivs && window.watermarkdivs.length > 0) {
            document.body.removeChild(document.getElementById("otdivid"));
            window.watermarkdivs = [];
        }

        //获取页面最大宽度
        var page_width = Math.max(document.body.scrollWidth,document.body.clientWidth);
        //获取页面最大长度
        var page_height = Math.max(document.body.scrollHeight,document.body.clientHeight);

        // 创建文档碎片
        var oTemp = document.createDocumentFragment();
        //创建水印外壳div
        var otdiv = document.getElementById("otdivid");
        if(!otdiv){
            otdiv =document.createElement('div');
            otdiv.id="otdivid";
            otdiv.style.pointerEvents = "none";
            document.body.appendChild(otdiv);
            //if($){
            //	$fadeInAndOut(otdiv,defaultSettings.watermark_flicker);
            //}else{
            	fadeInAndOut(otdiv,defaultSettings.watermark_flicker);
            //}
        }

        //如果将水印列数设置为0，或水印列数设置过大，超过页面最大宽度，则重新计算水印列数和水印x轴间隔
        if (defaultSettings.watermark_cols == 0 || (parseInt(defaultSettings.watermark_x + defaultSettings.watermark_width *defaultSettings.watermark_cols + defaultSettings.watermark_x_space * (defaultSettings.watermark_cols - 1)) > page_width)) {
            defaultSettings.watermark_cols = parseInt((page_width - defaultSettings.watermark_x + defaultSettings.watermark_x_space) / (defaultSettings.watermark_width + defaultSettings.watermark_x_space));
            defaultSettings.watermark_x_space = parseInt((page_width - defaultSettings.watermark_x - defaultSettings.watermark_width * defaultSettings.watermark_cols) / (defaultSettings.watermark_cols - 1));
        }
        //如果将水印行数设置为0，或水印行数设置过大，超过页面最大长度，则重新计算水印行数和水印y轴间隔
        if (defaultSettings.watermark_rows == 0 || (parseInt(defaultSettings.watermark_y + defaultSettings.watermark_height * defaultSettings.watermark_rows + defaultSettings.watermark_y_space * (defaultSettings.watermark_rows - 1)) > page_height)) {
            defaultSettings.watermark_rows = parseInt((defaultSettings.watermark_y_space + page_height - defaultSettings.watermark_y) / (defaultSettings.watermark_height + defaultSettings.watermark_y_space));
            defaultSettings.watermark_y_space = parseInt(((page_height - defaultSettings.watermark_y) - defaultSettings.watermark_height * defaultSettings.watermark_rows) / (defaultSettings.watermark_rows - 1));
        }

        var x;
        var y;
        for (var i = 0; i < defaultSettings.watermark_rows; i++) {
            y = defaultSettings.watermark_y + (defaultSettings.watermark_y_space + defaultSettings.watermark_height) * i;
            for (var j = 0; j < defaultSettings.watermark_cols; j++) {
                x = defaultSettings.watermark_x + (defaultSettings.watermark_width + defaultSettings.watermark_x_space) * j;

                var mask_div = document.createElement('div');
//                var oText=document.createTextNode(defaultSettings.watermark_txt);
//                mask_div.appendChild(oText);
                mask_div.innerHTML=defaultSettings.watermark_txt;
                // 设置水印相关属性start
                mask_div.id = 'mask_div' + i + j;
                //设置水印div倾斜显示
                mask_div.style.webkitTransform = "rotate(-" + defaultSettings.watermark_angle + "deg)";
                mask_div.style.MozTransform = "rotate(-" + defaultSettings.watermark_angle + "deg)";
                mask_div.style.msTransform = "rotate(-" + defaultSettings.watermark_angle + "deg)";
                mask_div.style.OTransform = "rotate(-" + defaultSettings.watermark_angle + "deg)";
                mask_div.style.transform = "rotate(-" + defaultSettings.watermark_angle + "deg)";
                mask_div.style.visibility = "";
                mask_div.style.position = "absolute";
                //选不中
                mask_div.style.left = x + 'px';
                mask_div.style.top = y + 'px';
                mask_div.style.overflow = "hidden";
                mask_div.style.zIndex = "9999";
                //mask_div.style.border="solid #eee 1px";
                mask_div.style.opacity = defaultSettings.watermark_alpha;
                mask_div.style.fontSize = defaultSettings.watermark_fontsize;
                mask_div.style.fontFamily = defaultSettings.watermark_font;
                mask_div.style.color = defaultSettings.watermark_color;
                mask_div.style.textAlign = defaultSettings.watermark_textAlign;
                mask_div.style.width = defaultSettings.watermark_width + 'px';
                mask_div.style.height = defaultSettings.watermark_height + 'px';
                mask_div.style.display = "block";
                //设置水印相关属性end
                //附加到文档碎片中
                otdiv.appendChild(mask_div);

                window.watermarkdivs.push(otdiv); //控制页面大小变化时水印字体
            };
        };
        //一次性添加到document中
        document.body.appendChild(oTemp);
    };
    var fadeInAndOut = function(target,duration){
    	if(!duration||duration==0)return;
    	if(target.style.opacity==0){
    		target.style.opacity = 1;
    	}else{
    		target.style.opacity = 0;
    	}
    	setTimeout(function(){
			fadeInAndOut(target,duration)
		},duration);
    }
    var $fadeInAndOut = function(target,duration){
    	if(!duration||duration==0)return;
    	if($(target).is(':hidden')){
    		$(target).fadeIn(duration/2);
    	}else{
    		$(target).fadeOut(duration/2);
    	}
    	setTimeout(function(){
    		$fadeInAndOut(target,duration)
    	},duration);
    }
    watermark.init = function(settings) {
        window.onload = function() {
            loadMark(settings);
        };
        window.onresize = function() {
            loadMark(settings);
        };
    };

    watermark.load = function(settings){
        loadMark(settings);
    };

})(window.watermark = {} ,jQuery);


window.onload=function(){
	watermark.load({ 
	//watermark_txt: "北京微金时代科技有限公司 <br>   报表试用版本                   " 
	watermark_txt: "\u5317\u4eac\u5fae\u91d1\u65f6\u4ee3\u79d1\u6280\u6709\u9650\u516c\u53f8 <br>   \u62a5\u8868\u8bd5\u7528\u7248\u672c                   " ,
	watermark_width:200,
	watermark_color:"#39a3a7",
	watermark_alpha:0.2,//0.3
	watermark_fontsize:"16px",
	watermark_x_spacer:'200',
	watermark_y_spacer:'100',
	watermark_flicker:0,
	watermark_cols:10,
	watermark_rows:10,
	watermark_textAlign:"right",
	//watermark_x:Math.max(document.body.scrollWidth,document.body.clientWidth)-160,
	//watermark_y:Math.max(document.body.scrollHeight,document.body.clientHeight)-150,
	watermark_angle:15//水印倾斜度数
	}); 
};
