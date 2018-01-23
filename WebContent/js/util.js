
/*
 * 函数：格式化日期 参数：formatStr-格式化字符串 d：将日显示为不带前导零的数字，如1 dd：将日显示为带前导零的数字，如01
 * ddd：将日显示为缩写形式，如Sun dddd：将日显示为全名，如Sunday M：将月份显示为不带前导零的数字，如一月显示为1
 * MM：将月份显示为带前导零的数字，如01 MMM：将月份显示为缩写形式，如Jan MMMM：将月份显示为完整月份名，如January
 * yy：以两位数字格式显示年份 yyyy：以四位数字格式显示年份 h：使用12小时制将小时显示为不带前导零的数字，注意||的用法
 * hh：使用12小时制将小时显示为带前导零的数字 H：使用24小时制将小时显示为不带前导零的数字 HH：使用24小时制将小时显示为带前导零的数字
 * m：将分钟显示为不带前导零的数字 mm：将分钟显示为带前导零的数字 s：将秒显示为不带前导零的数字 ss：将秒显示为带前导零的数字
 * l：将毫秒显示为不带前导零的数字 ll：将毫秒显示为带前导零的数字 tt：显示am/pm TT：显示AM/PM 返回：格式化后的日期
 */
Date.prototype.format = function(formatStr) {
	var date = this;
	/*
	 * 函数：填充0字符 参数：value-需要填充的字符串, length-总长度 返回：填充后的字符串
	 */
	var zeroize = function(value, length) {
		if (!length) {
			length = 2;
		}
		value = new String(value);
		for ( var i = 0, zeros = ''; i < (length - value.length); i++) {
			zeros += '0';
		}
		return zeros + value;
	};
	return formatStr
			.replace(
					/"[^"]*"|'[^']*'|\b(?:d{1,4}|M{1,4}|yy(?:yy)?|([hHmstT])\1?|[lLZ])\b/g,
					function($0) {
						switch ($0) {
						case 'd':
							return date.getDate();
						case 'dd':
							return zeroize(date.getDate());
						case 'ddd':
							return [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thr', 'Fri',
									'Sat' ][date.getDay()];
						case 'dddd':
							return [ 'Sunday', 'Monday', 'Tuesday',
									'Wednesday', 'Thursday', 'Friday',
									'Saturday' ][date.getDay()];
						case 'M':
							return date.getMonth() + 1;
						case 'MM':
							return zeroize(date.getMonth() + 1);
						case 'MMM':
							return [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
									'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' ][date
									.getMonth()];
						case 'MMMM':
							return [ 'January', 'February', 'March', 'April',
									'May', 'June', 'July', 'August',
									'September', 'October', 'November',
									'December' ][date.getMonth()];
						case 'yy':
							return new String(date.getFullYear()).substr(2);
						case 'yyyy':
							return date.getFullYear();
						case 'h':
							return date.getHours() % 12 || 12;
						case 'hh':
							return zeroize(date.getHours() % 12 || 12);
						case 'H':
							return date.getHours();
						case 'HH':
							return zeroize(date.getHours());
						case 'm':
							return date.getMinutes();
						case 'mm':
							return zeroize(date.getMinutes());
						case 's':
							return date.getSeconds();
						case 'ss':
							return zeroize(date.getSeconds());
						case 'l':
							return date.getMilliseconds();
						case 'll':
							return zeroize(date.getMilliseconds());
						case 'tt':
							return date.getHours() < 12 ? 'am' : 'pm';
						case 'TT':
							return date.getHours() < 12 ? 'AM' : 'PM';
						}
					});
} 
//测试 new Date().format("yyyy-MM-dd hh:mm:ss")

/**
 * 数字补零
 * 比如日期 1999-9-9 要转成1999-09-09
 * 调用zeroize(9, 2) 返回 09
 * param value 需要转换的数字
 * param length 需要转换数字的位数
 */
function zeroize (value, length) {
	if (!length) {
		length = 2;
	}
	value = new String(value);
	for ( var i = 0, zeros = ''; i < (length - value.length); i++) {
		zeros += '0';
	}
	return zeros + value;
} 

/**
 * 左补默认字符
 * @param value
 * @param length
 * @param paddingChar
 * @returns {String}
 */
function paddingLeft(value, length, paddingChar){
	if (!length) {
		length = 2;
	}
	value = new String(value);
	for ( var i = 0, padding = ''; i < (length - value.length); i++) {
		padding += paddingChar;
	}
	return padding + value;
}

/**
 * 右补默认字符
 * @param value
 * @param length
 * @param paddingChar
 * @returns {String}
 */
function paddingRight(value, length, paddingChar){
	if (!length) {
		length = 2;
	}
	value = new String(value);
	for ( var i = 0, padding = ''; i < (length - value.length); i++) {
		padding += paddingChar;
	}
	return value + padding;
}

//StringBuffer 类 start
/**
 * StringBuffer 类 用户字符串连接
 * 速度比直接字符串相加效率高 100%～200%
 * @returns
 */
function StringBuffer() {
	this._strings = new Array;
}

StringBuffer.prototype.append = function(str) {
	this._strings.push(str);
}

StringBuffer.prototype.toString = function() {
	return this._strings.join("");
}
StringBuffer.prototype.clear = function(){
	this._strings = [];
}
//StringBuffer 类 end

function DateUtil() {
}

/**
 * 将 hh:mm:ss 转换成 秒
 */
DateUtil.prototype.toSeconds = function(strTime) {

	if (strTime == "" || strTime == undefined || this.regrexTims(strTime) == false) {
		return 0;
	}
	
	var hours = parseInt(strTime.split(":")[0]);
	var minutes = parseInt(strTime.split(":")[1]);
	var seconds = parseInt(strTime.split(":")[2]);
	
	return hours*3600 + minutes*60 + seconds;
}

/**
 * 把秒数 转换为 hh:mm:ss
 */
DateUtil.prototype.toTime = function(intSeconds) {
	
	var hours = parseInt(intSeconds / 3600);
	var minutes = parseInt((intSeconds - hours * 3600) / 60);
	var seconds = intSeconds - hours * 3600 - minutes * 60;
	
	var retStr = zeroize(hours, 2) + ":" +  zeroize(minutes, 2) + ":" +  zeroize(seconds, 2);
	return retStr;
}

/**
 * 日期格式简单验证 hh:mm:ss
 */
DateUtil.prototype.regrexTims = function(strTime) { 
	var reg = /^\d{2}:\d{2}:\d{2}$/;
	return reg.test(strTime);
}
 
/**
 * 字符串截取
 */
function cutSubString(str, maxLength, suffix) {
	if (str == null || str == "" || str == undefined) {
		return "";
	}
	
	//是否有尾部 修饰字符（如。。。）
	if (suffix == null || suffix == "" || suffix == undefined) {
		suffix = "";
	}

	if (str.length > maxLength) {
		return str.substring(0, maxLength) + suffix;
	} else {
		return str;
	}
}

/**
 * 替换null，undefined 为指定默认字符串
 * @param str 需要检查的字符串
 * @param strDefault  默认字符串
 * @returns
 */
function replaceNull(str, strDefault) {
	if (str == null || str == "" || str == undefined) {
		if (strDefault == undefined || strDefault == null) {
			return "";
		} else {
			return strDefault;
		}
 		
	} else {
		return str;
	}
	
}

/**
 * 判断是否为 空字符串 null undefined
 * @param str
 */
function isEmpty(str) {
	if(str == "" || str == null || str == undefined) {
		return true;
	}
	return false;
}

/*
 * formatMoney(s,type)
 * 功能：金额按千位逗号分割
 * 参数：s，需要格式化的金额数值.
 * 参数：type,判断格式化后的金额是否需要小数位. 0 不要小数   1 要小数
 * 返回：返回格式化后的数值字符串.
 */
function formatMoney(s, type){ 
	var prex = false;
	if (s == null) {
		s = "";
	}
    s = s+"";
    if (s.indexOf("-") == 0) {
    	s = s.replace("-", "");
    	prex = true;
    }
 
	if (type == 0) {
	    if (s == null || s == "") return "0";
	    
	    s = s.toString().replace(/^(\d*)$/, "$1.");
	    s = (s + "00").replace(/(\d*\.\d{2})\d*/, "$1");
	    s = s.replace(".", ",");
	    var re = /(\d)(\d{3},)/;
	    while (re.test(s))
	        s = s.replace(re, "$1,$2");
	    s = s.replace(/,(\d{2})$/, ".$1");
	    if (type == 0) {// 不带小数位(默认是有小数位)
	        var a = s.split(".");
	        if (a[1] == "00") {
	            s = a[0];
	        }
	    }
	} else if (type == 2){ 
	    if (s == null || s == "") return "0.00";
	   
	    s = s.toString().replace(/^(\d*)$/, "$1.");
	    s = (s + "00").replace(/(\d*\.\d{2})\d*/, "$1");
	    s = s.replace(".", ",");
	    var re = /(\d)(\d{3},)/;
	    while (re.test(s))
	        s = s.replace(re, "$1,$2");
	    s = s.replace(/,(\d{2})$/, ".$1");
	    if (type == 0) {// 不带小数位(默认是有小数位)
	        var a = s.split(".");
	        if (a[1] == "00") {
	            s = a[0];
	        }
	    }
	    
	} else {
	    if (s == null || s == "") return "0.0000";
	    
	    s = s.toString().replace(/^(\d*)$/, "$1.");
	    s = (s + "0000").replace(/(\d*\.\d{4})\d*/, "$1");
	    s = s.replace(".", ",");
	    var re = /(\d)(\d{3},)/;
	    while (re.test(s))
	        s = s.replace(re, "$1,$2");
	    s = s.replace(/,(\d{4})$/, ".$1");
	    if (type == 0) {// 不带小数位(默认是有小数位)
	        var a = s.split(".");
	        if (a[1] == "0000") {
	            s = a[0];
	        }
	    }
	}
  
    if (prex) {
    	s = "-" + s;
    }
    return s;
}


//js方法：序列化表单
function serializeForm(form) {
	var obj = {};
	$.each(form.serializeArray(), function(index) {
		if (obj[this['name']]) {
			obj[this['name']] = obj[this['name']] + ',' + this['value'];
		} else {
			obj[this['name']] = this['value'];
		}
	});
	return obj;
}



var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}   

function isCardID(sId){   
    var iSum=0 ;  
    var info="" ;  
    if(!/^\d{17}(\d|x)$/i.test(sId)) return "你输入的身份证长度或格式错误";   
    sId=sId.replace(/x$/i,"a");   
    if(aCity[parseInt(sId.substr(0,2))]==null) return "你的身份证地区非法";   
    sBirthday=sId.substr(6,4)+"-"+Number(sId.substr(10,2))+"-"+Number(sId.substr(12,2));   
    var d=new Date(sBirthday.replace(/-/g,"/")) ;  
    if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))return "身份证上的出生日期非法";   
    for(var i = 17;i>=0;i --) iSum += (Math.pow(2,i) % 11) * parseInt(sId.charAt(17 - i),11) ;  
    if(iSum%11!=1) return "你输入的身份证号非法";   
    return true;//aCity[parseInt(sId.substr(0,2))]+","+sBirthday+","+(sId.substr(16,1)%2?"男":"女")   
}   
  
  
$.extend($.fn.validatebox.defaults.rules, {     
    idcared: {     
        validator: function(value,param){    
            var flag= isCardID(value);  
            return flag==true?true:false;    
        },     
        message: '不是有效的身份证号码'    
    }     
});  
