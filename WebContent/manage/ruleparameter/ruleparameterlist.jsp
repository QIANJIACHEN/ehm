<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
</head>
<body class="hold-transition" >

<!-- Content Wrapper. Contains page content -->
<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">

        <div class="box-header with-border">
            <div class="row">
            
                <div class="col-xs-2" style="min-width: 160px">
                <!--  
                    <input type="text" class=" form-control" id="search-key" placeholder="name">
                -->
                </div>
 
                

                <div class="col-xs-1" style="min-width: 160px">
                	<!-- 
                    <button class="btn btn-block btn-default" onclick="searchUser()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                    -->
                </div>
                    
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default col-sm-1" data-toggle="modal" data-target="#ruleparameter-add-modal">
                        <i class="fa fa-plus"></i>
                       	 添加
                    </button>
                </div>
            </div>
        </div>
        <div class="box-body" style="padding-top:20px">

            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table id="table-list" class="table  table-hover">
                    <thead>
                    <tr>
                    	<th>id</th>
                        <th>上级ID</th>
                        <th>类型</th>
                        <th>值</th>
                        <th>注释</th>
                        <th>创建时间</th>
                        <th>是否加入计算</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page='ruleparameterinfo.jsp'/>
<jsp:include page='ruleparameteradd.jsp'/>



<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    ordering: false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/ruleparameter/list.do",
        "type": "POST",
        "data": function (d) {
        	// 条件查询参数
        	//d.key = $("#search-key").val();
        	
        	// d.bzStatus = $("#search-bz-status").val();
            // d.accountStatus = $("#search-account-status").val();
        }
    },
    "columns": [
    	{"data": "id"},
        {"data": "parentId"},
        {"data": "type"},
        {"data": "val"},
        {"data": "annotation"},
        {"data": "ctime"},
        {"data": "isCalculate"}
    ],
    "ordering": false,
    "searching": false,
    "columnDefs": [
        {
            "targets": 7,
            "data": function (row, type, val, meta) {
                return row;
            },
            "render": function (data, type, full, meta) {
                var table = $("#table-list").DataTable();
                var result = '<div class="btn-group open">'
                    + '<button class="btn btn-default btn-sm "'
                    + ' data-toggle="modal" data-target="#ruleparameter-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deleteruleparameter(' + data.id + ')">'
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

// 存储点击行的内容
var cellWaterWashData = null;
 $('#table-list tbody').on('click', 'td', function () {
     var table = $('#table-list').DataTable();
     cellWaterWashData = table.cell(this).data();
 });

// 编辑按钮 → 信息填充
 $('#ruleparameter-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#editparentId').val(cellWaterWashData.parentId);
     modal.find('#edittype').val(cellWaterWashData.type);
     modal.find('#editval').val(cellWaterWashData.val);
     modal.find('#editannotation').val(cellWaterWashData.annotation);
 }).on('hide.bs.modal', function (event) {
     cellUserData = null;
 });
 
 // edit
 function editruleparameter() {
		var id = cellWaterWashData.id;
		var parentId = $("#editparentId").val();
		var type = $("#edittype").val();
		var val= $("#editval").val();
		var annotation = $("#editannotation").val();
		var isCalculate = $("#editisCalculate");
		$.post(
		    "${pageContext.request.contextPath}/manage/ruleparameter/update.do",
		    {
		        "id": id,
		        "parentId": parentId,
		        "type": type,
		        "val": val,
		        "annotation": annotation,
		        "isCalculate":isCalculate
		    },
		    function (res) {
		    	 $('#ruleparameter-info-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
	}
 
 // add
 function addruleparameter() {
		var parentId = $("#addparentId").val();
		var type = $("#addtype").val();
		var val= $("#addval").val();
		var annotation = $("#addannotation").val();
		var isCalculate = $("#addisCalculate");
		$.post(
		    "${pageContext.request.contextPath}/manage/ruleparameter/save.do",
		    {
		        "parentId": parentId,
		        "type": type,
		        "val": val,
		        "annotation": annotation,
		        "isCalculate":isCalculate
		    },
		    function (response) {
		    	 $('#ruleparameter-add-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
	}
 
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

 // search 
 function searchxx() {
	 reloadTable(true);
 }
 
// delete
 function deleteruleparameter(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/ruleparameter/delete.do",
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
 
</script>
</body>
</html>
