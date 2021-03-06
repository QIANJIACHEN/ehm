//获取到这个DOM节点，然后初始化


function chart(N1_1, N1_2, N1_3, N1_4, N1_5, N1_6, N1_7, N1_8, N1_9, N1_10){
	
	
	var myChart = echarts.init(document.getElementById("top"));
	var myChart1 = echarts.init(document.getElementById("bottom"));
	var myChart2 = echarts.init(document.getElementById("top1"));
	var myChart3 = echarts.init(document.getElementById("bottom1"));
	var myChart4 = echarts.init(document.getElementById("mixrecord"));
	
	var option = {
	    // 标题
	    title: {
	        text: 'N1起飞'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    //工具框，可以选择
	    toolbox: {
	        feature: {
	            saveAsImage: {}
	        }
	    },
	    //x轴信息样式
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: ['1','2','3','4','5','6','7','8','9','10'],
	    },
	    yAxis: {
	        type: 'value'
	    },
	    series: [
	        
	        {
	            name:'N1起飞',
	            type:'line',
	            data:[N1_1, N1_2, N1_3, N1_4, N1_5, N1_6, N1_7, N1_8, N1_9, N1_10]
	        },
	        
	        
	
	    ]
	};
	var option1 = {
		    // 标题
		    title: {
		        text: 'N1巡航'
		    },
		    tooltip: {
		        trigger: 'axis'
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    //工具框，可以选择
		    toolbox: {
		        feature: {
		            saveAsImage: {}
		        }
		    },
		    //x轴信息样式
		    xAxis: {
		        type: 'category',
		        boundaryGap: false,
		        data: ['1','2','3','4','5','6','7','8','9','10'],
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series: [
		        
		        {
		            name:'N1巡航',
		            type:'line',
		            data:[0.6, 0.67, 0.61, 0.69, 0.67, 0.67, 0.65,0.64,0.62,0.61]
		        },
		        
		        
		
		    ]
		};
	var option2 = {
		    // 标题
		    title: {
		        text: 'N2起飞'
		    },
		    tooltip: {
		        trigger: 'axis'
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    //工具框，可以选择
		    toolbox: {
		        feature: {
		            saveAsImage: {}
		        }
		    },
		    //x轴信息样式
		    xAxis: {
		        type: 'category',
		        boundaryGap: false,
		        data: ['1','2','3','4','5','6','7','8','9','10'],
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series: [
		        
		        {
		            name:'N2起飞',
		            type:'line',
		            data:[0.62, 0.63, 0.62, 0.67, 0.65, 0.62, 0.64,0.63,0.68,0.65]
		        },
		        
		        
		
		    ]
		};
	var option3 = {
		    // 标题
		    title: {
		        text: 'N2巡航'
		    },
		    tooltip: {
		        trigger: 'axis'
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    //工具框，可以选择
		    toolbox: {
		        feature: {
		            saveAsImage: {}
		        }
		    },
		    //x轴信息样式
		    xAxis: {
		        type: 'category',
		        boundaryGap: false,
		        data: ['1','2','3','4','5','6','7','8','9','10'],
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series: [
		        
		        {
		            name:'N2巡航',
		            type:'line',
		            data:[0.69, 0.61, 0.67, 0.62, 0.66, 0.66, 0.65,0.64,0.63,0.61]
		        },
		        
		        
		
		    ]
		};
	var option4 = {
            // 标题
            title: {
                text: '变化趋势'
            },
            tooltip: {
                trigger: 'axis'
            },
            //图例名
            legend: {
                data:['N1起飞','N2起飞','N1巡航','N2巡航']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            //工具框，可以选择
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            //x轴信息样式
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['1','2','3','4','5','6','7','8','9','10'],
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name:'N1起飞',
                    type:'line',
                    color:['#cf8970'],
                    data:[0.5, 0.65, 0.61, 0.63, 0.62, 0.64, 0.61,0.66,0.63,0.65],
                },
                {
                    name:'N1巡航',
                    type:'line',
                    color:['#639fa7'],
                    data:[0.6, 0.67, 0.61, 0.69, 0.67, 0.67, 0.65,0.64,0.62,0.61]
                },
                {
                    name:'N2起飞',
                    type:'line',
                    color:['#3c4f5c'],
                    data:[0.62, 0.63, 0.62, 0.67, 0.65, 0.62, 0.64,0.63,0.68,0.65]
                },
                {
                    name:'N2巡航',
                    type:'line',
                    color:['#c03733'],
                    data:[0.69, 0.61, 0.67, 0.62, 0.66, 0.66, 0.65,0.64,0.63,0.61]
                },

            ]
        };
	
	
	myChart.setOption(option);
	myChart1.setOption(option1);
	myChart2.setOption(option2);
	myChart3.setOption(option3);
	myChart4.setOption(option4);
	
	
	
}	
	
	