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
    	.nav-tabs > li.active > a{
    		    border: 1px solid #3399FF;
    		    border-bottom-color: transparent;
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
                    <select class="form-control" id="search-duty">
                    	<!-- <option disabled selected >执管基地</option>
                        <option>AAA</option> -->
                    </select>
                </div>
                
 				<div class="col-xs-1" style="min-width: 160px">
                    <input type="text" class=" form-control" id="search-engSn" placeholder="发动机编号">
                </div>

                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchxx()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                <div class="col-xs-1 pull-right" style="min-width: 160px">
                    <a href="${pageContext.request.contextPath}/manage/oilconsume/oilpressurereport.do" class="btn btn-block btn-primary col-sm-1">
                       	 生成图表
                    </a>
                </div>
            </div>
        </div>
        <div class="box-body" style="padding-top:20px">
			<div>

			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" role="tablist" style="border-bottom:1px solid #3399FF">
			    <li role="presentation" class="active"><a href="#engineer" aria-controls="home" role="tab" data-toggle="tab">起飞</a></li>
			    <li role="presentation"><a href="#flight" role="tab" data-toggle="tab">巡航</a></li>
			  </ul>
			
			  <!-- Tab panes -->
			  <div class="tab-content">
			    <div role="tabpanel" class="tab-pane active" id="engineer" style="padding-top:30px">
			    	<div class="row" style="margin-bottom:30px">
			    		<div class="col-xs-1" style="text-align:center;line-height:34px">震动模型</div>
			    		<div class="col-xs-2">
			    			<select class="form-control">
			    				<option>N1震动突变预警</option>
			    				<option>N2震动突变预警</option>
			    			</select>
			    		</div>
			    	</div>
		            <table id="table-engineer" class="table  table-hover table-bordered planetable">
		                	<thead>
			                    <tr>
			                        <th>运营人</th>
			                        <th>执管基地</th>
			                        <th>机号</th>
			                        <th>发动机位置</th>
			                        <th>发动机编号</th>
			                        <th>状态</th>
			                        <th>起飞时间</th>
			                        <th>单点</th>
			                        <th>平滑</th>
			                    </tr>
		                    </thead>
		                   	<tbody>
		                   		
		                   	</tbody>
		            </table>
			    </div>
			    <div role="tabpanel" class="tab-pane" id="flight" style="padding-top:30px">
			    	<div class="row" style="margin-bottom:30px">
			    		<div class="col-xs-1" style="text-align:center;line-height:34px">震动模型</div>
			    		<div class="col-xs-2">
			    			<select class="form-control">
			    				<option>N1震动突变预警</option>
			    				<option>N2震动突变预警</option>
			    			</select>
			    		</div>
			    	</div>
		            <table id="table-flight" class="table  table-hover table-bordered planetable">
		                	<thead>
			                    <tr>
			                        <th>运营人</th>
			                        <th>执管基地</th>
			                        <th>机号</th>
			                        <th>发动机位置</th>
			                        <th>发动机编号</th>
			                        <th>状态</th>
			                        <th>起飞时间</th>
			                        <th>单点</th>
			                        <th>平滑</th>
			                    </tr>
		                    </thead>
		                   	<tbody>
		                   		
		                   	</tbody>
		             </table>
			    </div>
			  </div>
			
			</div>
            
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
	$("#table-engineer").DataTable({
	    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
	    "serverSide": true,
	    ordering: false,
	    "type": "POST",
	    "ajax": {
	        "url": "${pageContext.request.contextPath}/manage/shakemonitor/listOne.do",
	        "type": "POST",
	        "data": function (search) {
	        	// 条件查询参数
	        	search.dutyId = $("#search-duty").val();
	        	search.engSn = $("#search-engSn").val();
	        }
	    },
	    "columns": [
	        {"data": "operater"},
	        {"data": "dutyName"},
	        {"data": "tail"},
	        null,
	        {"data": "engSn"},
	        null,
	        {"data": "flightDateTime"},
	        {"data": "zpoil"},
	        {"data": "zpoilSmoothed"}
	    ],
	    "ordering": false,
	    "searching": false,
	    "columnDefs": [
	    	
	    	{
	    		"targets": 3,
	            "data": function (row, type, val, meta) {
	                if (row.ePosition == 1) {
	                    return "左发";
	                } else if (row.ePosition == 2){
	                    return "右发";
	                } else {
	               	 return "-";
	                }
	            }
	        },
	    	{
	             "targets": 5,
	             "data": function (row, type, val, meta) {
	                 if (row.flightPhase == 1) {
	                     return "起飞";
	                 } else if (row.flightPhase == 2){
	                     return "巡航";
	                 } else {
	                	 return "-";
	                 }
	             }
	         }
	    ],
	    "ordering": false,
	    "searching": false,
	    "info": false,
	    "language": {
	        "lengthMenu": "显示 _MENU_ 条记录",
	        "paginate": {
	            "first": "首页",
	            "next": "下一页",
	            "previous": "上一页",
	            "last": "末页",
	        },
	        "zeroRecords": "",
	        "infoEmpty":"没有符合条件的数据",
	        "emptyTable":"没有符合条件的数据"
	    }
	});
	
	$("#table-flight").DataTable({
	    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
	    "serverSide": true,
	    ordering: false,
	    "type": "POST",
	    "ajax": {
	        "url": "${pageContext.request.contextPath}/manage/shakemonitor/listTwo.do",
	        "type": "POST",
	        "data": function (search) {
	        	// 条件查询参数
	        	search.dutyId = $("#search-duty").val();
	        	search.engSn = $("#search-engSn").val();
	        }
	    },
	    "columns": [
	        {"data": "operater"},
	        {"data": "dutyName"},
	        {"data": "tail"},
	        null,
	        {"data": "engSn"},
	        null,
	        {"data": "flightDateTime"},
	        {"data": "zpoil"},
	        {"data": "zpoilSmoothed"}
	    ],
	    "ordering": false,
	    "searching": false,
	    "columnDefs": [
	    	{
	    		"targets": 3,
	            "data": function (row, type, val, meta) {
	                if (row.ePosition == 1) {
	                    return "左发";
	                } else if (row.ePosition == 2){
	                    return "右发";
	                } else {
	               	 return "-";
	                }
	            }
	        },
	    	{
	             "targets": 5,
	             "data": function (row, type, val, meta) {
	                 if (row.flightPhase == 1) {
	                     return "起飞";
	                 } else if (row.flightPhase == 2){
	                     return "巡航";
	                 } else {
	                	 return "-";
	                 }
	             }
	         }
	    ],
	    "ordering": false,
	    "searching": false,
	    "info": false,
	    "language": {
	        "lengthMenu": "显示 _MENU_ 条记录",
	        "paginate": {
	            "first": "首页",
	            "next": "下一页",
	            "previous": "上一页",
	            "last": "末页",
	        },
	        "zeroRecords": "",
	        "infoEmpty":"没有符合条件的数据",
	        "emptyTable":"没有符合条件的数据"
	    }
	});
	
	 /**
	  * 重载列表
	  */
	 function reloadTable(reset) {
	     var table1 = $('#table-engineer').DataTable();
	     var table2 = $('#table-flight').DataTable();
	     if (reset == true) {
	         table1.ajax.reload(null, true);
	         table2.ajax.reload(null, true);
	     } else {
	         table1.ajax.reload();
	         table2.ajax.reload();
	     }
	 }

	 // search 
	 function searchxx() {
		 reloadTable(true);
	 }
	 
	 /**
	  * 填充搜索选择框
	  */
	 $(function(){
		 $.post(
	             "${pageContext.request.contextPath}/manage/duty/allduty.do",
	             {},
	             function (response) {
	            	  $('#search-duty').html('');
	            	  $('#search-duty').append('<option value="">执管基地</option>');
	            	  for(var o in response.data){
	            	      $('#search-duty').append('<option value="'+response.data[o].id+'">'+response.data[o].name+'</option>');
	            	  }  
	             },
	             "json"
	      );
	 });
	 
</script>
</html>
