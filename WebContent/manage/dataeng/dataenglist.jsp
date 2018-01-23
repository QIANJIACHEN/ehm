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
                    <input type="text" class=" form-control" id="search-engSn" placeholder="发动机SN">
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-bz-status">
                        <option>全部</option>
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchdataeng()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button style="background:#f4f4f4;border-color:#ddd;color:black" class="btn btn-block col-sm-1" data-toggle="modal" data-target="#dataeng-add-modal">
                        <i class="fa fa-plus"></i>
                       	 添加发动机
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
            	
                <table id="table-list" class="table  table-hover">
                    <thead>
                    <tr>
                        <th style="display:none">id</th>
                        <th>发动机SN</th>
                        <th>SAP平台显示的方式</th>
                        <th style="display:none">发动机序列</th>
                        <th style="display:none">发动机类型</th>
                        <th style="display:none">发动机模型</th>
                        <th>发动机构型</th>
                        <th>原始厂商</th>
                        <th>所有人</th>
                        <th style="display:none">CODE_CONFIG</th>
                        <th style="display:none">发动机型号另一种标识</th>
                        <th>创建时间</th>
                        <th>发动机设备号</th>
                        <th>状态</th>
                        <th>备注</th>
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

<jsp:include page='dataenginfo.jsp'/>
<jsp:include page='dataengadd.jsp'/>

<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    "ordering": false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/dataeng/list.do",
        "type": "POST",
        "data": function (search) {
        	// 条件查询参数
        	search.engSn = $("#search-engSn").val();
        }
    },
    "columns": [
        {"data": "id","visible": false},
        {"data": "engSn"},
        {"data": "engSnSap"},
        {"data": "engSeries","visible": false},
        {"data": "engType","visible": false},
        {"data": "engModel","visible": false},
        {"data": "engConfig"},
        {"data": "deliveryMode"},
        {"data": "owner"},
        {"data": "codeConfig","visible": false},
        {"data": "engConfigration","visible": false},
        {"data": "ctime"},
        {"data": "engPn"},
        {"data": "condition"},
        {"data": "remark"}
    ],
    "ordering": false,
    "searching": false,
     "columnDefs": [
        {
            "targets": 15,
            "data": function (row, type, val, meta) {
                return row;
            },
            "render": function (data, type, full, meta) {
                var table = $("#table-list").DataTable();
                var result = '<div class="btn-group open">'
                    + '<button class="btn btn-default btn-sm "'
                    + ' data-toggle="modal" data-target="#dataeng-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deletedataeng(' + data.id + ')">'
                    + '<i class="fa fa-trash"></i></button>'
                    + '<butoon class="btn btn-default btn-sm" engSn="'+data.engSn+'" onclick="jump(this)" ><i class="fa fa-rocket" aria-hidden="true"></i></button>'
                    +'</div>';
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
 $('#dataeng-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#editengSn').val(cellData.engSn);
     modal.find('#editengSnSap').val(cellData.engSnSap);
     modal.find('#editengSeries').val(cellData.engSeries);
     modal.find('#editengType').val(cellData.engType);
     modal.find('#editengModel').val(cellData.engModel);
     modal.find('#editengConfig').val(cellData.engConfig);
     modal.find('#editdeliveryMode').val(cellData.deliveryMode);
     modal.find('#editowner').val(cellData.owner);
     modal.find('#editcodeConfig').val(cellData.codeConfig);
     modal.find('#editengConfigration').val(cellData.engConfigration);
     modal.find('#editengPn').val(cellData.engPn);
     modal.find('#editcondition').val(cellData.condition);
     modal.find('#editremark').val(cellData.remark);
 }).on('hide.bs.modal', function (event) {
     cellData = null;
 });
 
 // edit
 function editdataeng() {
		var id = cellData.id;
		var engSn = $("#editengSn").val();
		var engSnSap = $("#editengSnSap").val();
		var engSeries= $("#editengSeries").val();
		var engType = $("#editengType").val();
		var engModel = $("#editengModel").val();
		var engConfig = $("#editengConfig").val();
		var deliveryMode = $("#editdeliveryMode").val();
		var owner = $("#editowner").val();
		var codeConfig = $("#editcodeConfig").val();
		var engConfigration = $("#editengConfigration").val();
		var engPn = $("#editengPn").val();
		var condition = $("#editcondition").val();
		var remark = $("#editremark").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/dataeng/update.do",
		    {
		        "id": id,
		        "engSn": engSn,
		        "engSnSap": engSnSap,
		        "engSeries": engSeries,
		        "engType": engType,
		        "engModel": engModel,
		        "engConfig": engConfig,
		        "deliveryMode": deliveryMode,
		        "owner": owner,
		        "codeConfig": codeConfig,
		        "engConfigration": engConfigration,
		        "engPn": engPn,
		        "condition": condition,
		        "remark": remark
		    },
		    function (response) {
		    	 $('#dataeng-info-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
	}
 
 // add 
 function adddataeng() {
		var engSn = $("#addengSn").val();
		var engSnSap = $("#addengSnSap").val();
		var engSeries= $("#addengSeries").val();
		var engType = $("#addengType").val();
		var engModel = $("#addengModel").val();
		var engConfig = $("#addengConfig").val();
		var deliveryMode = $("#adddeliveryMode").val();
		var owner = $("#addowner").val();
		var codeConfig = $("#addcodeConfig").val();
		var engConfigration = $("#addengConfigration").val();
		var engPn = $("#addengPn").val();
		var condition = $("#addcondition").val();
		var remark = $("#addremark").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/dataeng/save.do",
		    {
		        "engSn": engSn,
		        "engSnSap": engSnSap,
		        "engSeries": engSeries,
		        "engType": engType,
		        "engModel": engModel,
		        "engConfig": engConfig,
		        "deliveryMode": deliveryMode,
		        "owner": owner,
		        "codeConfig": codeConfig,
		        "engConfigration": engConfigration,
		        "engPn": engPn,
		        "condition": condition,
		        "remark": remark
		    },
		    function (response) {
		    	if(response.code != 101){
		    		alert(response.msg);
		    	}
		    	 $('#dataeng-add-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
	}

 /**
  * 清除弹窗原数据
  */
  $("#dataeng-add-modal").on("hidden.bs.modal", function() {
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
 function searchdataeng() {
	 reloadTable(true);
 }
 
// delete
 function deletedataeng(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/dataeng/delete.do",
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
 
	//excel 导出
	 $('#export').click(function(){
		 window.location = '${pageContext.request.contextPath}/manage/dataeng/export.do';
	 });
 
	// 调用OCUpload插件的方法
	$("#inport").upload({
	     action: "${pageContext.request.contextPath}/manage/dataeng/inport.do", //表单提交的地址
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
	function jump(object){
		engSn = $(object).attr("engSn");
		title = "发动机详情";
		tab_url = self.frameElement.getAttribute('data_url');//iframe对应的data_url和tab对应的data_url是一致的
		window.parent.changePage(title,tab_url);//调用父页面的方法
		url ="${pageContext.request.contextPath}/manage/dataeng/dataenglistdetail.do?engSn="+engSn+"&title=1";
		window.location.href=url;
	}
</script>
</body>
</html>
