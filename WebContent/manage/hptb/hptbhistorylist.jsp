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
                    <input type="text" class=" form-control" id="search-engSnUsed" placeholder="发动机SN">
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <select class="form-control" id="search-xx">
                    	<option disabled selected>全部</option>
                    </select>
                </div>
                <div class="col-xs-1" style="min-width: 160px">
                    <button class="btn btn-block btn-default" onclick="searchhptbhistory()">
                        <i class="fa fa-search"></i>
                      	  查询
                    </button>
                </div>
                    <div class="col-xs-1 pull-right" style="min-width: 160px">
                    <button class="btn btn-block btn-primary col-sm-1" data-toggle="modal" data-target="#hptbhistory-add-modal">
                        <i class="fa fa-plus"></i>
                       	 添加
                    </button>
                </div>
            </div>
        </div>
        <div class="box-body">

            <div class="dataTables_wrapper form-inline dt-bootstrap">
            	
                <table id="table-list" class="table  table-hover">
                    <thead>
                    <tr>
                       	<th style="display: none;">id</th>
                        <th>engSnUsed</th>
                        <th style="display: none;">hptbPn</th>
                        <th style="display: none;">hptbSn</th>
                        <th style="display: none;">engPn</th>
                        <th style="display: none;">onDate</th>
                        <th style="display: none;">onEtsn</th>
                        <th style="display: none;">onEcsn</th>
                        <th style="display: none;">onPtsn</th>
                        <th style="display: none;">onPcsn</th>
                        <th style="display: none;">offDate</th>
                        <th style="display: none;">offEtsn</th>
                        <th style="display: none;">offEcsn</th>
                        <th style="display: none;">offPtsn</th>
                        <th style="display: none;">offPcsn</th>
                        <th>limitSpecial</th>
                        <th>code</th>
                        <th>remark</th>
                        <th>ctime</th>
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

<jsp:include page='hptbhistoryinfo.jsp'/>
<jsp:include page='hptbhistoryadd.jsp'/>

<script type="text/javascript">
$("#table-list").DataTable({
    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
    "serverSide": true,
    "ordering": false,
    "type": "POST",
    "ajax": {
        "url": "${pageContext.request.contextPath}/manage/hptb/hptbhistory.do",
        "type": "POST",
        "data": function (search) {
        	// 条件查询参数
        	search.engSnUsed = $("#search-engSnUsed").val();
        }
    },
    "columns": [
        {"data": "id","visible": false},
        {"data": "engSnUsed"},
        {"data": "hptbPn","visible": false},
        {"data": "hptbSn","visible": false},
        {"data": "engPn","visible": false},
        {"data": "onDate","visible": false},
        {"data": "onEtsn","visible": false},
        {"data": "onEcsn","visible": false},
        {"data": "onPtsn","visible": false},
        {"data": "onPcsn","visible": false},
        {"data": "offDate","visible": false},
        {"data": "offEtsn","visible": false},
        {"data": "offEcsn","visible": false},
        {"data": "offPtsn","visible": false},
        {"data": "offPcsn","visible": false},
        {"data": "limitSpecial"},
        {"data": "code"},
        {"data": "remark"},
        {"data": "ctime"}
    ],
    "ordering": false,
    "searching": false,
     "columnDefs": [
        {
            "targets": 19,
            "data": function (row, type, val, meta) {
                return row;
            },
            "render": function (data, type, full, meta) {
                var table = $("#table-list").DataTable();
                var result = '<div class="btn-group open">'
                    + '<button class="btn btn-default btn-sm "'
                    + ' data-toggle="modal" data-target="#hptbhistory-info-modal">'
                    + '<i class="fa fa-gear"></i>'
                    + '</button><button class="btn btn-default btn-sm" onclick="deletehptbhistory(' + data.id + ')">'
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
var cellData = null;
 $('#table-list tbody').on('click', 'td', function () {
     var table = $('#table-list').DataTable();
     cellData = table.cell(this).data();
 });

// 编辑按钮 → 信息填充
 $('#hptbhistory-info-modal').on('show.bs.modal', function (event) {
     var modal = $(this);
     modal.find('#editengSnUsed').val(cellData.engSnUsed);
     modal.find('#edithptbPn').val(cellData.hptbPn);
     modal.find('#edithptbSn').val(cellData.hptbSn);
     modal.find('#editengPn').val(cellData.engPn);
     modal.find('#editonDate').val(cellData.onDate);
     modal.find('#editonEtsn').val(cellData.onEtsn);
     modal.find('#editonEcsn').val(cellData.onEcsn);
     modal.find('#editonPtsn').val(cellData.onPtsn);
     modal.find('#editonPcsn').val(cellData.onPcsn);
     modal.find('#editoffDate').val(cellData.offDate);
     modal.find('#editoffEtsn').val(cellData.offEtsn);
     modal.find('#editoffEcsn').val(cellData.offEcsn);
     modal.find('#editoffPtsn').val(cellData.offPtsn);
     modal.find('#editoffPcsn').val(cellData.offPcsn);
     modal.find('#editlimitSpecial').val(cellData.limitSpecial);
     modal.find('#editcode').val(cellData.code);
     modal.find('#editremark').val(cellData.remark);
 }).on('hide.bs.modal', function (event) {
     cellData = null;
 });
 
 // edit
 function edithptbhistory() {
		var id = cellData.id;
		var engSnUsed = $("#editengSnUsed").val();
		var hptbPn= $("#edithptbPn").val();
		var hptbSn = $("#edithptbSn").val();
		var engPn = $("#editengPn").val();
		var onDate = $("#editonDate").val();
		var onEtsn = $("#editonEtsn").val();
		var onEcsn = $("#editonEcsn").val();
		var onPtsn = $("#editonPtsn").val();
		var onPcsn = $("#editonPcsn").val();
		var offDate = $("#editoffDate").val();
		var offEtsn = $("#editoffEtsn").val();
		var offEcsn = $("#editoffEcsn").val();
		var offPtsn = $("#editoffPtsn").val();
		var offPcsn = $("#editoffPcsn").val();
		var limitSpecial = $("#editlimitSpecial").val();
		var code = $("#editcode").val();
		var remark = $("#editremark").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/hptb/updateHptbHistory.do",
		    {
		        "id": id,
		        "engSnUsed": engSnUsed,
		        "hptbPn": hptbPn,
		        "hptbSn": hptbSn,
		        "engPn": engPn,
		        "onDate": onDate,
		        "onEtsn": onEtsn,
		        "onEcsn": onEcsn,
		        "onPtsn": onPtsn,
		        "onPcsn": onPcsn,
		        "offDate": offDate,
		        "offEtsn": offEtsn,
		        "offEcsn": offEcsn,
		        "offPtsn": offPtsn,
		        "offPcsn": offPcsn,
		        "limitSpecial": limitSpecial,
		        "code": code,
		        "remark": remark
		    },
		    function (response) {
		    	 $('#hptbhistory-info-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
	}
 
 // add 
 function addhptbhistory() {
		var engSnUsed = $("#addengSnUsed").val();
		var hptbPn= $("#addhptbPn").val();
		var hptbSn = $("#addhptbSn").val();
		var engPn = $("#addengPn").val();
		var onDate = $("#addonDate").val();
		var onEtsn = $("#addonEtsn").val();
		var onEcsn = $("#addonEcsn").val();
		var onPtsn = $("#addonPtsn").val();
		var onPcsn = $("#addonPcsn").val();
		var offDate = $("#addoffDate").val();
		var offEtsn = $("#addoffEtsn").val();
		var offEcsn = $("#addoffEcsn").val();
		var offPtsn = $("#addoffPtsn").val();
		var offPcsn = $("#addoffPcsn").val();
		var limitSpecial = $("#addlimitSpecial").val();
		var code = $("#addcode").val();
		var remark = $("#addremark").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/hptb/saveHptbHistory.do",
		    {
			        "engSnUsed": engSnUsed,
			        "hptbPn": hptbPn,
			        "hptbSn": hptbSn,
			        "engPn": engPn,
			        "onDate": onDate,
			        "onEtsn": onEtsn,
			        "onEcsn": onEcsn,
			        "onPtsn": onPtsn,
			        "onPcsn": onPcsn,
			        "offDate": offDate,
			        "offEtsn": offEtsn,
			        "offEcsn": offEcsn,
			        "offPtsn": offPtsn,
			        "offPcsn": offPcsn,
			        "limitSpecial": limitSpecial,
			        "code": code,
			        "remark": remark
		    },
		    function (response) {
		    	if(response.code != 101){
		    		alert(response.msg);
		    	}
		    	 $('#hptbhistory-add-modal').modal('hide');
		         reloadTable(true);
		    },
		    "json"
		);
	}
 

	/**
	 * 清除弹窗原数据
	 */
	$("#hptbhistory-add-modal").on("hidden.bs.modal", function() {
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
	function searchhptbhistory() {
		reloadTable(true);
	}

	// delete
	function deletehptbhistory(id) {
		if (confirm("你确定要删除吗？")) {
			$.post(
					"${pageContext.request.contextPath}/manage/hptb/deleteHptbHistory.do",
					{
						"id" : id
					},
					function(response) {
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
