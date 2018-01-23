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
                    <button class="btn btn-block btn-default col-sm-1" data-toggle="modal" data-target="#engfleet-add-modal">
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
                        <th>签发日期</th>
                        <th>基地ID</th>
                        <th>机型</th>
                        <th>机号</th>
                        <th>发动机位置</th>
                        <th>发动机序号</th>
                        <th>LLP余寿</th>
                        <th>装机日期</th>
                        <th>HPTB余寿</th>
                        <th>ENG_余寿</th>
                        <th>下发日期_预计</th>
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
<jsp:include page='engfleetinfo.jsp'/>
<jsp:include page='engfleetadd.jsp'/>


<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    ordering: false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/engfleet/list.do",
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
        {"data": "ctime"},
        {"data": "duty"},
        {"data": "modle"},
        {"data": "tail"},
        {"data": "engPosit"},
        {"data": "engSn"},
        {"data": "llpLifeTime"},
        {"data": "inTime"},
        {"data": "hptbLifeTime"},
        {"data": "engLifeTime"},
        {"data": "uninstallTime"},
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
                    + ' data-toggle="modal" data-target="#engfleet-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deleteengfleet(' + data.id + ')">'
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
 $('#engfleet-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#editid').val(cellWaterWashData.id);
     modal.find('#editctime').val(cellWaterWashData.ctime);
     modal.find('#editduty').val(cellWaterWashData.duty);
     modal.find('#editmodle').val(cellWaterWashData.modle);
     modal.find('#edittail').val(cellWaterWashData.tail);
     modal.find('#editengPosit').val(cellWaterWashData.engPosit);
     modal.find('#editengSn').val(cellWaterWashData.engSn);
     modal.find('#editengPn').val(cellWaterWashData.engPn);
     modal.find('#editrating').val(cellWaterWashData.rating);
     modal.find('#editconfigPlane').val(cellWaterWashData.configPlane);
     modal.find('#editllpLifeTime').val(cellWaterWashData.llpLifeTime);
     modal.find('#editetsn').val(cellWaterWashData.etsn);
     modal.find('#editecsn').val(cellWaterWashData.ecsn);
     modal.find('#editsvTime').val(cellWaterWashData.svTime);
     modal.find('#editinTime').val(cellWaterWashData.inTime);
     modal.find('#edittsi').val(cellWaterWashData.tsi);
     modal.find('#editcsi').val(cellWaterWashData.csi);
     modal.find('#edittsr').val(cellWaterWashData.tsr);
     modal.find('#editcsr').val(cellWaterWashData.csr);
     modal.find('#edittso').val(cellWaterWashData.tso);
     modal.find('#editcso').val(cellWaterWashData.cso);
     modal.find('#editllp211sb').val(cellWaterWashData.llp211sb);
     modal.find('#edithptbLifeTime').val(cellWaterWashData.hptbLifeTime);
     modal.find('#editengLifeTime').val(cellWaterWashData.engLifeTime);
     modal.find('#edituninstallTime').val(cellWaterWashData.uninstallTime);
     modal.find('#editremark').val(cellWaterWashData.remark);
 }).on('hide.bs.modal', function (event) {
     cellUserData = null;
 });
 // edit user
 function editengfleet() {
		var id = $("#editid").val();
		var duty = $("#editduty").val();
		var modle = $("#editmodle").val();
		var tail= $("#edittail").val();
		var engPosit = $("#editengPosit").val();
		var engSn = $("#editengSn").val();
		var engPn = $("#editengPn").val();
		var rating = $("#editrating").val();
		var configPlane = $("#editconfigPlane").val();
		var llpLifeTime = $("#editllpLifeTime").val();
		var etsn = $("#editetsn").val();
		var ecsn = $("#editecsn").val();
		var svTime = $("#editsvTime").val();
		var inTime = $("#editinTime").val();
		var tsi = $("#edittsi").val();
		var csi = $("#editcsi").val();
		var tsr = $("#edittsr").val();
		var csr = $("#editcsr").val();
		var tso = $("#edittso").val();
		var cso = $("#editcso").val();
		var llp211sb = $("#editllp211sb").val();
		var hptbLifeTime = $("#edithptbLifeTime").val();
		var engLifeTime = $("#editengLifeTime").val();
		var uninstallTime = $("#edituninstallTime").val();
		var remark = $("#editremark").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/engfleet/saveOrUpdate.do",
		    {
		        "id": id,
		        "duty": duty,
		        "modle": modle,
		        "tail": tail,
		        "engPosit": engPosit,
		        "engSn": engSn,
		        "engPn": engPn,
		        "rating": rating,
		        "configPlane": configPlane,
		        "llpLifeTime": llpLifeTime,
		        "etsn": etsn,
		        "ecsn": ecsn,
		        "svTime":svTime,
		        "inTime":inTime,
		        "tsi":tsi,
		        "csi":csi,
		        "tsr":tsr,
		        "csr":csr,
		        "tso":tso,
		        "cso":cso,
		        "llp211sb":llp211sb,
		        "hptbLifeTime":hptbLifeTime,
		        "engLifeTime":engLifeTime,
		        "uninstallTime":uninstallTime,
		        "remark":remark
		    },
		    function (res) {
		    	 $('#engfleet-info-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
		reloadTable(true);
	}
 
 // add user
 function addengfleet() {
		var duty = $("#addduty").val();
		var modle = $("#addmodle").val();
		var tail= $("#addtail").val();
		var engPosit = $("#addengPosit").val();
		var engSn = $("#addengSn").val();
		var engPn = $("#addengPn").val();
		var rating = $("#addrating").val();
		var configPlane = $("#addconfigPlane").val();
		var llpLifeTime = $("#addllpLifeTime").val();
		var etsn = $("#addetsn").val();
		var ecsn = $("#addecsn").val();
		var svTime = $("#addsvTime").val();
		var inTime = $("#addinTime").val();
		var tsi = $("#addtsi").val();
		var csi = $("#addcsi").val();
		var tsr = $("#addtsr").val();
		var csr = $("#addcsr").val();
		var tso = $("#addtso").val();
		var cso = $("#addcso").val();
		var llp211sb = $("#addllp211sb").val();
		var hptbLifeTime = $("#addhptbLifeTime").val();
		var engLifeTime = $("#addengLifeTime").val();
		var uninstallTime = $("#adduninstallTime").val();
		var remark = $("#addremark").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/engfleet/saveOrUpdate.do",
		    {
		        "duty": duty,
		        "modle": modle,
		        "tail": tail,
		        "engPosit": engPosit,
		        "engSn": engSn,
		        "engPn": engPn,
		        "rating": rating,
		        "configPlane": configPlane,
		        "llpLifeTime": llpLifeTime,
		        "etsn": etsn,
		        "ecsn": ecsn,
		        "svTime":svTime,
		        "inTime":inTime,
		        "tsi":tsi,
		        "csi":csi,
		        "tsr":tsr,
		        "csr":csr,
		        "tso":tso,
		        "cso":cso,
		        "llp211sb":llp211sb,
		        "hptbLifeTime":hptbLifeTime,
		        "engLifeTime":engLifeTime,
		        "uninstallTime":uninstallTime,
		        "remark":remark
		    },
		    function (response) {
		    	 $('#engfleet-add-modal').modal('hide');
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
 function deleteengfleet(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/engfleet/delete.do",
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
