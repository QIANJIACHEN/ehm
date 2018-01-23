//获取到这个DOM节点，然后初始化


function chart(
		   n1_m0, n1_m1, n1_m2, n1_m3, n1_m4, n1_m5, n1_m6, n1_m7, n1_m8, n1_m9,
		   n1_d0, n1_d1, n1_d2, n1_d3, n1_d4, n1_d5, n1_d6, n1_d7, n1_d8, n1_d9,
		   n2_m0, n2_m1, n2_m2, n2_m3, n2_m4, n2_m5, n2_m6, n2_m7, n2_m8, n2_m9,
		   n2_d0, n2_d1, n2_d2, n2_d3, n2_d4, n2_d5, n2_d6, n2_d7, n2_d8, n2_d9
){
	
	
	var myChart = echarts.init(document.getElementById("top"));
	var myChart1 = echarts.init(document.getElementById("bottom"));
	var myChart2 = echarts.init(document.getElementById("top1"));
	var myChart3 = echarts.init(document.getElementById("bottom1"));
	
	var option = {
	    // 标题
	    title: {
	        text: '1发单点'
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
	            name:'1发单点',
	            type:'line',
	            data:[n1_m0, n1_m1, n1_m2, n1_m3, n1_m4, n1_m5, n1_m6, n1_m7, n1_m8, n1_m9]
	        },
	        
	        
	
	    ]
	};
	var option1 = {
		    // 标题
		    title: {
		        text: '1发平滑'
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
		            name:'1发平滑',
		            type:'line',
		            data:[n1_d0, n1_d1, n1_d2, n1_d3, n1_d4, n1_d5, n1_d6, n1_d7, n1_d8, n1_d9]
		        },
		        
		        
		
		    ]
		};
	var option2 = {
		    // 标题
		    title: {
		        text: '2发单点'
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
		            name:'2发单点',
		            type:'line',
		            data:[n2_m0, n2_m1, n2_m2, n2_m3, n2_m4, n2_m5, n2_m6, n2_m7, n2_m8, n2_m9]
		        },
		        
		        
		
		    ]
		};
	var option3 = {
		    // 标题
		    title: {
		        text: '2发平滑'
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
		            name:'2发平滑',
		            type:'line',
		            data:[n2_d0, n2_d1, n2_d2, n2_d3, n2_d4, n2_d5, n2_d6, n2_d7, n2_d8, n2_d9]
		        },
		        
		        
		
		    ]
		};
	
	
	myChart.setOption(option);
	myChart1.setOption(option1);
	myChart2.setOption(option2);
	myChart3.setOption(option3);
	
	
	
}	
	
	