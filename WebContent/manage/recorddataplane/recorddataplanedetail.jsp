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
    	.btn-primary {
		    background-color: #3c8dbc!important;
		    border-color: #367fa9!important;
			}
    </style>
</head>
<body class="hold-transition" >

<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">
		<button type="button" onclick="back()" class=" return btn-primary">返回</button>
        <div class="box-header">
        	<h4>基础信息</h4><br>
        	<div class="row basicinfo">
        		<div class="col-md-3 col-xs-3">
        			<p>
        				<span class="key">ID</span>
        				<span class="val" id="planeId"></span>
        			</p>
        			<p>
        				<span class="key">TAIL</span>
        				<span class="val"><a id="tail" title1="3" href="javascript:void(0)" onclick="jumpPlane(this)" ></a></span>
        			</p>
        			<p>
        				<span class="key">基地</span>
        				<span class="val"><a id="duty" title1="3" href="javascript:void(0)" onclick="jumpDuty(this)"></a></span>
        			</p>
        			<p>
        				<span class="key">推力</span>
        				<span class="val" id="ratingPlane"></span>
        			</p>
        			<p>
        				<span class="key">构型</span>
        				<span class="val" id="configPlane"></span>
        			</p>
        			<p>
        				<span class="key">发动机原始编码</span>
        				<span class="val" id="engSnOriginal"></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">型号1级</span>
        				<span class="val" id="series"></span>
        			</p>
        			<p>
        				<span class="key">型号2级</span>
        				<span class="val" id="type"></span>
        			</p>
        			<p>
        				<span class="key">型号3级</span>
        				<span class="val" id="model"></span>
        			</p>
        			<p>
        				<span class="key">属性</span>
        				<span class="val" id="attribute"></span>
        			</p>
        			<p>
        				<span class="key">ETOPS</span>
        				<span class="val" id="etops"></span>
        			</p>
        			<p>
        				<span class="key">高高原</span>
        				<span class="val" id="hHighLand"></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">VARIABLE</span>
        				<span class="val" id="variable"></span>
        			</p>
        			<p>
        				<span class="key">MSN</span>
        				<span class="val" id="serial"></span>
        			</p>
        			<p>
        				<span class="key">LINE</span>
        				<span class="val" id="line"></span>
        			</p>
        			<p>
        				<span class="key">MANUAL</span>
        				<span class="val" id="manual"></span>
        			</p>
        			<p>
        				<span class="key">运营人</span>
        				<span class="val" id="operater"></span>
        			</p>
        			<p>
        				<span class="key">所有人</span>
        				<span class="val" id="owner"></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key" >引进方式</span>
        				<span class="val" id="importWay"></span>
        			</p>
        			<p>
        				<span class="key">创建时间</span>
        				<span class="val" id="ctime"></span>
        			</p>
        		</div>
        	</div>
        	<br><h4>备注</h4><br>
        	<textarea id="remark" rows="" cols="" class="form-control" style="border-color:#fff;font-size:15px"></textarea>
        	
        </div>
        

    </div>
</div>
<script type="text/javascript">
		
	var Request = new Object(); 
	Request = getRequest(); 
	var id = Request['id']; 
	$.post("${pageContext.request.contextPath}/manage/recorddataplane/detail.do",{id:id},function(res){
		//console.log(res.data[0].serial);
		$('#planeId').html(res.data[0].id);
		$("#tail").html(res.data[0].tail);
		$("#tail").attr("tail",res.data[0].tail);
		$("#duty").html(res.data[0].dutyName);
		$("#duty").attr("duty",res.data[0].duty);
		$("#ratingPlane").html(res.data[0].ratingPlane);
		$("#configPlane").html(res.data[0].configPlane);
		$("#engSnOriginal").html(res.data[0].egsnOriginal);
		$("#series").html(res.data[0].series);
		$("#type").html(res.data[0].type);
		$("#model").html(res.data[0].model);
		$("#attribute").html(res.data[0].attribute);
		$("#etops").html(res.data[0].etops);
		if(res.data[0].hHighLand=="1"){
			$("#hHighLand").html("N");
		}else if(res.data[0].hHighLand=="0"){
			$("#hHighLand").html("Y");
		}
		$("#variable").html(res.data[0].variable);
		$("#serial").html(res.data[0].serial);
		$("#line").html(res.data[0].line);
		$("#manual").html(res.data[0].manual);
		$("#operater").html(res.data[0].operater);
		$("#owner").html(res.data[0].owner);
		$("#importWay").html(res.data[0].importWay);
		$("#ctime").html(res.data[0].ctime);
		$("#remark").html(res.data[0].remark);
		
	},"json");

	//返回
	function back(){
		var Request = new Object(); 
		Request = getRequest(); 
		title1 = Request['title'];
		if(title1=="1"){
			title = "飞机属性更变记录";
		}else if(title1=="2"){
			
		}
		tab_url = self.frameElement.getAttribute('data_url');//iframe对应的data_url和tab对应的data_url是一致的
		window.parent.changePage(title,tab_url);//调用父页面的方法
		//跳转
		window.history.back();
	}
	

	
</script>
</body>
</html>
