<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
    <style type="text/css">
    	
    	.nav_tabs > li{
    		float:left;
    	}
    	.nav_tabs > li a{
    		margin-right:2px;
    		border-radius:4px 4px 0px 0px;
    		color:#333;
    	}
    	.nav_tabs > li.active > a{
    		color:#3399FF;
    		border: 1px solid #3399FF;
    		border-bottom-color: transparent;
    	}
    	span.mright{
    		margin-right:15px;
    		margin-left:15px;
    	}
    	input.formnew , select.formnew{
    		padding:6px 12px;
    		min-width:130px;
    		max-width:160px;
    		margin:0px 3px;
    	}
    	table.planetable{
    		text-align:center;
    	}
    	table.planetable thead tr th {
    		text-align:center;
    	}
    	table.planetable tbody td a.sz{
    		color:#3399FF;
    		margin:0px 3px;
    	}
    	.first{
    		display:inline-block;
    		min-width:120px;
    	}
    	.box_a{
    		clear:both;
    		width:100%;
    		margin-bottom:20px;
    	}
    	.box_a .choose_a{
    		margin:0 20px;
    		padding:30px 20px;
    		background:#E7F9FF;
    		overflow:hidden;
    		position:relative;
    	}
    	.form-control{
    		display:inline-block!important;
    		min-width:150px!important;
    		width:auto!important;
    		margin-right:15px;
    		margin-bottom:20px;
    	}
    	.buttons{
    		width:200px;
    		float:right;
    	}
    	.xiugai{
    		margin-bottom:2px;
    	}
    	.save{
    		margin-top:2px;
    	}
    	.add{
    		float:right;
    	}
    	.xiugai,.save,.del,.add{
    		width:160px;
    		height:30px;
    		border:1px solid #5f5c5c;
    		border-radius:5px;
    		background:#f7f7f7;
    		
    	}
    	.left{
    		width:75%;
    		float:left;
    	}
    	.box_a:nth-of-type(2){
    		margin-top:20px;	
    	}
    	
    	.box_a:nth-of-type(4){
    		margin-top:20px;	
    	}
    	.form-control:disabled{
    		border:none;
    		background:none;
    		color:blue;
    		-moz-appearance: none;
    		-webkit-appearance:none;
            appearance:none;  
    	}
    	table{
    		width:80%;
    		line-height: 50px;
    		font-size: 14px;
    	}
    	table tr td span:nth-of-type(1){
    		display:inline-block;
    		width:100px;
    	}
    	table tr td span:nth-of-type(2){
    		color:blue;
    	}
    	
    	
    
    </style>
</head>
<body class="hold-transition" >

<!--引入弹框  -->
<jsp:include page="../public/tankuang.jsp"/>
	
<!-- Content Wrapper. Contains page content -->
<div class="wrapper">

	<button onclick="history.go(-1)" style="border:none;margin-right:10px;overflow:hidden;width:140px;height:40px;border-radius:5px;line-height:40px;background:#4671F7;color:white;float:right;margin:10px 20px;">返回</button>
	
	<div class="box_a">
		<div class="choose_a">
			<div class="left" style="width:100%">
				<span>公式名称</span>
				<input class="form-control" type="text" id="name">
				<span>优先级</span>
				<input class="form-control" type="text" id="orderId"/>
			</div>
			<div class="left" style="width:100%">
				<span>发动机序列</span>
				<select class="form-control" id="engSeries">
				</select>
				<span>发动机类型</span>
				<select class="form-control" id="engType">
				</select>
				<span>发动机模型</span>
				<select class="form-control" id="engModel">
				</select>
				<span>发动机构型</span>
				<select class="form-control" id="engConfig">
				</select>
			</div>
		</div>
	</div>
	
	<!-- 暂时不删 -->
<!-- 		
	<div class="box_a">
		<div class="choose_a" style="background:#F9EDF9;">
			<div class="left">
				<p style="margin-bottom:-10px;">
					<span>与上一条件的关系</span>
					<input class="form-control type" disabled="true" type="text" value="xxx">
				</p>
				<table>
					<tr>
						<td>
							<span>计算范围类型</span>
							<span>短期</span>
						</td>
						<td>
							<span>计算范围</span>
							<span>30点</span>
						</td>
						<td>
							<span>状态</span>
							<span>巡航</span>
						</td>
						<td>
							<span>选择参数</span>
							<span>N1震动</span>
							<span>&nbsp;&nbsp;</span>
							<span>左发</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>最大值</span>
							<span>0.68</span>
						</td>
						<td>
							<span>最小值</span>
							<span>0.57</span>
						</td>
					</tr>
				</table>
			
			</div>
			<div class="buttons">
				<button type="button" class="xiugai">修改</button>
				<button type="button" class="del">删除</button>
			</div>
		</div>
	</div> -->
	
	
	<div id="before" class="box_a">	
		<div class="choose_a" style="background:white;margin:0 20px;padding:10px 20px 10px 0;">
			<button type="button"  onclick="firstParam()" data-toggle="modal" data-target="#add-modal" style="margin-right:40px;" class="add">添加条件</button>
		</div>
	</div>
	
	<div class="box_a">
		<div class="choose_a" style="background:#A5D2FF;">
			<div class="left">
				<p>满足以上条件</p>
				发送警报给
				<select  id="fduty" class="form-control">
					<option>基地A</option>
				</select>
				<button type="button" onclick="getModal()">添加被通知人员</button><br>
				<span>警告内容</span>
				<input id="content" type="text" class="form-control" >
			</div>
		</div>
	</div>
	
	<div class="box_a">
		<div style="text-align:center">
	    	<button class="btn btn-default" style="min-width:130px;margin-right:10px" onclick="history.go(-1)">取消</button>
	    	<button class="btn btn-primary" style="min-width:130px" onclick="finish()">确定</button>
		</div>
	</div>
	
</div>
</body>

<jsp:include page='computationadd.jsp'/>
<jsp:include page='computationinfo.jsp'/>

<%
	Integer	id = (Integer)request.getAttribute("id");
%>

 <script type="text/javascript">
 
	$.ajaxSetup({  
	    async : false  
	}); 
	
	 var id = '${id}';
	 var engSeries;
	 var engType;
	 var engModel;
	 var engConfig;
	 $.post(
	         "${pageContext.request.contextPath}/manage/calculate/oneinspec.do",
	          {"id": id},
	          function (response) {
	          		$('#name').val(response.data.name);
	          		engSeries = response.data.engSeries;
	          		engType = response.data.engType;
	          		engModel = response.data.engModel;
	          		engConfig = response.data.engConfig;
	          		$('#orderId').val(response.data.orderId);
	          		$('#content').val(response.data.content);
	          },
	          "json"
	 );
	 
	  // 加载发动机序列
	  $(function(){
		     $.post(
		             "${pageContext.request.contextPath}/manage/dataeng/allEngSeries.do",
		             {},
		             function (response) {
		            	 $('#engSeries').html('');
		            	 for(var i in response.data){
		            		 if (response.data[i] == engSeries) {
		            	 	 	$('#engSeries').append('<option value="'+response.data[i]+'" selected>'+response.data[i]+'</option>');
							 }else {
		            	 		$('#engSeries').append('<option value="'+response.data[i]+'">'+response.data[i]+'</option>');
							 }
		            	 }
		             },
		             "json"
		         );
	  });
	  
	  // 加载发动机类型
	  $(function(){
		     $.post(
		             "${pageContext.request.contextPath}/manage/dataeng/allEngType.do",
		             {},
		             function (response) {
		            	 $('#engType').html('');
		            	 for(var i in response.data){
		            	 	 if (response.data[i] == engType) {
		            	 	 	$('#engType').append('<option value="'+response.data[i]+'" selected>'+response.data[i]+'</option>');
							 }else {
		            	 		$('#engType').append('<option value="'+response.data[i]+'">'+response.data[i]+'</option>');
							 }
		            	 }
		            	 
		             },
		             "json"
		         );
	  });
	  
	  // 加载发动机模型
	  $(function(){
		     $.post(
		             "${pageContext.request.contextPath}/manage/dataeng/allEngModel.do",
		             {},
		             function (response) {
		            	 $('#engModel').html('');
		            	 for(var i in response.data){
		            	 	 if (response.data[i] == engModel) {
		            	 	 	$('#engModel').append('<option value="'+response.data[i]+'"selected>'+response.data[i]+'</option>');
							 }else {
		            	 		$('#engModel').append('<option value="'+response.data[i]+'">'+response.data[i]+'</option>');
							 }
		            	 }
		             },
		             "json"
		         );
	  });
	  
	  // 加载发动机构型
	  $(function(){
		     $.post(
		             "${pageContext.request.contextPath}/manage/dataeng/allEngConfig.do",
		             {},
		             function (response) {
		            	 $('#engConfig').html('');
		            	 for(var i in response.data){
		            	 	 if (response.data[i] == engConfig) {
		            	 	 	$('#engConfig').append('<option value="'+response.data[i]+'"selected>'+response.data[i]+'</option>');
							 }else {
		            	 		$('#engConfig').append('<option value="'+response.data[i]+'">'+response.data[i]+'</option>');
							 }
		            	 }
		             },
		             "json"
		         );
	  });
	 
	 var arr = [];
	 $.post(
	         "${pageContext.request.contextPath}/manage/calculate/compu.do",
	          {"id": id},
	          function (response) {
	        	  for (var i in response.data) {
					 var cArr = [];
					 cArr.push(response.data[i].id);
					 cArr.push(response.data[i].type);
					 cArr.push(response.data[i].calculationType);
					 cArr.push(response.data[i].calculationRange);
					 cArr.push(response.data[i].rangeType);
					 cArr.push(response.data[i].flightPhase);
					 cArr.push(response.data[i].max);
					 cArr.push(response.data[i].min);
					 cArr.push(response.data[i].equal);
					 cArr.push(response.data[i].unequal);
					 cArr.push(response.data[i].ruleId);
					 
					 cArr.push(response.data[i].ruleType);
					 cArr.push(response.data[i].ruleName);
					 
					 arr.push(cArr);
				  }
	          },
	          "json"
	 );
	 
	 for (var i = 0; i < arr.length; i++) {
			 var ruleId = arr[i][10];
			 var ruleType = arr[i][11]
			 if(ruleType == 1){
				 showIns(arr[i][0], arr[i][1], ruleId, arr[i][12])
			 }else{
				 $.post(
		        		  "${pageContext.request.contextPath}/manage/calculate/param.do",
			          	  {"ruleId": ruleId},
				          function (response) {
				        	 var pVal = response.data[0].val;
				        	 var cVal = response.data[1].val;
				 			 showcomputation(arr[i][0], arr[i][1], arr[i][2], arr[i][3], arr[i][4], arr[i][5], pVal, cVal, arr[i][6], arr[i][7], arr[i][8], arr[i][9]);
				          },
				          "json"
				  )
			 }
	 }

	// 获取所有条件id（computation）
	function getCompuIds() {
		var compuIds = [];
		$('.del').each(function(){
			compuIds.push($(this).data('id'));
		});
		return compuIds;
	}

	// 确定按钮点击事件
	function finish(){
		if (getCompuIds().length == 0) {
			alert("最少一个条件！ ");
		}else{
			var id = '${id}';
			// 数组转json格式
			var userIds = JSON.stringify(users);
			var compuIds = JSON.stringify(getCompuIds());
			var name = $('#name').val();
			var engSeries = $('#engSeries').val();
			var engType = $('#engType').val();
			var engModel = $('#engModel').val();
			var engConfig = $('#engConfig').val();
			var orderId = $('#orderId').val();
			var content = $('#content').val();
			$.post(
				    "${pageContext.request.contextPath}/manage/calculate/updateall.do",
				    {
				    	"id": id,
				    	"userIds": userIds,
				    	"compuIds": compuIds,
				        "name": name,
				        "engSeries": engSeries,
				        "engType": engType,
				        "engModel": engModel,
				        "engConfig": engConfig,
				        "orderId": orderId,
				        "content": content
				    },
				    function (response) {
				    	if (response.code == 101) {
							alert('成功');
						}
				    },
				    "json"
				);
		}
	}
	
	// addcomputation
	function addcomputation() {
		var inspecId = '${id}';
		var type = $("#type").val();
		var calculationType = $("#calculationType").val();
		var calculationRange= $("#calculationRange").val();
		var rangeType = $("#rangeType").val();
		var flightPhase = $("#flightPhase").val();
		var pVal = $("#pVal").val();
		var cVal = $("#cVal").val();
		var cId = $("#cVal").find("option:selected").data("id");
		var max = $("#max").val();
		var min = $("#min").val();
		var equal = $("#equal").val();
		var unequal = $("#unequal").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/calculate/savecomputation.do",
		    {
		        "inspecId": inspecId,
		        "type": type,
		        "calculationType": calculationType,
		        "calculationRange": calculationRange,
		        "rangeType": rangeType,
		        "flightPhase": flightPhase,
		        "ruleId": cId,
		        "max": max,
		        "min": min,
		        "equal": equal,
		        "unequal": unequal
		    },
		    function (response) {
		    	$('#add-modal').modal('hide');
		    	var id = response.data;
		    	showcomputation(id, type, calculationType, calculationRange, rangeType, flightPhase, pVal, cVal, max, min, equal, unequal);
		    },
		    "json"
		);
	}
	
	 // 清除弹窗原数据
	 $("#add-modal").on("hidden.bs.modal", function() {
	     $('#reset').click();
	     $('#areset').click();
	 });
	 
	 $("#info-modal").on("hidden.bs.modal", function() {
	     $('#ebreset').click();
	     $('#eareset').click();
	 });
	 
	  // 页面显示条件参数
	  function showcomputation(id, type, calculationType, calculationRange, rangeType, flightPhase, pVal, cVal, max, min, equal, unequal){
		  $('#before').before('<div id="'+id+'" class="box_a">'
					+'<div class="choose_a" style="background:#F9EDF9;">'
					+'<div class="left">'
					+'	<p style="margin-bottom:-10px;">'
					+'	<span>与前一条件的关系</span>'
					+'	<span class="type" data-value="'+type+'">'+getType(type)+'</span>'
					+'</p>'
					+'<table>'
					+'	<tr>'
					+'		<td>'
					+'			<span>计算范围类型</span>'
					+'			<span class="calculationType" data-value="'+calculationType+'">'+getCalculationType(calculationType)+'</span>'
					+'		</td>'
					+'		<td>'
					+'			<span>计算范围</span>'
					+'			<span class="calculationRange">'+calculationRange+'</span>'
					+'			<span>&nbsp;&nbsp;</span>'
					+'	    	<span class="rangeType" data-value="'+rangeType+'">'+getRangeType(rangeType)+'</span>'
					+'		</td>'
					+'		<td>'
					+'			<span>状态</span>'
					+'			<span class="flightPhase" data-value="'+flightPhase+'">'+getFlightPhase(flightPhase)+'</span>'
					+'		</td>'
					+'		<td>'
					+'			<span>选择参数</span>'
					+'			<span class="pVal">'+pVal+'</span>'
					+'			<span>&nbsp;&nbsp;</span>'
					+'			<span class="cVal">'+cVal+'</span>'
					+'		</td>'
					+'	</tr>'
					+'	<tr>'
					+'		<td>'
					+'			<span>最大值</span>'
					+'			<span class="max">'+max+'</span>'
					+'		</td>'
					+'		<td>'
					+'			<span>最小值</span>'
					+'			<span class="min">'+min+'</span>'
					+'		</td>'
					+'		<td>'
					+'			<span>等于</span>'
					+'			<span class="equal">'+equal+'</span>'
					+'		</td>'
					+'		<td>'
					+'			<span>不等于</span>'
					+'			<span class="unequal">'+unequal+'</span>'
					+'		</td>'
					+'	</tr>'
					+'</table>'
					+'</div>'
					+'<div class="buttons">'
					+'<button type="button" class="xiugai edit" data-id="'+id+'" data-toggle="modal" data-target="#info-modal">修改</button>'
					+'<button type="button" class="del" data-id="'+id+'">删除</button>'
					+'</div>'
					+'</div>'
					+'</div>'); 
	 } 
	 
	  // 删除条件
	  $(".wrapper").on("click",".del", function(){
		   if (confirm("你确定要删除吗？")) {
				$(this).parent().parent().parent().remove();
				var id =  $(this).data('id');
				$.post(
			             "${pageContext.request.contextPath}/manage/calculate/deletecomputation.do",
			             {"id": id},
			             function (response) {
			             },
			             "json"
			         );
		   }
	  });
	  
	  var pVal;
	  var cVal;
	  // 条件修改弹窗数据填充
	  $(".wrapper").on("click",".edit", function(){
		  var id =  $(this).data('id');
		  var type = $('#'+id+'').find('.type').attr('data-value');
		  var calculationType = $('#'+id+'').find('.calculationType').attr('data-value');
		  var calculationRange = $('#'+id+'').find('.calculationRange').html();
		  var rangeType = $('#'+id+'').find('.rangeType').attr('data-value');
		  var flightPhase = $('#'+id+'').find('.flightPhase').attr('data-value');
		  pVal = $('#'+id+'').find('.pVal').html();
		  cVal = $('#'+id+'').find('.cVal').html();
		  var max = $('#'+id+'').find('.max').html();
		  var min = $('#'+id+'').find('.min').html();
		  var equal = $('#'+id+'').find('.equal').html();
		  var unequal = $('#'+id+'').find('.unequal').html();
		  
		  $('#eid').val(id);
		  $('#etype').val(type);
		  $('#ecalculationType').val(calculationType);
		  $('#ecalculationRange').val(calculationRange);
		  $('#erangeType').val(rangeType);
		  $('#eflightPhase').val(flightPhase);
		  $('#emax').val(max);
		  $('#emin').val(min);
		  $('#eequal').val(equal);
		  $('#eunequal').val(unequal);
		  
		  firstParam();
		  
		  // 按钮不可用
		  $('#eaf').attr("disabled", true)
		  $('#ebf').attr("disabled", false)
	  }); 
	  
	  
		// 第一个参数
	    function firstParam(){
	    	$.post(
		             "${pageContext.request.contextPath}/manage/calculate/firstParam.do",
		             {},
		             function (response) {
		            	 secondParam(response.data[0].id);
		            	 $('#pVal').html('');
		            	 $('#epVal').html('');
		            	 for(var i in response.data){
		            	 	$('#pVal').append('<option value="'+response.data[i].val+'" data-id="'+response.data[i].id+'">'+response.data[i].val+'</option>');
		            	 	if (pVal == response.data[i].val) {
		            	 		$('#epVal').append('<option value="'+response.data[i].val+'" data-id="'+response.data[i].id+'" selected>'+response.data[i].val+'</option>');
		            	 		secondParam(response.data[i].id);
							} else {
		            	 		$('#epVal').append('<option value="'+response.data[i].val+'" data-id="'+response.data[i].id+'">'+response.data[i].val+'</option>');
							}
		            	 }
		             },
		             "json"
		         );
	    }
	 	
	 	function getPId(){
		    var pId = $("#pVal").find("option:selected").data("id");
		    secondParam(pId);
	 	}
	 	
	 	function getePId(){
		    var pId = $("#epVal").find("option:selected").data("id");
		    secondParam(pId);
	 	}
	 	
	 	// 第二个参数
	    function secondParam(pId){
	    	$.post(
		             "${pageContext.request.contextPath}/manage/calculate/secondParam.do",
		             {"pId": pId},
		             function (response) {
		            	 $('#cVal').html('');
		            	 $('#ecVal').html('');
		            	 for(var i in response.data){
		            	 	$('#cVal').append('<option value="'+response.data[i].val+'" data-id="'+response.data[i].id+'">'+response.data[i].val+'</option>');
		            	 	if (response.data[i].val == cVal) {
		            	 		$('#ecVal').append('<option value="'+response.data[i].val+'" data-id="'+response.data[i].id+'" selected>'+response.data[i].val+'</option>');
							} else {
		            	 		$('#ecVal').append('<option value="'+response.data[i].val+'" data-id="'+response.data[i].id+'">'+response.data[i].val+'</option>');
							}
		            	 }
		             },
		             "json"
		         );
	    }
	 	
	  
	    // 修改条件
		function editcomputation() {
			var id = $("#eid").val();
			var type = $("#etype").val();
			var calculationType = $("#ecalculationType").val();
			var calculationRange= $("#ecalculationRange").val();
			var rangeType = $("#erangeType").val();
			var flightPhase = $("#eflightPhase").val();
			var pVal = $("#epVal").val();
			var cVal = $("#ecVal").val();
			var cId = $("#ecVal").find("option:selected").data("id");
			var max = $("#emax").val();
			var min = $("#emin").val();
			var equal = $("#eequal").val();
			var unequal = $("#eunequal").val();
			$.post(
			    "${pageContext.request.contextPath}/manage/calculate/updatecomputation.do",
			    {
			        "id": id,
			        "type": type,
			        "calculationType": calculationType,
			        "calculationRange": calculationRange,
			        "rangeType": rangeType,
			        "flightPhase": flightPhase,
			        "ruleId": cId,
			        "max": max,
			        "min": min,
			        "equal": equal,
			        "unequal": unequal
			    },
			    function (response) {
			    	$('#info-modal').modal('hide');
			    	  // 修改页面值
				  	  $('#'+id+'').find('.type').attr('data-value', type);
				  	  $('#'+id+'').find('.type').html(getType(type));
					  $('#'+id+'').find('.calculationType').attr('data-value', calculationType);
					  $('#'+id+'').find('.calculationType').html(getCalculationType(calculationType));
					  $('#'+id+'').find('.calculationRange').html(calculationRange);
					  $('#'+id+'').find('.rangeType').attr('data-value', rangeType);
					  $('#'+id+'').find('.rangeType').html(getRangeType(rangeType));
					  $('#'+id+'').find('.flightPhase').attr('data-value', flightPhase);
					  $('#'+id+'').find('.flightPhase').html(getFlightPhase(flightPhase));
					  $('#'+id+'').find('.pVal').html(pVal);
					  $('#'+id+'').find('.cVal').html(cVal);
					  $('#'+id+'').find('.max').html(max);
					  $('#'+id+'').find('.min').html(min);
					  $('#'+id+'').find('.equal').html(equal);
					  $('#'+id+'').find('.unequal').html(unequal);
			    },
			    "json"
			);
		}
	    
	 	
	  // 与前一条件的关系
	  function getType(type){
		  var str1;
		  if (type == 0) {
			  str1 = "第一个条件";
		  }
		  if (type == 1) {
			  str1 = "AND";
		  }
		  if (type == 2) {
			  str1 = "OR";
		  }
		  return str1;
	  }
	  
	  function getCalculationType(calculationType){
		  var str2;
		  if (calculationType == 1) {
			  str2 = "区间";
		  }
		  if (calculationType == 2) {
			  str2 = "短期";
		  }
		  if (calculationType == 3) {
			  str2 = "中期";
		  }
		  if (calculationType == 4) {
			  str2 = "长期";
		  }
		  return str2;
	  }
	  
	  function getRangeType(rangeType){
		  var str3;
		  if (rangeType == 1) {
			  str3 = "点";
		  }
		  if (rangeType == 2) {
			  str3 = "天";
		  }
		  return str3;
	  }
	 
	  function getFlightPhase(flightPhase){
		  var str4 = 'ALL';
		  if (flightPhase == 0) {
			  tr4 = "ALL";
		  }
		  if (flightPhase == 1) {
			  str4 = "起飞";
		  }
		  if (flightPhase == 2) {
			  str4 = "巡航";
		  }
		  return str4;
	  }
	  
	  
	  
	  // 加载维修单位
	  $.post(
              "${pageContext.request.contextPath}/manage/duty/allduty.do",
              {},
              function (response) {
             	  $('#fduty').html('');
             	  $('#fduty').append('<option disabled="disabled" selected>请选择</option>');
             	  for(var o in response.data){
             	      $('#fduty').append('<option value="'+response.data[o].id+'">'+response.data[o].name+'</option>');
             	  }  
              },
              "json"
       );
	  
	  // 显示添加人员弹窗
	  function getModal(){
		  $('.shadowbox').css('display', 'block');
		  var duty = $('#fduty').val();
		  $.post(
	              "${pageContext.request.contextPath}/manage/duty/allduty.do",
	              {},
	              function (response) {
	             	  $('#duty').html('');
	             	 $('#duty').append('<option value="" selected>全部</option>');
	             	  for(var o in response.data){
	             		  if(response.data[o].id == duty){
		             	      $('#duty').append('<option value="'+response.data[o].id+'" selected>'+response.data[o].name+'</option>');
	             		  }else{
		             	      $('#duty').append('<option value="'+response.data[o].id+'">'+response.data[o].name+'</option>');
	             		  }
	             	  } 
	              },
	              "json"
	       );
		  reloadTable2(true);
		  isChecked();
	  }
	  
	  // 弹框取消按钮
	  function getHidden(){
		  if (confirm("取消后，所选人员将被清空！")) {
			  // 数组清空
		 	  users.splice(0, users.length);
			  // 隐藏添加人员弹窗
			  $('.shadowbox').css('display', 'none');
		  }
	  }
	  
	  // 弹框确定按钮 
	  function ok(){
		  console.log(users);
		  // 隐藏添加人员弹窗
		  $('.shadowbox').css('display', 'none');
	  }
	  
	  // onchange
	  function getDuty(){
		  reloadTable2(true);
		  isChecked();
	  }
	  
	  // 人员列表
	  $("#user-list").DataTable({
		    'dom': 'tr<"row"<"col-sm-5"l><"col-sm-7"p>>',
		    "serverSide": true,
		    "ordering": false,
		    "type": "POST",
		    "ajax": {
		        "url": "${pageContext.request.contextPath}/manage/user/list.do",
		        "type": "POST",
		        "data": function (search) {
		        	// 条件查询参数
		        	if($('#duty').val() != ''){
			        	search.duty = $('#duty').val();
		        	}
		        	search.username = '';
		        }
		    },
		    "columns": [
		    	{"data": "checkbox"}, 
		        {"data": "username"},
		        {"data": "number"},
		        {"data": "email"},
		        {"data": "dutyName"}
		    ],
		    "ordering": false,
		    "searching": false,
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
	  
	  // 重载列表
	  function reloadTable2(reset) {
		     $('#isSelect').prop('checked', false);
		     var table = $('#user-list').DataTable();
		     if (reset == true) {
		         table.ajax.reload(null, true);
		     } else {
		         table.ajax.reload();
		     }
		 }
	  
	  // 是否全选
	  $('#isSelect').click(function(){
		  if($(this).prop('checked')){
		  	  	// 全选
		  	  	$('.func').each(function(){
		  			$(this).prop('checked', true);
		  		});
		  }else{
			  // 清空
			  $('.func').each(function(){
		  			$(this).prop('checked', false);
		  	  });
		  }
	  });
	  
	  // 上一页 下一页 页数 点击事件
	  $('#user-list_paginate').click(function(){
		  $('#isSelect').prop('checked', false);
		  isChecked();
	  });
	  
	  // checkbox 点击事件
	  var users = [];
	  $('#user-list').on('click', 'input', function(){
		  $('.func').each(function(){
			  if($(this).prop('checked')){
				  var flag = true;
				  for(var i=0; i<users.length; i++) {
					    if(users[i] == $(this).data('id')) {
					    	flag = false;
					    }
					}
				  if(flag){
					  users.push($(this).data('id'));
				  }
			  }else{
				  for(var i=0; i<users.length; i++) {
					    if(users[i] == $(this).data('id')) {
					    	users.splice(i, 1);
					    }
					}
			  }
		  });
	  });
	  
	 // 加载users
	 var id = '${id}';
	 $.post(
	         "${pageContext.request.contextPath}/manage/calculate/users.do",
	          {"id": id},
	          function (response) {
	        	  for ( var i in response.data) {
	        		  users.push(response.data[i].userId);
				  }
	        	  isChecked();
	          },
	          "json"
	 );
	  
	  // 表格 change 事件
 	  function isChecked(){
		  $('.func').each(function(){
			  for(var i=0; i<users.length; i++) {
				    if(users[i] == $(this).data('id')) {
					    $(this).prop('checked', true);
				    }
				}
		  });
	  }  
	  
	  // 根据基地获取用户信息
	  function listByDuty(){
		  var usersByDuty;
		  var duty = $('#duty').val();
		  $.post(
	              "${pageContext.request.contextPath}/manage/user/listByDuty.do",
	              {"duty": duty},
	              function (response) {
	            	  usersByDuty = response.data;
	              },
	              "json"
	       );
		  return usersByDuty;
	  }
	  
	  // 弹框 全选按钮点击事件
	  function allSelect(){
		  var usersByDuty = listByDuty();
		  for(var o in usersByDuty){
 		  	  var flag = true;
			  for(var i=0; i<users.length; i++) {
				    if(users[i] == usersByDuty[o].userId) {
				    	flag = false;
				    }
			   }
			  if(flag){
				  users.push(usersByDuty[o].userId);
			  }
     	   } 
		  isChecked();
	  }
	  
	  // 弹框 取消全选 事件
	  function noSelect(){
		  var usersByDuty = listByDuty();
		  for(var o in usersByDuty){
			  for(var i=0; i<users.length; i++) {
				  if(users[i] == usersByDuty[o].userId) {
				    	users.splice(i, 1);
				    }
			   }
     	   } 
		  reloadTable2(true);
	  }
	  
	  
	/* 2018-1-10 新加功能  添加条件 可选已设置公式  */
	  
  	  // 加载已设置公式
  	  var insId = '${id}';
  	  function getAllIns(id){
		  $.post(
	              "${pageContext.request.contextPath}/manage/calculate/allInspectionTwo.do",
	              {"id": insId},
	              function (response) {
	             	  $('#ins').html('');
	             	  $('#eins').html('');
	             	  $('#ins').append('<option disabled="disabled" selected>请选择</option>');
	             	  $('#eins').append('<option disabled="disabled" selected>请选择</option>');
	             	  for(var o in response.data){
	             		 $('#ins').append('<option  data-id="'+response.data[o].id+'">'+response.data[o].name+'</option>');
	             		  if(response.data[o].id == id){
		             	  		$('#eins').append('<option  data-id="'+response.data[o].id+'" selected>'+response.data[o].name+'</option>');
	             		  }else{
	             	      		$('#eins').append('<option  data-id="'+response.data[o].id+'">'+response.data[o].name+'</option>');
	             		  }
	             	  }  
	              },
	              "json"
	       );
	  }
	  
  	  getAllIns("")
  	  
	  // 弹框已设置公式页面 保存按钮事件
	  function addIns(){
		  var type = $('#a-type').val()
		  var ruleId = $('#ins').find('option:selected').data('id')
		  var insName =  $('#ins').val()
		  $.post(
	              "${pageContext.request.contextPath}/manage/calculate/saveInspec.do",
	              {"type": type, "ruleId": ruleId},
	              function (response) {
					  showIns(response.data, type, ruleId, insName)
	              },
	              "json"
	       );
		  $('#add-modal').modal('hide');
	  }
  	  
  	  // 页面显示已选择的公式信息
  	  function showIns(id, type, ruleId, insName){
  		   $('#before').before('<div id="'+id+'" class="box_a">'
				  			+'	<div class="choose_a" style="background:#F9EDF9;">'
				  			+'		<div class="left">'
				  			+'			<p style="margin-bottom:-10px;">'
				  			+'				<span>与前一条件的关系</span>'
				  			+'				<span class="eatype" data-value="'+type+'">'+getType(type)+'</span>'
				  			+'			</p>'
				  			+'			<table>'
				  			+'				<tr>'
				  			+'					<td>'
				  			+'						<span>已选公式</span>'
				  			+'						<span class="ruleId" data-id="'+ruleId+'">'+insName+'</span>'
				  			+'					</td>'
				  			+'				</tr>'
				  			+'			</table>'
				  			+'		</div>'
				  			+'		<div class="buttons">'
				  			+'			<button type="button" class="xiugai aedit" data-id="'+id+'" data-toggle="modal" data-target="#info-modal">修改</button>'
				  			+'			<button type="button" class="del" data-id="'+id+'">删除</button>'
				  			+'		</div>'
				  			+'	</div>'
				  			+'</div>')
  	  }
	  
  	// 条件修改弹窗数据填充
  	$(".wrapper").on("click",".aedit", function(){
		  var id =  $(this).data('id');
		  $('#eaid').val(id);
		  var ruleId = $('#'+id+'').find('.ruleId').attr('data-id')
		  var eatype = $('#'+id+'').find('.eatype').attr('data-value')
		  
		  $('#eatype').val(eatype);
		  getAllIns(ruleId);
		  
		  $('#eaf').attr("disabled", false)
		  $('#ebf').attr("disabled", true)
	  });  
  	
 	// 修改条件
	function editIns() {
		var id = $("#eaid").val();
		var type = $("#eatype").val();
		var ruleId = $("#eins").find("option:selected").data("id");
		var insName = $("#eins").val();
		$.post(
		    "${pageContext.request.contextPath}/manage/calculate/updatecomputation.do",
		    {
		        "id": id,
		        "type": type,
		        "ruleId": ruleId
		    },
		    function (response) {
		    	$('#info-modal').modal('hide');
		    	  // 修改页面值
			  	  $('#'+id+'').find('.eatype').attr('data-value', type);
			  	  $('#'+id+'').find('.eatype').html(getType(type));
			  	  
			  	  $('#'+id+'').find('.ruleId').attr('data-id', ruleId);
				  $('#'+id+'').find('.ruleId').html(insName);
		    },
		    "json"
		);
	}
 	
</script>
</html>
