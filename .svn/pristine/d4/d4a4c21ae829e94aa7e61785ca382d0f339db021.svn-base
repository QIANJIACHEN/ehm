<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
</head>
<script type="text/javascript" src="../../js/ocupload.js"></script>
<body class="hold-transition" >

<!-- Content Wrapper. Contains page content -->
<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">

        <div class="box-header with-border">
            <div class="row">
                <div class="col-xs-2" style="min-width: 160px">
                    <input type="text" class=" form-control" id="search-key" placeholder="发动机编号">
                </div>
                 
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchControlfleetengspare()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                    
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default col-sm-1" data-toggle="modal" data-target="#controlfleetengspare-add-modal">
                        <i class="fa fa-plus"></i>
                       	 添加
                    </button>
                </div>
                
                
                <div class="col-xs-1 pull-right" style="min-width: 160px">
                    <button id="export" class="btn btn-block btn-primary col-sm-1">
                        <i class="fa fa-mail-forward"></i>
                       	 导出数据
                    </button>
                </div>
                <div class="col-xs-1 pull-right" style="min-width: 160px">
                    <button id="inport" class="btn btn-block btn-primary">
                        <i class="fa fa-mail-reply"></i>
                       	 导入数据
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
                        <th>发动机ID</th>
                        <th>发动机编号</th>
                        <th>拆发时间</th>
                        <th>状态</th>
                        <th>INSTALL_PLAN</th>
                        <th>LLP_SAP</th>
                        <th>CONFIG_ACCESS</th>
                        <th>备注</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page='controfleetengspareinfo.jsp'/>
<jsp:include page='controfleetengspareadd.jsp'/>



<script type="text/javascript">
//获取发动机
$.post("${pageContext.request.contextPath}/manage/dataeng/allDataEng.do",function(res){
	res = JSON.parse(res);
	$(".engId").empty();
	$(".engId").append('<option value="0" >请选择</option>');
	
		$.each(res.data,function(index,item){
			   
		    $(".engId").append("<option value='"+item.id+"' engSn='"+item.engSn+"' engId='"+item.id+"'>"+item.engSn+"</option>");
		    
		});		
})


$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    ordering: false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/controlfleetengspare/list.do",
        "type": "POST",
        "data": function (d) {
        	// 条件查询参数
        	d.engSn = $("#search-key").val();
        	// d.bzStatus = $("#search-bz-status").val();
            // d.accountStatus = $("#search-account-status").val();
        }
    },
    "columns": [
    	{"data":"id"},
        {"data": "engId"},
        {"data": "engSn"},
        {"data": "removeDate"},
        {"data": "condition"},
        {"data": "installPlan"},
        {"data": "llpSap"},
        {"data": "configAccess"},
        {"data": "remark"},
        null
    ],
    "ordering": false,
    "searching": false,
    "columnDefs": [
        {
            "targets": 9,
            "data": function (row, type, val, meta) {
                return row;
            },
            "render": function (data, type, full, meta) {
                var table = $("#table-list").DataTable();
                var result = '<div class="btn-group open">'
                    + '<button class="btn btn-default btn-sm "'
                    + ' data-toggle="modal" data-target="#controlfleetengspare-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deletecontrolfleetplane(' + data.id + ')">'
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
var fleetEngSpareData = null;
 $('#table-list tbody').on('click', 'td', function () {
     var table = $('#table-list').DataTable();
     fleetEngSpareData = table.cell(this).data();
 });

// 编辑按钮 → 用户信息填充
 $('#controlfleetengspare-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     console.log(fleetEngSpareData);
     modal.find('#editid').val(fleetEngSpareData.id);
     modal.find('#editengSn').val(fleetEngSpareData.engId);
     modal.find('#editremoveDate').val(fleetEngSpareData.removeDate);
     modal.find('#editcondition').val(fleetEngSpareData.condition);
     modal.find('#editinstallPlan').val(fleetEngSpareData.installPlan);
     modal.find('#editllpSap').val(fleetEngSpareData.llpSap);
     modal.find('#editconfigAccess').val(fleetEngSpareData.configAccess);
     modal.find('#editremark').val(fleetEngSpareData.remark);
 }).on('hide.bs.modal', function (event) {
     cellUserData = null;
 });
 
 // edit controlfleetplane
 function editcontrolfleetengspare() {
		var id = $("#editid").val();
		var engId = $("#editengSn").find("option:selected").attr("engId");
		var engSn = $("#editengSn").find("option:selected").attr("engSn");
		var removeDate = $("#editremoveDate").val();
		var condition = $("#editcondition").val();
		var installPlan = $("#editinstallPlan").val();
		var llpSap = $("#editllpSap").val();
		var configAccess = $("#editconfigAccess").val();
		var remark = $("#editremark").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/controlfleetengspare/update.do",
		    {
		        "id": id,
		        "engId": engId,
		        "engSn":engSn,
		        "removeDate": removeDate,
		        "condition": condition,
		        "installPlan": installPlan,
		        "llpSap": llpSap,
		        "configAccess": configAccess,
		        "remark": remark
		    },
		    function (res) {
		    	 $('#controlfleetplane-info-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
		reloadTable(true);
	}
 
 // add controlfleetengspare
 function addcontrolfleetengspare() {
		var engId = $("#addengId").find("option:selected").attr("engId");
		var engSn = $("#addengId").find("option:selected").attr("engSn");
		var removeDate = $("#addremoveDate").val();
		var condition = $("#addcondition").val();
		var installPlan = $("#addinstallPlan").val();
		var llpSap = $("#addllpSap").val();
		var configAccess = $("#addconfigAccess").val();
		var remark = $("#addremark").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/controlfleetengspare/save.do",
		    {
		        "engId": engId,
		        "engSn":engSn,
		        "removeDate": removeDate,
		        "condition": condition,
		        "installPlan": installPlan,
		        "llpSap": llpSap,
		        "configAccess": configAccess,
		        "remark": remark
		    },
		    function (response) {
		    	 $('#controlfleetengspare-add-modal').modal('hide');
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

 // search 
 function searchControlfleetengspare() {
	 var table = $('#table-list').DataTable();
	 table.ajax.reload(null, true);
 }
 
// delete
 function deletecontrolfleetplane(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/controlfleetengspare/delete.do",
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
 
 //选择事件
 $("#addengId").change(function(){
	 var addengPn = $(this).find("option:selected").attr("engPn");
	 var addengSn = $(this).find("option:selected").attr("engSn");
	 $("#addengPn").val(addengPn);
	 $("#addengSn").val(addengSn);
	 
 });
 
 $("#editengId").change(function(){
	 var editengPn = $(this).find("option:selected").attr("engPn");
	 var editengSn = $(this).find("option:selected").attr("engSn");
	 $("#editengPn").val(editengPn);
	 $("#editengSn").val(editengSn);
	 
 });
 
//excel 导出
 $('#export').click(function(){
	 window.location = '${pageContext.request.contextPath}/manage/controlfleetengspare/export.do';
 });
 
// 调用OCUpload插件的方法
$("#inport").upload({
     action: "${pageContext.request.contextPath}/manage/controlfleetengspare/inport.do", //表单提交的地址
     name: "file",
     onComplete: function (data) { //提交表单之后
 		var data = $.parseJSON(data);
		if (data.code != 101) {
			alert("导入失败！");
		}
		reloadTable(true);
	},
	onSelect : function() {//当用户选择了一个文件后触发事件
		//当选择了文件后，关闭自动提交
		this.autoSubmit = false;
		//校验上传的文件名是否满足后缀为.xls或.xlsx
		var regex = /^.*\.(?:xls|xlsx)$/i;
		if (regex.test($("[name = '" + this.name() + "']").val())) {
			//通过校验
			this.submit();
		} else {
			//未通过
			alert('文件格式不正确! ');
		}
	}
});
</script>
</body>
</html>
