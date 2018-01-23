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
    </style>
</head>
<body class="hold-transition" >

<!-- Content Wrapper. Contains page content -->
<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">
        <div class="box-header with-border" style="border-bottom:none;">
         
            <div class="row" style="margin:15px 0px">
            	<div class="col-xs-1 pull-right" style="min-width: 160px">
                    <button class="btn btn-block btn-primary col-sm-1">
                       	 保存
                    </button>
                </div>
            	<div class="col-xs-1 pull-right" style="min-width: 160px">
                    <a href="shakereportchart.do" class="btn btn-block btn-primary col-sm-1">
                       	 生成图表
                    </a>
                </div>
            </div>
            
            
        </div>
        <div class="box-body">
			<table class="table table-hover table-bordered">
			  	<thead>
			  		<tr>
				  		<th>运营人</th>
				  		<th>执管基地</th>
				  		<th>机号</th>
				  		<th>发动机位置</th>
				  		<th>发动机编号</th>
				  		<th>SCORE_VIB</th>
				  		<th>N1起飞</th>
				  		<th>N1巡航</th>
				  		<th>N2起飞</th>
				  		<th>N2巡航</th>
			  		</tr>
			  	</thead>
			  	<tbody>
			  		<tr>
			  			<td>云航</td>
			  			<td>KM01</td>
			  			<td>B1702</td>
			  			<td>右发</td>
			  			<td>660272</td>
			  			<td>80.63</td>
			  			<td>0.50</td>
			  			<td>0.1</td>
			  			<td>0.37</td>
			  			<td>0.39</td>
			  		</tr>
			  	</tbody>
			</table>
            
        </div>
    </div>
</div>




</body>
</html>
