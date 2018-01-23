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
                    <input type="text" class=" form-control" id="search-xx" placeholder="xx">
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-bz-status">
                        <option>全部</option>
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchxx()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
            </div>
        </div>
        <div class="box-body">
            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table id="table-list" class="table  table-hover">
                    <thead>
                    <tr>
                        <th>飞机号</th>
                        <th>型号</th>
                        <th>发动机位置</th>
                        <th>发动机编号</th>
                        <th>发动机设备号</th>
                        <th>ETOPS</th>
                        <th>高高原</th>
                        <th>基地</th>
                        <th>营运人</th>
                        <th>IDPLUG_PN</th>
                        <th>所有人</th>
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


<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    "ordering": false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/engonwing/list.do",
        "type": "POST",
        "data": function (search) {
        	// 条件查询参数
        }
    },
    "columns": [
        {"data": "tail"},
        {"data": "model"},
       // {"data": "engPosition"},
       	null,
        {"data": "engSn"},
        {"data": "engPn"},
        {"data": "etops"},
        null,
        {"data": "dutyName"},
        {"data": "operater"},
        {"data": "idPlugPn"},
        {"data": "owner"}
    ],
    "ordering": false,
    "searching": false,
     "columnDefs": [
    	 {
         	"targets": 2,
         	"data": function (row, type, val, meta) {
         		if(row.engPosition == 1){
           		 	return "左发";
           	 	}
                return "右发";
         	}
          },
    	 {
             "targets": 6,
             "data": function (row, type, val, meta) {
            	 if(row.hHighLand == 1){
            		 return "是";
            	 }
                 return "否";
             }
         },
         
        {
            "targets": 11,
            "data": function (row, type, val, meta) {
                return row;
            },
            "render": function (data, type, full, meta) {
                var table = $("#table-list").DataTable();
                var result = '<div class="btn-group open">'
                    + '<button class="btn btn-default btn-sm" onclick="deletexx(' + data.id + ')">'
                    + '<i class="fa fa-trash"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="jump('+data.id+')" ><i class="fa fa-space-shuttle" aria-hidden="true"></i>'
                    + '</button></div>';
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
 function deletexx(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "#",
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
 
//跳转
 function jump(id){
 	url="${pageContext.request.contextPath}/manage/engonwing/engonwingdetail.do?id="+id+"&title=1";
 	title = "onwing发动机详情";
	tab_url = self.frameElement.getAttribute('data_url');//iframe对应的data_url和tab对应的data_url是一致的
	window.parent.changePage(title,tab_url);//调用父页面的方法
	//跳转
	window.location.href=url;
 }
 
</script>
</body>
</html>
