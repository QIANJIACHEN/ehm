<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
    <style type="text/css">
    	table.planetable{
    		text-align:center;
    	}
    	table.planetable thead tr th {
    		text-align:center;
    	}
    	table.planetable tbody tr td:last-child span{
    		cursor:pointer;
    		color:#199ED8;
    	}
    	.nav-tabs > li.active > a{
    		    border: 1px solid #3399FF;
    		    border-bottom-color: transparent;
    	}
    	
    </style>
</head>
<script type="text/javascript" src="../../js/ocupload.js"></script>
<body class="hold-transition" >

<!-- Content Wrapper. Contains page content -->
<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">

        <div class="box-header with-border">
            <div class="row">
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-duty">
                    </select>
                </div>
            	<div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-planeId">
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchoil()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
           
                <div class="col-xs-1" style="min-width: 160px">
                    <button style="background:#f4f4f4;border-color:#ddd;color:black" id="i" class="btn btn-block btn-primary col-sm-1" data-toggle="modal" data-target="#oil-add-modal">
                        <i class="fa fa-plus"></i>
                       	 添加数据
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
                <table id="oilconsume" class="table  table-hover">
                    <thead>
                    <tr>
                        <th style="display: none;">id</th>
			            <th>执管基地</th>
			            <th>机号</th>
			            <th>飞行日期</th>
			            <th>1发加油时间差</th>
			            <th>2发加油时间差</th>
			            <th>1发滑油消耗率</th>
			            <th>2发滑油消耗率</th>
			            <th>录入人</th>
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

<jsp:include page='oiladd.jsp'/>
<jsp:include page='oilinfo.jsp'/>

<script type="text/javascript">
	$("#oilconsume").DataTable({
	    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
	    "serverSide": true,
	    "ordering": false,
	    "type": "POST",
	    "ajax": {
	        "url": "${pageContext.request.contextPath}/manage/oilconsumption/list.do",
	        "type": "POST",
	        "data": function (search) {
	        	// 条件查询参数
	        	search.duty = $("#search-duty").val();
	        	search.planeId = $("#search-planeId").val();
	        }
	    },
	    "columns": [
	        {"data": "id","visible": false},
	        {"data": "dutyName"},
	        {"data": "tail"},
	        {"data": "fltTime"},
	        {"data": "refuelTimeDifference1"},
	        {"data": "refuelTimeDifference2"},
	        {"data": "oilConsumeRate1"},
	        {"data": "oilConsumeRate2"},
	        {"data": "username"}
	    ],
	    "ordering": false,
	    "searching": false,
	     "columnDefs": [
	    	 {
	          	"targets" : 2,
	  			"render" : function(data, type, row) {
	  				return "<a href='javascript:void(0)' title1='13' tail='"+(data == null ? '-' : data)+"' onclick='jumpPlane(this)'>" + (data == null ? '-' : data)
	  						+ "</a>";
	  			}
	  		},
	         {
	            "targets": 9,
	            "data": function (row, type, val, meta) {
	                return row;
	            },
	            "render": function (data, type, full, meta) {
	                var table = $("#oilconsume").DataTable();
	                var result = '<div class="btn-group open">'
	                    + '<button class="btn btn-default btn-sm "'
	                    + ' data-toggle="modal" data-target="#oil-info-modal">'
	                    + '<i class="fa fa-gear"></i>'
	                    + '</button><button class="btn btn-default btn-sm" onclick="deleteoil(' + data.id + ')">'
	                    + '<i class="fa fa-trash"></i></button>'
	                    + '<button class="btn btn-default btn-sm" onclick="jump('+data.id+')" ><i class="fa fa-rocket" aria-hidden="true"></i></button>'
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
	 $('#oilconsume tbody').on('click', 'td', function () {
	     var table = $('#oilconsume').DataTable();
	     cellData = table.cell(this).data();
	 });
	 
	 /**
	  * 编辑按钮   → 信息填充
	  */
	  $('#oil-info-modal').on('show.bs.modal', function (event) {
	      var modal = $(this);
	      modal.find('#id').val(cellData.id);
	      modal.find('#configPlane').val(cellData.configPlane);
	      modal.find('#fltNo').val(cellData.fltNo);
	      modal.find('#fltTime').val(cellData.fltTime);
	      modal.find('#airTime').val(cellData.airTime);
	      modal.find('#groundTime').val(cellData.groundTime);
	      modal.find('#refuelOil1').val(cellData.refuelOil1);
	      modal.find('#oilAddition1').val(cellData.oilAddition1);
	      modal.find('#refuelTimeDifference1').val(cellData.refuelTimeDifference1);
	      modal.find('#oilConsume1').val(cellData.oilConsume1);
	      modal.find('#oilConsumeRate1').val(cellData.oilConsumeRate1);
	      modal.find('#refuelOil2').val(cellData.refuelOil2);
	      modal.find('#oilAddition2').val(cellData.oilAddition2);
	      modal.find('#refuelTimeDifference2').val(cellData.refuelTimeDifference2);
	      modal.find('#oilConsume2').val(cellData.oilConsume2);
	      modal.find('#oilConsumeRate2').val(cellData.oilConsumeRate2);
	      modal.find('#refuelOil3').val(cellData.refuelOil3);
	      modal.find('#oilAddition3').val(cellData.oilAddition3);
	      modal.find('#refuelTimeDifference3').val(cellData.refuelTimeDifference3);
	      modal.find('#oilConsume3').val(cellData.oilConsume3);
	      modal.find('#oilConsumeRate3').val(cellData.oilConsumeRate3);
	      modal.find('#refuelOil4').val(cellData.refuelOil4);
	      modal.find('#oilAddition4').val(cellData.oilAddition4);
	      modal.find('#refuelTimeDifference4').val(cellData.refuelTimeDifference4);
	      modal.find('#oilConsume4').val(cellData.oilConsume4);
	      modal.find('#oilConsumeRate4').val(cellData.oilConsumeRate4);
	      modal.find('#engVigilance').val(cellData.engVigilance);
	      modal.find('#apuOilAddition').val(cellData.apuOilAddition);
	      modal.find('#apuOilConsumeRate').val(cellData.apuOilConsumeRate);
	      modal.find('#apuOilConsumeVigilance').val(cellData.apuOilConsumeVigilance);
	  }).on('hide.bs.modal', function (event) {
	      cellData = null;
	  });
 
	 /**
	  * 重载列表
	  */
	 function reloadTable(reset) {
	     var table = $('#oilconsume').DataTable();
	     if (reset == true) {
	         table.ajax.reload(null, true);
	     } else {
	         table.ajax.reload();
	     }
 	}
 
	 /**
	  * search
	  */
	  function searchoil() {
	 	 reloadTable(true);
	  }
	 
	// add
	function addoil(){
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
			    url: "${pageContext.request.contextPath}/manage/oilconsumption/save.do",  
			    dataType: 'json', 
			    data: $('#form-add').serialize(),  
			    async: true,  // 是否异步
			    success: function(data) {  
			        //接收后台返回的结果  
			        if(data.code != 101){
			    		alert(data.msg); 
			        }
			        $('#oil-add-modal').modal('hide');
			         reloadTable(true);
			    }
			});
		}else{
			 alert('参数不完整！');
		}
	}
	
	// edit
	function editoil(){
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
			    url: "${pageContext.request.contextPath}/manage/oilconsumption/update.do",  
			    dataType: 'json', 
			    data: $('#form-info').serialize(),  
			    async: true,  // 是否异步
			    success: function(data) {  
			        //接收后台返回的结果  
			        if(data.code != 101){
			    		alert(data.msg); 
			        }
			        $('#oil-info-modal').modal('hide');
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
	 $("#oil-add-modal").on("hidden.bs.modal", function() {
	     $('#reset').click();
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
	
	 $('#i').click(function(){
		 $.post(
	             "${pageContext.request.contextPath}/manage/dataplane/allplane.do",
	             {},
	             function (response) {
	            	  $('#addtail').html('');
	            	  for(var o in response.data){
	            	      $('#addtail').append('<option value="'+response.data[o].id+'">'+response.data[o].tail+'</option>');
	            	  }  
	             },
	             "json"
	      );
	 });
	
	 $('#oilconsume tbody').click(function(){
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
	
	 $('#oilconsume tbody').click(function(){
		 $.post(
	             "${pageContext.request.contextPath}/manage/dataplane/allplane.do",
	             {},
	             function (response) {
	            	  $('#edittail').html('');
	            	  for(var o in response.data){
	            	      $('#edittail').append('<option value="'+response.data[o].id+'">'+response.data[o].tail+'</option>');
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
	             "${pageContext.request.contextPath}/manage/dataplane/allplane.do",
	             {},
	             function (response) {
	            	  $('#search-planeId').html('');
	            	  $('#search-planeId').append('<option value="">全部机号</option>');
	            	  for(var o in response.data){
	            	      $('#search-planeId').append('<option value="'+response.data[o].id+'">'+response.data[o].tail+'</option>');
	            	  }  
	             },
	             "json"
	      );
	});
	 
	// excel 导出
	 $('#export').click(function(){
		 window.location = '${pageContext.request.contextPath}/manage/oilconsumption/export.do';
	 });
	 
	// 调用OCUpload插件的方法
	$("#inport").upload({
	     action: "${pageContext.request.contextPath}/manage/oilconsumption/inport.do", //表单提交的地址
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
	 /**
	  * delete
	  */
	  function deleteoil(id) {
	      if (confirm("你确定要删除吗？")) {
	          $.post(
	              "${pageContext.request.contextPath}/manage/oilconsumption/delete.do",
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
		title = "滑油数据详情";
		tab_url = self.frameElement.getAttribute('data_url');//iframe对应的data_url和tab对应的data_url是一致的
		window.parent.changePage(title,tab_url);//调用父页面的方法
		url ="${pageContext.request.contextPath}/manage/oilconsumption/oildetail.do?id="+id+"&title=1";
		window.location.href=url;
	}
	 
</script>



</body>
</html>
