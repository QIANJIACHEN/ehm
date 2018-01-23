<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
    <style type="text/css">
    	table.tablerecord th ,table.tablerecord td{
    		text-align:center;
    		border:1px solid #d7d7d7 !important;
    	}
    	table.tablerecord th{
    		background-color:#f2f2f2;
    	}
    	table.tablerecord td a{
    		text-decoration:underline;
    	}
    	.basicinfo p span{
    		display:inline-block;
    		width:40%;
    		padding-left:10px;
    		box-sizing:border-box;
    		font-size:15px;
    	}
    	.basicinfo p span.key{
    		width:45%;
    		padding-left:0px;
    		font-weight:bold;
    	}
    	.basicinfo p span a{
    		text-decoration:underline;
    	}
    	.btn-primary {
		    background-color: #3c8dbc!important;
		    border-color: #367fa9!important;
			}
    </style>
</head>
<body class="hold-transition" >

<div class="wrapper">
	<button type="button" onclick="back()"  class="return btn-primary">返回</button>
    <div class="box wrapper " style="overflow: auto;">
		 
        <div class="box-header">
        	<h2 style="font-weight:bold">发动机信息</h2><br>
        	<h4>基本信息</h4><br>
        	<div class="row basicinfo" style="margin-bottom:60px;">
        		<div class="col-md-3 col-xs-3">
        			<p>
        				<span class="key">ID</span>
        				<span class="val" id="engId">哈哈哈哈哈哈</span>
        			</p>
        			<p>
        				<span class="key">TAIL</span>
        				<span class="val" ><a id="tail"  href="javascript:void(0)" tail="" title1="8" onclick="jumpPlane(this)" ></a></span>
        			</p>
        			<p>
        				<span class="key">发动机SN</span>
        				<span class="val" id="engSn" ></span>
        			</p>
        			<p>
        				<span class="key">SAP平台显示方式</span>
        				<span class="val" id="engSnSap"></span>
        			</p>
        			<p>
        				<span class="key">发动机序列</span>
        				<span class="val" id="engSeries"></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">发动机构型</span>
        				<span class="val" id="engConfig" ></span>
        			</p>
        			<p>
        				<span class="key">发动机类型</span>
        				<span class="val" id="engType" ></span>
        			</p>
        			<p>
        				<span class="key">发动机模型</span>
        				<span class="val" id="engModel" ></span>
        			</p>
        			<p>
        				<span class="key">原始厂商</span>
        				<span class="val" id="deliveryMode"></span>
        			</p>
        		</div>
        		<div class="col-md-3 col-xs-3">
        			<p>
        				<span class="key">所有人</span>
        				<span class="val" id="owner" ></span>
        			</p>
        			<p>
        				<span class="key">CODE CONFIG</span>
        				<span class="val" id="codeConfig"></span>
        			</p>
        			<p>
        				<span class="key" style="word-break:normal; white-space:pre-wrap;word-wrap : break-word ;overflow: hidden ;">ENG_CONFIGARATION</span>
        				<span class="val" id="engConfigration"></span>
        			</p>
        			<p>
        				<span class="key">发动机设备号</span>
        				<span class="val" id="engPn" ></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">状态</span>
        				<span class="val" id="condition"></span>
        			</p>
        			<p>
        				<span class="key">创建时间</span>
        				<span class="val" id="ctime"></span>
        			</p>
        		</div>
        	</div>
        	<h4>备注</h4>
            <div  style="width: 100%;height: 300px;">
            	a
            </div>
        	
        </div>
        
       <!--  <div class="box-body">
			
			<h4>历史信息</h4><br>
            <div class="dataTables_wrapper form-inline dt-bootstrap" style="padding:0px 20px">
               <table class="table table-hover tablerecord">
                    <thead>
	                    <tr>
	                        <th>创建时间</th>
	                        <th>发动机SN</th>
	                        <th>发动机设备号</th>
	                        <th>SAP平台显示的方式</th>
	                        <th>发动机序列</th>
	                        <th>发动机类型</th>
	                        <th>发动机模型</th>
	                        <th>发动机构型</th>
	                        <th>原始厂商</th>
	                        <th>所有人</th>
	                    </tr>
                    </thead>
                    <tbody id="table-body">
                    	
                    </tbody>
                </table>
            </div>
        </div> -->
    </div>
</div>
<script type="text/javascript">
	
var Request = new Object(); 
Request = getRequest(); 
var engSn = Request['engSn'];

$.post("${pageContext.request.contextPath}/manage/dataeng/info.do",{engSn:engSn},function(res){
	if(res.data!=null&&res.data!=""){
		$("#engId").html(res.data[0].id);
		$("#tail").html(res.data[0].tail);
		$("#tail").attr("tail",res.data[0].tail);
		$("#engSn").html(res.data[0].engSn);
		$("#engSn").attr("engSn",res.data[0].engSn);
		$("#engSnSap").html(res.data[0].engSnSap);
		$("#engSeries").html(res.data[0].engSeries);
		$("#engType").html(res.data[0].engType);
		$("#engModel").html(res.data[0].engModel);
		$("#engConfig").html(res.data[0].engConfig);
		$("#deliveryMode").html(res.data[0].deliveryMode);
		$("#owner").html(res.data[0].owner);
		$("#codeConfig").html(res.data[0].codeConfig);
		$("#engConfigration").html(res.data[0].engConfigration);
		$("#ctime").html(res.data[0].ctime);
		$("#engPn").html(res.data[0].engPn);
		$("#condition").html(res.data[0].condition);
		$("#remark").html(res.data[0].remark);
	}
},"json");

//发动机属性变更记录	
//$.post("${pageContext.request.contextPath}/manage/recorddataeng/getlistbyeng.do",{engSn:engSn},function(res){
//	res=JSON.parse(res);
	//console.log(res.data);
//	$("#table-body").empty();
//	if(res.data!=null&&res.data!=""&&res.data!="undefined"){
//		$.each(res.data,function(index,item){
//			$("#table-body").append("<tr><td>"+item.ctime+"</td><td>"+item.engSn+"</td><td>"+item.engPn+"</td><td>"+item.engSnSap+"</td>"
//					+"<td>"+item.engSeries+"</td><td>"+item.engType+"</td><td>"+item.engModel+"</td><td>"+item.engConfig+"</td>"
//					+"<td>"+item.deliveryMode+"</td><td>"+item.owner+"</td>"
//					+"</tr>");
//		
//		})
//	}else{
//		$("#table-body").append("<p>暂无数据</p>");
//	}
//})
	//返回
	function back(){
		var Request = new Object(); 
		Request = getRequest(); 
		title1 = Request['title'];
		if(title1=="1"){
			title = "发动机列表";
		}else if(title1=="2"){
			title = "飞机详情";
		}else if(title1=="3"){
			title="发动机属性更变详请";
		}else if(title1=="4"){
			title="onwing发动机详情";
		}else if(title1=="5"){
			title="发动机状态简报详情";
		}else if(title1=="6"){
			title = "SAP日报详情";
		}else if(title1=="9"){
			title = "水洗详情";
		}else if(title1=="10"){
			title = "机队清单";
		}else if(title1=="11"){
			title = "SAP日报";
		}else if(title1=="12"){
			title = "发动机性能数据";
		}else if(title1=="13"){
			title = "水洗列表";
		}else if(title1=="14"){
			title = "寿命件门限";
		}else if(title1=="15"){
			title = "重要部件门限";
		}else if(title1=="16"){
			title="故障件记录";
		}
		
		tab_url = self.frameElement.getAttribute('data_url');//iframe对应的data_url和tab对应的data_url是一致的
		window.parent.changePage(title,tab_url);//调用父页面的方法
		//跳转
		window.history.back();
	}
	

</script>
</body>
</html>
