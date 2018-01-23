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

        <div class="box-header with-border">
        
        	<div class="row">
        		<div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control">
                    	<option disabled selected>运营人</option>
                    	<option>VHNVB</option>
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control">
                    	<option disabled selected>执管基地</option>
                    	<option>VHNVB</option>
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control">
                    	<option disabled selected>发动机位置</option>
                    	<option>VHNVB</option>
                    </select>
                </div>
        		<div class="col-xs-1" style="min-width: 160px">
        			<button type="submit" class="btn btn-block btn-default" style="margin:0px 15px;">查询</button>
        		</div>
        		<div class="col-xs-1 pull-right" style="min-width: 160px">
        			<button class="btn btn-block btn-primary" data-toggle="modal" data-target="#troubleshooting-add-modal">
                       	 导入数据
              		</button>
        		</div>
        	</div>
        		
        </div>
        <div class="box-body">

            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table id="table-list" class="table  table-hover">
                    <thead>
                    <tr>
                        <th>运营人</th>
                        <th>执管基地</th>
                        <th>机号</th>
                        <th>发动机位置</th>
                        <th>发动机编号</th>
                        <th>ZT49之平均值</th>
                        <th>ZT49之最大值</th>
                    </tr>
                    </thead>
                    <tbody>
                    	<tr>
                    		<td>东航</td>
                    		<td>GD01</td>
                    		<td>B5896</td>
                    		<td>2</td>
                    		<td>26415</td>
                    		<td>857.50</td>
                    		<td>935.00</td>
                    	</tr>
                    	
                    </tbody>
                    <!--这里是内容 -->

                </table>
                <div class="row"><div class="col-sm-5"><div class="dataTables_length" id="table-list_length"><label>显示 <select name="table-list_length" aria-controls="table-list" class="form-control input-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条记录</label></div></div><div class="col-sm-7"><div class="dataTables_paginate paging_simple_numbers" id="table-list_paginate"><ul class="pagination"><li class="paginate_button previous disabled" id="table-list_previous"><a href="#" aria-controls="table-list" data-dt-idx="0" tabindex="0">上一页</a></li><li class="paginate_button active"><a href="#" aria-controls="table-list" data-dt-idx="1" tabindex="0">1</a></li><li class="paginate_button "><a href="#" aria-controls="table-list" data-dt-idx="2" tabindex="0">2</a></li><li class="paginate_button next" id="table-list_next"><a href="#" aria-controls="table-list" data-dt-idx="3" tabindex="0">下一页</a></li></ul></div></div></div>
            </div>
        </div>
    </div>
</div>




</body>
</html>
