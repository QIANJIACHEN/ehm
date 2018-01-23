<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
    <script type="text/javascript" src="../../js/ocupload.js"></script>
</head>
<body class="hold-transition" >

<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">
        <div class="box-header with-border">
        
          <div class="row">
                <div class="col-xs-1" style="min-width: 160px">
                    <input type="text" class=" form-control" id="search-engSn" placeholder="xx">
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-bz-status">
                        <option>全部</option>
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchdataidplug()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                <div class="col-xs-2" style="min-width: 160px">
                    <button id="i" class="btn btn-block btn-primary col-sm-1" data-toggle="modal" data-target="#dataidplug-add-modal">
                        <i class="fa fa-plus"></i>
                       	 添加IDPLUG数据
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
                        <th style="display:none">id</th>
                        <th style="display:none">发动机ID</th>
                        <th>发动机设备号</th>
                        <th>发动机型号</th>
                        <th>转速</th>
                        <th>构型</th>
                        <th>飞机型号</th>
                        <th>IDPLUG_PN</th>
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

<jsp:include page='dataidpluginfo.jsp'/>
<jsp:include page='dataidplugadd.jsp'/>

<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    "ordering": false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/dataidplug/list.do",
        "type": "POST",
        "data": function (search) {
        	// 条件查询参数
        }
    },
    "columns": [
        {"data": "id","visible": false},
        {"data": "engId","visible": false},
        {"data": "engPn"},
        {"data": "engModel"},
        {"data": "rating"},
        {"data": "config"},
        {"data": "planeType"},
        {"data": "idPlugPn"}
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
                    + ' data-toggle="modal" data-target="#dataidplug-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deletedataidplug(' + data.id + ')">'
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
var cellData = null;
 $('#table-list tbody').on('click', 'td', function () {
     var table = $('#table-list').DataTable();
     cellData = table.cell(this).data();
 });

// 编辑按钮 → 信息填充
 $('#dataidplug-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#editrating').val(cellData.rating);
     modal.find('#editplaneType').val(cellData.planeType);
     modal.find('#editidPlugPn').val(cellData.idPlugPn);
 }).on('hide.bs.modal', function (event) {
     cellData = null;
 });
 
 // edit
 function editdataidplug() {
		var id = cellData.id;
		var engId = $("#editengId").val();
		var rating = $("#editrating").val();
		var planeType = $("#editplaneType").val();
		var idPlugPn = $("#editidPlugPn").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/dataidplug/update.do",
		    {
		        "id": id,
		        "engId": engId,
		        "rating": rating,
		        "planeType": planeType,
		        "idPlugPn": idPlugPn
		    },
		    function (response) {
		    	 $('#dataidplug-info-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
	}
 
 // add 
 function adddataidplug() {
		var engId = $("#addengId").val();
		var rating = $("#addrating").val();
		var planeType = $("#addplaneType").val();
		var idPlugPn = $("#addidPlugPn").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/dataidplug/save.do",
		    {
		        "engId": engId,
		        "rating": rating,
		        "planeType": planeType,
		        "idPlugPn": idPlugPn
		    },
		    function (response) {
		    	 $('#dataidplug-add-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
	}

 /**
  * 清除弹窗原数据
  */
  $("#dataidplug-add-modal").on("hidden.bs.modal", function() {
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

 // search 
 function searchxx() {
	 reloadTable(true);
 }
 
// delete
 function deletedataidplug(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/dataidplug/delete.do",
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
 
 $('#i').click(function(){
	 $.post(
             "${pageContext.request.contextPath}/manage/dataeng/allDataEng.do",
             {},
             function (response) {
            	  $('#addengId').html('');
            	  for(var o in response.data){
            	      $('#addengId').append('<option value="'+response.data[o].id+'">'+response.data[o].engSn+'</option>');
            	  }  
             },
             "json"
      );
 });
 
 $('#table-list tbody').on('click', 'td', function () {
	 $.post(
             "${pageContext.request.contextPath}/manage/dataeng/allDataEng.do",
             {},
             function (response) {
            	  $('#editengId').html('');
            	  for(var o in response.data){
            	      $('#editengId').append('<option value="'+response.data[o].id+'">'+response.data[o].engSn+'</option>');
            	  }  
             },
             "json"
      );
 });
//excel 导出
 $('#export').click(function(){
	 window.location = '${pageContext.request.contextPath}/manage/dataidplug/export.do';
 });
 
// 调用OCUpload插件的方法
$("#inport").upload({
     action: "${pageContext.request.contextPath}/manage/dataidplug/inport.do", //表单提交的地址
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
