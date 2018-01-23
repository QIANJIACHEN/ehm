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
                    <input type="text" class=" form-control" id="search-engSn" placeholder="发动机编号">
                </div>
 
                

                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchRecorddataeng()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                    
               <!--  <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default col-sm-1" data-toggle="modal" data-target="#recorddataeng-add-modal">
                        <i class="fa fa-plus"></i>
                       	 添加
                    </button>
                </div> -->
            </div>
        </div>
        <div class="box-body" style="padding-top:20px">

            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table id="table-list" class="table  table-hover">
                    <thead>
                    <tr>
                        <th>发动机SN</th>
                        <th>SAP平台显示的方式</th>
                        <th>发动机序列</th>
                        <th>发动机类型</th>
                        <th>发动机模型</th>
                        <th>发动机构型</th>
                        <th>原始厂商</th>
                        <th>所有人</th>
                        <th>CODE_CONFIG</th>
                        <th>发动机型号另一种标识</th>
                        <th>创建时间</th>
                        <th>录入人</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page='recorddataenginfo.jsp'/>
<jsp:include page='recorddataengadd.jsp'/>


<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    ordering: false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/recorddataeng/list.do",
        "type": "POST",
        "data": function (search) {
        	// 条件查询参数
        	search.engSn = $("#search-engSn").val();
        }
    },
    "columns": [
        {"data": "engSn"},
        {"data": "engSnSap"},
        {"data": "engSeries"},
        {"data": "engType"},
        {"data": "engModel"},
        {"data": "engConfig"},
        {"data": "deliveryMode"},
        {"data": "owner"},
        {"data": "codeConfig"},
        {"data": "engConfigration"},
        {"data": "ctime"},
        {"data": "username"},
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
	                // + '<button class="btn btn-default btn-sm "'
	               // + ' data-toggle="modal" data-target="#dataplane-info-modal">'
	                // + '<i class="fa fa-gear"></i>'
	                 //+ '</button><button class="btn btn-default btn-sm" onclick="deletedataplane(' + data.id + ')">'
	                // + '<i class="fa fa-trash"></i></button>'
	                 + '<butoon class="btn btn-default btn-sm" onclick="jump('+data.id+')" ><i class="fa fa-space-shuttle" aria-hidden="true"></i></button>'
	                 + '</div>'
	                 
	                 ;
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
 $('#recorddataeng-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#editid').val(cellWaterWashData.id);
     modal.find('#editengPn').val(cellWaterWashData.engPn);
     modal.find('#editengSn').val(cellWaterWashData.engSn);
     modal.find('#editengSnSap').val(cellWaterWashData.engSnSap);
     modal.find('#editengSeries').val(cellWaterWashData.engSeries);
     modal.find('#editengType').val(cellWaterWashData.engType);
     modal.find('#editengModel').val(cellWaterWashData.engModel);
     modal.find('#editengConfig').val(cellWaterWashData.engConfig);
     modal.find('#editdeliveryMode').val(cellWaterWashData.deliveryMode);
     modal.find('#editowner').val(cellWaterWashData.owner);
     modal.find('#editcodeConfig').val(cellWaterWashData.codeConfig);
     modal.find('#editengConfigration').val(cellWaterWashData.engConfigration);
     modal.find('#edituserId').val(cellWaterWashData.userId);
     modal.find('#editctime').val(cellWaterWashData.ctime);
 }).on('hide.bs.modal', function (event) {
     cellUserData = null;
 });
 
 // edit 
 function editrecorddataeng() {
		var id = $("#editid").val();
		var engSn = $("#editengSn").val();
		var engPn = $("#editengPn").val();
		var engSnSap = $("#editengSnSap").val();
		var engSeries= $("#editengSeries").val();
		var engType = $("#editengType").val();
		var engModel = $("#editengModel").val();
		var engConfig = $("#editengConfig").val();
		var deliveryMode = $("#editdeliveryMode").val();
		var owner = $("#editowner").val();
		var codeConfig = $("#editcodeConfig").val();
		var engConfigration = $("#editengConfigration").val();
		var userId = $("#edituserId").val();
		var ctime = $("#editctime").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/recorddataeng/saveOrUpdate.do",
		    {
		        "id": id,
		        "engSn": engSn,
		        "engPn":engPn,
		        "engSnSap": engSnSap,
		        "engSeries": engSeries,
		        "engType": engType,
		        "engModel": engModel,
		        "engConfig": engConfig,
		        "deliveryMode": deliveryMode,
		        "owner": owner,
		        "codeConfig": codeConfig,
		        "engConfigration": engConfigration,
		        "userId": userId,
		        "ctime": ctime
		    },
		    function (res) {
		    	 $('#recorddataeng-info-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
		reloadTable(true);
	}
 
 // add 
 function addrecorddataeng() {
		var id = $("#addid").val();
		var engSn = $("#addengSn").val();
		var engPn = $("#addengPn").val();
		var engSnSap = $("#addengSnSap").val();
		var engSeries= $("#addengSeries").val();
		var engType = $("#addengType").val();
		var engModel = $("#addengModel").val();
		var engConfig = $("#addengConfig").val();
		var deliveryMode = $("#adddeliveryMode").val();
		var owner = $("#addowner").val();
		var codeConfig = $("#addcodeConfig").val();
		var engConfigration = $("#addengConfigration").val();
		var userId = $("#adduserId").val();
		var ctime = $("#addctime").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/recorddataeng/saveOrUpdate.do",
		    {
		    	"id": id,
		        "engSn": engSn,
		        "engPn":engPn,
		        "engSnSap": engSnSap,
		        "engSeries": engSeries,
		        "engType": engType,
		        "engModel": engModel,
		        "engConfig": engConfig,
		        "deliveryMode": deliveryMode,
		        "owner": owner,
		        "codeConfig": codeConfig,
		        "engConfigration": engConfigration,
		        "userId": userId,
		        "ctime": ctime
		    },
		    function (response) {
		    	 $('#recorddataeng-add-modal').modal('hide');
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
         table.ajax.reload(null, true);
     } else {
         table.ajax.reload();
     }
 }

 // search 
 function searchRecorddataeng() {
	 var table = $('#table-list').DataTable();
	 reloadTable(true);
 }
 
// delete
 function deleterecorddataeng(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/recorddataeng/delete.do",
             {
                 "id": id,
             },
             function (response) {
            	 console.log(21);
                 $('#mood-modal').modal('hide');
                 reloadTable(true);
             },
             "json"
         );
         reloadTable(true);
     };
 }
//跳转
 function jump(id){
 	url="${pageContext.request.contextPath}/manage/recorddataeng/recorddataengdetail.do?id="+id+"&title=1";
 	title = "发动机属性更变详请";
	tab_url = self.frameElement.getAttribute('data_url');
	window.parent.changePage(title,tab_url);//调用父页面的方法
 	window.location.href = url;
 }
</script>
</body>
</html>
