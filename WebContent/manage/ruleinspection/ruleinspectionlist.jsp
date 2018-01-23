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
                    <input type="text" class=" form-control" id="search-key" placeholder="name">
                </div>
 
                

                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchUser()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                    
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default col-sm-1" data-toggle="modal" data-target="#ruleinspection-add-modal">
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
                        <th>名称</th>
                        <th>录入人</th>
                        <th>状态</th>
                        <th>发动机序列</th>
                        <th>发动机类型</th>
                        <th>发动机模型</th>
                        <th>发动机构型</th>
                        <th>优先级</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page='ruleinspectioninfo.jsp'/>
<jsp:include page='ruleinspectionadd.jsp'/>



<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    ordering: false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/ruleinspection/list.do",
        "type": "POST",
        "data": function (d) {
        	// 条件查询参数
        	d.key = $("#search-key").val();
        	
        	// d.bzStatus = $("#search-bz-status").val();
            // d.accountStatus = $("#search-account-status").val();
        }
    },
    "columns": [
    	{"data": "id"},
        {"data": "name"},
        {"data": "userId"},
        {"data": "type"},
        {"data": "engSeries"},
        {"data": "engType"},
        {"data": "engModel"},
        {"data": "engConfig"},
        {"data": "orderId"},
        {"data": "ctime"},
        null
    ],
    "ordering": false,
    "searching": false,
    "columnDefs": [
        {
            "targets": 10,
            "data": function (row, type, val, meta) {
                return row;
            },
            "render": function (data, type, full, meta) {
                var table = $("#table-list").DataTable();
                var result = '<div class="btn-group open">'
                    + '<button class="btn btn-default btn-sm "'
                    + ' data-toggle="modal" data-target="#ruleinspection-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deleteruleinspection(' + data.id + ')">'
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
 $('#ruleinspection-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#editid').val(cellWaterWashData.id);
     modal.find('#editname').val(cellWaterWashData.name);
     modal.find('#edituserId').val(cellWaterWashData.userId);
     modal.find('#edittype').val(cellWaterWashData.type);
     modal.find('#editcontent').val(cellWaterWashData.content);
     modal.find('#editengSeries').val(cellWaterWashData.engSeries);
     modal.find('#editengType').val(cellWaterWashData.engType);
     modal.find('#editengModel').val(cellWaterWashData.engModel);
     modal.find('#editengConfig').val(cellWaterWashData.engConfig);
     modal.find('#editorderId').val(cellWaterWashData.orderId);
     modal.find('#editctime').val(cellWaterWashData.ctime);
 }).on('hide.bs.modal', function (event) {
     cellUserData = null;
 });
 
 // edit
 function editruleinspection() {
		var id = $("#editid").val();
		var name = $("#editname").val();
		var userId = $("#edituserId").val();
		var type= $("#edittype").val();
		var content = $("#editcontent").val();
		var engSeries = $("#editengSeries").val();
		var engType = $("#editengType").val();
		var engModel = $("#editengModel").val();
		var engConfig = $("#editengConfig").val();
		var orderId = $("#editorderId").val();
		var ctime = $("#editctime").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/ruleinspection/saveOrUpdate.do",
		    {
		        "id": id,
		        "name": name,
		        "userId": userId,
		        "type": type,
		        "content": content,
		        "engSeries": engSeries,
		        "engType": engType,
		        "engModel": engModel,
		        "engConfig": engConfig,
		        "orderId": orderId,
		        "ctime": ctime
		    },
		    function (res) {
		    	 $('#ruleinspection-info-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
		$('#ruleinspection-info-modal').modal('hide');
        reloadTable(true);
	}
 
 // add 
 function addruleinspection() {
	 	var id = $("#addid").val();
		var name = $("#addname").val();
		var userId = $("#adduserId").val();
		var type= $("#addtype").val();
		var content = $("#addcontent").val();
		var engSeries = $("#addengSeries").val();
		var engType = $("#addengType").val();
		var engModel = $("#addengModel").val();
		var engConfig = $("#addengConfig").val();
		var orderId = $("#addorderId").val();
		var ctime = $("#addctime").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/ruleinspection/saveOrUpdate.do",
		    {
		    	"id": id,
		        "name": name,
		        "userId": userId,
		        "type": type,
		        "content": content,
		        "engSeries": engSeries,
		        "engType": engType,
		        "engModel": engModel,
		        "engConfig": engConfig,
		        "orderId": orderId,
		        "ctime": ctime
		    },
		    function (response) {
		    	 $('#ruleinspection-add-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
		$('#ruleinspection-add-modal').modal('hide');
        reloadTable(true);
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
 function searchUser() {
	 var table = $('#table-list').DataTable();
	 table.ajax.reload(null, true);
 }
 
// delete
 function deleteruleinspection(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/ruleinspection/delete.do",
             {
                 "id": id,
             },
             function (response) {
                 $('#mood-modal').modal('hide');
                 reloadTable(true);
             },
             "json"
         );
         $('#mood-modal').modal('hide');
         reloadTable(true);
     };
     
 }
 
</script>
</body>
</html>
