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
    		width:60%;
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
				<span class="mright">发动机编号</span>
				<input class="formnew" type="text" placeholder="52250" style="height:34px"/>
						    		
				<span class="mright">时间</span>
				<select class="formnew">
					<option>10个点</option>
				</select>
				
				<div style="min-width: 160px;margin-left:15px;display:inline-block;vertical-align:bottom">
                    <button class="btn btn-block btn-default col-sm-1">
                       	 查询
                    </button>
                </div>
				<!-- <div style="min-width: 160px;display:inline-block;vertical-align:bottom;float:right">
                    <button class="btn btn-block btn-primary col-sm-1">
                       	 保存
                    </button>
                </div> -->
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
<script type="text/javascript" src="../../js/echarts/shakeecharts.js"></script>
<script type="text/javascript">
	var N1_1 = 0.6;
	var N1_2 = 0.65;
	var N1_3 = 0.61;
	var N1_4 = 0.63;
	var N1_5 = 0.62;
	var N1_6 = 0.64;
	var N1_7 = 0.61;
	var N1_8 = 0.66;
	var N1_9 = 0.63;
	var N1_10 = 0.65;

	chart(N1_1, N1_2, N1_3, N1_4, N1_5, N1_6, N1_7, N1_8, N1_9, N1_10);
	
</script>
</body>
</html>
