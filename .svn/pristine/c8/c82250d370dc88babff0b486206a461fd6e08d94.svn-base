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
                    <input type="text" class=" form-control" id="search-name" placeholder="名称">
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-role">
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchduty()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button style="background:#f4f4f4;border-color:#ddd;color:black" id='i' class="btn btn-block col-sm-1" data-toggle="modal" data-target="#duty-add-modal">
                        <i class="fa fa-plus"></i>
                       	 添加部门
                    </button>
                </div>
            </div>
        </div>
        <div class="box-body">

            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table id="table-list" class="table  table-hover">
                    <thead>
                    <tr>
                        <th style="display: none;">ID</th>
                        <th style="display: none;">上级ID</th>
                        <th>上级</th>
                        <th>名称</th>
                        <th style="display: none;">角色ID</th>
                        <th>角色</th>
                        <th>创建时间</th>
                        <th>所在地</th>
                        <th>分类</th>
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

<jsp:include page='dutyadd.jsp'/>
<jsp:include page='dutyinfo.jsp'/>

<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    "ordering": false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/duty/list.do",
        "type": "POST",
        "data": function (search) {
        	// 条件查询参数
        	search.name = $("#search-name").val();
        	search.role = $("#search-role").val();
        }
    },
    "columns": [
        {"data": "id","visible": false},
        {"data": "parentId","visible": false},
        {"data": "parentName"},
        {"data": "name"},
        {"data": "role","visible": false},
        {"data": "roleName"},
        {"data": "ctime"},
        {"data": "location"},
        null
    ],
    "ordering": false,
    "searching": false,
     "columnDefs": [
    	 {
             "targets": 8,
             "data": function (row, type, val, meta) {
                 if (row.type == 1) {
                     return "分公司";
                 } 
                 if (row.type == 2) {
                     return "子公司";
                 } 
                 if (row.type == 3) {
                     return "执行单位";
                 } 
                 if (row.type == 4) {
                     return "基地";
                 } 
             }
         },
         {
            "targets": 9,
            "data": function (row, type, val, meta) {
                return row;
            },
            "render": function (data, type, full, meta) {
                var table = $("#table-list").DataTable();
                var result = '<div class="btn-group open">'
                    + '<button class="btn btn-default btn-sm "'
                    + ' data-toggle="modal" data-target="#duty-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deleteduty(' + data.id + ')">'
                    + '<i class="fa fa-trash"></i></button>'
                    + '<button class="btn btn-default btn-sm" onclick="jump('+data.id+')" >'
                    + '<i class="fa fa-info-circle" aria-hidden="true"></i></button>'
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
  * 编辑按钮   → 信息填充
  */
  $('#duty-info-modal').on('show.bs.modal', function (event) {
      var modal = $(this);
      modal.find('#editname').val(cellData.name);
      modal.find('#editlocation').val(cellData.location);
  }).on('hide.bs.modal', function (event) {
      cellData = null;
  });

  /**
   * edit 
   */
   function editduty() {
  		var id = cellData.id;
  		var parentId = $("#editparentId").val();
  		var name = $("#editname").val();
  		var role= $("#editrole").val();
  		var location= $("#editlocation").val();
  		var type= $("#edittype").val();
  		$.post(
  		    "${pageContext.request.contextPath}/manage/duty/update.do",
  		    {
  		        "id": id,
  		        "parentId": parentId,
  		        "name": name,
  		        "role": role,
  		        "location": location,
  		        "type": type
  		    },
  		    function (response) {
  		    	 $('#duty-info-modal').modal('hide');
  		         reloadTable(true);
  		    },
  		    "json"
  		);
  	}
  
 // add
 function addduty() {
		var parentId = $("#addparentId").val();
		var name = $("#addname").val();
		var role= $("#addrole").val();
		var location= $("#addlocation").val();
  		var type= $("#addtype").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/duty/save.do",
		    {
		    	"parentId": parentId,
  		        "name": name,
  		        "role": role,
  		        "location": location,
		        "type": type
		    },
		    function (response) {
		    	$('#duty-add-modal').modal('hide');
		        reloadTable(true);
		    },
		    "json"
		);
	}
 
 /**
  * 清除弹窗原数据
  */
  $("#duty-add-modal").on("hidden.bs.modal", function() {
      $('#reset').click();
  });
 
 // delete
 function deleteduty(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/duty/delete.do",
             {
                 "id": id
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
 function searchduty() {
	 reloadTable(true);
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
 
 $('#i').click(function(){
	 $.post(
             "${pageContext.request.contextPath}/manage/duty/allduty.do",
             {},
             function (response) {
            	  $('#addparentId').html('');
            	  $('#addparentId').append('<option value="0"></option>');
            	  for(var o in response.data){
            	      $('#addparentId').append('<option value="'+response.data[o].id+'">'+response.data[o].name+'</option>');
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
            	  $('#editparentId').html('');
            	  $('#editparentId').append('<option value="0"></option>');
            	  for(var o in response.data){
            	      $('#editparentId').append('<option value="'+response.data[o].id+'">'+response.data[o].name+'</option>');
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
 function jump(id){
	title = "部门详请";//1
	title1="1";
	back_url = "duty/dutylist.do";
	tab_url = self.frameElement.getAttribute('data_url');
	window.parent.changePage(title,tab_url);//调用父页面的方法
 	url="${pageContext.request.contextPath}/manage/duty/dutydetail.do?id="+id+"&title="+title1+"&back_url="+back_url;
 	window.location.href = url;
 }
</script>
</body>
</html>
