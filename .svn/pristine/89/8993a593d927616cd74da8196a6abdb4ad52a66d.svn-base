<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 


<ul id="tt_tree" class="easyui-tree">
	<li><span>城市管理</span>
		<ul>
			<li data-options="attributes:{'url':'manage/mgrCity.jsp'}"><span>开通服务的城市 </span></li>
			<li data-options="attributes:{'url':'manage/mgrServiceArea.jsp'}"><span>服务区域</span></li> 
		</ul>
	</li>
	<li><span>疗程管理</span>
		<ul>
			<li data-options="attributes:{'url':'manage/mgrProduct.jsp'}"><span>疗程列表 </span></li>
		</ul>
		<ul>
			<li data-options="attributes:{'url':'manage/mgrProductEmp.jsp'}"><span>疗程美容师 </span></li>
		</ul>
	</li>
	<li><span>用户管理</span>
		<ul>
			<li data-options="attributes:{'url':'manage/mgrUser.jsp'}"><span>用户管理 </span></li>
		</ul>
	</li>
	<li><span>评论管理</span>
		<ul>
			<li data-options="attributes:{'url':'manage/mgrReview.jsp'}"><span>评论管理 </span></li>
		</ul>
	</li>
		<li><span>系统用户管理</span>
		<ul>
			<li data-options="attributes:{'url':'manage/mgrSysAdmin.jsp'}"><span>系统用户管理 </span></li>
		</ul>
	</li>
	<li><span>订单管理</span>
		<ul>
			<li data-options="attributes:{'url':'manage/mgrOrder.jsp'}"><span>订单管理 </span></li>
		</ul>
		<ul>
			<li data-options="attributes:{'url':'manage/mgrWaitRefund.jsp'}"><span>待退款订单管理 </span></li>
		</ul>
	</li>
	<li><span>广告管理</span>
		<ul>
			<li data-options="attributes:{'url':'manage/mgrAdvertisement.jsp'}"><span>广告管理 </span></li>
		</ul>
	</li>
	<li><span>交易管理</span>
		<ul>
			<li data-options="attributes:{'url':'manage/mgrPayRecord.jsp'}"><span>支付管理</span></li>
		</ul>
		<ul>
			<li data-options="attributes:{'url':'manage/mgrRefundRecord.jsp'}"><span>退款管理</span></li>
		</ul>
	</li>
	<li><span>版本管理</span>
		<ul>
			<li data-options="attributes:{'url':'manage/mgrVersion.jsp'}"><span>版本管理 </span></li>
		</ul>
	</li>
</ul>


<script> 
	$("#tt_tree").tree({
		//data: treeData,
		onClick: function(node) {
			if ($("#tt").tabs("exists", node.text)) {
				$("#tt").tabs("select", node.text);
				//$('#tt').tabs('getTab', node.text).css('width', 'auto');
			} else {
				var url = node.attributes.url;
				var scrolling = "auto";//"no";
				//if(url == "manage/cupMatchsGroup.jsp" || "manage/teamManage.jsp") {
				//	scrolling = "auto";
				//}
				
				//在iframe外套上一个DIV并设置大小 可解决数据过多超出屏幕不显示滚动条的问题
				var content ='<div style="width:100%;height:91%;"><iframe scrolling="'+scrolling+'" frameborder="0"  src="'+url+'" style="width:100%;height:100%;overflow:auto;"></iframe><div>';
				
				$("#tt").tabs("add",{
					title: node.text,
					content: content,
					closable: true,
				});
				
				//$('#tt').tabs('getSelected').css('width', 'auto'); //重新tab body宽度为auto，如果你上面的添加语句设置了selected为false，注意使用下面注释的这句来获取你的tab
                //$('#tabs').tabs('getTab', subtitle).css('width', 'auto');
			}
		}
	});
	
//	$(window).resize(function(){
//		$('#tt').datagrid('resize', {
//			width:function(){return document.body.clientWidth;},
//			height:function(){return document.body.clientHeight;},
//		});
//	});
//	$(window).resize(function () {  
//         $('#tt').tabs({  
//             width: $("#tt").parent().width(),  
//             height: "auto"  
//         });  
//     })
     
//     $(function() {  
//         $('#tt').tabs({  
//             width: $("#tt").parent().width(),   
//             height: "auto"  
//         });  
//     });  
</script> 
    