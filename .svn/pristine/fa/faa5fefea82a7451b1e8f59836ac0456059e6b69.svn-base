//获取到这个DOM节点，然后初始化


function chart(arr, n1_rd_chart, n1_or_chart, n2_rd_chart,  n2_or_chart){

	var myChart = echarts.init(document.getElementById("leftcharts"));
	var myChart1 = echarts.init(document.getElementById("rightcharts"));
	
	
	var option = {
            // 标题
            title: {
                text: '左发'
            },
            tooltip: {
                trigger: 'axis'
            },
            //图例名
            legend: {
                data:['左发加油时间差','左发滑油消耗率']
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
                data: arr
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name:'左发加油时间差',
                    type:'line',
                    color:['#cf8970'],
                    data: n1_rd_chart
                },
                {
                    name:'左发滑油消耗率',
                    type:'line',
                    color:['#639fa7'],
                    data: n1_or_chart
                }
            ]
        };
	
	
	var option1 = {
			// 标题
			title: {
				text: '右发'
			},
			tooltip: {
				trigger: 'axis'
			},
			//图例名
			legend: {
				data:['右发加油时间差','右发滑油消耗率']
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
				data: arr
			},
			yAxis: {
				type: 'value'
			},
			series: [
				{
					name:'右发加油时间差',
					type:'line',
					color:['#cf8970'],
					data: n2_rd_chart
				},
				{
					name:'右发滑油消耗率',
					type:'line',
					color:['#639fa7'],
					data: n2_or_chart
				}
				]
	};
	
	myChart.setOption(option);
	myChart1.setOption(option1);
}	
	
	
	
	