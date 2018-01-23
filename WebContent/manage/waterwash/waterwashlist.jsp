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
                    <select class="form-control" id="search-bz-status">
                    	<option disabled selected >水洗时间</option>
                        <option>2017年12月</option>
                    </select>
                </div>
 
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-bz-status">
                    	<option disabled selected >执管基地</option>
                        <option>全部</option>
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-account-status">
                    
                        <option disabled selected >水洗人员</option>
                        <option>AAA</option>
                    </select>
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
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchwaterwash()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default col-sm-1" data-toggle="modal" data-target="#waterwash-add-modal">
                        <i class="fa fa-search"></i>
                      	  添加
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
                        <th>创建时间</th>
                        <th>天气</th>
                        <th>地理位置</th>
                        <th>发动机编号</th>
                        <th>持续时间</th>
                        <th>效果</th>
                        <th>评级</th>
                        <th>水洗人员</th>
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
                    				<button class="btn btn-default btn-sm" onclick="deleteuser()">
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
                    				<button class="btn btn-default btn-sm" onclick="deleteuser()">
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
<jsp:include page='waterwashinfo.jsp'/>
<jsp:include page='waterwashadd.jsp'/>
<jsp:include page='../public/delete.jsp'/>



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
        "url": "${pageContext.request.contextPath}/manage/waterwash/list.do",
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
        {"data": "ctime"},
        {"data": "weather"},
        {"data": "geographic"},
        {"data": "engSn"},
        {"data": "durationTime"},
        {"data": "result"},
        {"data": "level"},
        {"data": "userId"},
        null
    ],
    "ordering": false,
    "searching": false,
    "columnDefs": [
    	{
         	"targets" : 4,
 			"render" : function(data, type, row) {
 				return "<a href='javascript:void(0)' title1='13' engSn='"+(data == null ? '-' : data)+"' onclick='jumpEng(this)'>" + (data == null ? '-' : data)
 						+ "</a>";
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
                    + ' data-toggle="modal" data-target="#waterwash-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deletewaterwash(' + data.id + ')">'
                    + '<i class="fa fa-trash"></i></button>'
                    + '<button class="btn btn-default btn-sm" onclick="jump('+data.id+')">'
                    +'<i class="fa fa-shower" aria-hidden="true"></i></button>'
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

// 编辑按钮 → 用户信息填充
 $('#waterwash-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#editid').val(cellWaterWashData.id);
     modal.find('#editparameterApparatus').val(cellWaterWashData.parameterApparatus);
     modal.find('#edituserId').val(cellWaterWashData.userId);
     modal.find('#editgeographic').val(cellWaterWashData.geographic);
     modal.find('#editweather').val(cellWaterWashData.weather);
     modal.find('#editengId').val(cellWaterWashData.engId);
     modal.find('#editresult').val(cellWaterWashData.result);
     modal.find('#editlevel').val(cellWaterWashData.level);
     modal.find('#editdurationTime').val(cellWaterWashData.durationTime);
     modal.find('#editctime').val(cellWaterWashData.ctime);
 }).on('hide.bs.modal', function (event) {
     cellUserData = null;
 });
 
 // edit user
 function editwaterwash() {
		var id = $("#editid").val();
		var parameterApparatus = $("#editparameterApparatus").val();
		var userId = $("#edituserId").val();
		var geographic= $("#editgeographic").val();
		var weather = $("#editweather").val();
		var engId = $("#editengId").val();
		var engSn = $("#editengId").find("option:selected").attr("engSn");
		var result = $("#editresult").val();
		var level = $("#editlevel").val();
		var durationTime = $("#editdurationTime").val();
		var ctime = $("#editctime").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/waterwash/saveOrUpdate.do",
		    {
		        "id": id,
		        "parameterApparatus": parameterApparatus,
		        "userId": userId,
		        "geographic": geographic,
		        "weather": weather,
		        "engId":engId,
		        "engSn": engSn,
		        "result": result,
		        "level": level,
		        "durationTime": durationTime,
		        "ctime": ctime
		    },
		    function (res) {
		    	 $('#waterwash-info-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
		$('#waterwash-info-modal').modal('hide');
        reloadTable(true);
	}
 
 // add user
 function addwaterwash() {
		var parameterApparatus = $("#addparameterApparatus").val();
		var userId = $("#adduserId").val();
		var geographic= $("#addgeographic").val();
		var weather = $("#addweather").val();
		var engId = $("#addengId").val();
		var engSn = $("#addengId").find("option:selected").attr("engSn");
		var result = $("#addresult").val();
		var level = $("#addlevel").val();
		var durationTime = $("#adddurationTime").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/waterwash/saveOrUpdate.do",
		    {
		        "parameterApparatus": parameterApparatus,
		        "userId": userId,
		        "geographic": geographic,
		        "weather": weather,
		        "engId":engId,
		        "engSn": engSn,
		        "result": result,
		        "level": level,
		        "durationTime": durationTime
		    },
		    function (response) {
		    	 $('#waterwash-add-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
		$('#waterwash-add-modal').modal('hide');
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
 function searchwaterwash() {
	var table = $('#table-list').DataTable();
	table.ajax.reload(null, true);
 }
 
// delete
 function deletewaterwash(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/waterwash/delete.do",
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
 // excel 导出
 $('#export').click(function(){
	 window.location = '${pageContext.request.contextPath}/manage/waterwash/export.do';
 });
 
// 调用OCUpload插件的方法
$("#inport").upload({
     action: "${pageContext.request.contextPath}/manage/waterwash/inport.do", //表单提交的地址
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

//跳转
function jump(id){
	url="${pageContext.request.contextPath}/manage/waterwash/waterwashdetail.do?id="+id;
	title = "水洗详情";
	tab_url = self.frameElement.getAttribute('data_url');//iframe对应的data_url和tab对应的data_url是一致的
	window.parent.changePage(title,tab_url);//调用父页面的方法
	window.location.href = url;
}
</script>
</body>
</html>
