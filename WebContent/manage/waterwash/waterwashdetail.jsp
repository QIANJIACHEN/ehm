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
	<button type="button" onclick="back()" class=" return">返回</button>
    <div class="box wrapper " style="overflow: auto;">
		 
        <div class="box-header">
        	<h4>基础信息</h4><br>
        	<div class="row basicinfo">
        		<div class="col-md-3 col-xs-3">
        			<p>
        				<span class="key">ID</span>
        				<span class="val" id="waterwashid"></span>
        			</p>
        			<p>
        				<span class="key">设备参数</span>
        				<span class="val" id="parameterApparatus"></span>
        			</p>
        			<p>
        				<span class="key">水洗人员</span>
        				<span class="val" id="userName"></span>
        			</p>
        			<p>
        				<span class="key">地理位置</span>
        				<span class="val" id="geographic"></span>
        			</p>
        			<p>
        				<span class="key">天气</span>
        				<span class="val" id="weather"></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">发动机型号</span>
        				<span class="val" ><a id="engSn" title1="9" href="javascript:void(0)" onclick="jumpEng(this)"></a></span>
        			</p>
        			<p>
        				<span class="key">效果</span>
        				<span class="val" id="result"></span>
        			</p>
        			<p>
        				<span class="key">评级</span>
        				<span class="val" id="level"></span>
        			</p>
        			<p>
        				<span class="key">持续时间</span>
        				<span class="val" id="durationTime"></span>
        			</p>
        			<p>
        				<span class="key">创建时间</span>
        				<span class="val" id="ctime"></span>
        			</p>
        			
        		</div>
        		
        	
        	</div>
        	
        </div>
        
    </div>
</div>
<script type="text/javascript">
		
	var Request = new Object(); 
	Request = getRequest(); 
	var id = Request['id']; 
	$.post("${pageContext.request.contextPath}/manage/waterwash/detail.do",{id:id},function(res){
		//console.log(res.data[0]);
		$("#waterwashid").html(res.data[0].id);
		$("#parameterApparatus").html(res.data[0].parameterApparatus);
		$("#userName").html(res.data[0].userName);
		$("#geographic").html(res.data[0].geographic);
		$("#weather").html(res.data[0].weather);
		$("#engSn").html(res.data[0].engSn);
		$("#engSn").attr("engSn",res.data[0].engSn);
		$("#result").html(res.data[0].result);
		$("#level").html(res.data[0].level);
		$("#durationTime").html(res.data[0].durationTime);
		$("#ctime").html(res.data[0].ctime);
	},"json");
	//返回
	function back(){
		url="${pageContext.request.contextPath}/manage/waterwash/waterwashlist.do";
		title = "水洗列表";
		tab_url = self.frameElement.getAttribute('data_url');//iframe对应的data_url和tab对应的data_url是一致的
		window.parent.changePage(title,tab_url);//调用父页面的方法
		//跳转
		window.location.href=url;
	}
	
</script>
</body>
</html>
