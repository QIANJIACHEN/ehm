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
    	.table{
    		width:90%;
    		margin-left:1%;
    	}
    	.table_a tr td{
    		width:20%;
    		font-size:14px;
    		vertical-align:middle!important;
    		text-align:center;
    		border-color:#e2dcdc!important;
    	}
    	.table_b tr td{
    		width:25%;
    		font-size:14px;
    		vertical-align:middle!important;
    		text-align:center;
    		border-color:#e2dcdc!important;
    	}
    	.table_b tr td span{
    		color:#3399ff;
    		cursor:pointer;
    	}
    </style>
</head>
<body class="hold-transition" >

<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">
		<button type="button" onclick="back()" class=" return">返回</button> 
        <div class="box-header">
        	<h2 style="font-weight:bold">部门详情</h2><br><br>
        	<table class="table table-bordered table_a">
        		<tr style="background:#f1f1f1;font-weight:bold;">
        			<td>部门名称</td>
        			<td>所属基地</td>
        			<td>部门负责人</td>
        			<td>所在地址</td>
        			<td>办公电话</td>
        		</tr>
        		<tr>
        			<td>xxx</td>
        			<td>上海</td>
        			<td>哈哈哈</td>
        			<td>上海市静安区</td>
        			<td>1234567890</td>
        		</tr>
        	</table>
        	<p style="margin-left:1%;margin-top:60px;">部门成员</p>
        	<table class="table table-bordered table_b">
        		<tr style="background:#f1f1f1;font-weight:bold;">
        			<td>编号</td>
        			<td>姓名</td>
        			<td>手机号</td>
        			<td>操作</td>
        		</tr>
        		<tr>
        			<td style="text-decoration: underline;color:#3399ff;">xxx</td>
        			<td>王大崔</td>
        			<td>1234567890</td>
        			<td>
        				<span>编辑<span>
        				<span>删除<span>
        			</td>
        		</tr>
        	</table>
        	<!-- <h4>基础信息</h4><br> -->
        	<!-- <div class="row basicinfo">
        		<div class="col-md-3 col-xs-3">
        			<p>
        				<span class="key">ID</span>
        				<span class="val" id="dutyId"></span>
        			</p>
        			<p>
        				<span class="key">上级</span>
        				<span class="val" id="parentName"></span>
        			</p>
        			<p>
        				<span class="key">名称</span>
        				<span class="val" id="name"></span>
        			</p>
        			<p>
        				<span class="key">角色</span>
        				<span class="val" id="roleName"></span>
        			</p>
        			<p>
        				<span class="key">所在地</span>
        				<span class="val" id="location"></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			
        			
        			<p>
        				<span class="key">分类</span>
        				<span class="val" id="type"></span>
        			</p>
        			<p>
        				<span class="key">创建时间</span>
        				<span class="val" id="ctime"></span>
        			</p>
        		</div>
        		
        	
        	</div> -->
        	
        </div>
        
    </div>
</div>
<script type="text/javascript">
		
	var Request = new Object(); 
	Request = getRequest(); 
	var id = Request['id']; 
	$.post("${pageContext.request.contextPath}/manage/duty/detail.do",{id:id},function(res){
		
		$("#dutyId").html(res.data[0].id);
		$("#parentName").html(res.data[0].parentName);
		$("#name").html(res.data[0].name);
		$("#roleName").html(res.data[0].roleName);
		$("#location").html(res.data[0].location);
		
		$("#ctime").html(res.data[0].ctime);
		if (res.data[0].type == 1) {
            typename = "分公司";
        } 
        if (res.data[0].type == 2) {
        	typename =  "子公司";
        } 
        if (res.data[0].type == 3) {
        	typename =  "执行单位";
        } 
        if (res.data[0].type == 4) {
        	typename =  "基地";
        } 
        $("#type").html(typename);
	},"json");
	
	//返回
	function back(){
		var Request = new Object(); 
		Request = getRequest(); 
		title1 = Request['title'];
		if(title1=="1"){
			title = "部门列表";
		}else if(title1=="2"){
			title = "飞机详情";
		}else if(title1=="3"){
			title = "飞机属性更变记录详情";
		}else if(title1=="4"){
			title = "onwing发动机详情";
		}else if(title1=="6"){
			title = "SAP日报表详情";
		}else if(title1=="7"){
			title = "滑油数据详情";
		}
		tab_url = self.frameElement.getAttribute('data_url');//iframe对应的data_url和tab对应的data_url是一致的
		window.parent.changePage(title,tab_url);//调用父页面的方法
		//跳转
		window.history.back();
	}

</script>
</body>
</html>
