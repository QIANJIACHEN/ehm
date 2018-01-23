<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
    <script type="text/javascript" src="../../js/ocupload.js"></script>
    <style type="text/css">
    	table.table , table.table tr th{
    		text-align:center;
    	}
    	
    </style>
</head>
<body class="hold-transition" >

<!-- Content Wrapper. Contains page content -->
<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">

        <div class="box-header with-border">
        
        	<div class="row">
        		<div class="col-xs-2" style="min-width: 160px">
                    <input type="text" name="keyword" class="form-control" id="search-key" placeholder="关键字" />
                </div>
        		<div class="col-xs-1" style="min-width: 160px">
        			<button type="submit" class="btn btn-block btn-default" style="margin:0px 15px;" onclick="searchUser()">查询</button>
        		</div>
        		<div class="col-xs-1 pull-right" style="min-width: 160px">
        			<button style="background:#f4f4f4;border-color:#ddd;color:black" class="btn btn-block" data-toggle="modal" data-target="#recordAdd-modal">
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
        <div class="box-body">

            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table id="table-list" class="table  table-hover">
                    <thead>
                    <tr>
                    	<th>ID</th>
                        <th>飞机号</th>
                        <th>发动机位置</th>
                        <th>发动机编号</th>
                        <th>发动机设备号</th>
                        <th>USED_CYCLE</th>
                        <th>安装时间</th>
                        <th>安装ETSN</th>
                        <th>安装ECSN</th>
                        <th>拆发时间</th>
                        <th>拆发ECSN</th>
                        <th>拆发ETSN</th>
                        <th>PLAN</th>
                        <th>SV</th>
                        <th>SV_GRADE</th>
                        <th>拆发原因</th>
                        <th>备注</th>
                        <th>工厂</th>
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
<jsp:include page='recordModel.jsp'/>
<jsp:include page='recordAddModel.jsp'/>
<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    ordering: false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/troubleshooting/recordinfo.do",
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
        {"data": "tail"},
        //{"data": "engPosition"},
        null,
        {"data": "engSn"},
        {"data": "engPn"},
        {"data": "usedCycle"},
        {"data": "dateInstall"},
        {"data": "etsnInstall"},
        {"data": "ecsnInstall"},
        {"data": "dateRemoval"},
        {"data": "etsnRemoval"},
        {"data": "ecsnRemoaval"},
        {"data": "paln"},
        {"data": "sv"},
        {"data": "svGrade"},
        {"data": "removalCause"},
        {"data": "remark"},
        {"data": "factory"},
        null
    ],
    "ordering": false,
    "searching": false,
    "columnDefs": [
    	{
         	"targets" : 1,
 			"render" : function(data, type, row) {
 				return "<a href='javascript:void(0)' title1='15' tail='"+(data == null ? '-' : data)+"' onclick='jumpPlane(this)'>" + (data == null ? '-' : data)
 						+ "</a>";
 			}
 		},
    	{
    		"targets":2,
    		"data":function (row,type,val,meta){
    			if(row.engPosition=="1"){
    				return "左发";
    			}
    			return "右发";
    		}
    	},
        {
            "targets": 18,
            "data": function (row, type, val, meta) {
                return row;
            },
            "render": function (data, type, full, meta) {
                var table = $("#table-list").DataTable();
                var result = '<div class="btn-group open">'
                    + '<button class="btn btn-default btn-sm "'
                    + ' data-toggle="modal" data-target="#record-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deleteActivity(' + data.id + ')">'
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
var cellUserData = null;
$('#table-list tbody').on('click', 'td', function () {
    var table = $('#table-list').DataTable();
    cellUserData = table.cell(this).data();
});

// 编辑按钮 → 用户信息填充
 $('#record-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#duty').val(cellUserData.duty);
     modal.find('#stries').val(cellUserData.stries);
     modal.find('#tail').val(cellUserData.tail);
     modal.find('#engPosit').val(cellUserData.engPosit);
     modal.find('#engSn').val(cellUserData.engSn);
     modal.find('#status').val(cellUserData.status);
     modal.find('#name').val(cellUserData.name);
     modal.find('#id').val(cellUserData.id);
     modal.find('#sub-title').text('修改');
     modal.find('#type').val(1);
 }).on('hide.bs.modal', function (event) {
     cellUserData = null;
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

 // search 
 function searchUser() {
	 reloadTable(true);
 }
 
// delete
function deleteActivity(id){
	 if (confirm("你确定要删除吗？")) {
		 $.ajax({
			 type : "post",
			 url : "${pageContext.request.contextPath}/manage/hptb/recorddelete.do",
			 data : { "id": id,},
			 dataType:"json",
			 success : function(data){
				 window.location.reload(true);
                 $('#record-modal').modal('hide');
                 reloadTable(true);
			 }
		 })
     };
}
//excel 导出
$('#export').click(function(){
	 window.location = '${pageContext.request.contextPath}/manage/troubleshooting/export.do';
});

//调用OCUpload插件的方法
$("#inport").upload({
    action: "${pageContext.request.contextPath}/manage/troubleshooting/inport.do", //表单提交的地址
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
