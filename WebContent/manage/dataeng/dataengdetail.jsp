<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
    <style type="text/css">
    	table.planetable{
    		text-align:center;
    	}
    	table.planetable thead tr th {
    		text-align:center;
    	}
    	table.planetable tbody tr td:last-child span{
    		cursor:pointer;
    		color:#199ED8;
    	}
    	
    </style>
</head>
<body class="hold-transition" >

<!-- Content Wrapper. Contains page content -->
<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">
    	
        <div class="box-header with-border" style="border-bottom:none">
        	<h2>发动机信息</h2>
        	<br>
            <h4>当前信息</h4><br>
            <div class="dataTables_wrapper form-inline dt-bootstrap table-responsive">
            
                <table class="table  table-hover table-bordered planetable">
                	<thead>
                    <tr>
                        <th>生产商</th>
                        <th>发动机编号</th>
                        <th>RATTING</th>
                        <th>CONFIG</th>
                        <th>当前EGTM</th>
                        <th>当前ETSN</th>
                        <th>当前ECSN</th>
                        <th>LLP余寿</th>
                        <th>状态</th>
                        <th>装机日期</th>
                        <th>预计下发日期</th>
                        <th>备注</th>
                    </tr>
                    </thead>
                   	<tbody>
                   		<tr>
                   			<td>GE</td>
                   			<td>300155</td>
                   			<td>26</td>
                   			<td>E</td>
                   			<td>86.55</td>
                   			<td>184</td>
                   			<td>96</td>
                   			<td>19904</td>
                   			<td>送修</td>
                   			<td>2017/09/22</td>
                   			<td>2020/02/21</td>
                   			<td></td>
                   		</tr>
                   		
                   	</tbody>
                </table>
                
            </div>
        </div>
        
        
        
        <div class="box-body">
			<h4>历史信息</h4><br>
            <div class="dataTables_wrapper form-inline dt-bootstrap table-responsive">
            
                <table class="table  table-hover planetable">
                	<thead>
                    <tr>
                        <th>下发时间</th>
                        <th>下发原因</th>
                        <th>CONFIG</th>
                        <th>RATTING</th>
                        <th>执管基地</th>
                        <th>机号</th>
                        <th>机型</th>
                        <th>发动机位置</th>
                    </tr>
                    </thead>
                   	<tbody>
                   		<tr>
                   			<td>2017/02/22</td>
                   			<td>退租修理</td>
                   			<td>E</td>
                   			<td>26</td>
                   			<td>SX01</td>
                   			<td>B1722</td>
                   			<td>B737-800</td>
                   			<td>1</td>
                   		</tr>
                   		<tr>
                   			<td>2017/02/22</td>
                   			<td>退租修理</td>
                   			<td>E</td>
                   			<td>26</td>
                   			<td>SX01</td>
                   			<td>B1722</td>
                   			<td>B737-800</td>
                   			<td>1</td>
                   		</tr>
                   		<tr>
                   			<td>2017/02/22</td>
                   			<td>退租修理</td>
                   			<td>E</td>
                   			<td>26</td>
                   			<td>SX01</td>
                   			<td>B1722</td>
                   			<td>B737-800</td>
                   			<td>1</td>
                   		</tr>
                   	</tbody>
                </table>
                
            </div>
            
        </div>
    </div>
</div>




</body>
</html>
