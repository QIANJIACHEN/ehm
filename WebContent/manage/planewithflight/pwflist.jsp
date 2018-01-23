<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
</head>
<body class="hold-transition" >

<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">

        <div class="box-header pwf-border">
            <div class="row">
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-planeId">
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-flightId">
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchpwf()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button style="background:#f4f4f4;border-color:#ddd;color:black" id="i" class="btn btn-block btn-primary col-sm-1" data-toggle="modal" data-target="#pwf-add-modal">
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
                        <th style="display: none">ID</th>
                        <th>机号</th>
                        <th>航班</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page='pwfinfo.jsp'/>
<jsp:include page='pwfadd.jsp'/>

<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    "ordering": false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/pwf/list.do",
        "type": "POST",
        "data": function (search) {
        	// 条件查询参数
        	search.planeId = $("#search-planeId").val();
        	search.flightId = $("#search-flightId").val();
        }
    },
    "columns": [
        {"data": "id","visible": false},
        {"data": "tail"},
        {"data": "number"},
        {"data": "ctime"}
    ],
    "ordering": false,
    "searching": false,
     "columnDefs": [
    	 {
          	"targets" : 1,
  			"render" : function(data, type, row) {
  				return "<a href='javascript:void(0)' title1='10' tail='"+(data == null ? '-' : data)+"' onclick='jumpPlane(this)'>" + (data == null ? '-' : data)
  						+ "</a>";
  			}
  		},
         {
            "targets": 4,
            "data": function (row, type, val, meta) {
                return row;
            },
            "render": function (data, type, full, meta) {
                var table = $("#table-list").DataTable();
                var result = '<div class="btn-group open">'
                    + '<button class="btn btn-default btn-sm "'
                    + ' data-toggle="modal" data-target="#pwf-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deletepwf(' + data.id + ')">'
                    + '<i class="fa fa-trash"></i></button></div>';
                return result;
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
 * 存储点击行的内容
 */
var cellData = null;
 $('#table-list tbody').on('click', 'td', function () {
     var table = $('#table-list').DataTable();
     cellData = table.cell(this).data();
 });

/**
 * 编辑按钮   → 信息填充
 */
 $('#pwf-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#id').val(cellData.id);
 }).on('hide.bs.modal', function (event) {
     cellData = null;
 });
 
/**
 * edit 
 */
 function editpwf() {
	 	var id = cellData.id;
		var planeId = $("#editplaneId").val();
		var flightId = $("#editflightId").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/pwf/update.do",
		    {
		        "id": id,
		        "planeId": planeId,
		        "flightId": flightId
		    },
		    function (response) {
		    	 $('#pwf-info-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
	}
 
/**
 * add
 */
 function addpwf() {
	 	var planeId = $("#addplaneId").val();
		var flightId = $("#addflightId").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/pwf/save.do",
		    {
		    	"planeId": planeId,
		        "flightId": flightId
		    },
		    function (response) {
		    	 $('#pwf-add-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
	}
	
/**
 * 清除弹窗原数据
 */
 $("#pwf-add-modal").on("hidden.bs.modal", function() {
     $('#reset').click();
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
 function searchpwf() {
	 reloadTable(true);
 }
 
/**
 * delete
 */
 function deletepwf(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/pwf/delete.do",
             {
                 "id": id,
             },
             function (response) {
                 $('#mood-modal').modal('hide');
                 reloadTable(true);
             },
             "json"
         );
     };
 }
 
 /**
  * 填充选择框
  */
  $('#i').click(function(){
 	 $.post(
              "${pageContext.request.contextPath}/manage/dataplane/allplane.do",
              {},
              function (response) {
             	  $('#addplaneId').html('');
             	  for(var o in response.data){
             	      $('#addplaneId').append('<option value="'+response.data[o].id+'">'+response.data[o].tail+'</option>');
             	  }  
              },
              "json"
       );
  })
  $('#i').click(function(){
 	 $.post(
              "${pageContext.request.contextPath}/manage/flight/allflight.do",
              {},
              function (response) {
             	  $('#addflightId').html('');
             	  for(var o in response.data){
             	      $('#addflightId').append('<option value="'+response.data[o].id+'">'+response.data[o].number+'</option>');
             	  }  
              },
              "json"
       );
  })
   $('#table-list tbody').on('click', 'td', function () {
	 $.post(
             "${pageContext.request.contextPath}/manage/dataplane/allplane.do",
             {},
             function (response) {
            	  $('#editplaneId').html('');
            	  for(var o in response.data){
            	      $('#editplaneId').append('<option value="'+response.data[o].id+'">'+response.data[o].tail+'</option>');
            	  }  
             },
             "json"
      );
 });
   $('#table-list tbody').on('click', 'td', function () {
	 $.post(
             "${pageContext.request.contextPath}/manage/flight/allflight.do",
             {},
             function (response) {
            	  $('#editflightId').html('');
            	  for(var o in response.data){
            	      $('#editflightId').append('<option value="'+response.data[o].id+'">'+response.data[o].number+'</option>');
            	  }  
             },
             "json"
      );
 });
   $(function(){
		 $.post(
	             "${pageContext.request.contextPath}/manage/dataplane/allplane.do",
	             {},
	             function (response) {
	            	  $('#search-planeId').html('');
	            	  $('#search-planeId').append('<option value="">全部机号</option>');
	            	  for(var o in response.data){
	            	      $('#search-planeId').append('<option value="'+response.data[o].id+'">'+response.data[o].tail+'</option>');
	            	  }  
	             },
	             "json"
	      );
	});
   $(function(){
		 $.post(
	             "${pageContext.request.contextPath}/manage/flight/allflight.do",
	             {},
	             function (response) {
	            	  $('#search-flightId').html('');
	            	  $('#search-flightId').append('<option value="">全部航班</option>');
	            	  for(var o in response.data){
	            	      $('#search-flightId').append('<option value="'+response.data[o].id+'">'+response.data[o].number+'</option>');
	            	  }  
	             },
	             "json"
	      );
	});
 
</script>
</body>
</html>
