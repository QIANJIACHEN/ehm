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
		 
		<button type="button" onclick="back()" class="return">返回</button>
        <div class="box-header">
        	<h4>基础信息</h4><br>
        	<div class="row basicinfo">
        		<div class="col-md-3 col-xs-3">
        			<p>
        				<span class="key">发动机id</span>
        				<span class="val" id="engId"></span>
        			</p>
        			<p>
        				<span class="key">发动机编号</span>
        				<span class="val"><a href="javascript:void(0)" title1="5" id="engSn" onclick="jumpEng(this)" ></a></span>
        			</p>
        			<p>
        				<span class="key">TSI_START</span>
        				<span class="val" id="tsiStart"></span>
        			</p>
        			<p>
        				<span class="key">CSI_START</span>
        				<span class="val" id="csiStart"></span>
        			</p>
        			<p>
        				<span class="key">SV_TIME</span>
        				<span class="val" id="svTime"></span>
        			</p>
        			<p>
        				<span class="key">TSR_START</span>
        				<span class="val" id="tsrStart"></span>
        			</p>
        		</div>
        		<div class="col-md-3 col-xs-3">
        			<p>
        				<span class="key">TSO_START</span>
        				<span class="val" id="tsoStart"></span>
        			</p>
        			<p>
        				<span class="key">CSO_START</span>
        				<span class="val" id="csoStart"></span>
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
	$.post("${pageContext.request.contextPath}/manage/engconditionfleet/info.do",{id:id},function(res){
		$('#engId').html(res.data[0].engId);
		$("#engSn").html(res.data[0].engSn);
		$("#engSn").attr("engSn",res.data[0].engSn);
		$("#tsiStart").html(res.data[0].tsiStart);
		$("#tsoStart").html(res.data[0].tsoStart);
		$("#tsrStart").html(res.data[0].tsrStart);
		$("#csiStart").html(res.data[0].csiStart);
		$("#csoStart").html(res.data[0].csoStart);
		$("#csrStart").html(res.data[0].csrStart);
		$("#ctime").html(res.data[0].ctime);
		
	},"json");
	
	//返回
	function back(){
		var Request = new Object(); 
		Request = getRequest();
		title1 = Request['title'];
		if(title1=="1"){
			title = "发动机状态简报";
		}else if(title1=="2"){
			
		}else if(title1=="3"){
			
		}
		tab_url = self.frameElement.getAttribute('data_url');//iframe对应的data_url和tab对应的data_url是一致的
		window.parent.changePage(title,tab_url);//调用父页面的方法
		//跳转
		window.history.back();
	}

</script>
</body>
</html>
