<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
    <style type="text/css">
    	table.table , table.table tr th{
    		text-align:center;
    	}
    	span.mright{
    		margin-right:15px;
    		margin-left:15px;
    	}
    	input.formnew , select.formnew{
    		padding:6px 12px;
    		min-width:130px;
    		max-width:160px;
    		margin:0px 3px;
    	}
    </style>
</head>
<body class="hold-transition" >

<!-- Content Wrapper. Contains page content -->
<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">
        <div class="box-header with-border" style="border-bottom:none;">
         
            <div class="row" style="margin:15px 0px">
         		<form action="" method="post">
					<span class="mright">Z状态</span>
					<select class="formnew">
						<option>起飞</option>
						<option>巡航</option>
					</select>
							    		
					<span class="mright">机号</span>
					<input class="formnew" type="text" value="" style="height:34px"/>
					
					<span class="mright">飞行日期</span>
					<select class="formnew">
						<option></option>
					</select>
					
					<div style="min-width: 160px;display:inline-block;vertical-align:bottom;float:right">
	                    <button class="btn btn-block btn-primary col-sm-1">
	                       	 保存
	                    </button>
	                </div>
                </form>
            </div>
            
            
        </div>
        <div class="box-body">
			<table class="table table-hover table-bordered">
			  	<thead>
			  		<tr>
				  		<th>运营人</th>
				  		<th>执管基地</th>
				  		<th>机号</th>
				  		<th>发动机编号</th>
				  		<th>H_HIGHLAND</th>
				  		<th>发动机位置</th>
				  		<th>OIL_CONSUMPTION</th>
				  		<th>SCORE_OIL_CONSUMPTION</th>
			  		</tr>
			  	</thead>
			  	<tbody>
			  		<tr>
			  			<td>联行</td>
			  			<td>5001</td>
			  			<td>B1752</td>
			  			<td>521555</td>
			  			<td>N</td>
			  			<td>左发</td>
			  			<td>0.3509</td>
			  			<td>60.00</td>
			  		</tr>
			  	</tbody>
			</table>
            
        </div>
    </div>
</div>




</body>
</html>
