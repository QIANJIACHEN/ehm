<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header> 
	<section class="inner">
		<section class="left">
			<font class="logo" style="font-size: 4em;">伊美</font>
		</section>
		<section class="right">
			<div class="headlist">
				<span class="list-name">欢迎来到伊美管理后台！</span>
				<ul>
					<li class="seperator"></li>
					<li class="item profile">
						<label class="name" id="label_loginname"></label>
						<a class="logout" href="javascript:;" id="anchor_logout">退出登录</a>
					</li>
					<li class="seperator"></li> 
					<li class="seperator"></li>
				</ul>
			</div>
		</section>
	</section>
</header>
<script type="text/javascript">
	void function(window, $){
		$("#label_loginname").html($.cookie("username"));

		$("#anchor_logout").click(function(){
			if (confirm("您确认要退出吗")) { 
				$.get(
						"${pageContext.request.contextPath}/ManagerAuth/logout.do",
						{
						},
						function(data){
							if(data.code != 0) {
								alert("注销失败");
								refresh(); 
								return;
							}
//							var id = data.data.id;
							location = "${pageContext.request.contextPath}";
						},
						"json"
					)				
			}
		});
	}(this, jQuery);
</script>