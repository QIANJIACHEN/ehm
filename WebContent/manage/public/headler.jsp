<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<header class="main-header">
    <!-- Logo -->
    <span class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <!--<span class="logo-mini"><b>EHM</b>后台管理</span>-->
        <span class="logo-mini"></span>
        <!-- logo for regular state and mobile devices -->
        <!--<span class="logo-lg"><b>EHM</b>后台管理</span>-->
        <span class="logo-lg"></span>
        
    </span>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">发动机健康管理系统EHM</span>
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="hidden-xs">欢迎${sessionScope.SESSION_LOGIN_USER.username}</span>
                    </a>
                </li>
                <!-- Control Sidebar Toggle Button -->
                <li>
                    <a href="javascript:void(0);" onclick="logout()" data-toggle="control-sidebar">
                        <%--<i class="fa fa-gears"></i>--%>
                       	 退出
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</header>

<script>
    function logout() {
        if (confirm("你确定要退出吗?")) {
            $.post(
                    "${pageContext.request.contextPath }/manage/auth/logout.do",

                    function (data) {
                        if (data.code != 101) {
                            alert(data.msg);
                            return;
                        }

                        location.replace("${pageContext.request.contextPath }/manage/login/login.jsp");
                    },
                    "json"
            )
        }
    }

</script>

