<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<style>
	/* 弹窗样式 */
    	.shadowbox{
    		width:100%;
    		height:100%;
    		background: #0000004d;
    		position: fixed;
    		z-index: 900;
    		display:none;
    	}
    	.container_box{
    		width:900px;
    		min-height:500px;
    		background:white;
    		position:absolute;
    		top:50%;
    		left:50%;
    		margin-left:-400px;
    		margin-top:-383px;
    		padding:10px 30px;
    	}
    	.container_box h4{
    		font-weight:bold;
    	}
    	.main_box{
    		margin-top:40px;
    	}
    	.place{
    		width:300px;
    		font-size:16px;
    	}
    	.form_box span{
    		display:inline-block;
    		width:70px;
    		font-size:16px;
    	}
    	.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td{
    		border:1px solid #cecaca;
    	}
    	.table > tbody > tr > td{
    		padding:5px;
    		vertical-align:middle;
    		text-align:center;
			word-wrap:break-word;
    	}
    	.table > tbody > tr > td:nth-of-type(1){
    		width:33px;
    	}
    	.table > tbody > tr > td:nth-of-type(2){
    		width:200px;
    	}
    	.table > tbody > tr > td:nth-of-type(3){
    		width:179px;
    	}
    	.table > tbody > tr > td:nth-of-type(4){
    		width:179px;
    	}
    	.table > tbody > tr > td:nth-of-type(5){
    		width:179px;
    	}
    	.btn{
    		width:135px;
    		height:40px;
    	}
</style>
</head>
<body>
<!--弹窗  -->
<div class="shadowbox" id="pshow">
	<div class="container_box">
		<h4>选择被通知的人员</h4>
		<div class="main_box">
			<form class="form_box">
				<span>基地</span>
				<select class="place" id="duty" onchange="getDuty()">
					<!-- <option>基地A</option> -->
				</select>
				
				<button type="button" style="float:right" class="btn btn-default" onclick="noSelect()">取消</button>&nbsp;&nbsp;&nbsp;
				<button type="button" style="float:right" class="btn btn-default" onclick="allSelect()">全选</button>
			    
				<br><br><br>
				<span>成员</span>
				<table id="user-list" style="width:770px;float:right" class="table table-bordered">
					<thead>
                    <tr>
                    	<th><input type="checkbox" id="isSelect" /></th>
                        <th>用户名</th>
                        <th>工号</th>
                        <th>邮箱</th>
                        <th>基地</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
				</table>
				
			</form>
			<div style="text-align:center;margin-top:33px;">
				<button type="button" style="color:white;background:#d3deea;" class="btn btn-default" onclick="getHidden()">取消</button>&nbsp;&nbsp;&nbsp;
				<button type="button" style="background:#386fea;" class="btn btn-primary" onclick="ok()">确定</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>
