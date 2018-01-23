//获取到这个DOM节点，然后初始化


function zvb1smoothedchart(
		  n1_1_f0, n1_1_f1, n1_1_f2, n1_1_f3, n1_1_f4, n1_1_f5, n1_1_f6, n1_1_f7, n1_1_f8, n1_1_f9,
		  n1_1_r0, n1_1_r1, n1_1_r2, n1_1_r3, n1_1_r4, n1_1_r5, n1_1_r6, n1_1_r7, n1_1_r8, n1_1_r9,
		  n1_2_f0, n1_2_f1, n1_2_f2, n1_2_f3, n1_2_f4, n1_2_f5, n1_2_f6, n1_2_f7, n1_2_f8, n1_2_f9,
		  n1_2_r0, n1_2_r1, n1_2_r2, n1_2_r3, n1_2_r4, n1_2_r5, n1_2_r6, n1_2_r7, n1_2_r8, n1_2_r9,
		  n2_1_f0, n2_1_f1, n2_1_f2, n2_1_f3, n2_1_f4, n2_1_f5, n2_1_f6, n2_1_f7, n2_1_f8, n2_1_f9,
		  n2_1_r0, n2_1_r1, n2_1_r2, n2_1_r3, n2_1_r4, n2_1_r5, n2_1_r6, n2_1_r7, n2_1_r8, n2_1_r9,
		  n2_2_f0, n2_2_f1, n2_2_f2, n2_2_f3, n2_2_f4, n2_2_f5, n2_2_f6, n2_2_f7, n2_2_f8, n2_2_f9,
		  n2_2_r0, n2_2_r1, n2_2_r2, n2_2_r3, n2_2_r4, n2_2_r5, n2_2_r6, n2_2_r7, n2_2_r8, n2_2_r9		
){
	
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
            //图例名
            legend: {
                data:['前平滑','后平滑']
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
                    name:'前平滑',
                    type:'line',
                    color:['#cf8970'],
                    data:[n1_1_f0, n1_1_f1, n1_1_f2, n1_1_f3, n1_1_f4, n1_1_f5, n1_1_f6, n1_1_f7, n1_1_f8, n1_1_f9],
                },
                {
                    name:'后平滑',
                    type:'line',
                    color:['#639fa7'],
                    data:[n1_1_r0, n1_1_r1, n1_1_r2, n1_1_r3, n1_1_r4, n1_1_r5, n1_1_r6, n1_1_r7, n1_1_r8, n1_1_r9]
                }
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
			//图例名
			legend: {
				data:['前平滑','后平滑']
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
					name:'前平滑',
					type:'line',
					color:['#cf8970'],
					data:[n1_2_f0, n1_2_f1, n1_2_f2, n1_2_f3, n1_2_f4, n1_2_f5, n1_2_f6, n1_2_f7, n1_2_f8, n1_2_f9],
				},
				{
					name:'后平滑',
					type:'line',
					color:['#639fa7'],
					data:[n1_2_r0, n1_2_r1, n1_2_r2, n1_2_r3, n1_2_r4, n1_2_r5, n1_2_r6, n1_2_r7, n1_2_r8, n1_2_r9]
				}
				
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
			//图例名
			legend: {
				data:['前平滑','后平滑']
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
					name:'前平滑',
					type:'line',
					color:['#cf8970'],
					data:[n2_1_f0, n2_1_f1, n2_1_f2, n2_1_f3, n2_1_f4, n2_1_f5, n2_1_f6, n2_1_f7, n2_1_f8, n2_1_f9],
				},
				{
					name:'后平滑',
					type:'line',
					color:['#639fa7'],
					data:[n2_1_r0, n2_1_r1, n2_1_r2, n2_1_r3, n2_1_r4, n2_1_r5, n2_1_r6, n2_1_r7, n2_1_r8, n2_1_r9]
				}
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
			//图例名
			legend: {
				data:['前平滑','后平滑']
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
					name:'前平滑',
					type:'line',
					color:['#cf8970'],
					data:[n2_2_f0, n2_2_f1, n2_2_f2, n2_2_f3, n2_2_f4, n2_2_f5, n2_2_f6, n2_2_f7, n2_2_f8, n2_2_f9],
				},
				{
					name:'后平滑',
					type:'line',
					color:['#639fa7'],
					data:[n2_2_r0, n2_2_r1, n2_2_r2, n2_2_r3, n2_2_r4, n2_2_r5, n2_2_r6, n2_2_r7, n2_2_r8, n2_2_r9]
				}
				
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
                data:['N1起飞前平滑','N1起飞后平滑',
                	  'N1巡航前平滑','N1巡航后平滑',
                	  'N2起飞前平滑','N2起飞后平滑',
                	  'N2巡航前平滑','N2巡航后平滑']
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
                    name:'N1起飞前平滑',
                    type:'line',
                    color:['#cf8790'],
                    data:[n1_1_f0, n1_1_f1, n1_1_f2, n1_1_f3, n1_1_f4, n1_1_f5, n1_1_f6, n1_1_f7, n1_1_f8, n1_1_f9],
                },
                {
                    name:'N1起飞后平滑',
                    type:'line',
                    color:['#639fa7'],
                    data:[n1_1_r0, n1_1_r1, n1_1_r2, n1_1_r3, n1_1_r4, n1_1_r5, n1_1_r6, n1_1_r7, n1_1_r8, n1_1_r9]
                },
                {
                	name:'N1巡航前平滑',
                	type:'line',
                	color:['#3c8f1c'],
                	data:[n1_2_f0, n1_2_f1, n1_2_f2, n1_2_f3, n1_2_f4, n1_2_f5, n1_2_f6, n1_2_f7, n1_2_f8, n1_2_f9]
                },
                {
                	name:'N1巡航后平滑',
                	type:'line',
                	color:['#c03700'],
                	data:[n1_2_r0, n1_2_r1, n1_2_r2, n1_2_r3, n1_2_r4, n1_2_r5, n1_2_r6, n1_2_r7, n1_2_r8, n1_2_r9]
                },
                {
                	name:'N2起飞前平滑',
                	type:'line',
                	color:['#cf7770'],
                	data:[n2_1_f0, n2_1_f1, n2_1_f2, n2_1_f3, n2_1_f4, n2_1_f5, n2_1_f6, n2_1_f7, n2_1_f8, n2_1_f9],
                },
                {
                	name:'N2起飞后平滑',
                	type:'line',
                	color:['#690fa7'],
                	data:[n2_1_r0, n2_1_r1, n2_1_r2, n2_1_r3, n2_1_r4, n2_1_r5, n2_1_r6, n2_1_r7, n2_1_r8, n2_1_r9]
                },
                {
                	name:'N2巡航前平滑',
                	type:'line',
                	color:['#3c0f0c'],
                	data:[n2_2_f0, n2_2_f1, n2_2_f2, n2_2_f3, n2_2_f4, n2_2_f5, n2_2_f6, n2_2_f7, n2_2_f8, n2_2_f9]
                },
                {
                	name:'N2巡航后平滑',
                	type:'line',
                	color:['#c03788'],
                	data:[n2_2_r0, n2_2_r1, n2_2_r2, n2_2_r3, n2_2_r4, n2_2_r5, n2_2_r6, n2_2_r7, n2_2_r8, n2_2_r9]
                }
            ]
        };
	
	
	myChart.setOption(option);
	myChart1.setOption(option1);
	myChart2.setOption(option2);
	myChart3.setOption(option3);
	myChart4.setOption(option4);
	
	
	
}	
	
	