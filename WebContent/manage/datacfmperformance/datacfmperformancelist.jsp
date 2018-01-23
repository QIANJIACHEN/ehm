<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
</head>
<script type="text/javascript" src="../../js/ocupload.js"></script>
<body class="hold-transition" >

<!-- Content Wrapper. Contains page content -->
<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">

        <div class="box-header with-border">
            <div class="row">
                <div class="col-xs-1" style="min-width: 160px">
                    <input type="text" class=" form-control" id="search-key" placeholder="发动机号">
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchxx()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button id="i" class="btn btn-block btn-default" data-toggle="modal" data-target="#datacfmperformance-add-modal">
                        <i class="fa fa-plus"></i>
                       	 添加
                    </button>
                </div>
            </div>
            <br>
            <div class="row">
        		<div class="col-xs-1" style="min-width:150px;padding-bottom:5px">
        			<a href="dffimagereport.do" class="btn btn-block btn-primary">双发DFF报表</a>
        		</div>
        		<div class="col-xs-1" style="min-width:150px;padding-bottom:5px">
        			<a href="degtimagereport.do" class="btn btn-block btn-primary">双发DEGT报表</a>
        		</div>
        		<div class="col-xs-1" style="min-width:150px;padding-bottom:5px">
        			<a href="egtmimagereport.do" class="btn btn-block btn-primary">双发EGTM报表</a>
        		</div>
        		<div class="col-xs-1" style="min-width:150px;padding-bottom:5px">
        			<a href="dcsimagereport.do" class="btn btn-block btn-primary">双发DCS报表</a>
        		</div>
        		<div class="col-xs-1" style="min-width:150px;padding-bottom:5px">
        			<a href="performanceimagereport.do" class="btn btn-block btn-primary">双发性能报表</a>
        		</div>
        		<div class="col-xs-1 pull-right" style="min-width:150px;padding-bottom:5px">
        			<button id="export" class="btn btn-block btn-primary">导出</button>
        		</div>
        		<div class="col-xs-1 pull-right" style="min-width:150px;padding-bottom:5px">
        			<button id="inport" class="btn btn-block btn-primary">导入</button>
        		</div>
        	</div>
        </div>
        <div class="box-body" style="padding-top:20px">

            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <table id="table-list" class="table  table-hover">
                    <thead>
                    <tr>
                    	<th style="display: none;">ID</th>
                        <th>机号</th>
                        <th>EPOSITION</th>
                        <th>ESN</th>
                        <th>FLIGHT_PHASE</th>
                        <th>飞行时间</th>
                        <th>发动机类型</th>
                        <th>N1 Phase Angle Rear</th>
                        <th>Delta Core Speed Smoothed</th>
                        <th>Delta EGT Smoothed</th>
                        <th>N1 Phase Angle Fwd</th>
                        <th>EGT Hot Day Margin Divergence</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page='datacfmperformanceinfo.jsp'/>
<jsp:include page='datacfmperformanceadd.jsp'/>


<script type="text/javascript">

$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    ordering: false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/datacfmperformance/list.do",
        "type": "POST",
        "data": function (d) {
        	// 条件查询参数
        	d.key = $("#search-key").val();
        }
    },
    "columns": [
    	{"data":"id","visible": false},
        {"data": "tail"},
        null,
        {"data": "esn"},
        null,
        {"data": "flightDateTime"},
        {"data": "engineType"},
        {"data": "zphsr"},
        {"data": "gpcn25Smoothed"},
        {"data": "degtSmoothed"},
        {"data": "zphsf"},
        {"data": "egthdmD"},
        null
    ],
    "ordering": false,
    "searching": false,
    "columnDefs": [
    	// {
        // 	"targets" : 1,
 		//	"render" : function(data, type, row) {
 		//		return "<a href='javascript:openView(\"" + row.id
 		//				+ "\")'>" + (data == null ? '-' : data)
 		//				+ "</a>";
 		//	}
 		//},
 		{
         	"targets" : 1,
 			"render" : function(data, type, row) {
 				return "<a href='javascript:void(0)' title1='12' tail='"+(data == null ? '-' : data)+"' onclick='jumpPlane(this)'>" + (data == null ? '-' : data)
 						+ "</a>";
 			}
 		},
    	{
    		"targets": 2,
            "data": function (row, type, val, meta) {
                if (row.eposition == 1) {
                    return "左发";
                } else if (row.eposition == 2){
                    return "右发";
                } else {
               	 return "-";
                }
            }
        },
        {
         	"targets" : 3,
 			"render" : function(data, type, row) {
 				return "<a href='javascript:void(0)' title1='12' engSn='"+(data == null ? '-' : data)+"' onclick='jumpEng(this)'>" + (data == null ? '-' : data)
 						+ "</a>";
 			}
 		},
    	{
        	"targets": 4,
            "data": function (row, type, val, meta) {
                if (row.flightPhase == 'TAKEOFF') {
                    return "起飞";
                } else if (row.flightPhase == 'CRUISE'){
                    return "巡航";
                } else {
               	 return "-";
                }
            }
        },
        {
            "targets": 12,
            "data": function (row, type, val, meta) {
                return row;
            },
            "render": function (data, type, full, meta) {
                var table = $("#table-list").DataTable();
                var result = '<div class="btn-group open">'
                    + '<button class="btn btn-default btn-sm "'
                    + ' data-toggle="modal" data-target="#datacfmperformance-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deletedatacfmperformance(' + data.id + ')">'
                    + '<i class="fa fa-trash"></i></button>'
                    + '</button><button class="btn btn-default btn-sm" onclick="openView('+data.id+')">'
                    + '<i class="fa fa-space-shuttle" aria-hidden="true"></i></button></div>';
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
 $('#datacfmperformance-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#id').val(cellData.id);
     modal.find('#editeposition').val(cellData.eposition);
     modal.find('#editesn').val(cellData.esn);
     modal.find('#editflightPhase').val(cellData.flightPhase);
     modal.find('#editflightDateTime').val(cellData.flightDateTime);
     modal.find('#editengineType').val(cellData.engineType);
     modal.find('#editzphsr').val(cellData.zphsr);
     modal.find('#editgpcn25Smoothed').val(cellData.gpcn25Smoothed);
     modal.find('#editdegtSmoothed').val(cellData.degtSmoothed);
     modal.find('#editzphsf').val(cellData.zphsf);
     modal.find('#editegthdmD').val(cellData.egthdmD);
     modal.find('#editzvb1fSmoothed').val(cellData.zvb1fSmoothed);
     modal.find('#editgwfm').val(cellData.gwfm);
     modal.find('#editegthdm').val(cellData.egthdm);
     modal.find('#editgwfmD').val(cellData.gwfmD);
     modal.find('#editzvb1r').val(cellData.zvb1r);
     modal.find('#editegthdmDSmoothed').val(cellData.egthdmDSmoothed);
     modal.find('#editztoil').val(cellData.ztoil);
     modal.find('#editzvb2f').val(cellData.zvb2f);
     modal.find('#editzvb2r').val(cellData.zvb2r);
     modal.find('#editzvb1f').val(cellData.zvb1f);
     modal.find('#editzvb2rSmoothed').val(cellData.zvb2rSmoothed);
     modal.find('#editdegtDSmoothed').val(cellData.degtDSmoothed);
     modal.find('#editgpcn25D').val(cellData.gpcn25D);
     modal.find('#editzvb1rSmoothed').val(cellData.zvb1rSmoothed);
     modal.find('#editztoilSmoothed').val(cellData.ztoilSmoothed);
     modal.find('#editgwfmSmoothed').val(cellData.gwfmSmoothed);
     modal.find('#editgpcn25').val(cellData.gpcn25);
     modal.find('#editgwfmDSmoothed').val(cellData.gwfmDSmoothed);
     modal.find('#editgpcn25DSmoothed').val(cellData.gpcn25DSmoothed);
     modal.find('#editzvb2fSmoothed').val(cellData.zvb2fSmoothed);
     modal.find('#editzpoilSmoothed').val(cellData.zpoilSmoothed);
     modal.find('#editegthdmSmoothed').val(cellData.egthdmSmoothed);
     modal.find('#editdegtD').val(cellData.degtD);
     modal.find('#editzpoil').val(cellData.zpoil);
     modal.find('#editzt49').val(cellData.zt49);
     modal.find('#editdegt').val(cellData.degt);
 }).on('hide.bs.modal', function (event) {
     cellData = null;
 });
 
 // edit datacfmperformance
 function editdatacfmperformance() {
		//var id = cellData.id;
		var id = $("#id").val();
		var planeId = $("#editplaneId").val();
		var eposition = $("#editeposition").val();
		var engId = $("#editengId").val();
		var esn= $("#editesn").val();
		var flightPhase = $("#editflightPhase").val();
		var flightDateTime = $("#editflightDateTime").val();
		var engineType = $("#editengineType").val();
		var zphsr = $("#editzphsr").val();
		var gpcn25Smoothed = $("#editgpcn25Smoothed").val();
		var degtSmoothed = $("#editdegtSmoothed").val();
		var zphsf = $("#editzphsf").val();
		var egthdmD = $("#editegthdmD").val();
		var zvb1fSmoothed = $("#editzvb1fSmoothed").val();
		var gwfm = $("#editgwfm").val();
		var egthdm = $("#editegthdm").val();
		var gwfmD = $("#editgwfmD").val();
		var zvb1r = $("#editzvb1r").val();
		var egthdmDSmoothed = $("#editegthdmDSmoothed").val();
		var ztoil = $("#editztoil").val();
		var zvb2f = $("#editzvb2f").val();
		var zvb2r = $("#editzvb2r").val();
		var zvb1f = $("#editzvb1f").val();
		var zvb2rSmoothed = $("#editzvb2rSmoothed").val();
		var degtDSmoothed = $("#editdegtDSmoothed").val();
		var gpcn25D = $("#editgpcn25D").val();
		var zvb1rSmoothed = $("#editzvb1rSmoothed").val();
		var ztoilSmoothed = $("#editztoilSmoothed").val();
		var gwfmSmoothed = $("#editgwfmSmoothed").val();
		var gpcn25 = $("#editgpcn25").val();
		var gwfmDSmoothed = $("#editgwfmDSmoothed").val();
		var gpcn25DSmoothed = $("#editgpcn25DSmoothed").val();
		var zvb2fSmoothed = $("#editzvb2fSmoothed").val();
		var zpoilSmoothed = $("#editzpoilSmoothed").val();
		var egthdmSmoothed = $("#editegthdmSmoothed").val();
		var degtD = $("#editdegtD").val();
		var zpoil = $("#editzpoil").val();
		var zt49 = $("#editzt49").val();
		var degt = $("#editdegt").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/datacfmperformance/update.do",
		    {
		        "id": id,
		        "planeId": planeId,
		        "eposition": eposition,
		        "engId": engId,
		        "esn": esn,
		        "flightPhase": flightPhase,
		        "flightDateTime": flightDateTime,
		        "engineType": engineType,
		        "zphsr": zphsr,
		        "gpcn25Smoothed": gpcn25Smoothed,
		        "degtSmoothed": degtSmoothed,
		        "zphsf": zphsf,
		        "egthdmD": egthdmD,
		        "zvb1fSmoothed": zvb1fSmoothed,
		        "gwfm": gwfm,
		        "egthdm": egthdm,
		        "gwfmD": gwfmD,
		        "zvb1r": zvb1r,
		        "egthdmDSmoothed": egthdmDSmoothed,
		        "ztoil": ztoil,
		        "zvb2f": zvb2f,
		        "zvb2r": zvb2r,
		        "zvb1f": zvb1f,
		        "zvb2rSmoothed": zvb2rSmoothed,
		        "degtDSmoothed": degtDSmoothed,
		        "gpcn25D": gpcn25D,
		        "zvb1rSmoothed": zvb1rSmoothed,
		        "ztoilSmoothed": ztoilSmoothed,
		        "gwfmSmoothed": gwfmSmoothed,
		        "gpcn25": gpcn25,
		        "gwfmDSmoothed": gwfmDSmoothed,
		        "gpcn25DSmoothed": gpcn25DSmoothed,
		        "zvb2fSmoothed": zvb2fSmoothed,
		        "zpoilSmoothed": zpoilSmoothed,
		        "egthdmSmoothed": egthdmSmoothed,
		        "degtD": degtD,
		        "zpoil": zpoil,
		        "zt49": zt49,
		        "degt": degt
		    },
		    function (res) {
		    	 $('#datacfmperformance-info-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
		reloadTable(true);
	}
 
 // add datacfmperformance
 function adddatacfmperformance() {
		var planeId = $("#addplaneId").val();
		var eposition = $("#addeposition").val();
		var engId = $("#addengId").val();
		var esn= $("#addesn").val();
		var flightPhase = $("#addflightPhase").val();
		var flightDateTime = $("#addflightDateTime").val();
		var engineType = $("#addengineType").val();
		var zphsr = $("#addzphsr").val();
		var gpcn25Smoothed = $("#addgpcn25Smoothed").val();
		var degtSmoothed = $("#adddegtSmoothed").val();
		var zphsf = $("#addzphsf").val();
		var egthdmD = $("#addegthdmD").val();
		var zvb1fSmoothed = $("#addzvb1fSmoothed").val();
		var gwfm = $("#addgwfm").val();
		var egthdm = $("#addegthdm").val();
		var gwfmD = $("#addgwfmD").val();
		var zvb1r = $("#addzvb1r").val();
		var egthdmDSmoothed = $("#addegthdmDSmoothed").val();
		var ztoil = $("#addztoil").val();
		var zvb2f = $("#addzvb2f").val();
		var zvb2r = $("#addzvb2r").val();
		var zvb1f = $("#addzvb1f").val();
		var zvb2rSmoothed = $("#addzvb2rSmoothed").val();
		var degtDSmoothed = $("#adddegtDSmoothed").val();
		var gpcn25D = $("#addgpcn25D").val();
		var zvb1rSmoothed = $("#addzvb1rSmoothed").val();
		var ztoilSmoothed = $("#addztoilSmoothed").val();
		var gwfmSmoothed = $("#addgwfmSmoothed").val();
		var gpcn25 = $("#addgpcn25").val();
		var gwfmDSmoothed = $("#addgwfmDSmoothed").val();
		var gpcn25DSmoothed = $("#addgpcn25DSmoothed").val();
		var zvb2fSmoothed = $("#addzvb2fSmoothed").val();
		var zpoilSmoothed = $("#addzpoilSmoothed").val();
		var egthdmSmoothed = $("#addegthdmSmoothed").val();
		var degtD = $("#adddegtD").val();
		var zpoil = $("#addzpoil").val();
		var zt49 = $("#addzt49").val();
		var degt = $("#adddegt").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/datacfmperformance/save.do",
		    {
		        "planeId": planeId,
		        "eposition": eposition,
		        "engId": engId,
		        "esn": esn,
		        "flightPhase": flightPhase,
		        "flightDateTime": flightDateTime,
		        "engineType": engineType,
		        "zphsr": zphsr,
		        "gpcn25Smoothed": gpcn25Smoothed,
		        "degtSmoothed": degtSmoothed,
		        "zphsf": zphsf,
		        "egthdmD": egthdmD,
		        "zvb1fSmoothed": zvb1fSmoothed,
		        "gwfm": gwfm,
		        "egthdm": egthdm,
		        "gwfmD": gwfmD,
		        "zvb1r": zvb1r,
		        "egthdmDSmoothed": egthdmDSmoothed,
		        "ztoil": ztoil,
		        "zvb2f": zvb2f,
		        "zvb2r": zvb2r,
		        "zvb1f": zvb1f,
		        "zvb2rSmoothed": zvb2rSmoothed,
		        "degtDSmoothed": degtDSmoothed,
		        "gpcn25D": gpcn25D,
		        "zvb1rSmoothed": zvb1rSmoothed,
		        "ztoilSmoothed": ztoilSmoothed,
		        "gwfmSmoothed": gwfmSmoothed,
		        "gpcn25": gpcn25,
		        "gwfmDSmoothed": gwfmDSmoothed,
		        "gpcn25DSmoothed": gpcn25DSmoothed,
		        "zvb2fSmoothed": zvb2fSmoothed,
		        "zpoilSmoothed": zpoilSmoothed,
		        "egthdmSmoothed": egthdmSmoothed,
		        "degtD": degtD,
		        "zpoil": zpoil,
		        "zt49": zt49,
		        "degt": degt
		    },
		    function (response) {
		    	 $('#datacfmperformance-add-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
	}
 
	 /**
	  * 清除弹窗原数据
	  */
	  $("#datacfmperformance-add-modal").on("hidden.bs.modal", function() {
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
	 function deletedatacfmperformance(id) {
	     if (confirm("你确定要删除吗？")) {
	         $.post(
	             "${pageContext.request.contextPath}/manage/datacfmperformance/delete.do",
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
	 
	 // 跳转详细页面
	 function openView(id){
		 window.location = '${pageContext.request.contextPath}/manage/datacfmperformance/detail.do?id='+ id;
	 }
	
	 $('#i').click(function(){
		 $.post(
	             "${pageContext.request.contextPath}/manage/dataplane/allplane.do",
	             {},
	             function (response) {
	            	  $('#addplaneId').html('');
	            	  for(var o in response.data){
	            	      $('#addplaneId').append('<option value="'+response.data[o].id+'">'+response.data[o].tail+'</option>');
	            	  }  
	             },
	             "json"
	      );
	 });
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
	 $('#table-list tbody').click(function(){
		 $.post(
	             "${pageContext.request.contextPath}/manage/dataplane/allplane.do",
	             {},
	             function (response) {
	            	  $('#editplaneId').html('');
	            	  for(var o in response.data){
	            	      $('#editplaneId').append('<option value="'+response.data[o].id+'">'+response.data[o].tail+'</option>');
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
		 window.location = '${pageContext.request.contextPath}/manage/datacfmperformance/export.do';
	 });

	// 调用OCUpload插件的方法
	$("#inport").upload({
	     action: "${pageContext.request.contextPath}/manage/datacfmperformance/inport.do", //表单提交的地址
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
