<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
	.content-wrapper{background:white;}
	.uls{width:100%;overflow:hidden;list-style:none;padding-left:12px;};
	/* 下面是选中的背景颜色 */
	/* .active{background:rgba(219, 229, 231, 1)!important;} */
</style>
<div class="content-wrapper">
	<!-- <div style="position:relative;"> -->
		<a id="task-pre" style="float:left;position: relative;top: 22px;" href="javascript:void(0)" class="task-changebt" onclick="arrowLeft()">←</a>
		<div id="uuc" style="width:700px;overflow:hidden;white-space:nowrap;display:block;padding:0 25px;">
	
		<ul  id="uls" style="margin-bottom:0px;padding-left:0px;padding-bottom:8px;">
			
		</ul>
		
		<div style="clear:both;"></div>
		</div>
		<a id="task-next" style="float: right;position: relative;top: -42px;right: 18%;" href="javascript:void(0)" class="task-changebt" onclick="arrowRight()">→</a>
	<!-- </div> -->
    <div class="box">
    	<iframe class="myiframe" x="1" id="myiframe" data_url="/manage/index/home.do" src="${pageContext.request.contextPath}/manage/index/home.do" width="100%" height="100%">
    </iframe>
    </div>
</div>
<script>
	
		
	
</script>
<!-- /.content-wrapper -->
