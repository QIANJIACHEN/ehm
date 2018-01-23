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
                    <input type="text" class=" form-control" id="search-number" placeholder="航班号">
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-sTerminal">
                    	<option value="">起飞航站</option>
                    	<option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-eTerminal">
                    	<option value="">到达航站</option>
                    	<option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchflight()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button style="background:#f4f4f4;border-color:#ddd;color:black" id="i" class="btn btn-block btn-primary col-sm-1" data-toggle="modal" data-target="#flight-add-modal">
                        <i class="fa fa-plus"></i>
                       	 添加航班
                    </button>
                </div>
            </div>
        </div>
        <div class="box-body">

            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table id="table-list" class="table  table-hover">
                    <thead>
                    <tr>
                        <th style="display: none">ID</th>
                        <th>航班号</th>
                        <th>飞行时间</th>
                        <th>空中时间</th>
                        <th>空地时间</th>
                        <th>起飞航站</th>
                        <th>到达航站</th>
                        <th>创建时间</th>
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

<jsp:include page='flightinfo.jsp'/>
<jsp:include page='flightadd.jsp'/>

<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    "ordering": false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/flight/list.do",
        "type": "POST",
        "data": function (search) {
        	// 条件查询参数
        	search.number = $("#search-number").val();
        	search.sTerminal = $("#search-sTerminal").val();
        	search.eTerminal = $("#search-eTerminal").val();
        }
    },
    "columns": [
        {"data": "id","visible": false},
        {"data": "number"},
        {"data": "flyTime"},
        {"data": "airTime"},
        {"data": "floorTime"},
        {"data": "sTerminal"},
        {"data": "eTerminal"},
        {"data": "ctime"}
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
                    + ' data-toggle="modal" data-target="#flight-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deleteflight(' + data.id + ')">'
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
 $('#flight-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#id').val(cellData.id);
     modal.find('#number').val(cellData.number);
     modal.find('#flyTime').val(cellData.flyTime);
     modal.find('#airTime').val(cellData.airTime);
     modal.find('#floorTime').val(cellData.floorTime);
 }).on('hide.bs.modal', function (event) {
     cellData = null;
 });
 
/**
 * edit 
 */
 function editflight() {
		// 判断表单内容
		var flag=true;
		var t = $('#form-info').serializeArray();
		$.each(t, function() {
			// 为什么是this，而t为什么不行
			if(this.value == null || this.value.trim() == ''){
			    flag=false;
			}
		});
		if(flag){
			$.ajax({ 
			    type: 'POST',  
			    cache: false, // 是否有缓存
			    url: "${pageContext.request.contextPath}/manage/flight/update.do",  
			    dataType: 'json', 
			    data: $('#form-info').serialize(),  
			    async: true,  // 是否异步
			    success: function(data) {  
			        //接收后台返回的结果  
			        if(data.code != 101){
			    		alert(data.msg); 
			        }
			        $('#flight-info-modal').modal('hide');
			         reloadTable(true);
			    }
			});
		}else{
			 alert('参数不完整！');
		}
	}
 
/**
 * add
 */
 function addflight() {
	// 判断表单内容
		var flag=true;
		var t = $('#form-add').serializeArray();
		$.each(t, function() {
			// 为什么是this，而t为什么不行
			if(this.value == null || this.value.trim() == ''){
			    flag=false;
			}
		});
		if(flag){
			 $.ajax({  
				    type: 'POST',  
				    cache: false, // 是否有缓存
				    url: "${pageContext.request.contextPath}/manage/flight/save.do",  
				    dataType: 'json', 
				    data: $('#form-add').serialize(),  
				    async: true,  // 是否异步
				    success: function(data) {  
				        //接收后台返回的结果  
				        if(data.code != 101){
				    		alert(data.msg); 
				        }
				        $('#flight-add-modal').modal('hide');
				         reloadTable(true);
				    }
				});
		}else{
			 alert('参数不完整！');
		}
	}
	
/**
 * 清除弹窗原数据
 */
 $("#flight-add-modal").on("hidden.bs.modal", function() {
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
 function searchflight() {
	 reloadTable(true);
 }
 
/**
 * delete
 */
 function deleteflight(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/flight/delete.do",
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
 
</script>
</body>
</html>
