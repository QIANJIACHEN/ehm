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
    	.charts-mix #mixrecord{
    		width:80%;
    		min-width:600px;
    		height:300px;
    		margin:10px auto 50px;
    		background-color:red;
    	}
    </style>
</head>
<body class="hold-transition" >

<!-- Content Wrapper. Contains page content -->
<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">
        <div class="box-header with-border" style="border-bottom:none;">
         	
         	<div class="row" style="margin:15px 0px">
				<!-- <span class="mright">发动机编号</span>
				<input class="formnew" type="text" placeholder="52250" style="height:34px"/> -->
				
				<span class="mright">机号</span>
				<select id="search-tail" class="formnew" onchange="gettail()">
					<!-- <option value="tail">tail</option> -->
				</select>		 
                   		
				<span class="mright">时间</span>
				<select class="formnew">
					<option>10个点</option>
				</select>
				<div style="min-width: 160px;margin-left:15px;display:inline-block;vertical-align:bottom">
                    <button class="btn btn-block btn-default col-sm-1" >
                       	 查询
                    </button>
                </div>
				<div style="min-width: 160px;display:inline-block;vertical-align:bottom;float:right">
                    <button onclick="history.go(-1)" class="btn btn-block btn-primary col-sm-1">
                       	 返回
                    </button>
                </div>
				<div class="col-xs-1 pull-right" style="min-width: 160px">
                    <button onclick="zphs()" class="btn btn-block btn-primary col-sm-1">
                       	 趋势报表
                    </button>
                </div>
				<div class="col-xs-1 pull-right" style="min-width: 160px">
                    <button onclick="zvb1smoothed()" class="btn btn-block btn-primary col-sm-1">
                       	 平滑报表
                    </button>
                </div>
				<div class="col-xs-1 pull-right" style="min-width: 160px">
                    <button onclick="zvb1()" class="btn btn-block btn-primary col-sm-1">
                       	 单点报表
                    </button>
                </div>
			</div>
            
        </div>
        <div class="box-body">
        	<div class="charts-single">
        		<div class="leftcharts">
        			<div id="top"></div>
        			<div id="bottom"></div>
        		</div>
            	<div class="rightcharts">
            		<div id="top1"></div>
        			<div id="bottom1"></div>
            	</div>
        	</div>
			<div class="charts-mix">
				<div id="mixrecord"></div>
			</div>
        </div>
    </div>
</div>


<script type="text/javascript" src="../../js/echarts/echarts.js"></script>
<script type="text/javascript" src="../../js/echarts/shakezvb1chart.js"></script>
<script type="text/javascript" src="../../js/echarts/shakezvb1smoothedchart.js"></script>
<script type="text/javascript" src="../../js/echarts/shakezphschart.js"></script>

<script type="text/javascript">
	// 初始化选择框
	$.post(
	        "${pageContext.request.contextPath}/manage/dataplane/allplane.do",
	        {},
	        function (response) {
		       	  $('#search-tail').html('');
		       	  for(var o in response.data){
		       	      $('#search-tail').append('<option value="'+response.data[o].tail+'">'+response.data[o].tail+'</option>');
		       	  }  
	       		searchtail(response.data[0].tail)
	        },
	        "json"
	 );
	
	// onchange事件
	function gettail(){
		var tail = $('#search-tail').val();
		searchtail(tail);
	}
	
	// n1 起飞 前单点
	var n1_1_zvb1f = [];
	// n1 起飞 后单点
	var n1_1_zvb1r = [];
	// n1 巡航 前单点
	var n1_2_zvb1f = [];
	// n1 巡航 后单点
	var n1_2_zvb1r = [];
	// n1 起飞  前平滑
	var n1_1_zvb1fsmoothed = [];
	// n1 起飞 后平滑
	var n1_1_zvb1rsmoothed = [];
	// n1 巡航  前平滑
	var n1_2_zvb1fsmoothed = [];
	// n1 巡航 后平滑
	var n1_2_zvb1rsmoothed = [];
	// n1 起飞  前趋势
	var n1_1_zphsf = [];
	// n1 起飞 后趋势
	var n1_1_zphsr = [];
	// n1 巡航  前趋势
	var n1_2_zphsf = [];
	// n1 巡航 后趋势
	var n1_2_zphsr = [];
	
	// n2 起飞 前单点
	var n2_1_zvb1f = [];
	// n2 起飞 后单点
	var n2_1_zvb1r = [];
	// n2 巡航 前单点
	var n2_2_zvb1f = [];
	// n2 巡航 后单点
	var n2_2_zvb1r = [];
	// n2 起飞  前平滑
	var n2_1_zvb1fsmoothed = [];
	// n2 起飞 后平滑
	var n2_1_zvb1rsmoothed = [];
	// n2 巡航  前平滑
	var n2_2_zvb1fsmoothed = [];
	// n2 巡航 后平滑
	var n2_2_zvb1rsmoothed = [];
	// n2 起飞  前趋势
	var n2_1_zphsf = [];
	// n2 起飞 后趋势
	var n2_1_zphsr = [];
	// n2 巡航  前趋势
	var n2_2_zphsf = [];
	// n2 巡航 后趋势
	var n2_2_zphsr = [];
	
	// 数据加载
	function searchtail(tail){
		// 数组清空
 		n1_1_zvb1f.splice(0, n1_1_zvb1f.length);
		n1_1_zvb1r.splice(0, n1_1_zvb1r.length);
		n1_1_zvb1fsmoothed.splice(0, n1_1_zvb1fsmoothed.length);
		n1_1_zvb1rsmoothed.splice(0, n1_1_zvb1rsmoothed.length);
		n1_1_zphsf.splice(0, n1_1_zphsf.length);
		n1_1_zphsr.splice(0, n1_1_zphsr.length);
		n1_2_zvb1f.splice(0, n1_2_zvb1f.length);
		n1_2_zvb1r.splice(0, n1_2_zvb1r.length);
		n1_2_zvb1fsmoothed.splice(0, n1_2_zvb1fsmoothed.length);
		n1_2_zvb1rsmoothed.splice(0, n1_2_zvb1rsmoothed.length);
		n1_2_zphsf.splice(0, n1_2_zphsf.length);
		n1_2_zphsr.splice(0, n1_2_zphsr.length);
		
		n2_1_zvb1f.splice(0, n2_1_zvb1f.length);
		n2_1_zvb1r.splice(0, n2_1_zvb1r.length);
		n2_1_zvb1fsmoothed.splice(0, n2_1_zvb1fsmoothed.length);
		n2_1_zvb1rsmoothed.splice(0, n2_1_zvb1rsmoothed.length);
		n2_1_zphsf.splice(0, n2_1_zphsf.length);
		n2_1_zphsr.splice(0, n2_1_zphsr.length);
		n2_2_zvb1f.splice(0, n2_2_zvb1f.length);
		n2_2_zvb1r.splice(0, n2_2_zvb1r.length);
		n2_2_zvb1fsmoothed.splice(0, n2_2_zvb1fsmoothed.length);
		n2_2_zvb1rsmoothed.splice(0, n2_2_zvb1rsmoothed.length);
		n2_2_zphsf.splice(0, n2_2_zphsf.length);
		n2_2_zphsr.splice(0, n2_2_zphsr.length);  
		
		$.post(
	            "${pageContext.request.contextPath}/manage/shakemonitor/list.do",
	            {"tail": tail},
	            function (response) {
		           	  for(var o in response.data){
		           		    if (response.data[o].ePosition == 1) {
								// N1 (单点，平滑，趋势)
								if (response.data[o].flightPhase == 1) {
									// 起飞
									n1_1_zvb1f.push(response.data[o].zvb1f);
									n1_1_zvb1r.push(response.data[o].zvb1r);
									n1_1_zvb1fsmoothed.push(response.data[o].zvb1fSmoothed);
									n1_1_zvb1rsmoothed.push(response.data[o].zvb1rSmoothed);
									n1_1_zphsf.push(response.data[o].zphsf);
									n1_1_zphsr.push(response.data[o].zphsr);
								} else {
									// 巡航
									n1_2_zvb1f.push(response.data[o].zvb1f);
									n1_2_zvb1r.push(response.data[o].zvb1r);
									n1_2_zvb1fsmoothed.push(response.data[o].zvb1fSmoothed);
									n1_2_zvb1rsmoothed.push(response.data[o].zvb1rSmoothed);
									n1_2_zphsf.push(response.data[o].zphsf);
									n1_2_zphsr.push(response.data[o].zphsr);
								}
							} else {
								// N2 (单点，平滑，趋势)
								if (response.data[o].flightPhase == 1) {
									// 起飞
									n2_1_zvb1f.push(response.data[o].zvb1f);
									n2_1_zvb1r.push(response.data[o].zvb1r);
									n2_1_zvb1fsmoothed.push(response.data[o].zvb1fSmoothed);
									n2_1_zvb1rsmoothed.push(response.data[o].zvb1rSmoothed);
									n2_1_zphsf.push(response.data[o].zphsf);
									n2_1_zphsr.push(response.data[o].zphsr);
								} else {
									// 巡航
									n2_2_zvb1f.push(response.data[o].zvb1f);
									n2_2_zvb1r.push(response.data[o].zvb1r);
									n2_2_zvb1fsmoothed.push(response.data[o].zvb1fSmoothed);
									n2_2_zvb1rsmoothed.push(response.data[o].zvb1rSmoothed);
									n2_2_zphsf.push(response.data[o].zphsf);
									n2_2_zphsr.push(response.data[o].zphsr);
								}
							}
		           	  }
		           	  // 页面初始化(默认单点图表)
	           		  zvb1(); 
	            },
	            'json'
	     );
	}
	
	// 单点
	function zvb1(){
		// n1 起飞 前单点
		n1_1_f0 = n1_1_zvb1f[0];
		n1_1_f1 = n1_1_zvb1f[1];
		n1_1_f2 = n1_1_zvb1f[2];
		n1_1_f3 = n1_1_zvb1f[3];
		n1_1_f4 = n1_1_zvb1f[4];
		n1_1_f5 = n1_1_zvb1f[5];
		n1_1_f6 = n1_1_zvb1f[6];
		n1_1_f7 = n1_1_zvb1f[7];
		n1_1_f8 = n1_1_zvb1f[8];
		n1_1_f9 = n1_1_zvb1f[9];
		// n1 起飞 后单点
		n1_1_r0 = n1_1_zvb1r[0];
		n1_1_r1 = n1_1_zvb1r[1];
		n1_1_r2 = n1_1_zvb1r[2];
		n1_1_r3 = n1_1_zvb1r[3];
		n1_1_r4 = n1_1_zvb1r[4];
		n1_1_r5 = n1_1_zvb1r[5];
		n1_1_r6 = n1_1_zvb1r[6];
		n1_1_r7 = n1_1_zvb1r[7];
		n1_1_r8 = n1_1_zvb1r[8];
		n1_1_r9 = n1_1_zvb1r[9];
		// n1 巡航 前单点
		n1_2_f0 = n1_2_zvb1f[0];
		n1_2_f1 = n1_2_zvb1f[1];
		n1_2_f2 = n1_2_zvb1f[2];
		n1_2_f3 = n1_2_zvb1f[3];
		n1_2_f4 = n1_2_zvb1f[4];
		n1_2_f5 = n1_2_zvb1f[5];
		n1_2_f6 = n1_2_zvb1f[6];
		n1_2_f7 = n1_2_zvb1f[7];
		n1_2_f8 = n1_2_zvb1f[8];
		n1_2_f9 = n1_2_zvb1f[9];
		// n1 巡航 后单点
		n1_2_r0 = n1_2_zvb1r[0];
		n1_2_r1 = n1_2_zvb1r[1];
		n1_2_r2 = n1_2_zvb1r[2];
		n1_2_r3 = n1_2_zvb1r[3];
		n1_2_r4 = n1_2_zvb1r[4];
		n1_2_r5 = n1_2_zvb1r[5];
		n1_2_r6 = n1_2_zvb1r[6];
		n1_2_r7 = n1_2_zvb1r[7];
		n1_2_r8 = n1_2_zvb1r[8];
		n1_2_r9 = n1_2_zvb1r[9];
		// n2 起飞 前单点
		n2_1_f0 = n2_1_zvb1f[0];
		n2_1_f1 = n2_1_zvb1f[1];
		n2_1_f2 = n2_1_zvb1f[2];
		n2_1_f3 = n2_1_zvb1f[3];
		n2_1_f4 = n2_1_zvb1f[4];
		n2_1_f5 = n2_1_zvb1f[5];
		n2_1_f6 = n2_1_zvb1f[6];
		n2_1_f7 = n2_1_zvb1f[7];
		n2_1_f8 = n2_1_zvb1f[8];
		n2_1_f9 = n2_1_zvb1f[9];
		// n2 起飞 后单点
		n2_1_r0 = n2_1_zvb1r[0];
		n2_1_r1 = n2_1_zvb1r[1];
		n2_1_r2 = n2_1_zvb1r[2];
		n2_1_r3 = n2_1_zvb1r[3];
		n2_1_r4 = n2_1_zvb1r[4];
		n2_1_r5 = n2_1_zvb1r[5];
		n2_1_r6 = n2_1_zvb1r[6];
		n2_1_r7 = n2_1_zvb1r[7];
		n2_1_r8 = n2_1_zvb1r[8];
		n2_1_r9 = n2_1_zvb1r[9];
		// n2 巡航 前单点
		n2_2_f0 = n2_2_zvb1f[0];
		n2_2_f1 = n2_2_zvb1f[1];
		n2_2_f2 = n2_2_zvb1f[2];
		n2_2_f3 = n2_2_zvb1f[3];
		n2_2_f4 = n2_2_zvb1f[4];
		n2_2_f5 = n2_2_zvb1f[5];
		n2_2_f6 = n2_2_zvb1f[6];
		n2_2_f7 = n2_2_zvb1f[7];
		n2_2_f8 = n2_2_zvb1f[8];
		n2_2_f9 = n2_2_zvb1f[9];
		// n2 巡航 后单点
		n2_2_r0 = n2_2_zvb1r[0];
		n2_2_r1 = n2_2_zvb1r[1];
		n2_2_r2 = n2_2_zvb1r[2];
		n2_2_r3 = n2_2_zvb1r[3];
		n2_2_r4 = n2_2_zvb1r[4];
		n2_2_r5 = n2_2_zvb1r[5];
		n2_2_r6 = n2_2_zvb1r[6];
		n2_2_r7 = n2_2_zvb1r[7];
		n2_2_r8 = n2_2_zvb1r[8];
		n2_2_r9 = n2_2_zvb1r[9];
		
		zvb1chart(
				  n1_1_f0, n1_1_f1, n1_1_f2, n1_1_f3, n1_1_f4, n1_1_f5, n1_1_f6, n1_1_f7, n1_1_f8, n1_1_f9,
				  n1_1_r0, n1_1_r1, n1_1_r2, n1_1_r3, n1_1_r4, n1_1_r5, n1_1_r6, n1_1_r7, n1_1_r8, n1_1_r9,
				  n1_2_f0, n1_2_f1, n1_2_f2, n1_2_f3, n1_2_f4, n1_2_f5, n1_2_f6, n1_2_f7, n1_2_f8, n1_2_f9,
				  n1_2_r0, n1_2_r1, n1_2_r2, n1_2_r3, n1_2_r4, n1_2_r5, n1_2_r6, n1_2_r7, n1_2_r8, n1_2_r9,
				  n2_1_f0, n2_1_f1, n2_1_f2, n2_1_f3, n2_1_f4, n2_1_f5, n2_1_f6, n2_1_f7, n2_1_f8, n2_1_f9,
				  n2_1_r0, n2_1_r1, n2_1_r2, n2_1_r3, n2_1_r4, n2_1_r5, n2_1_r6, n2_1_r7, n2_1_r8, n2_1_r9,
				  n2_2_f0, n2_2_f1, n2_2_f2, n2_2_f3, n2_2_f4, n2_2_f5, n2_2_f6, n2_2_f7, n2_2_f8, n2_2_f9,
				  n2_2_r0, n2_2_r1, n2_2_r2, n2_2_r3, n2_2_r4, n2_2_r5, n2_2_r6, n2_2_r7, n2_2_r8, n2_2_r9
		);
	}
	
	// 平滑
	function zvb1smoothed(){
		// n1 起飞 前平滑
		n1_1_f0 = n1_1_zvb1fsmoothed[0];
		n1_1_f1 = n1_1_zvb1fsmoothed[1];
		n1_1_f2 = n1_1_zvb1fsmoothed[2];
		n1_1_f3 = n1_1_zvb1fsmoothed[3];
		n1_1_f4 = n1_1_zvb1fsmoothed[4];
		n1_1_f5 = n1_1_zvb1fsmoothed[5];
		n1_1_f6 = n1_1_zvb1fsmoothed[6];
		n1_1_f7 = n1_1_zvb1fsmoothed[7];
		n1_1_f8 = n1_1_zvb1fsmoothed[8];
		n1_1_f9 = n1_1_zvb1fsmoothed[9];
		// n1 起飞 后平滑
		n1_1_r0 = n1_1_zvb1rsmoothed[0];
		n1_1_r1 = n1_1_zvb1rsmoothed[1];
		n1_1_r2 = n1_1_zvb1rsmoothed[2];
		n1_1_r3 = n1_1_zvb1rsmoothed[3];
		n1_1_r4 = n1_1_zvb1rsmoothed[4];
		n1_1_r5 = n1_1_zvb1rsmoothed[5];
		n1_1_r6 = n1_1_zvb1rsmoothed[6];
		n1_1_r7 = n1_1_zvb1rsmoothed[7];
		n1_1_r8 = n1_1_zvb1rsmoothed[8];
		n1_1_r9 = n1_1_zvb1rsmoothed[9];
		// n1 巡航 前平滑
		n1_2_f0 = n1_2_zvb1fsmoothed[0];
		n1_2_f1 = n1_2_zvb1fsmoothed[1];
		n1_2_f2 = n1_2_zvb1fsmoothed[2];
		n1_2_f3 = n1_2_zvb1fsmoothed[3];
		n1_2_f4 = n1_2_zvb1fsmoothed[4];
		n1_2_f5 = n1_2_zvb1fsmoothed[5];
		n1_2_f6 = n1_2_zvb1fsmoothed[6];
		n1_2_f7 = n1_2_zvb1fsmoothed[7];
		n1_2_f8 = n1_2_zvb1fsmoothed[8];
		n1_2_f9 = n1_2_zvb1fsmoothed[9];
		// n1 巡航 后平滑
		n1_2_r0 = n1_2_zvb1rsmoothed[0];
		n1_2_r1 = n1_2_zvb1rsmoothed[1];
		n1_2_r2 = n1_2_zvb1rsmoothed[2];
		n1_2_r3 = n1_2_zvb1rsmoothed[3];
		n1_2_r4 = n1_2_zvb1rsmoothed[4];
		n1_2_r5 = n1_2_zvb1rsmoothed[5];
		n1_2_r6 = n1_2_zvb1rsmoothed[6];
		n1_2_r7 = n1_2_zvb1rsmoothed[7];
		n1_2_r8 = n1_2_zvb1rsmoothed[8];
		n1_2_r9 = n1_2_zvb1rsmoothed[9];
		// n2 起飞 前平滑
		n2_1_f0 = n2_1_zvb1fsmoothed[0];
		n2_1_f1 = n2_1_zvb1fsmoothed[1];
		n2_1_f2 = n2_1_zvb1fsmoothed[2];
		n2_1_f3 = n2_1_zvb1fsmoothed[3];
		n2_1_f4 = n2_1_zvb1fsmoothed[4];
		n2_1_f5 = n2_1_zvb1fsmoothed[5];
		n2_1_f6 = n2_1_zvb1fsmoothed[6];
		n2_1_f7 = n2_1_zvb1fsmoothed[7];
		n2_1_f8 = n2_1_zvb1fsmoothed[8];
		n2_1_f9 = n2_1_zvb1fsmoothed[9];
		// n2 起飞 后平滑
		n2_1_r0 = n2_1_zvb1rsmoothed[0];
		n2_1_r1 = n2_1_zvb1rsmoothed[1];
		n2_1_r2 = n2_1_zvb1rsmoothed[2];
		n2_1_r3 = n2_1_zvb1rsmoothed[3];
		n2_1_r4 = n2_1_zvb1rsmoothed[4];
		n2_1_r5 = n2_1_zvb1rsmoothed[5];
		n2_1_r6 = n2_1_zvb1rsmoothed[6];
		n2_1_r7 = n2_1_zvb1rsmoothed[7];
		n2_1_r8 = n2_1_zvb1rsmoothed[8];
		n2_1_r9 = n2_1_zvb1rsmoothed[9];
		// n2 巡航 前平滑
		n2_2_f0 = n2_2_zvb1fsmoothed[0];
		n2_2_f1 = n2_2_zvb1fsmoothed[1];
		n2_2_f2 = n2_2_zvb1fsmoothed[2];
		n2_2_f3 = n2_2_zvb1fsmoothed[3];
		n2_2_f4 = n2_2_zvb1fsmoothed[4];
		n2_2_f5 = n2_2_zvb1fsmoothed[5];
		n2_2_f6 = n2_2_zvb1fsmoothed[6];
		n2_2_f7 = n2_2_zvb1fsmoothed[7];
		n2_2_f8 = n2_2_zvb1fsmoothed[8];
		n2_2_f9 = n2_2_zvb1fsmoothed[9];
		// n2 巡航 后平滑
		n2_2_r0 = n2_2_zvb1rsmoothed[0];
		n2_2_r1 = n2_2_zvb1rsmoothed[1];
		n2_2_r2 = n2_2_zvb1rsmoothed[2];
		n2_2_r3 = n2_2_zvb1rsmoothed[3];
		n2_2_r4 = n2_2_zvb1rsmoothed[4];
		n2_2_r5 = n2_2_zvb1rsmoothed[5];
		n2_2_r6 = n2_2_zvb1rsmoothed[6];
		n2_2_r7 = n2_2_zvb1rsmoothed[7];
		n2_2_r8 = n2_2_zvb1rsmoothed[8];
		n2_2_r9 = n2_2_zvb1rsmoothed[9];
		
		zvb1smoothedchart(
				  n1_1_f0, n1_1_f1, n1_1_f2, n1_1_f3, n1_1_f4, n1_1_f5, n1_1_f6, n1_1_f7, n1_1_f8, n1_1_f9,
				  n1_1_r0, n1_1_r1, n1_1_r2, n1_1_r3, n1_1_r4, n1_1_r5, n1_1_r6, n1_1_r7, n1_1_r8, n1_1_r9,
				  n1_2_f0, n1_2_f1, n1_2_f2, n1_2_f3, n1_2_f4, n1_2_f5, n1_2_f6, n1_2_f7, n1_2_f8, n1_2_f9,
				  n1_2_r0, n1_2_r1, n1_2_r2, n1_2_r3, n1_2_r4, n1_2_r5, n1_2_r6, n1_2_r7, n1_2_r8, n1_2_r9,
				  n2_1_f0, n2_1_f1, n2_1_f2, n2_1_f3, n2_1_f4, n2_1_f5, n2_1_f6, n2_1_f7, n2_1_f8, n2_1_f9,
				  n2_1_r0, n2_1_r1, n2_1_r2, n2_1_r3, n2_1_r4, n2_1_r5, n2_1_r6, n2_1_r7, n2_1_r8, n2_1_r9,
				  n2_2_f0, n2_2_f1, n2_2_f2, n2_2_f3, n2_2_f4, n2_2_f5, n2_2_f6, n2_2_f7, n2_2_f8, n2_2_f9,
				  n2_2_r0, n2_2_r1, n2_2_r2, n2_2_r3, n2_2_r4, n2_2_r5, n2_2_r6, n2_2_r7, n2_2_r8, n2_2_r9
		);
	}
	
	// 趋势
	function zphs(){
		// n1 起飞 前趋势
		n1_1_f0 = n1_1_zphsf[0];
		n1_1_f1 = n1_1_zphsf[1];
		n1_1_f2 = n1_1_zphsf[2];
		n1_1_f3 = n1_1_zphsf[3];
		n1_1_f4 = n1_1_zphsf[4];
		n1_1_f5 = n1_1_zphsf[5];
		n1_1_f6 = n1_1_zphsf[6];
		n1_1_f7 = n1_1_zphsf[7];
		n1_1_f8 = n1_1_zphsf[8];
		n1_1_f9 = n1_1_zphsf[9];
		// n1 起飞 后趋势
		n1_1_r0 = n1_1_zphsr[0];
		n1_1_r1 = n1_1_zphsr[1];
		n1_1_r2 = n1_1_zphsr[2];
		n1_1_r3 = n1_1_zphsr[3];
		n1_1_r4 = n1_1_zphsr[4];
		n1_1_r5 = n1_1_zphsr[5];
		n1_1_r6 = n1_1_zphsr[6];
		n1_1_r7 = n1_1_zphsr[7];
		n1_1_r8 = n1_1_zphsr[8];
		n1_1_r9 = n1_1_zphsr[9];
		// n1 巡航 前趋势
		n1_2_f0 = n1_2_zphsf[0];
		n1_2_f1 = n1_2_zphsf[1];
		n1_2_f2 = n1_2_zphsf[2];
		n1_2_f3 = n1_2_zphsf[3];
		n1_2_f4 = n1_2_zphsf[4];
		n1_2_f5 = n1_2_zphsf[5];
		n1_2_f6 = n1_2_zphsf[6];
		n1_2_f7 = n1_2_zphsf[7];
		n1_2_f8 = n1_2_zphsf[8];
		n1_2_f9 = n1_2_zphsf[9];
		// n1 巡航 后趋势
		n1_2_r0 = n1_2_zphsr[0];
		n1_2_r1 = n1_2_zphsr[1];
		n1_2_r2 = n1_2_zphsr[2];
		n1_2_r3 = n1_2_zphsr[3];
		n1_2_r4 = n1_2_zphsr[4];
		n1_2_r5 = n1_2_zphsr[5];
		n1_2_r6 = n1_2_zphsr[6];
		n1_2_r7 = n1_2_zphsr[7];
		n1_2_r8 = n1_2_zphsr[8];
		n1_2_r9 = n1_2_zphsr[9];
		// n2 起飞 前趋势
		n2_1_f0 = n2_1_zphsf[0];
		n2_1_f1 = n2_1_zphsf[1];
		n2_1_f2 = n2_1_zphsf[2];
		n2_1_f3 = n2_1_zphsf[3];
		n2_1_f4 = n2_1_zphsf[4];
		n2_1_f5 = n2_1_zphsf[5];
		n2_1_f6 = n2_1_zphsf[6];
		n2_1_f7 = n2_1_zphsf[7];
		n2_1_f8 = n2_1_zphsf[8];
		n2_1_f9 = n2_1_zphsf[9];
		// n2 起飞 后趋势
		n2_1_r0 = n2_1_zphsr[0];
		n2_1_r1 = n2_1_zphsr[1];
		n2_1_r2 = n2_1_zphsr[2];
		n2_1_r3 = n2_1_zphsr[3];
		n2_1_r4 = n2_1_zphsr[4];
		n2_1_r5 = n2_1_zphsr[5];
		n2_1_r6 = n2_1_zphsr[6];
		n2_1_r7 = n2_1_zphsr[7];
		n2_1_r8 = n2_1_zphsr[8];
		n2_1_r9 = n2_1_zphsr[9];
		// n2 巡航 前趋势
		n2_2_f0 = n2_2_zphsf[0];
		n2_2_f1 = n2_2_zphsf[1];
		n2_2_f2 = n2_2_zphsf[2];
		n2_2_f3 = n2_2_zphsf[3];
		n2_2_f4 = n2_2_zphsf[4];
		n2_2_f5 = n2_2_zphsf[5];
		n2_2_f6 = n2_2_zphsf[6];
		n2_2_f7 = n2_2_zphsf[7];
		n2_2_f8 = n2_2_zphsf[8];
		n2_2_f9 = n2_2_zphsf[9];
		// n2 巡航 后趋势
		n2_2_r0 = n2_2_zphsr[0];
		n2_2_r1 = n2_2_zphsr[1];
		n2_2_r2 = n2_2_zphsr[2];
		n2_2_r3 = n2_2_zphsr[3];
		n2_2_r4 = n2_2_zphsr[4];
		n2_2_r5 = n2_2_zphsr[5];
		n2_2_r6 = n2_2_zphsr[6];
		n2_2_r7 = n2_2_zphsr[7];
		n2_2_r8 = n2_2_zphsr[8];
		n2_2_r9 = n2_2_zphsr[9];
		
		zphschart(
				  n1_1_f0, n1_1_f1, n1_1_f2, n1_1_f3, n1_1_f4, n1_1_f5, n1_1_f6, n1_1_f7, n1_1_f8, n1_1_f9,
				  n1_1_r0, n1_1_r1, n1_1_r2, n1_1_r3, n1_1_r4, n1_1_r5, n1_1_r6, n1_1_r7, n1_1_r8, n1_1_r9,
				  n1_2_f0, n1_2_f1, n1_2_f2, n1_2_f3, n1_2_f4, n1_2_f5, n1_2_f6, n1_2_f7, n1_2_f8, n1_2_f9,
				  n1_2_r0, n1_2_r1, n1_2_r2, n1_2_r3, n1_2_r4, n1_2_r5, n1_2_r6, n1_2_r7, n1_2_r8, n1_2_r9,
				  n2_1_f0, n2_1_f1, n2_1_f2, n2_1_f3, n2_1_f4, n2_1_f5, n2_1_f6, n2_1_f7, n2_1_f8, n2_1_f9,
				  n2_1_r0, n2_1_r1, n2_1_r2, n2_1_r3, n2_1_r4, n2_1_r5, n2_1_r6, n2_1_r7, n2_1_r8, n2_1_r9,
				  n2_2_f0, n2_2_f1, n2_2_f2, n2_2_f3, n2_2_f4, n2_2_f5, n2_2_f6, n2_2_f7, n2_2_f8, n2_2_f9,
				  n2_2_r0, n2_2_r1, n2_2_r2, n2_2_r3, n2_2_r4, n2_2_r5, n2_2_r6, n2_2_r7, n2_2_r8, n2_2_r9		
		);
	}
	
</script>
</body>
</html>
