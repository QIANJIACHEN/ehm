	function getRequest(){
		var url = location.search;
		var theRequest = new Object(); 
		if (url.indexOf("?") != -1) { 
			var str = url.substr(1); 
			strs = str.split("&"); 
			for(var i = 0; i < strs.length; i ++) { 
			theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]); 
			}
		}
			return theRequest; 
	}


	function jumpPlane(object){
		tail = $(object).attr("tail");
		title1 = $(object).attr("title1");//该页面名称编号
		url = "/manage/dataplane/dataplanelistdetail.do?tail="+tail+"&title="+title1;
		title = "飞机详情";//跳转页面名称
		tab_url = self.frameElement.getAttribute('data_url');//iframe对应的data_url和tab对应的data_url是一致的
		window.parent.changePage(title,tab_url);//调用父页面的方法
		//跳转
		window.parent.jumpiframe(tab_url,url);
	}
	
	function jumpEng(object){
		engSn = $(object).attr("engSn");
		title1 = $(object).attr("title1");//该页面名称
		url = "/manage/dataeng/dataenglistdetail.do?engSn="+engSn+"&title="+title1;
		title = "发动机详情";//跳转页面名称
		tab_url = self.frameElement.getAttribute('data_url');//iframe对应的data_url和tab对应的data_url是一致的
		window.parent.changePage(title,tab_url);//调用父页面的方法
		//跳转
		window.parent.jumpiframe(tab_url,url);
	}
	
	function jumpDuty(object){
		duty = $(object).attr("duty");
		title1=$(object).attr("title1");//"7";
		url = "/manage/duty/dutydetail.do?id="+duty+"&title="+title1;
		title = "部门详情";
		tab_url = self.frameElement.getAttribute('data_url');//iframe对应的data_url和tab对应的data_url是一致的
		window.parent.changePage(title,tab_url);//调用父页面的方法
		//跳转
		window.parent.jumpiframe(tab_url,url);
	}