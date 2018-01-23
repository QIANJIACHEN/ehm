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
                
                    <input type="text" class=" form-control" id="search-key" placeholder="engSnUsed">
                
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
                    	<th>ID</th>
                        <th>ENG_SN_USED</th>
                        <th>IIN</th>
                        <th>LLP_PN</th>
                        <th>LLP_SN</th>
                        <th>PLANE_TYPE</th>
                        <th>LIMIT_SPECIAL</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page='llphistoryinfo.jsp'/>
<jsp:include page='llphistoryadd.jsp'/>



<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    ordering: false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/llpactivity/llphistory.do",
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
        {"data": "engSnUsed"},
        {"data": "iin"},
        {"data": "llpPn"},
        {"data": "llpSn"},
        {"data": "planeType"},
        {"data": "limitSpecial"},
        {"data": "ctime"},
        null
    ],
    "ordering": false,
    "searching": false,
    "columnDefs": [
        {
            "targets": 8,
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

// 编辑按钮 → 用户信息填充
 $('#ruleinspection-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#editid').val(cellWaterWashData.id);
     modal.find('#editengSnUsed').val(cellWaterWashData.engSnUsed);
     modal.find('#editiin').val(cellWaterWashData.iin);
     modal.find('#editllpPn').val(cellWaterWashData.llpPn);
     modal.find('#editllpSn').val(cellWaterWashData.llpSn);
     modal.find('#editplaneType').val(cellWaterWashData.planeType);
     modal.find('#editonlimitSpecial').val(cellWaterWashData.limitSpecial);
 }).on('hide.bs.modal', function (event) {
     cellUserData = null;
 });
 
 // edit user
 function editruleinspection() {
	    var type = $("#edittype").val();
		var id = $("#editid").val();
		var engSnUsed = $("#editengSnUsed").val();
		var iin = $("#editiin").val();
		var llpPn = $("#editllpPn").val();
		var llpSn = $("#editllpSn").val();
		var planeType = $("#editplaneType").val();
		var engPn = $("#editengPn").val();
		var onDate = $("#editonDate").val();
		var onEtsn = $("#editonEtsn").val();
		var onEcsn = $("#editonEcsn").val();
		var onPtsn = $("#editonPtsn").val();
		var onPcsn = $("#editonPcsn").val();
		var limitSpecial = $("#editlimitSpecial").val();
		var remark = $("#editremark").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/llpactivity/llphistoryaddupdata.do",
		    {
		    	"type" : type,
		        "id": id,
		        "engSnUsed": engSnUsed,
		        "iin":iin,
		        "llpPn": llpPn,
		        "llpSn": llpSn,
		        "planeType": planeType,
		        "engPn": engPn,
		        "onDate": onDate,
		        "onEtsn": onEtsn,
		        "onEcsn": onEcsn,
		        "onPtsn": onPtsn,
		        "onPcsn": onPcsn,
		        "limitSpecial": limitSpecial,
		        "remark": remark
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
 
 // add user
 function addruleinspection() {
	    var type = $('#addtype').val();
		var engSnUsed = $("#addengSnUsed").val();
		var iin = $("#addiin").val();
		var llpPn = $("#addllpPn").val();
		var llpSn = $("#addllpSn").val();
		var planeType = $("#addplaneType").val();
		var engPn = $("#addengPn").val();
		var onDate = $("#addonDate").val();
		var onEtsn = $("#addonEtsn").val();
		var onEcsn = $("#addonEcsn").val();
		var onPtsn = $("#addonPtsn").val();
		var onPcsn = $("#addonPcsn").val();
		var offDate = $("#addoffDate").val();
		var offEtsn = $("#addoffEtsn").val();
		var offEcsn = $("#addoffEcsn").val();
		var offPtsn = $("#addoffPtsn").val();
		var offPcsn = $("#addoffPcsn").val();
		var limitSpecial = $("#addlimitSpecial").val();
		var remark = $("#addremark").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/llpactivity/llphistoryaddupdata.do",
		    {
		    	"type" : type,
		        "engSnUsed": engSnUsed,
		        "iin":iin,
		        "llpPn": llpPn,
		        "llpSn": llpSn,
		        "planeType": planeType,
		        "engPn": engPn,
		        "onDate": onDate,
		        "onEtsn": onEtsn,
		        "onEcsn": onEcsn,
		        "onPtsn": onPtsn,
		        "onPcsn": onPcsn,
		        "limitSpecial": limitSpecial,
		        "remark": remark
		    },
		    function (response) {
		    	 $('#ruleinspection-add-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
		$('#ruleinspection-add-modal').modal('hide');
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
 function deleteruleinspection(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/llpactivity/deletehistory.do",
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
