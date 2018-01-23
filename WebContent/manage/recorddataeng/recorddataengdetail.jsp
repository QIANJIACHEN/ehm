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
        	<h4>基础信息</h4><br>
        	<div class="row basicinfo">
        		<div class="col-md-3 col-xs-3">
        			<p>
        				<span class="key">ID</span>
        				<span class="val" id="engId"></span>
        			</p>
        			<p>
        				<span class="key">发动机SN</span>
        				<span class="val" ><a id="engSn" title1="3" href="javascript:void(0)" onclick="jumpEng(this)"></a></span>
        			</p>
        			<p>
        				<span class="key">SAP平台显示方式</span>
        				<span class="val" id="engSnSap"></span>
        			</p>
        			<p>
        				<span class="key">发动机序列</span>
        				<span class="val" id="engSeries"></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">发动机构型</span>
        				<span class="val" id="engConfig" ></span>
        			</p>
        			<p>
        				<span class="key">发动机类型</span>
        				<span class="val" id="engType" ></span>
        			</p>
        			<p>
        				<span class="key">发动机模型</span>
        				<span class="val" id="engModel" ></span>
        			</p>
        			<p>
        				<span class="key">原始厂商</span>
        				<span class="val" id="deliveryMode"></span>
        			</p>
        		</div>
        		<div class="col-md-3 col-xs-3">
        			<p>
        				<span class="key">所有人</span>
        				<span class="val" id="owner" ></span>
        			</p>
        			<p>
        				<span class="key">CODE CONFIG</span>
        				<span class="val" id="codeConfig"></span>
        			</p>
        			<p>
        				<span class="key" style="word-break:normal; white-space:pre-wrap;word-wrap : break-word ;overflow: hidden ;">ENG_CONFIGARATION</span>
        				<span class="val" id="engConfigration"></span>
        			</p>
        			<p>
        				<span class="key">发动机设备号</span>
        				<span class="val" id="engPn" ></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			
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

$.post("${pageContext.request.contextPath}/manage/recorddataeng/detail.do",{id:id},function(res){
	
	$("#engId").html(res.data[0].id);
	$("#engSn").html(res.data[0].engSn);
	$("#engSn").attr("engSn",res.data[0].engSn);
	$("#engSnSap").html(res.data[0].engSnSap);
	$("#engSeries").html(res.data[0].engSeries);
	$("#engType").html(res.data[0].engType);
	$("#engModel").html(res.data[0].engModel);
	$("#engConfig").html(res.data[0].engConfig);
	$("#deliveryMode").html(res.data[0].deliveryMode);
	$("#owner").html(res.data[0].owner);
	$("#codeConfig").html(res.data[0].codeConfig);
	$("#engConfigration").html(res.data[0].engConfigration);
	$("#ctime").html(res.data[0].ctime);
	$("#engPn").html(res.data[0].engPn);
},"json");
//返回
function back(){
	var Request = new Object(); 
	Request = getRequest();
	title1 = Request['title'];
	if(title1=="1"){
		title = "发动机属性更变列表";
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
