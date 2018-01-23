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
            <!-- 
                <div class="col-xs-2" style="min-width: 160px">
                    <input type="text" class=" form-control" id="search-key" placeholder="发动机号">
                </div>
 
                

                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchengdeadlinellp()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                -->  
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
                    <button class="btn btn-block btn-default col-sm-1" data-toggle="modal" data-target="#engdeadlinellp-add-modal">
                        <i class="fa fa-plus"></i>
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
                        <th>发动机编号</th>
                        <th>DEADLINE_LLP</th>
                        <th>DEADLINE_211</th>
                        <th>操作</th>
                    </tr>
                    </thead>
	
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page='engdeadlinellpinfo.jsp'/>
<jsp:include page='engdeadlinellpadd.jsp'/>


<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    ordering: false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/engdeadlinellp/list.do",
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
        {"data": "deadLineLlp"},
        {"data": "deadLine211"},
        null
    ],
    "ordering": false,
    "searching": false,
    "columnDefs": [
    	{
         	"targets" : 1,
 			"render" : function(data, type, row) {
 				return "<a href='javascript:void(0)' title1='14' engSn='"+(data == null ? '-' : data)+"' onclick='jumpEng(this)'>" + (data == null ? '-' : data)
 						+ "</a>";
 			}
 		},
        {
            "targets":4,
            "data": function (row, type, val, meta) {
                return row;
            },
            "render": function (data, type, full, meta) {
                var table = $("#table-list").DataTable();
                var result = '<div class="btn-group open">'
                    + '<button class="btn btn-default btn-sm "'
                    + ' data-toggle="modal" data-target="#engdeadlinellp-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deleteengdeadlinellp(' + data.id + ')">'
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

// 存储点击行的内容
var cellWaterWashData = null;
 $('#table-list tbody').on('click', 'td', function () {
     var table = $('#table-list').DataTable();
     cell = table.cell(this).data();
 });

// 编辑按钮 → 机队清单填充
 $('#engdeadlinellp-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#editid').val(cell.id);
	 modal.find('#editengSn').val(cell.engId);
     modal.find('#editdeadLineLlp').val(cell.deadLineLlp);
     modal.find('#editdeadLine211').val(cell.deadLine211);
 }).on('hide.bs.modal', function (event) {
     cellUserData = null;
 });
 // edit engdeadlinellp
 function editengdeadlinellp() {
		var id = $("#editid").val();
		var engId = $("#editengSn").val();
		var engSn = $("#editengSn").find("option:selected").attr("engSn");
		var deadLineLlp = $("#editdeadLineLlp").val();
		var deadLine211 = $("#editdeadLine211").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/engdeadlinellp/saveOrUpdate.do",
		    {
		        "id": id,
		        "engId":engId,
		        "engSn": engSn,
		        "deadLineLlp": deadLineLlp,
		        "deadLine211": deadLine211
		    },
		    function (res) {
		    	 $('#engdeadlinellp-info-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
		reloadTable(true);
	}
 
 // add user
 function addengdeadlinellp() {
		var engId = $("#addengSn").val();
		var engSn = $("#addengSn").find("option:selected").attr("engSn");
		var deadLineLlp = $("#adddeadLineLlp").val();
		var deadLine211 = $("#adddeadLine211").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/engdeadlinellp/saveOrUpdate.do",
		    {
		        "engId":engId,
		        "engSn": engSn,
		        "deadLineLlp": deadLineLlp,
		        "deadLine211": deadLine211
		    },
		    function (response) {
		    	 $('#engdeadlinellp-add-modal').modal('hide');
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
    	 window.location.reload(true);
        // table.ajax.reload(null, true);
     } else {
         table.ajax.reload();
     }
 }

 // search 
 function searchengdeadlinellp() {
	 var table = $('#table-list').DataTable();
	 table.ajax.reload(null, true);
 }
 
// delete
 function deleteengdeadlinellp(id) {
     if (confirm("你确定要删除吗？")) {
         $.post(
             "${pageContext.request.contextPath}/manage/engdeadlinellp/delete.do",
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

 //获取发动机
 $.post("${pageContext.request.contextPath}/manage/dataeng/allDataEng.do",function(res){

 	$(".engId").empty();
 	$(".engId").append('<option value="0" engSn="0" engPn="0">请选择</option>');
 		res = JSON.parse(res);
 		$.each(res.data,function(index,item){
 			   
 		    $(".engId").append("<option value='"+item.id+"' engSn='"+item.engSn+"' engPn='"+item.engPn+"'>"+item.engSn+"</option>");
 		    
 		});
 	
 })
 
 // excel 导出
	 $('#export').click(function(){
		 window.location = '${pageContext.request.contextPath}/manage/engdeadlinellp/export.do';
	 });
	 
	// 调用OCUpload插件的方法
	$("#inport").upload({
	     action: "${pageContext.request.contextPath}/manage/engdeadlinellp/inport.do", //表单提交的地址
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
