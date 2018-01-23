<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
    <script type="text/javascript" src="../../js/ocupload.js"></script>
</head>
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
                    <button class="btn btn-block btn-default" onclick="searchengconditionfleet()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                    
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default col-sm-1" data-toggle="modal" data-target="#engconditionfleet-add-modal">
                        <i class="fa fa-plus"></i>
                       	 添加
                    </button>
                </div>
                <div class="col-xs-1 pull-right" style="min-width: 160px">
                    <a href="${pageContext.request.contextPath}/manage/engconditionfleet/planeinfo.do" class="btn btn-block btn-primary col-sm-1">
                        <i class="fa fa-mail-forward"></i>
                       	 飞机信息报表
                    </a>
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
                        <th>发动机编号</th>
                        <th>TSI_START</th>
                        <th>CSI_START</th>
                        <th>SV_TIME</th>
                        <th>TSR_START</th>
                        <th>CSR_START</th>
                        <th>TSO_START</th>
                        <th>CSO_START</th>
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
<jsp:include page='engconditionfleetinfo.jsp'/>
<jsp:include page='engconditionfleetadd.jsp'/>


<script type="text/javascript">

//获取发动机
$.post("${pageContext.request.contextPath}/manage/dataeng/allDataEng.do",function(res){

	$(".engId").empty();
	$(".engId").append('<option value="0" engSn="0">请选择</option>');
	res = JSON.parse(res);
	//console.log(res.data);
		$.each(res.data,function(index,item){
			   
		    $(".engId").append("<option value='"+item.id+"' engSn='"+item.engSn+"' >"+item.engSn+"</option>");
		    
		});
	
	
})

$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    ordering: false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/engconditionfleet/list.do",
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
        {"data": "engSn"},
        {"data": "tsiStart"},
        {"data": "csiStart"},
        {"data": "svTime"},
        {"data": "tsrStart"},
        {"data": "csrStart"},
        {"data": "tsoStart"},
        {"data": "csoStart"},
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
                    + ' data-toggle="modal" data-target="#engconditionfleet-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deleteengconditionfleet(' + data.id + ')">'
                    + '<i class="fa fa-trash"></i>'
                    + '</button><butoon class="btn btn-default btn-sm" onclick="jump('+data.id+')" ><i class="fa fa-space-shuttle" aria-hidden="true"></i></button>'
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

// 存储点击行的内容
var cellWaterWashData = null;
 $('#table-list tbody').on('click', 'td', function () {
     var table = $('#table-list').DataTable();
     cellWaterWashData = table.cell(this).data();
 });

// 编辑按钮 → 发动机状态简报填充
 $('#engconditionfleet-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#editid').val(cellWaterWashData.id);
     modal.find('#editctime').val(cellWaterWashData.ctime);
     modal.find('#editengId').val(cellWaterWashData.engId);
     modal.find('#edittsiStart').val(cellWaterWashData.tsiStart);
     modal.find('#editcsiStart').val(cellWaterWashData.csiStart);
     modal.find('#editsvTime').val(cellWaterWashData.svTime);
     modal.find('#edittsrStart').val(cellWaterWashData.tsrStart);
     modal.find('#editcsrStart').val(cellWaterWashData.csrStart);
     modal.find('#edittsoStart').val(cellWaterWashData.tsoStart);
     modal.find('#editcsoStart').val(cellWaterWashData.csoStart);
 }).on('hide.bs.modal', function (event) {
     cellUserData = null;
 });
 // edit engconditionfleet
 function editengconditionfleet() {
		var id = $("#editid").val();
		var engId = $("#editengId").val();
		var engSn = $("#editengId").find("option:selected").attr("engSn");
		var tsiStart= $("#edittsiStart").val();
		var csiStart = $("#editcsiStart").val();
		var svTime = $("#editsvTime").val();
		var tsrStart = $("#edittsrStart").val();
		var csrStart = $("#editcsrStart").val();
		var tsoStart = $("#edittsoStart").val();
		var csoStart = $("#editcsoStart").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/engconditionfleet/saveOrUpdate.do",
		    {
		        "id": id,
		        "engId": engId,
		        "engSn": engSn,
		        "tsiStart": tsiStart,
		        "csiStart": csiStart,
		        "svTime": svTime,
		        "tsrStart": tsrStart,
		        "csrStart": csrStart,
		        "tsoStart": tsoStart,
		        "csoStart": csoStart,
		    },
		    function (res) {
		    	 $('#engconditionfleet-info-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
		reloadTable(true);
	}
 
 // add engconditionfleet
 function addengconditionfleet() {
		var engId = $("#addengId").val();
		var engSn = $("#addengId").find("option:selected").attr("engSn");
		var tsiStart= $("#addtsiStart").val();
		var csiStart = $("#addcsiStart").val();
		var svTime = $("#addsvTime").val();
		var tsrStart = $("#addtsrStart").val();
		var csrStart = $("#addcsrStart").val();
		var tsoStart = $("#addtsoStart").val();
		var csoStart = $("#addcsoStart").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/engconditionfleet/saveOrUpdate.do",
		    {
		        "engId": engId,
		        "engSn": engSn,
		        "tsiStart": tsiStart,
		        "csiStart": csiStart,
		        "svTime": svTime,
		        "tsrStart": tsrStart,
		        "csrStart": csrStart,
		        "tsoStart": tsoStart,
		        "csoStart": csoStart,
		    },
		    function (response) {
		    	 $('#engconditionfleet-add-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
		reloadTable(true);
	}
 
//跳转
 function jump(id){
 	url="${pageContext.request.contextPath}/manage/engconditionfleet/engconditionfleetdetail.do?id="+id+"&title=1";
 	title = "发动机状态简报详情";
	tab_url = self.frameElement.getAttribute('data_url');//iframe对应的data_url和tab对应的data_url是一致的
	window.parent.changePage(title,tab_url);//调用父页面的方法
	//跳转
	window.location.href=url;
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
 function searchengconditionfleet() {
	 var table = $('#table-list').DataTable();
	 table.ajax.reload(null, true);
 }
 
// delete
 function deleteengconditionfleet(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/engconditionfleet/delete.do",
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
//excel 导出
 $('#export').click(function(){
	 window.location = '${pageContext.request.contextPath}/manage/engconditionfleet/export.do';
 });
 
// 调用OCUpload插件的方法
$("#inport").upload({
     action: "${pageContext.request.contextPath}/manage/engconditionfleet/inport.do", //表单提交的地址
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
