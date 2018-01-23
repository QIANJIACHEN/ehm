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
                    <input type="text" class=" form-control" id="search-key" placeholder="发动机号">
                </div>
 
                

                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchUser()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                    
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default col-sm-1" data-toggle="modal" data-target="#waterwash-add-modal">
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
                    	<th>ID</th>
                        <th>发动机号</th>
                        <th>删除日期</th>
                        <th>删除原因</th>
                        <th>状态</th>
                        <th>工厂</th>
                        <th>到达日期</th>
                        <th>原始厂商</th>
                        <th>完成计划时间</th>
                        <th>完成时间</th>
                        <th>SHIP</th>
                        <th>TAT</th>
                        <th>操作</th>
                    </tr>
                    </thead>
<!--  
                    <tbody>
                    	<tr>
                    		<td>2017年12月</td>
                    		<td>多云</td>
                    		<td></td>
                    		<td></td>
                    		<td></td>
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
                    		<td>2017年12月</td>
                    		<td>小雨</td>
                    		<td></td>
                    		<td></td>
                    		<td></td>
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
-->
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page='engspareinfo.jsp'/>
<jsp:include page='engspareadd.jsp'/>


<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    ordering: false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/engspare/list.do",
        "type": "POST",
        "data": function (d) {
        	// 条件查询参数
        	d.key = $("#search-key").val();
        	
        	// d.bzStatus = $("#search-bz-status").val();
            // d.accountStatus = $("#search-account-status").val();
        }
    },
    "columns": [
    	{"data":"id"},
        {"data": "engSn"},
        {"data": "removeDate"},
        {"data": "removalCause"},
        {"data": "condition_"},
        {"data": "factory"},
        {"data": "arrived"},
        {"data": "induction"},
        {"data": "completePlan"},
        {"data": "complete"},
        {"data": "ship"},
        {"data": "tat"},
        null
    ],
    "ordering": false,
    "searching": false,
    "columnDefs": [
        {
            "targets": 12,
            "data": function (row, type, val, meta) {
                return row;
            },
            "render": function (data, type, full, meta) {
                var table = $("#table-list").DataTable();
                var result = '<div class="btn-group open">'
                    + '<button class="btn btn-default btn-sm "'
                    + ' data-toggle="modal" data-target="#waterwash-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deletewaterwash(' + data.id + ')">'
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

// 编辑按钮 → 用户信息填充
 $('#waterwash-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#editid').val(cellWaterWashData.id);
     modal.find('#editengSn').val(cellWaterWashData.engSn);
     modal.find('#editremoveDate').val(cellWaterWashData.removeDate);
     modal.find('#editremovalCause').val(cellWaterWashData.removalCause);
     modal.find('#editcondition_').val(cellWaterWashData.condition_);
     modal.find('#editfactory').val(cellWaterWashData.factory);
     modal.find('#editinduction').val(cellWaterWashData.induction);
     modal.find('#editarrived').val(cellWaterWashData.arrived);
     modal.find('#editcompletePlan').val(cellWaterWashData.completePlan);
     modal.find('#editcomplete').val(cellWaterWashData.complete);
     modal.find('#editship').val(cellWaterWashData.ship);
     modal.find('#edittat').val(cellWaterWashData.tat);
 }).on('hide.bs.modal', function (event) {
     cellUserData = null;
 });
 // edit user
 function editwaterwash() {
		var id = $("#editid").val();
		var engSn = $("#editengSn").val();
		var removeDate = $("#editremoveDate").val();
		var removalCause= $("#editremovalCause").val();
		var condition_ = $("#editcondition_").val();
		var factory = $("#editfactory").val();
		var arrived = $("#editarrived").val();
		var induction = $("#editinduction").val();
		var completePlan = $("#editcompletePlan").val();
		var complete = $("#editcomplete").val();
		var ship = $("#editship").val();
		var tat = $("#edittat").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/engspare/saveOrUpdate.do",
		    {
		        "id": id,
		        "engSn": engSn,
		        "removeDate": removeDate,
		        "removalCause": removalCause,
		        "condition_": condition_,
		        "factory": factory,
		        "arrived": arrived,
		        "induction": induction,
		        "completePlan": completePlan,
		        "complete": complete,
		        "ship": ship,
		        "tat": tat
		    },
		    function (res) {
		    	 $('#waterwash-info-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
		reloadTable(true);
	}
 
 // add user
 function addwaterwash() {
		var engSn = $("#addengSn").val();
		var removeDate = $("#addremoveDate").val();
		var removalCause= $("#addremovalCause").val();
		var condition_ = $("#addcondition_").val();
		var factory = $("#addfactory").val();
		var arrived = $("#addarrived").val();
		var induction = $("#addinduction").val();
		var completePlan = $("#addcompletePlan").val();
		var complete = $("#addcomplete").val();
		var ship = $("#addship").val();
		var tat = $("#addtat").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/engspare/saveOrUpdate.do",
		    {
		        "engSn": engSn,
		        "removeDate": removeDate,
		        "removalCause": removalCause,
		        "condition_": condition_,
		        "factory": factory,
		        "arrived": arrived,
		        "induction": induction,
		        "completePlan": completePlan,
		        "complete": complete,
		        "ship": ship,
		        "tat": tat
		    },
		    function (response) {
		    	 $('#waterwash-add-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
		reloadTable(true);
	}
 
 /**
  * 重载列表
  */
 function reloadTable(reset) {
     var table = $('#table-list').DataTable();
     if (reset == true) {
    	 window.location.reload(true);
        // table.ajax.reload(null, true);
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
 function deletewaterwash(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/engspare/delete.do",
             {
                 "id": id,
             },
             function (response) {
                 $('#mood-modal').modal('hide');
                 reloadTable(true);
             },
             "json"
         );
         reloadTable(true);
     };
 }
 
</script>
</body>
</html>
