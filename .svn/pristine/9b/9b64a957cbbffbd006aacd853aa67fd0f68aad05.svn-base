<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>

    <script type="text/javascript">
        if (window != top)
            top.location.href = location.href;
    </script>
</head>
<body class="hold-transition login-page skin-blue">
<div class="wrapper">

    <div class="login-box">
        <div class="login-logo">
            <a href="#"><b>EHM</b>后台管理</a>
        </div>
        <div class="login-box-body">
            <div>
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="账号" id="username" value="">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="密码" id="password" value="">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                    </div>
                    <div class="col-xs-4">
                        <button onclick="login()" class="btn btn-primary btn-block btn-flat">登录</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$('#password').bind('keypress', function(event) {  
    if (event.keyCode == "13") {              
    	login();
    }  
}); 
    function login() {
        var username = $("#username").val();
        var password = $("#password").val();
		$.post(
			"${pageContext.request.contextPath }/manage/auth/login.do",
			{
				username: username,
				password: password
			},
			function (data) {
				if (data.code != 101) {
					alert(data.msg);
					return;
				}
				location = "../index/index.jsp";
			},
			"json"
		);
	}
</script>
</body>
</html>