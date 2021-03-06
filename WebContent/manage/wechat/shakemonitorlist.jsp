<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">

<title>震动监控列表</title>
<link rel="stylesheet" href="../css/jqueryui/weui.min.css">
<link rel="stylesheet" href="../css/jqueryui/jquery-weui.css">
<link rel="stylesheet" href="../css/jqueryui/demos.css">
</head>
<body ontouchstart>
  	<div class="page__pd">
      <div class="weui-search-bar" id="searchBar">
        <form class="weui-search-bar__form" action="#">
          <div class="weui-search-bar__box" style="height:inherit">
            <i class="weui-icon-search"></i>
            <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索" required="">
            <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
          </div>
          <label class="weui-search-bar__label" id="searchText" style="transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1);">
            <i class="weui-icon-search"></i>
            <span>搜索</span>
          </label>
        </form>
        <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
      </div>
      <!--震动监控列表-->
      <div class="weui-panel weui-panel_access">
      	
        <div class="weui-panel__bd">
        	<!--没有删除功能-->
          <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg open-popup" data-target="#half">
          	
	            <div class="weui-media-box__bd">
	              <h4 class="weui-media-box__title">
	                	震动模型：N1震动突变预警
	              </h4>
	              <p class="weui-media-box__desc">机号：B1702</p>
	            </div>
          </a>
          
        </div>
        
        
        
      </div>
    </div>
    <!--模态框-->
    <div id="half" class='weui-popup__container popup-top'>
      <div class="weui-popup__overlay"></div>
      <div class="weui-popup__modal">
        <div class="toolbar">
          <div class="toolbar-inner">
            <a href="javascript:;" class="picker-button close-popup">关闭</a>
            <h1 class="title">震动监控信息</h1>
          </div>
        </div>
        <div class="modal-content">
         	 <div class="weui-form-preview">
		      <div class="weui-form-preview__hd">
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">震动模型</label>
		          <em class="weui-form-preview__value">N1震动突变预警</em>
		        </div>
		      </div>
		      <div class="weui-form-preview__bd">
		      	<div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">运营人</label>
		          <span class="weui-form-preview__value">云航</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">执管基地</label>
		          <span class="weui-form-preview__value">KM01</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">机号</label>
		          <span class="weui-form-preview__value">B1702</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">发动机位置</label>
		          <span class="weui-form-preview__value">2</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">发动机编号</label>
		          <span class="weui-form-preview__value">660272</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">状态</label>
		          <span class="weui-form-preview__value">起飞</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">起飞时间</label>
		          <span class="weui-form-preview__value">2017/10/17 0:05</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">N1前单点</label>
		          <span class="weui-form-preview__value">0.81</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">N1后单点</label>
		          <span class="weui-form-preview__value">1.46</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">N1前平滑</label>
		          <span class="weui-form-preview__value">0.56</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">N1后平滑</label>
		          <span class="weui-form-preview__value">0.83</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">N1前趋势</label>
		          <span class="weui-form-preview__value">0.25</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">N1后趋势</label>
		          <span class="weui-form-preview__value">0.63</span>
		        </div>
		      </div>
		    </div>
        </div>
      </div>

    </div>
    
    <jsp:include page='footer.jsp'/>
    <script src="../../js/jqueryui/jquery-2.1.4.js"></script>
	<script src="../../js/jqueryui/fastclick.js"></script>
	<script>
	  $(function() {
	    FastClick.attach(document.body);
	  });
	</script>
	<script src="../../js/jqueryui/jquery-weui.js"></script>
  </body>
</html>