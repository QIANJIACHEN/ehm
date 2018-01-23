<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
    <script type="text/javascript" src="../../js/echarts/echarts.js"></script>
</head>
<body class="hold-transition" >
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="engcount" style="width: 600px;height:400px;"></div>
    <div id="main1" style="width: 600px;height:400px;"></div>
    <div id="duty" style="width: 600px;height:400px;"></div>
    <div id="main3" style="width: 600px;height:400px;"></div>
    <div id="main4" style="width: 600px;height:400px;"></div>
    <div id="main5" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('engcount'));
        var myChart1 = echarts.init(document.getElementById('main1'));
        var myChart2 = echarts.init(document.getElementById('duty'));
        var myChart3 = echarts.init(document.getElementById('main3'));
        var myChart4 = echarts.init(document.getElementById('main4'));
        var myChart5 = echarts.init(document.getElementById('main5'));
        // 指定图表的配置项和数据
        var option = {
            title: {
                text: 'ENG_SN的计数'
            },
            tooltip: {},
            legend: {
                data:['ENG_SN的数量']
            },
            xAxis: {
                data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
            },
            //y轴数值会根据所有值自行变成适合阅读的
            yAxis: {},
            series: [{
                name: 'ENG_SN的数量',
                type: 'bar',
                data: [5, 120, 636, 10, 10, 20]
            }]
        };
        //第一个图标，可以当成例子来写
		$.post("${pageContext.request.contextPath}/manage/dataeng/getEngConfigrationGroup.do",function(res){
			if(res!=""&&res!=null&&res!="undefined"){
				res = JSON.parse(res);
				data1="";num1="";
				if(res.data.length>="1"){
					$.each(res.data,function(key,val){
						data1 = data1+'"'+val.engConfigration+'"'+",";
						num1 = num1+val.num+",";
					});
					data1=data1.substring(0,data1.length-1);
					num1=num1.substring(0,num1.length-1);
					//需要string转json不然读取不了- -
					data1 = "["+data1+"]";
					data1 = eval("(" + data1 + ")");
					num1 = "["+num1+"]";
					num1 = eval("(" + num1 + ")");
					var option1 = {
				            title: {
				                text: 'ENG_SN的计数'
				            },
				            tooltip: {},
				            legend: {
				                data:['ENG_SN的数量']
				            },
				            xAxis: {
				                data: data1
				            },
				            //y轴数值会根据所有值自行变成适合阅读的
				            yAxis: {},
				            series: [{
				                name: 'ENG_SN的数量',
				                type: 'bar',
				                data: num1
				            }]
				        };
					myChart.setOption(option1);
				}
			}
			
		});
        // 使用刚指定的配置项和数据显示图表。
       	
        //第三个图标
        $.post("${pageContext.request.contextPath}/manage/dataeng/getDutyGroup.do",function(res){
			if(res!=""&&res!=null&&res!="undefined"){
				res = JSON.parse(res);
				data3="";num3="";
				if(res.data.length>="1"){
					$.each(res.data,function(key,val){
						data3 = data3+'"'+val.dutyName+'"'+",";
						num3 = num3+val.num+",";
					});
					data3=data3.substring(0,data3.length-1);
					num3=num3.substring(0,num3.length-1);
					//需要string转json不然读取不了- -
					data3 = "["+data3+"]";
					data3 = eval("(" + data3 + ")");
					num3 = "["+num3+"]";
					num3 = eval("(" + num3 + ")");
					var option3 = {
				            title: {
				                text: 'ENG_SN的计数'
				            },
				            tooltip: {},
				            legend: {
				                data:['发动机数量']
				            },
				            xAxis: {
				                data: data3
				            },
				            //y轴数值会根据所有值自行变成适合阅读的
				            yAxis: {},
				            series: [{
				                name: '发动机数量',
				                type: 'bar',
				                data: num3
				            }]
				        };
					myChart2.setOption(option3);
				}
			}
			
			 
        });
        //第四幅图
        $.post("${pageContext.request.contextPath}/manage/dataeng/getEngModelGroup.do",function(res){
        	if(res!=""&&res!=null&&res!="undefined"){
				res = JSON.parse(res);
				data4="";num4="";
				if(res.data.length>="1"){
					$.each(res.data,function(key,val){
						data4 = data4+'"'+val.engModel+'"'+",";
						num4 = num4+val.num+",";
					});
					data4=data4.substring(0,data4.length-1);
					num4=num4.substring(0,num4.length-1);
					//需要string转json不然读取不了- -
					data4 = "["+data4+"]";
					data4 = eval("(" + data4 + ")");
					num4 = "["+num4+"]";
					num4 = eval("(" + num4 + ")");
					var option4 = {
				            title: {
				                text: 'ENG_SN的计数'
				            },
				            tooltip: {},
				            legend: {
				                data:['发动机数量']
				            },
				            xAxis: {
				                data: data4
				            },
				            //y轴数值会根据所有值自行变成适合阅读的
				            yAxis: {},
				            series: [{
				                name: '发动机数量',
				                type: 'bar',
				                data: num4
				            }]
				        };
					myChart3.setOption(option4);
				}
			}
        });
      //第五图
      $.post("${pageContext.request.contextPath}/manage/dataeng/getEngConfigGroup.do",function(res){
    	  if(res!=""&&res!=null&&res!="undefined"){
				res = JSON.parse(res);
				data5="";num5="";
				if(res.data.length>="1"){
					$.each(res.data,function(key,val){
						data5 = data5+'"'+val.engConfig+'"'+",";
						num5 = num5+val.num+",";
					});
					data5=data5.substring(0,data5.length-1);
					num5=num5.substring(0,num5.length-1);
					//需要string转json不然读取不了- -
					data5 = "["+data5+"]";
					data5 = eval("(" + data5 + ")");
					num5 = "["+num5+"]";
					num5 = eval("(" + num5 + ")");
					var option4 = {
				            title: {
				                text: 'ENG_SN的计数'
				            },
				            tooltip: {},
				            legend: {
				                data:['发动机数量']
				            },
				            xAxis: {
				                data: data5
				            },
				            //y轴数值会根据所有值自行变成适合阅读的
				            yAxis: {},
				            series: [{
				                name: '发动机数量',
				                type: 'bar',
				                data: num5
				            }]
				        };
					myChart3.setOption(option4);
				}
			}
      });
      
		$.post("${pageContext.request.contextPath}/manage/dataplane/getPlaneGroupByModel.do",function(res){
			res = JSON.parse(res);
			model1=res.model;
			//console.log(model1);
			operater = "";
			info = "";
			$.each(res.data,function(key,val){
				if(info==""){
					info = info+'{name:"'+key+'",type:"bar",stack:"航空公司",data:['+val+']}';
				}else{
					info = info+',{name:"'+key+'",type:"bar",stack:"航空公司",data:['+val+']}';
				}
				
				
				operater = operater+'"'+key+'",';
			});
			operater=operater.substring(0,operater.length-1);
			info = "["+info+"]";
			operater = "["+operater+"]";
			info = eval("(" + info + ")");
			operater = eval("(" + operater + ")");
			console.log(1);
			console.log(model1);
			console.log(info);
			console.log(operater);
			option5 = {
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				    legend: {
				        data:operater
				    },
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				    xAxis : [
				        {
				            type : 'category',
				            data : model1
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value'
				        }
				    ],
				    series :info
				};
			myChart4.setOption(option5);
			
			
			//console.log(operater);
     	});
		
       
        
       </script>
</body>
</html>