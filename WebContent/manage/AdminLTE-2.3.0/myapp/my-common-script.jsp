<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- jQuery 2.1.4 -->
<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/bootstrap/js/bootstrap.min.js"></script>
<!--updloadify-->
<script type="text/javascript" src="${pageContext.request.contextPath}/manage/uploadify/jquery.uploadify.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/manage/uploadify/jquery.uploadify.min.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/plugins/datatables/dataTables.bootstrap.min.js"></script>


<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/plugins/My97DatePicker/WdatePicker.js"></script>
<!-- InputMask -->
<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/plugins/iCheck/icheck.min.js"></script>


<!-- FastClick -->
<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/plugins/fastclick/fastclick.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/dist/js/app.min.js"></script>
<!-- Sparkline -->
<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<%--<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/plugins/chartjs/Chart.min.js"></script>--%>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<%--<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/dist/js/pages/dashboard2.js"></script>--%>
<!-- AdminLTE for demo purposes -->
<%--<script src="${pageContext.request.contextPath}/manage/AdminLTE-2.3.0/dist/js/demo.js"></script>--%>
<script src="${pageContext.request.contextPath}/js/jump.js"></script>


<script type="text/javascript">
	// ajax请求超时处理
	$.ajaxSetup({   
	    contentType: "application/x-www-form-urlencoded;charset=utf-8",   
	    complete: function(XMLHttpRequest,textStatus){ 
	    var sessionstatus=XMLHttpRequest.getResponseHeader("sessionstatus"); //通过XMLHttpRequest取得响应头，sessionstatus，  
	         if(sessionstatus == "timeout"){
	        	   // 如果超时就处理 ，指定要跳转的页面  
	        	   if (confirm("登录超时,请重新登录！")) {
	        		   window.location.reload()
	        	   }
	         } else if(sessionstatus == "nopower"){
	        	 window.location = "${pageContext.request.contextPath}/manage/manage/nopower.jsp"
	         }
	    	
	    }   
	});
</script>

