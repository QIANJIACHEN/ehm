<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
    <link rel="stylesheet" href="../css/donghang/home.css">
    <!-- 日历控件 -->
    <link rel="stylesheet" href="../css/donghang/fullcalendar/fullcalendar.min.css">
    <link rel="stylesheet" href="../css/donghang/fullcalendar/fullcalendar.print.min.css" media='print'>
    <style>
    	.fc-widget-header:first-of-type, .fc-widget-content:first-of-type{
    		border-left:1px solid #ddd;
    	}
    	.fc-widget-header:last-of-type, .fc-widget-content:last-of-type {
		    border-right:1px solid #ddd ;
		}
		.charts-pie>div{
    		float:left;
    		width:50%;
    		height:500px;
    		/* min-width:470px;
    		 */
    		/* box-sizing:border-box; */
    		padding:0px 20px;
    	}
    	.list-group-item{
    		border:none!important;
    		border-bottom:1px solid #ddd!important;
    		margin-bottom:0!important;
    		overflow:hidden;
    	}
    	.list-group{
    		border:1px solid #ddd!important;
    		padding-bottom:225px;
    	}
    	.text-left{
    		float:left;
    	}
    	.text-right{
    		float:right;
    	}
    	.fc-toolbar {
    		display:none;
    	}
    	.fc-day-header span{
    		font-size:17px;
    		display:inline-block;
    		height:50px;
    		line-height:50px;
    	}
    	.fc-content-skeleton{
    		height:50px!important;
    	}
    	.fc-row{
    		height:50px!important;
    		line-height:50px;
    	}
    	.fc-scroller{
    		height:auto!important;
    	}
    	.fc-day-top{
    		text-align:center;
    	}
    	.fc-day-number{
    		float:none!important;
    	}
    	.fc-event-container{
    		display:none;
    	}
    	.fc-day-number{
    		line-height:50px;
    	}
    	.fc-unthemed td.fc-today{
    		background:#FF9378;
    	}
		.fc-day-number{
			color:black!important;
		}
		.fc-other-month{
			background:#f2f2f2;
		}
		a{
			color:black!important;
		}
    </style>
</head>
<body class="hold-transition">
<!-- Content Wrapper. Contains page content -->
<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">

        <div class="box-header with-border" style="border-bottom:none">
        	<div class="row" style="margin-top:30px">
        		<div class="col-xs-4" style="min-width:130px;padding-bottom:5px">
        			<ul class="list-group warning">
					    <li class="list-group-item" style="border:none!important;font-weight:bold;">警报
					    	<span class="badge"><a style="color:#6b6b6b">更多></a></span>
					    </li>
					    <li class="list-group-item">
					 		<span class="text-left">免费 Window 空间托管</span>
					 		<span class="text-right">2017/12/29</span>
					    </li>
					    <li class="list-group-item">
					    	<span class="text-left">图像的数量</span>
					    	<span class="text-right">2017/12/29</span>
					    </li>
					    <li class="list-group-item">
					    	<span class="text-left">24*7 支持</span>
					    	<span class="text-right">2017/12/29</span>
					    </li>
					</ul>
        		</div>	
        		<div class="col-xs-7 col-xs-offset-1"  id="calendar" style=""></div>
        	</div>
        		
			  
        </div>
        <div class="box-body">
			<div class="charts-pie">
        		<div id="leftcharts"></div>
            	<div id="rightcharts"></div>
        	</div>

        </div>
    </div>
</div>

<script src='../../js/fullcalendar/moment.min.js'></script>
<script src='../../js/fullcalendar/jquery.min.js'></script>
<script src='../../js/fullcalendar/fullcalendar.min.js'></script>
<script type="text/javascript" src="../../js/echarts/echarts.js"></script>
<script type="text/javascript" src="../../js/echarts/homepieecharts.js"></script>
<script>
	

        $(document).ready(function() {
        	//获取当前的年月日信息
        	var oDtate=new Date();
            var year=oDtate.getFullYear();
            var month=oDtate.getMonth()+1;
            var day=oDtate.getDate();
            var nowdate=year+"-"+month+"-"+day;

            $('#calendar').fullCalendar({
               /*  header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay,listWeek'
                }, */
                defaultDate:nowdate ,
                navLinks: true, // can click day/week names to navigate views
                editable: true,
                eventLimit: true, // allow "more" link when too many events
                events: [
                    {
                        title: 'All Day Event',
                        start: '2017-11-01',
                    },
                    {
                        title: 'Long Event',
                        start: '2017-11-07',
                        end: '2017-11-10'
                    },
                    {
                        id: 999,
                        title: 'Repeating Event',
                        start: '2017-11-09T16:00:00'
                    },
                    {
                        id: 999,
                        title: 'Repeating Event',
                        start: '2017-11-16T16:00:00'
                    },
                    {
                        title: 'Conference',
                        start: '2017-11-11',
                        end: '2017-11-13'
                    },
                    {
                        title: 'Meeting',
                        start: '2017-11-12T10:30:00',
                        end: '2017-11-12T12:30:00'
                    },
                    {
                        title: 'Lunch',
                        start: '2017-11-12T12:00:00'
                    },
                    {
                        title: 'Meeting',
                        start: '2017-11-12T14:30:00'
                    },
                    {
                        title: 'Happy Hour',
                        start: '2017-11-12T17:30:00'
                    },
                    {
                        title: 'Dinner',
                        start: '2017-11-12T20:00:00'
                    },
                    {
                        title: 'Birthday Party',
                        start: '2017-11-13T07:00:00'
                    },
                    {
                        title: 'Click for baidu',
                        url: 'http://www.baidu.com',
                        start: '2017-11-28'
                    }
                ]
            });

        });

</script>
	

</body>
</html>
