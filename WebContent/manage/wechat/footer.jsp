<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div class="weui-tabbar" style="position: fixed;">
        <a href="news.do" class="weui-tabbar__item">
          <span class="weui-badge" style="position: absolute;top: -.4em;right: 1em;">3</span>
          <div class="weui-tabbar__icon">
            <img src="../images/wechat/icon_nav_dialog.png" alt="">
          </div>
          <p class="weui-tabbar__label">消息</p>
        </a>
        <a href="department.do" class="weui-tabbar__item">
          <div class="weui-tabbar__icon">
            <img src="../images/wechat/icon_nav_article.png" alt="">
          </div>
          <p class="weui-tabbar__label">通讯录</p>
        </a>
        <a href="workingtable.do" class="weui-tabbar__item">
          <div class="weui-tabbar__icon">
            <img src="../images/wechat/icon_nav_button.png" alt="">
          </div>
          <p class="weui-tabbar__label">工作台</p>
        </a>
        <a href="mine.do" class="weui-tabbar__item">
          <div class="weui-tabbar__icon">
            <img src="../images/wechat/icon_nav_cell.png" alt="">
          </div>
          <p class="weui-tabbar__label">我的</p>
        </a>
      </div>