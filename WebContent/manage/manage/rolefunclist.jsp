<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
</head>
<script type="text/javascript" src="../../js/ocupload.js"></script>
<body class="hold-transition" >

<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">
    	<div class="box-header with-border">
            <div class="row">
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-primary" onclick="addFunc()">
                        <i class="fa fa-plus"></i>
                      	  添加功能列表
                    </button>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button id="updataFuncName" class="btn btn-block btn-primary">
                        <i class="fa fa-plus"></i>
                      	  添加功能名称
                    </button>
                </div>
            </div>
        </div>
        <div class="box-body">
            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table id="table-list" class="table  table-hover">
                    <thead>
                    <tr>
                        <th style="display: none;">角色 ID</th>
                        <th>角色名称</th>
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

<jsp:include page='rolefuncinfo.jsp'/>

<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    "ordering": false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/manage/listRole.do",
        "type": "POST",
        "data": function (search) {
        }
    },
    "columns": [
        {"data": "id","visible": false},
        {"data": "name"}
    ],
    "ordering": false,
    "searching": false,
     "columnDefs": [
         {
            "targets": 2,
            "data": function (row, type, val, meta) {
                return row;
            },
            "render": function (data, type, full, meta) {
                var table = $("#table-list").DataTable();
                var result = '<div class="btn-group open">'
                    + '<button class="btn btn-default btn-sm "'
                    + ' data-toggle="modal" data-target="#rolefunc-info-modal">'
                    + '<i class="fa fa-gear"></i></button></div>';
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
  $('#rolefunc-info-modal').on('show.bs.modal', function (event) {
      var modal = $(this);
      modal.find('#name').val(cellData.name);
  }).on('hide.bs.modal', function (event) {
      cellData = null;
  });
 
  /**
   * 角色 和 功能 存入数据库
   */
  function addFunc(){
		$.post(
	  		    "${pageContext.request.contextPath}/manage/manage/allURL.do",
	  		    {},
	  		    function (response) {
	  		         reloadTable(true);
	  		    },
	  		    "json"
	  	);
  }

  /**
   * edit 
   */
   function editRoleFunc() {
  		var roleId = cellData.id;
  		var arr = [];
  		$('.func').each(function(){
  			if($(this).prop('checked')){
  				arr.push($(this).attr('value'));
  			}
  		});
  		// 数组转json格式
  		var func = JSON.stringify(arr);
  		$.post(
  		    "${pageContext.request.contextPath}/manage/manage/updateRoleFunc.do",
  		    {
  		        "roleId": roleId,
  		        "func": func
  		    },
  		    function (response) {
  		    	 $('#rolefunc-info-modal').modal('hide');
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

	/**
	 * 填充选择框
	 */
	$('#table-list tbody').on('click','td',function() {
		var roleId = cellData.id;
		$.post(
				"${pageContext.request.contextPath}/manage/manage/roleFunc.do",
				{"roleId": roleId},
				function(response) {
					$('#rolefunc').html('');
					$('#rolefunc').append('<label for="text-name">功能列表</label><br>');
					$('#rolefunc').append('<label onclick="selectAll()">全选</label>&nbsp;&nbsp;<label onclick="deleteAll()">清空</label><br>');
					for ( var o in response.data) {
						if (response.data[o].flag == 1) {
							$('#rolefunc').append('<label><input class="func" checked="checked" type="checkbox" value="'+response.data[o].id+'"/>&nbsp;&nbsp;'+response.data[o].url+'</label><br>');
						} else {
							$('#rolefunc').append('<label><input class="func" type="checkbox" value="'+response.data[o].id+'"/>&nbsp;&nbsp;'+response.data[o].url+'</label><br>');
						}
					}
				}, 
				"json"
		);
	});
	
	/**
	 * 全选
	 */
	function selectAll(){
		$('.func').each(function(){
  			$(this).attr('checked','checked');
  		});
	}
	/**
	 * 清空
	 */
	function deleteAll(){
		$('.func').each(function(){
			$(this).removeAttr('checked');	
  		});
	}
	
	// 调用OCUpload插件的方法
	$("#updataFuncName").upload({
        action: "${pageContext.request.contextPath}/manage/manage/updataFuncName.do", //表单提交的地址
        name: "file",
        onComplete: function (data) { //提交表单之后
        	var data = $.parseJSON(data);
			if (data.code != 101) {
				alert("添加失败！");
			}
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
