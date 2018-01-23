<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
    <style type="text/css">
    	
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
    	.box-body{
    		padding:0px 15px;
    		box-sizing:border-box;
    		min-width:970px;
    	}
    	.charts-single>div{
    		float:left;
    		width:50%;
    		min-width:470px;
    		height:560px;
    		box-sizing:border-box;
    	}
    	.charts-single:after{
    		display:block;
    		content:"";
    		clear:both;
    	}
    	.charts-single>div>div{
    		width:100%;
    		height:50%;
    	}
    </style>
</head>
<body class="hold-transition" >

<!-- Content Wrapper. Contains page content -->
<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">
        <div class="box-header with-border" style="border-bottom:none;">
         	
         	<div class="row" style="margin:15px 0px">
					
				<span class="mright">机号</span>
				<select id="search-tail" class="formnew" onchange="gettail()">
				</select>	    		
				<span class="mright">范围</span>
				<select class="formnew" id="ch" onchange="toChart()">
					<option value="5">5个点</option>
					<option value="10">10个点</option>
					<option value="15">15个点</option>
				</select>
				
                <div style="min-width: 160px;display:inline-block;vertical-align:bottom;float:right">
                    <button onclick="history.go(-1)" class="btn btn-block btn-primary col-sm-1">
                       	 返回
                    </button>
                </div>
			</div>
            
        </div>
        <div class="box-body">
        	<div class="charts-single">
        		<div class="leftcharts">
        			<div id="top"></div>
        		</div>
        	</div>
        </div>
    </div>
</div>


<script type="text/javascript" src="../../js/echarts/echarts.js"></script>
<script type="text/javascript" src="../../js/echarts/egtmecharts.js"></script>
<script type="text/javascript">
	//初始化选择框
	$.post(
	        "${pageContext.request.contextPath}/manage/dataplane/allplane.do",
	        {},
	        function (response) {
	       	  $('#search-tail').html('');
	       	  for(var o in response.data){
	       	      $('#search-tail').append('<option value="'+response.data[o].tail+'">'+response.data[o].tail+'</option>');
	       	  }  
	        },
	        "json"
	 );
	
	// 页面初始化
	$(function(){
		var inittail = '${sessionScope.inittail}';
		searchtail(inittail);
	});
	
	// onchange事件
	function gettail(){
		var tail = $('#search-tail').val();
		searchtail(tail);
	}
	
	// n1 单点
	var n1_egthdm = [];
	// n1 平滑
	var n1_egthdmSmoothed = [];
	// n2 单点
	var n2_egthdm = [];
	// n2 平滑
	var n2_egthdmSmoothed = [];
	
	// 数据加载
	function searchtail(tail){
		// 数组清空
		n1_egthdm.splice(0, n1_egthdm.length);
		n1_egthdmSmoothed.splice(0, n1_egthdmSmoothed.length);
		n2_egthdm.splice(0, n2_egthdm.length);
		n2_egthdmSmoothed.splice(0, n2_egthdmSmoothed.length);
			
		$.post(
	            "${pageContext.request.contextPath}/manage/datacfmperformance/all.do",
	            {"tail": tail},
	            function (response) {
		           	  for(var o in response.data){
		           			// 起飞的时候才会有数据
		           		  	if(response.data[o].flightPhase == 'TAKEOFF'){
			           		    if (response.data[o].eposition == 1) {
									// N1 (单点，平滑)
									n1_egthdm.push(response.data[o].egthdm);
									n1_egthdmSmoothed.push(response.data[o].egthdmSmoothed);
								} else {
									// N2 (单点，平滑)
									n2_egthdm.push(response.data[o].egthdm);
									n2_egthdmSmoothed.push(response.data[o].egthdmSmoothed);
								}
		           		  	}
		           	  }
		           	  // 页面初始化
	           		  toChart(); 
	            },
	            'json'
	     );
	}
	
	function toChart(){
		var val = $('#ch').val()
		var n1_egthdm_chart = []
		var n1_egthdmSmoothed_chart = []
		var n2_egthdm_chart = []
		var n2_egthdmSmoothed_chart = []
		
		for(var i = n1_egthdm.length-val; i < n1_egthdm.length; i++){
			n1_egthdm_chart.push(n1_egthdm[i])
			n1_egthdmSmoothed_chart.push(n1_egthdmSmoothed[i])
			n2_egthdm_chart.push(n2_egthdm[i])
			n2_egthdmSmoothed_chart.push(n2_egthdmSmoothed[i])
		} 
		
		var arr = []
		for(var i = 1; i<= val; i++){
			arr.push(''+i+'')
		}
		
		chart(arr, n1_egthdm_chart, n1_egthdmSmoothed_chart, n2_egthdm_chart,  n2_egthdmSmoothed_chart) 
	}
	
	
</script>
</body>
</html>
