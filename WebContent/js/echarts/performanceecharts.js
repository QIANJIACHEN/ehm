//获取到这个DOM节点，然后初始化


function chart(arr, n1_gwfm_chart, n1_gwfmSmoothed_chart, n2_gwfm_chart,  n2_gwfmSmoothed_chart,
				    n1_degt_chart, n1_degtSmoothed_chart, n2_degt_chart,  n2_degtSmoothed_chart,
				    n1_egthdm_chart, n1_egthdmSmoothed_chart, n2_egthdm_chart,  n2_egthdmSmoothed_chart,
				    n1_gpcn25_chart, n1_gpcn25Smoothed_chart, n2_gpcn25_chart,  n2_gpcn25Smoothed_chart){
	
	
	var myChart = echarts.init(document.getElementById("top"));
	var myChart1 = echarts.init(document.getElementById("bottom"));
	var myChart2 = echarts.init(document.getElementById("top1"));
	var myChart3 = echarts.init(document.getElementById("bottom1"));
	
	var option = {
            // 标题
            title: {
                text: '双发DFF报表'
            },
            tooltip: {
                trigger: 'axis'
            },
            //图例名
            legend: {
                data:['左发单点','左发平滑','右发单点','右发平滑']
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
                    name:'左发单点',
                    type:'line',
                    color:['#cf8970'],
                    data: n1_gwfm_chart
                },
                {
                    name:'左发平滑',
                    type:'line',
                    color:['#639fa7'],
                    data: n1_gwfmSmoothed_chart
                },
                {
                    name:'右发单点',
                    type:'line',
                    color:['#123fa7'],
                    data: n2_gwfm_chart
                },
                {
                    name:'右发平滑',
                    type:'line',
                    color:['#111fa7'],
                    data: n2_gwfmSmoothed_chart
                }
            ]
        };


	var option1 = {
            // 标题
            title: {
                text: '双发DEGT报表'
            },
            tooltip: {
                trigger: 'axis'
            },
            //图例名
            legend: {
                data:['左发单点','左发平滑','右发单点','右发平滑']
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
                    name:'左发单点',
                    type:'line',
                    color:['#cf8970'],
                    data: n1_degt_chart
                },
                {
                    name:'左发平滑',
                    type:'line',
                    color:['#639fa7'],
                    data: n1_degtSmoothed_chart
                },
                {
                    name:'右发单点',
                    type:'line',
                    color:['#123fa7'],
                    data: n2_degt_chart
                },
                {
                    name:'右发平滑',
                    type:'line',
                    color:['#111fa7'],
                    data: n2_degtSmoothed_chart
                }
            ]
        };
	
	
	var option2 = {
            // 标题
            title: {
                text: '双发EGTM报表'
            },
            tooltip: {
                trigger: 'axis'
            },
            //图例名
            legend: {
                data:['左发单点','左发平滑','右发单点','右发平滑']
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
                    name:'左发单点',
                    type:'line',
                    color:['#cf8970'],
                    data: n1_egthdm_chart
                },
                {
                    name:'左发平滑',
                    type:'line',
                    color:['#639fa7'],
                    data: n1_egthdmSmoothed_chart
                },
                {
                    name:'右发单点',
                    type:'line',
                    color:['#123fa7'],
                    data: n2_egthdm_chart
                },
                {
                    name:'右发平滑',
                    type:'line',
                    color:['#111fa7'],
                    data: n2_egthdmSmoothed_chart
                }
            ]
        };

	
	
	var option3 = {
            // 标题
            title: {
                text: '双发DCS报表'
            },
            tooltip: {
                trigger: 'axis'
            },
            //图例名
            legend: {
                data:['左发单点','左发平滑','右发单点','右发平滑']
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
                    name:'左发单点',
                    type:'line',
                    color:['#cf8970'],
                    data: n1_gpcn25_chart
                },
                {
                    name:'左发平滑',
                    type:'line',
                    color:['#639fa7'],
                    data: n1_gpcn25Smoothed_chart
                },
                {
                    name:'右发单点',
                    type:'line',
                    color:['#123fa7'],
                    data: n2_gpcn25_chart
                },
                {
                    name:'右发平滑',
                    type:'line',
                    color:['#111fa7'],
                    data: n2_gpcn25Smoothed_chart
                }
            ]
        };
	
	
	myChart.setOption(option);
	myChart1.setOption(option1);
	myChart2.setOption(option2);
	myChart3.setOption(option3);
	
	
	
}	
	
	