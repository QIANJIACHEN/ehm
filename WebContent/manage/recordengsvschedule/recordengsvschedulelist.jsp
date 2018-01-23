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
                    <input type="text" class=" form-control" id="search-key" placeholder="工厂">
                </div>
 
                

                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchRecordengsvschedule()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                    
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default col-sm-1" data-toggle="modal" data-target="#recordEngSvSchedule-add-modal">
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
                        <th>拆发时间</th>
                        <th>工厂</th>
                        <th>到达时间</th>
                        <th>INDUCTION</th>
                        <th>计划完成时间</th>
                        <th>完成时间</th>
                        <th>送还时间</th>
                        <th>花费</th>
                        <th>耗时</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page='recordengsvscheduleinfo.jsp'/>
<jsp:include page='recordengsvscheduleadd.jsp'/>



<script type="text/javascript">

 $("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    ordering: false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/recordengsvschedule/list.do",
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
        {"data": "removeDate"},
        {"data": "factory"},
        {"data": "arrived"},
        {"data": "induction"},
        {"data": "completePlan"},
        {"data": "complete"},
        {"data": "ship"},
        {"data": "cost"},
        {"data": "tat"},
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
                    + ' data-toggle="modal" data-target="#recordengsvschedule-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deleterecordengsvschedule(' + data.id + ')">'
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
 
//add controlfleetengspare
function addrecordengsvschedule() {
	var removeDate = $("#addremoveDate").val();
	var factory = $("#addfactory").val();
	var arrived = $("#addarrived").val();
	var induction = $("#addinduction").val();
	var completePlan = $("#addcompletePlan").val();
	var complete = $("#addcomplete").val();
	var ship = $("#addship").val();
	var cost = $("#addcost").val();
	var tat = $("#addtat").val();
	decimalcost(cost);
	$.post(
	    "${pageContext.request.contextPath}/manage/recordengsvschedule/save.do",
	    {
	        "removeDate": removeDate,
	        "factory":factory,
	        "arrived": arrived,
	        "induction": induction,
	        "completePlan": completePlan,
	        "complete": complete,
	        "ship": ship,
	        "cost": cost,
	        "tat": tat
	    },
	    function (response) {
	    	 $('#recordEngSvSchedule-add-modal').modal('hide');
	         reloadTable(true);
	    },
	    "json"
	);
	reloadTable(true);
}

//存储点击行的内容
var recordengsvscheduleData = null;
 $('#table-list tbody').on('click', 'td', function () {
     var table = $('#table-list').DataTable();
     recordengsvscheduleData = table.cell(this).data();
 });

// 编辑按钮 → 用户信息填充
 $('#recordengsvschedule-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#editid').val(recordengsvscheduleData.id);
     modal.find('#editremoveDate').val(recordengsvscheduleData.removeDate);
     modal.find('#editfactory').val(recordengsvscheduleData.factory);
     modal.find('#editarrived').val(recordengsvscheduleData.arrived);
     modal.find('#editinduction').val(recordengsvscheduleData.induction);
     modal.find('#editcompletePlan').val(recordengsvscheduleData.completePlan);
     modal.find('#editcomplete').val(recordengsvscheduleData.complete);
     modal.find('#editship').val(recordengsvscheduleData.ship);
     modal.find('#editcost').val(recordengsvscheduleData.cost);
     modal.find('#edittat').val(recordengsvscheduleData.tat);
 }).on('hide.bs.modal', function (event) {
     cellUserData = null;
 });
 
 // edit recordengsvschedule
 function editrecordengsvschedule() {
		var id = $("#editid").val();
		var removeDate = $("#editremoveDate").val();
		var factory = $("#editfactory").val();
		var arrived = $("#editarrived").val();
		var induction = $("#editinduction").val();
		var completePlan = $("#editcompletePlan").val();
		var complete = $("#editcomplete").val();
		var ship = $("#editship").val();
		var cost = $("#editcost").val();
		var tat = $("#edittat").val();
		decimalcost(cost);
		$.post(
		    "${pageContext.request.contextPath}/manage/recordengsvschedule/update.do",
		    {
		        "id": id,
		        "removeDate": removeDate,
		        "factory":factory,
		        "arrived": arrived,
		        "induction": induction,
		        "completePlan": completePlan,
		        "complete": complete,
		        "ship": ship,
		        "cost": cost,
		        "tat": tat
		    },
		    function (res) {
		    	 $('#recordengsvschedule-info-modal').modal('hide');
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
        table.ajax.reload(null, true);
    } else {
        table.ajax.reload();
    }
}

/*
 * 删除数据
 */
//delete
function deleterecordengsvschedule(id) {
    if (confirm("你确定要删除吗？")) {
        $.post(
            "${pageContext.request.contextPath}/manage/recordengsvschedule/delete.do",
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

//search 
function searchRecordengsvschedule() {
	 var table = $('#table-list').DataTable();
	 table.ajax.reload(null, true);
}

function decimalcost(cost) {
	if(cost.indexOf(".")>-1) {
		if(cost.substr(".").length>3){
			alert("花费小数点后只可以有两位");
			return false;
		}
		if(cost.substr(0,".").length>10) {
			alert("花费数量超过限制");
			return false;
		}
	}else{
		if(cost.length>10) {
			alert("花费数量超过限制");
			return false;
		}
	}

}

</script>
</body>
</html>
