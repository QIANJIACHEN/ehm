<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
    <style type="text/css">
    	table.tablerecord th ,table.tablerecord td{
    		text-align:center;
    		border:1px solid #d7d7d7 !important;
    	}
    	table.tablerecord th{
    		background-color:#f2f2f2;
    	}
    	table.tablerecord td a{
    		text-decoration:underline;
    	}
    	.basicinfo p span{
    		display:inline-block;
    		width:40%;
    		padding-left:10px;
    		box-sizing:border-box;
    		font-size:15px;
    	}
    	.basicinfo p span.key{
    		width:45%;
    		padding-left:0px;
    		font-weight:bold;
    	}
    	.basicinfo p span a{
    		text-decoration:underline;
    	}
    </style>
</head>
<body class="hold-transition" >

<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">
		<button type="button" onclick="back()" class=" return">返回</button> 
        <div class="box-header">
        	<h2>震动监控详情</h2><br>
        	<h4>基础信息</h4><br>
        	<div class="row basicinfo">
        		<div class="col-md-3 col-xs-3">
        			<p>
        				<span class="key">运营人</span>
        				<span class="val" id="operater"></span>
        			</p>
        			<p>
        				<span class="key">执管基地</span>
        				<span class="val" id="dutyName"></span>
        			</p>
        			<p>
        				<span class="key">机号</span>
        				<span class="val" id="tail"></span>
        			</p>
        			<p>
        				<span class="key">发动机位置</span>
        				<span class="val" id="ePosition"></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">发动机编号</span>
        				<span class="val" id="engSn" ></span>
        			</p>
        			<p>
        				<span class="key">状态</span>
        				<span class="val" id="flightPhase" >起飞</span>
        			</p>
        			<p>
        				<span class="key">起飞时间</span>
        				<span class="val" id="flightDateTime" ></span>
        			</p>
        			<p>
        				<span class="key">前单点</span>
        				<span class="val" id="zvb1f"></span>
        			</p>
        		</div>
        		<div class="col-md-3 col-xs-3">
        			<p>
        				<span class="key">后单点</span>
        				<span class="val" id="zvb1r" ></span>
        			</p>
        			<p>
        				<span class="key">前平滑</span>
        				<span class="val" id="zvb1fSmoothed"></span>
        			</p>
        			<p>
        				<span class="key">后平滑</span>
        				<span class="val" id="zvb1rSmoothed" ></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">前趋势</span>
        				<span class="val" id="zphsf"></span>
        			</p>
        			<p>
        				<span class="key">后趋势</span>
        				<span class="val" id="zphsr"></span>
        			</p>
        		</div>
        	</div>
        	
        </div>
        

    </div>
</div>
<script type="text/javascript">
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
	
var Request = new Object(); 
Request = getRequest(); 
var id = Request['id'];

$.post("${pageContext.request.contextPath}/manage/shakemonitor/detail.do",{id:id},function(res){
	console.dir(res);
	$("#operater").html(res.data[0].operater);
	$("#dutyName").html(res.data[0].dutyName);
	$("#tail").html(res.data[0].tail);
	$("#ePosition").html(res.data[0].ePosition);
	$("#engSn").html(res.data[0].engSn);
	if(res.data[0].flightPhase == 1){
		$("#flightPhase").html('起飞');
	}else{
		$("#flightPhase").html('巡航');
	}
	$("#flightDateTime").html(res.data[0].flightDateTime);
	$("#zvb1f").html(res.data[0].zvb1f);
	$("#zvb1r").html(res.data[0].zvb1r);
	$("#zvb1fSmoothed").html(res.data[0].zvb1fSmoothed);
	$("#zvb1rSmoothed").html(res.data[0].zvb1rSmoothed);
	$("#zphsf").html(res.data[0].zphsf);
	$("#zphsr").html(res.data[0].zphsr);
},"json");
//返回
function back(){
	url="${pageContext.request.contextPath}/manage/shakemonitor/shakelist.do";
	title = "震动监控数据";
	tab_url = self.frameElement.getAttribute('data_url');//iframe对应的data_url和tab对应的data_url是一致的
	window.parent.changePage(title,tab_url);//调用父页面的方法
	//跳转
	window.location.href=url;
}


</script>
</body>
</html>
