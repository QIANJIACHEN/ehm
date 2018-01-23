<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
</head>
<body class="hold-transition" >

<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">

        <div class="box-header with-border">
            <div class="row">
                <div class="col-xs-1" style="min-width: 160px">
                    <input type="text" class=" form-control" id="search-username" placeholder="用户名">
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-role">
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-duty">
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchuser()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button style="background:#f4f4f4;border-color:#ddd;color:black" id="i" class="btn btn-block col-sm-1" data-toggle="modal" data-target="#user-add-modal">
                        <i class="fa fa-plus"></i>
                       	 添加成员
                    </button>
                </div>
            </div>
        </div>
        <div class="box-body">

            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table id="table-list" class="table  table-hover" >
                    <thead>
                    <tr>
                        <th style="display: none">用户ID</th>
                        <th>用户名</th>
                        <th style="display: none">姓名</th>
                        <th style="display: none">密码</th>
                        <th>职位</th>
                        <th style="display: none">角色ID</th>
                        <th>角色</th>
                        <th>手机号</th>
                        <th>创建时间</th>
                        <th style="display: none">基地ID</th>
                        <th>基地</th>
                        <th>邮箱</th>
                        <th style="display: none">工号</th>
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

<jsp:include page='userinfo.jsp'/>
<jsp:include page='useradd.jsp'/>
<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    "ordering": false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/user/list.do",
        "type": "POST",
        "data": function (search) {
        	// 条件查询参数
        	search.username = $("#search-username").val();
        	search.duty = $("#search-duty").val();
        	search.role = $("#search-role").val();
        }
    },
    "columns": [
        {"data": "userId","visible": false},
        {"data": "username"},
        {"data": "realName","visible": false},
        {"data": "password","visible": false},
        {"data": "position"},
        {"data": "role","visible": false},
        {"data": "roleName"},
        {"data": "phone"},
        {"data": "ctime"},
        {"data": "duty","visible": false},
        {"data": "dutyName"},
        {"data": "email"},
        {"data": "number","visible": false}
    ],
    "ordering": false,
    "searching": false,
     "columnDefs": [
         {
            "targets": 13,
            "data": function (row, type, val, meta) {
                return row;
            },
            "render": function (data, type, full, meta) {
                var table = $("#table-list").DataTable();
                var result = '<div class="btn-group open">'
                    + '<button class="btn btn-default btn-sm "'
                    + ' data-toggle="modal" data-target="#user-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deleteuser(' + data.userId + ')">'
                    + '<i class="fa fa-trash"></i></button>'
                    + '<button class="btn btn-default btn-sm" onclick="jump('+data.userId+')" >'
                    + '<i class="fa fa-address-card" aria-hidden="true"></i></button>'
                    + '</div>';
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
 * 编辑按钮   → 用户信息填充
 */
 $('#user-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#edituserId').val(cellData.userId);
     modal.find('#editusername').val(cellData.username);
     modal.find('#editrealName').val(cellData.realName);
     modal.find('#editpassword').val(cellData.password);
     modal.find('#editposition').val(cellData.position);
     modal.find('#editemail').val(cellData.email);
     modal.find('#editphone').val(cellData.phone);
     modal.find('#editnumber').val(cellData.number);
 }).on('hide.bs.modal', function (event) {
     cellData = null;
 });
 
/**
 * edit 
 */
 function edituser() {
		var userId = cellData.userId;
		var username = $("#editusername").val();
		var realName = $("#editrealName").val();
		var password= $("#editpassword").val();
		var position = $("#editposition").val();
		var role = $("#editrole").val();
		var phone = $("#editphone").val();
		var duty = $("#editduty").val();
		var email = $("#editemail").val();
		var number = $("#editnumber").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/user/update.do",
		    {
		        "userId": userId,
		        "username": username,
		        "realName": realName,
		        //"password": password,
		        "position": position,
		        "role": role,
		        "phone": phone,
		        "duty": duty,
		        "email": email,
		        "number": number
		    },
		    function (response) {
		    	 $('#user-info-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
	}
 
/**
 * add
 */
 function adduser() {
		var username = $("#addusername").val();
		var realName = $("#addrealName").val();
		var password= $("#addpassword").val();
		var position = $("#addposition").val();
		var role = $("#addrole").val();
		var phone = $("#addphone").val();
		var duty = $("#addduty").val();
		var email = $("#addemail").val();
		var number = $("#addnumber").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/user/save.do",
		    {
		        "username": username,
		        "realName": realName,
		        "password": password,
		        "position": position,
		        "role": role,
		        "phone": phone,
		        "duty": duty,
		        "email": email,
		        "number": number
		    },
		    function (response) {
		    	if(response.code != 101){
		    		alert(response.msg);
		    	}
		    	 $('#user-add-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
	}
	
/**
 * 清除弹窗原数据
 */
 $("#user-add-modal").on("hidden.bs.modal", function() {
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

/**
 * search
 */
 function searchuser() {
	 reloadTable(true);
 }
 
/**
 * delete
 */
 function deleteuser(userId) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/user/delete.do",
             {
                 "userId": userId,
             },
             function (response) {
                 $('#mood-modal').modal('hide');
                 reloadTable(true);
             },
             "json"
         );
     };
 }
 
/**
 * 填充选择框
 */
 $('#i').click(function(){
	 $.post(
             "${pageContext.request.contextPath}/manage/manage/allrole.do",
             {},
             function (response) {
            	  $('#addrole').html('');
            	  for(var o in response.data){
            	      $('#addrole').append('<option value="'+response.data[o].id+'">'+response.data[o].name+'</option>');
            	  }  
             },
             "json"
      );
 });
 
 $('#i').click(function(){
	 $.post(
             "${pageContext.request.contextPath}/manage/duty/allduty.do",
             {},
             function (response) {
            	  $('#addduty').html('');
            	  for(var o in response.data){
            	      $('#addduty').append('<option value="'+response.data[o].id+'">'+response.data[o].name+'</option>');
            	  }  
             },
             "json"
      );
 });
 
 $('#table-list tbody').on('click', 'td', function () {
	 $.post(
             "${pageContext.request.contextPath}/manage/manage/allrole.do",
             {},
             function (response) {
            	  $('#editrole').html('');
            	  for(var o in response.data){
            	      $('#editrole').append('<option value="'+response.data[o].id+'">'+response.data[o].name+'</option>');
            	  }  
             },
             "json"
      );
 });
 
 $('#table-list tbody').on('click', 'td', function () {
	 $.post(
             "${pageContext.request.contextPath}/manage/duty/allduty.do",
             {},
             function (response) {
            	  $('#editduty').html('');
            	  for(var o in response.data){
            	      $('#editduty').append('<option value="'+response.data[o].id+'">'+response.data[o].name+'</option>');
            	  }  
             },
             "json"
      );
});

$(function(){
	 $.post(
             "${pageContext.request.contextPath}/manage/duty/allduty.do",
             {},
             function (response) {
            	  $('#search-duty').html('');
            	  $('#search-duty').append('<option value="">所属基地</option>');
            	  for(var o in response.data){
            	      $('#search-duty').append('<option value="'+response.data[o].id+'">'+response.data[o].name+'</option>');
            	  }  
             },
             "json"
      );
});

$(function(){
	 $.post(
             "${pageContext.request.contextPath}/manage/manage/allrole.do",
             {},
             function (response) {
            	  $('#search-role').html('');
            	  $('#search-role').append('<option value="">角色名称</option>');
            	  for(var o in response.data){
            	      $('#search-role').append('<option value="'+response.data[o].id+'">'+response.data[o].name+'</option>');
            	  }  
             },
             "json"
      );
});
//跳转
function jump(userId){
	url = "${pageContext.request.contextPath}/manage/user/userdetail.do?userId="+userId;
	title = "用户详情";
	tab_url = self.frameElement.getAttribute('data_url');//iframe对应的data_url和tab对应的data_url是一致的
	window.parent.changePage(title,tab_url);//调用父页面的方法
	//跳转
	window.location.href=url;
}

</script>
</body>
</html>
