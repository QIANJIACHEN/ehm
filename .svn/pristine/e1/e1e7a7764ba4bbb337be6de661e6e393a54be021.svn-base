//获取到这个DOM节点，然后初始化


function chart(arr, n1_gwfm_chart, n1_gwfmSmoothed_chart, n2_gwfm_chart,  n2_gwfmSmoothed_chart){
	
	
	var myChart = echarts.init(document.getElementById("top"));
	
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

	
	myChart.setOption(option);
	
	
	
}	
	
	