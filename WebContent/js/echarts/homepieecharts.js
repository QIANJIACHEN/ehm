//获取到这个DOM节点，然后初始化


	var myChart = echarts.init(document.getElementById("leftcharts"));
	var myChart1 = echarts.init(document.getElementById("rightcharts"));
	
	option = {
		    title : {
		        text: '各基地发动机数量分布',
		        x:'center',
		        textStyle:{
		            fontWeight:'100',
		            fontSize:'16',
		            color:'black'
		        }
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: ['A基地','B基地','C基地','D基地','E基地']
		    },
		    series : [
		        {
		            name: '基地名称',
		            type: 'pie',
		            radius : '65%',
		            center: ['50%', '50%'],
		            data:[
		                {value:335, name:'A基地'},
		                {value:310, name:'B基地'},
		                {value:234, name:'C基地'},
		                {value:135, name:'D基地'},
		                {value:1548, name:'E基地'}
		            ],
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
	option1 = {
		    tooltip: {
		        trigger: 'item',
		        formatter: "{a} <br/>{b}: {c} ({d}%)"
		    },
		    title : {
		        text: '各基地飞机数量分布',
		        x:'center',
		        textStyle:{
		            fontWeight:'100',
		            fontSize:'16',
		            color:'black'
		        }
		    },
		    legend: {
		        orient: 'vertical',
		        x: 'left',
		        data: ['A基地','B基地','C基地','D基地','E基地']
		    },
		    series: [
		        {
		            name:'基地名称',
		            type:'pie',
		            radius: ['50%', '70%'],
		            avoidLabelOverlap: false,
		            label: {
		                normal: {
		                    show: false,
		                    position: 'center'
		                },
		                emphasis: {
		                    show: true,
		                    textStyle: {
		                        fontSize: '20',
		                        fontWeight: 'bold'
		                    }
		                }
		            },
		            labelLine: {
		                normal: {
		                    show: false
		                }
		            },
		            data:[
		                {value:335, name:'A基地'},
		                {value:310, name:'B基地'},
		                {value:234, name:'C基地'},
		                {value:135, name:'D基地'},
		                {value:1548, name:'E基地'}
		            ],
		        }
		    ]
		};
	
	
	
	
	
	myChart.setOption(option);
	myChart1.setOption(option1);
	
	
	
	
	
	