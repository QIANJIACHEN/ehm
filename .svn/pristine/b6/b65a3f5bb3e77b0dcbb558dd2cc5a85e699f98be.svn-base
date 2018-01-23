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
                    <input type="text" class=" form-control" id="search-operater" placeholder="运营人">
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-duty">
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchoil()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                <div class="col-xs-1 pull-right" style="min-width:150px;padding-bottom:5px">
        			<a href="oilconsumereport.do" class="btn btn-block btn-primary">生成报表</a>
        		</div>
            </div>
        </div>
        <div class="box-body" style="padding-top:20px">
			<div class="dataTables_wrapper form-inline dt-bootstrap">
                <table id="table-list" class="table  table-hover">
                    <thead>
                    <tr>
                        <th>运营人</th>
			            <th>执管基地</th>
			            <th>机号</th>
			            <th>H_HIGHLAND</th>
			            <th>飞行日期</th>
			            <th>1发加油时间差</th>
			            <th>2发加油时间差</th>
			            <th>1发滑油消耗率</th>
			            <th>2发滑油消耗率</th>
                    </tr>
                    </thead>
                    <tbody>
                </table>
            </div>
            
        </div>
    </div>
</div>

<script type="text/javascript">
	$("#table-list").DataTable({
	    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
	    "serverSide": true,
	    "ordering": false,
	    "type": "POST",
	    "ajax": {
	        "url": "${pageContext.request.contextPath}/manage/oilconsume/list.do",
	        "type": "POST",
	        "data": function (search) {
	        	// 条件查询参数
	        	search.operater = $('#search-operater').val();
	        	search.duty = $('#search-duty').val();
	        }
	    },
	    "columns": [
	        {"data": "operater"},
	        {"data": "dutyName"},
	        {"data": "tail"},
	        null,
	        {"data": "fltTime"},
	        {"data": "refuelTimeDifference1"},
	        {"data": "refuelTimeDifference2"},
	        {"data": "oilConsumeRate1"},
	        {"data": "oilConsumeRate2"}
	    ],
	    "ordering": false,
	    "searching": false,
	    "columnDefs": [
	    	{
	         	"targets" : 2,
	 			"render" : function(data, type, row) {
	 				return "<a href='javascript:void(0)' title1='15' tail='"+(data == null ? '-' : data)+"' onclick='jumpPlane(this)'>" + (data == null ? '-' : data)
	 						+ "</a>";
	 			}
	 		},
	         {
	            "targets": 3,
	            "data": function (row, type, val, meta) {
	                 if (row.hHighLand == 1) {
	                     return "是";
	                 } else if (row.hHighLand == 0){
	                     return "否";
	                 } else {
	                	 return "-";
	                 }
	             }
	         }
	    ],
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
	     var table = $('#table-list').DataTable();
	     if (reset == true) {
	         table.ajax.reload(null, true);
	     } else {
	         table.ajax.reload();
	     }
 	}
 
	 /**
	  * search
	  */
	  function searchoil() {
	 	 reloadTable(true);
	  }
	
	 $(function(){
		 $.post(
	             "${pageContext.request.contextPath}/manage/duty/allduty.do",
	             {},
	             function (response) {
	            	  $('#search-duty').html('');
	            	  $('#search-duty').append('<option value="">所属基地</option>');
	            	  for(var o in response.data){
	            	      $('#search-duty').append('<option value="'+response.data[o].id+'">'+response.data[o].name+'</option>');
	            	  }  
	             },
	             "json"
	      );
	 });
	
</script>
</body>
</html>
