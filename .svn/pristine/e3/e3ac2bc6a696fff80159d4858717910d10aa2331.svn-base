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
        		<div class="col-xs-2" style="min-width: 160px">
                    <input type="text" name="keyword" class="form-control" placeholder="关键字" />
                </div>
        		<div class="col-xs-1" style="min-width: 160px">
        			<button type="submit" class="btn btn-block btn-default" style="margin:0px 15px;">查询</button>
        		</div>
        		<div class="col-xs-1 pull-right" style="min-width: 160px">
        			<button style="background:#f4f4f4;border-color:#ddd;color:black" class="btn btn-block" data-toggle="modal" data-target="#troubleshooting-add-modal">
                        <i class="fa fa-plus"></i>
                       	 添加
              		</button>
        		</div>
        	</div>
        		
			  
			  
			
			
			
        </div>
        <div class="box-body">

            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table id="table-list" class="table  table-hover">
                    <thead>
                    <tr>
                        <th>发动机编号</th>
                        <th>故障描述</th>
                        <th>状态</th>
                        <th>发动机类型</th>
                        <th>发动机编号</th>
                        <th>发生日期</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    	<tr>
                    		<td>125532</td>
                    		<td></td>
                    		<td>巡航</td>
                    		<td></td>
                    		<td></td>
                    		<td></td>
                    		<td>
                    			<div class="btn-group open">
                    				<button class="btn btn-default btn-sm " data-toggle="modal" data-target="#user-info-modal">
                    					<i class="fa fa-gear"></i>
                    				</button>
                    				<button class="btn btn-default btn-sm" onclick="deleteuser(01)">
                    					<i class="fa fa-trash"></i>
                    				</button>
                    			</div>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td>125532</td>
                    		<td></td>
                    		<td>起飞</td>
                    		<td></td>
                    		<td></td>
                    		<td></td>
                    		<td>
                    			<div class="btn-group open">
                    				<button class="btn btn-default btn-sm " data-toggle="modal" data-target="#user-info-modal">
                    					<i class="fa fa-gear"></i>
                    				</button>
                    				<button class="btn btn-default btn-sm" onclick="deleteuser(01)">
                    					<i class="fa fa-trash"></i>
                    				</button>
                    			</div>
                    		</td>
                    	</tr>
                    	
                    </tbody>
                    <!--这里是内容 -->

                </table>
                <div class="row"><div class="col-sm-5"><div class="dataTables_length" id="table-list_length"><label>显示 <select name="table-list_length" aria-controls="table-list" class="form-control input-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条记录</label></div></div><div class="col-sm-7"><div class="dataTables_paginate paging_simple_numbers" id="table-list_paginate"><ul class="pagination"><li class="paginate_button previous disabled" id="table-list_previous"><a href="#" aria-controls="table-list" data-dt-idx="0" tabindex="0">上一页</a></li><li class="paginate_button active"><a href="#" aria-controls="table-list" data-dt-idx="1" tabindex="0">1</a></li><li class="paginate_button "><a href="#" aria-controls="table-list" data-dt-idx="2" tabindex="0">2</a></li><li class="paginate_button next" id="table-list_next"><a href="#" aria-controls="table-list" data-dt-idx="3" tabindex="0">下一页</a></li></ul></div></div></div>
            </div>
        </div>
    </div>
</div>
<jsp:include page='addtroubleshooting.jsp'/>
<jsp:include page='../public/delete.jsp'/>



</body>
</html>
