<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">

<title>发动机性能数据表</title>
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
      <!--发动机性能数据表-->
      <div class="weui-panel weui-panel_access">
        <div class="weui-panel__bd">
        	
        	<!--没有删除功能-->
          <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg open-popup" data-target="#half">
          	
	            <div class="weui-media-box__bd">
	              <h4 class="weui-media-box__title">
	                	发动机编号：862798
	              </h4>
	              <p class="weui-media-box__desc">机号：B5130</p>
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
            <h1 class="title">发动机性能数据表</h1>
          </div>
        </div>
        <div class="modal-content">
         	 <div class="weui-form-preview">
		      <div class="weui-form-preview__hd">
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">发动机编号</label>
		          <em class="weui-form-preview__value">862798</em>
		        </div>
		      </div>
		      <div class="weui-form-preview__bd">
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">机号</label>
		          <span class="weui-form-preview__value">B5130</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">发动机位置</label>
		          <span class="weui-form-preview__value">1</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">FLIGHT_PHASE</label>
		          <span class="weui-form-preview__value">CRUISE</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">飞行日期</label>
		          <span class="weui-form-preview__value">2017/10/20</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">发动机类型</label>
		          <span class="weui-form-preview__value">CFM56-7B26E</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">ZPHSR</label>
		          <span class="weui-form-preview__value">32</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">GPCN25_SMOOTHED</label>
		          <span class="weui-form-preview__value">-0.632</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">DEGT_SMOOTHED</label>
		          <span class="weui-form-preview__value">11.5826</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">ZPHSF</label>
		          <span class="weui-form-preview__value">329</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">EGTHDM_D</label>
		          <span class="weui-form-preview__value">87.09</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">ZVB1F_SMOOTHED</label>
		          <span class="weui-form-preview__value">0.1427</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">GWFM</label>
		          <span class="weui-form-preview__value">-0.2206</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">EGTHDM</label>
		          <span class="weui-form-preview__value"></span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">GWFM_D</label>
		          <span class="weui-form-preview__value">-0.6834</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">ZVB1R</label>
		          <span class="weui-form-preview__value">0.16</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">EGTHDM_D_SMOOTHED</label>
		          <span class="weui-form-preview__value"></span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">ZTOIL</label>
		          <span class="weui-form-preview__value">106</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">ZVB2F</label>
		          <span class="weui-form-preview__value">0.04</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">ZVB2R</label>
		          <span class="weui-form-preview__value">0.06</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">ZVB1F</label>
		          <span class="weui-form-preview__value">0.12</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">ZVB2R_SMOOTHED</label>
		          <span class="weui-form-preview__value">0.04</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">DEGT_D_SMOOTHED</label>
		          <span class="weui-form-preview__value">-10.593</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">GPCN25_D</label>
		          <span class="weui-form-preview__value">-0.1065</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">ZVB1R_SMOOTHED</label>
		          <span class="weui-form-preview__value">0.1477</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">ZTOIL_SMOOTHED</label>
		          <span class="weui-form-preview__value">105.9982</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">GWFM_SMOOTHED</label>
		          <span class="weui-form-preview__value">-0.7227</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">GPCN25</label>
		          <span class="weui-form-preview__value">-0.6669</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">GWFM_D_SMOOTHED</label>
		          <span class="weui-form-preview__value">-0.7437</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">GPCN25_D_SMOOTHED</label>
		          <span class="weui-form-preview__value">-0.1068</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">ZVB2F_SMOOTHED</label>
		          <span class="weui-form-preview__value">0.0429</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">ZPOIL_SMOOTHED</label>
		          <span class="weui-form-preview__value">43.4332</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">EGTHDM_SMOOTHED</label>
		          <span class="weui-form-preview__value"></span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">DEGT_D</label>
		          <span class="weui-form-preview__value">-11.5</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">ZPOIL</label>
		          <span class="weui-form-preview__value">44</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">ZT49</label>
		          <span class="weui-form-preview__value">615</span>
		        </div>
		        <div class="weui-form-preview__item">
		          <label class="weui-form-preview__label">DEGT</label>
		          <span class="weui-form-preview__value">12.5271</span>
		        </div>
		        
		      </div>
		      <div style="height:53px"></div>
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