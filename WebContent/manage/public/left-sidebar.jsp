<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<aside class="main-sidebar">
    <section class="sidebar">

        <ul class="sidebar-menu">

            <li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-home" style="font-size:18px"></i> <span>首页</span> <i class="fa fa-angle-right pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <%--<li class="active">--%>
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/index/home.do" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>首页</a></li>
                </ul>
            </li>
            <!-- 飞机管理 -->
            <li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-plane"></i> <span>飞机管理</span> <i class="fa fa-angle-right pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/dataplane/dataplanelist.do" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>飞机列表</a>
                    </li>
                    <!--  <li><a href="javascript:void(0);" data="1" data_url="/manage/dataplane/dataplanelistdetail.do" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>飞机详情</a></li>-->
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/recorddataplane/recorddataplanelist.do" onclick="jumpPage(this)">
	                    	<i class="fa fa-circle-o"></i>飞机属性更变记录</a>
	                </li>
					<li><a href="javascript:void(0);" data="1" data_url="/manage/controlfleetplane/controlfleetplanelist.do" onclick="jumpPage(this)">
	                    	<i class="fa fa-circle-o"></i>机队清单</a>
	                </li>
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/flight/flightlist.do" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>航班信息</a>
                    </li>
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/pwf/pwflist.do" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>飞机航班关联</a>
                    </li>
                    <!--  
                    <li>
                    	<a href="javascript:void(0);" data="1" data_url="/manage/fleeteng/fleetenglist.do"  onclick="jumpPage(this)">
                    		<i class="fa fa-circle-o"></i>机队清单
                    	</a>
                    </li>
                    -->
                </ul>
              </li>
                <!-- 发动机管理 -->
	          <li class="treeview">
	                <a href="javascript:void(0);">
	                    <i class="fa icons icon-fdj"></i> <span>发动机管理</span> <i class="fa fa-angle-right pull-right"></i>
	                </a>
	                <ul class="treeview-menu">
	                    <li><a href="javascript:void(0);" data="1" data_url="/manage/dataeng/dataenglist.do"  onclick="jumpPage(this)">
	                    	<i class="fa fa-circle-o"></i>发动机列表</a>
	                    </li>
	                    <!--  <li><a href="javascript:void(0);" data="1" data_url="/manage/dataeng/dataenglistdetail.do"  onclick="jumpPage(this)">
	                    	<i class="fa fa-circle-o"></i>发动机详情</a>
	                    </li> -->
	                   	<li><a href="javascript:void(0);" data="1" data_url="/manage/recorddataeng/recorddataenglist.do"  onclick="jumpPage(this)">
	                    	<i class="fa fa-circle-o"></i>发动机属性更变记录</a>
	                    </li>
	                    <!-- 
	                    <li><a href="javascript:void(0);" data="1" data_url="/manage/controlfleetengspare/fleetengsparelist.do"  onclick="jumpPage(this)">
	                    	<i class="fa fa-circle-o"></i>发动机维修</a>
	                    </li>
	                    <li><a href="javascript:void(0);" data="1" data_url="/manage/engspare/engsparelist.do"  onclick="jumpPage(this)">
	                    	<i class="fa fa-circle-o"></i>发动机备发</a>
	                    </li>
	                    <li><a href="javascript:void(0);" data="1" data_url="/manage/dataidplug/dataidpluglist.do"  onclick="jumpPage(this)">
	                    	<i class="fa fa-circle-o"></i>IDPLUG数据</a>
	                    </li>
	                    <li><a href="javascript:void(0);" data="1" data_url="/manage/engonwing/engonwinglist.do"  onclick="jumpPage(this)">
	                    	<i class="fa fa-circle-o"></i>onwing发动机</a>
	                    </li>
	                    <li><a href="javascript:void(0);" data="1" data_url="/manage/recordengsvschedule/recordengsvschedulelist.do"  onclick="jumpPage(this)">
	                    	<i class="fa fa-circle-o"></i>发动机维修记录</a>
	                    </li>
	                     -->
	                    <li>
                    	<a href="javascript:void(0);" data="1" data_url="/manage/engconditionfleet/engconditionfleetlist.do"  onclick="jumpPage(this)">
                    		<i class="fa fa-circle-o"></i>发动机状态简报
                    	</a>
                    	</li>
	                </ul>
	         </li>   
	             
	        <!-- 性能监控 -->
            <li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-bolt"></i> <span>性能监控</span> <i class="fa fa-angle-right pull-right"></i>
                </a>
                <ul class="treeview-menu">
                	<li>
                    	<a href="javascript:void(0);" data="1" data_url="/manage/sapdailyreport/sapdailyreportlist.do" onclick="jumpPage(this)">
                    		<i class="fa fa-circle-o"></i>SAP日报表
                    	</a>
                    </li>
                    <!-- 
                    <li>
	                    <a href="javascript:void(0);" data="1" data_url="/manage/shakemonitor/shakelist.do" onclick="jumpPage(this)">
	                    <i class="fa fa-circle-o"></i>震动监控数据
	                    </a>
                    </li>
                     -->
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/datacfmperformance/datacfmperformancelist.do" onclick="jumpPage(this)">
	                    	<i class="fa fa-circle-o"></i>发动机性能数据</a>
	                </li>
	                <!--  
                    <li>
	                    <a href="javascript:void(0);" data="1" data_url="/manage/shakemonitor/shakereport.do" onclick="jumpPage(this)">
	                    <i class="fa fa-circle-o"></i>震动健康报告
	                    </a>
                    </li>
                    -->
                </ul>
            </li>	
            
 			<!-- 滑油监控 -->
            <li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-tint"></i> <span>滑油监控</span> <i class="fa fa-angle-right pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li>
	                    <a href="javascript:void(0);" data="1" data_url="/manage/oilconsumption/oillist.do" onclick="jumpPage(this)">
	                    <i class="fa fa-circle-o"></i>滑油数据
	                    </a>
                    </li>
                    <li>
	                    <a href="javascript:void(0);" data="1" data_url="/manage/oilconsume/oilconsumelist.do" onclick="jumpPage(this)">
	                    <i class="fa fa-circle-o"></i>滑耗监控
	                    </a>
                    </li>
                    <li>
	                    <a href="javascript:void(0);" data="1" data_url="/manage/oilconsume/oilpressurelist.do" onclick="jumpPage(this)">
	                    <i class="fa fa-circle-o"></i>滑油压力监控
	                    </a>
                    </li>
                    <li>
	                    <a href="javascript:void(0);" data="1" data_url="/manage/oilconsumption/oilreport.do" onclick="jumpPage(this)">
	                    <i class="fa fa-circle-o"></i>健康报告
	                    </a>
                    </li>
                </ul>
            </li>    
            
			<li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-shower"></i> <span>水洗监控</span> <i class="fa fa-angle-right pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li>
	                    <a href="javascript:void(0);" data="1" data_url="/manage/waterwash/waterwashlist.do" onclick="jumpPage(this)">
	                    	<i class="fa fa-circle-o"></i>水洗列表
	                    </a>
                    </li>
                    <li>
	                    <a href="javascript:void(0);" data="1" data_url="/manage/waterwash/waterwashrecord.do" onclick="jumpPage(this)">
	                    	<i class="fa fa-circle-o"></i>操作记录
	                    </a>
                    </li>
                </ul>
            </li>    
            
			<!-- 排故专家 -->
            <li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-wrench "></i> <span>排故专家</span> <i class="fa fa-angle-right pull-right"></i>
                </a>
                <ul class="treeview-menu">
                	<li><a href="javascript:void(0);" data="1" data_url="/manage/troubleshooting/record.do" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>故障记录列表</a></li>
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/troubleshooting/troublelist.do" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>排故列表</a></li>
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/datacase/datacaselist.do" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>故障类型</a></li>
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/datasapdefect/datasapdefectlist.do" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>故障件记录</a></li>
                </ul>
            </li>
            
			<!-- LLP余寿管理 -->
            <li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-clock-o"></i> <span>LLP余寿管理</span> <i class="fa fa-angle-right pull-right"></i>
                </a>
                <ul class="treeview-menu">
                <!-- 
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/llpactivity/llpactivitylist.do" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>余寿管理列表</a></li>
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/llpactivity/llphistorylist.do" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>余寿历史</a></li>
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/hptn/hptnactivitylist.do"  onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>HPTN数据</a></li>
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/hptn/hptnhistorylist.do" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>HPTN历史</a></li>
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/lptn1/lptn1activitylist.do" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>LPTN1数据</a></li>
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/lptn1/lptn1historylist.do" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>LPTN1历史</a></li>
					<li><a href="javascript:void(0);" data="1" data_url="/manage/hptb/hptbactivitylist.do" onclick="jumpPage(this)"><i
							class="fa fa-circle-o"></i>HPTB数据</a></li>
					<li><a href="javascript:void(0);" data="1" data_url="/manage/hptb/hptbhistorylist.do" onclick="jumpPage(this)"><i
							class="fa fa-circle-o"></i>HPTB历史</a></li>
				 -->
					<li><a href="javascript:void(0);" data="1" data_url="/manage/engdeadlinellp/engdeadlinellplist.do" onclick="jumpPage(this)"><i
							class="fa fa-circle-o"></i>寿命件门限</a></li>
					<li><a href="javascript:void(0);" data="1" data_url="/manage/engdeadlinehptb/engdeadlinehptblist.do" onclick="jumpPage(this)"><i
							class="fa fa-circle-o"></i>重要部件门限</a></li>
				</ul>
            </li>
            
            <!-- 监控数据 -->
            <!-- 监控报警 -->
            <li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-area-chart"></i> <span>监控报警</span> <i class="fa fa-angle-right pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    
                </ul>
            </li>
        
            <!-- 排气温度 -->
<!--             <li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-thermometer-three-quarters"></i> <span>排气温度</span> <i class="fa fa-angle-right pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li>
	                    <a href="javascript:void(0);" onclick="jumpPage(this)">
	                    	<i class="fa fa-circle-o"></i>排气温度列表
	                    </a>
                   </li>
                </ul>
            </li>  -->      

			<!-- 计算设置 -->
            <li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-calculator"></i> <span>计算设置</span> <i class="fa fa-angle-right pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="javascript:void(0);" data="1" data_url="/manage/calculate/settings_new.do" onclick="jumpPage(this)">
                    	<i class="fa fa-circle-o"></i>计算设置</a>
                    </li>
                </ul>
            </li>
                                                                     
             <li class="treeview">
                <a href="javascript:void(0);">
                    <i class="fa fa-users"></i> <span>人员管理</span> <i class="fa fa-angle-right pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="javascript:void(0);" data_url="/manage/user/userlist.do" data="1" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>成员列表</a>
                    </li>
                    <li>
                    	<a href="javascript:void(0);" data_url="/manage/duty/dutylist.do" data="1" onclick="jumpPage(this)">
                    		<i class="fa fa-circle-o"></i>部门列表
                    	</a>
                    </li>
                    <li><a href="javascript:void(0);" data_url="/manage/manage/rolelist.do" data="1" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>角色列表</a></li>
                    <!-- <li><a href="javascript:void(0);" data_url="/manage/manage/rolefunclist.do" data="1" onclick="jumpPage(this)"><i
                            class="fa fa-circle-o"></i>权限设置</a></li> -->
                </ul>
            </li>

        </ul>
    </section>

</aside>

<script>
	
    var base = "${pageContext.request.contextPath}";
    var storeUrl = null;
  
    function jumpPage(object) {
    	var url = $(object).attr("data_url");
    	var text = $(object).text();
    	
      //将所有标签改为未被选中状态
      notchosentab();
      //添加标签
		if(isaddtab(url)){
			addtab(url,text);
			//添加后需要判断数量，在根据数量改变ul的margin-left值，暂定ul宽度为700（后续初步打算是根据iframe宽度的80%之类的计算），
			//还有其他什么需要备注吗，想想，需要些的方法有，获取ul下的li数量，根据数量计算出此时ul的宽度是否超过div的宽度同上所述
			//判断是否超过，修改margin-left的值//后续需要追加一个← →消失显示的方法,在x按钮的方法里放入隐藏← →
			count = getlicount();
			width = $(window).width()-233;//获取页面宽度
			console.log(width);
			d_w = width*0.8;
			
			left_w = d_w-count*160;//此处160为li的宽度，写死比较容易，此处就写死了（这样比较简单，不然一个一个去获取太麻烦了，时间只剩半小时了）
			if(left_w<=0){
				wwidth=count*160+100;//需要放下所有的li并且还要能放下← →，//先写个大概逻辑吧
				$("#uls").css("width",wwidth+"px");
				$("#uls").css("margin-left",left_w+"px");
				$("#uuc").css("width",d_w+"px");
				//此处先写显示← →的方法
				showArrow();
			}else{
				wwidth=count*160;
				$("#uls").css("width",wwidth+"px");
				w=wwidth+100;
				$("#uuc").css("width",w+"px");
			}
			//此处逻辑修改
			//新增一个myiframe
			$("#myiframe").removeAttr("id");
			addiframe(url);
		}else{
	 		//更改为被选中
	 		changetab(url);
	 		changePage(text,url);
		}
		//显示iframe,隐藏其他的
		//判断是左侧栏还是上方tab
		var type = $(object).attr("data");
		if(type==="1"){
			//刷新
			refreshiframe(url);
		}else{
			showiframe(url);
		}
		//将最初始的iframe删除,以后优化可以这里做个判断，不过今天不想做这件事
    	delstartiframe();
   	 }

    //获得ul下的li数量
    function getlicount(){
    	length = $(".cxc").length;
    	return length;
    }
    
    //显示← →
    function showArrow(){
    	//等会写
    	
    }
    
    function hideArrow(){
    	
    }
    
    
    //写一下← →的方法//可能的话还要把所有的值转成int类型，string类型可能有时会有问题
    function arrowLeft(){
    	console.log(1);
    	//获取当前ul的宽度,ul父级div的宽度（也要一直更改限制为iframe的80%），
    	ulwidth = $("#uls").width();
    	divwidth = $("#uuc").width();
    	ul_margin_left = $("#uls").css("margin-left");
    	ul_margin_left=parseInt(ul_margin_left.replace('px',''));
    	console.log(ul_margin_left);
    	//判断
    	if(ul_margin_left==""||ul_margin_left==null||ul_margin_left=="undefined"){
    		//什么都不做//
    	}else if(ul_margin_left<=0){
    		//
    		now_margin_left = ul_margin_left+160;//160为一个li宽度
    		if(now_margin_left>0){
        		$("#uls").css("margin-left","0px");
        	}else{
        		$("#uls").css("margin-left",now_margin_left+"px");
    			u_w = ulwidth-160;
    			$("#uls").css("width",u_w+"px");
        	}
    	}
    }
    
    function arrowRight(){
    	console.log(2);
    	//获取当前ul的宽度,ul父级div的宽度（也要一直更改限制为iframe的80%），
    	ulwidth = $("#uls").width();
    	divwidth = $("#uuc").width();
    	ul_margin_left = $("#uls").css("margin-left");
    	ul_margin_left=parseInt(ul_margin_left.replace('px',''));
    	console.log(ul_margin_left);
    	//判断
    	if((ul_margin_left==""||ul_margin_left==null||ul_margin_left=="undefined")&&ul_margin_left!="0"){
    		//什么都不做
    		console.log(123);
    	}else{
    		//此处需要一个限制条件，当到达最后时不再减少
    		count = getlicount();//li数量
    		min =  width = $(window).width()-233;//获取页面宽度
			d_w = width*0.8;
			min = d_w-count*160;
			console.log(min);
    		now_margin_left = ul_margin_left-160;//160为一个li宽度
    		console.log(now_margin_left);
    		if(now_margin_left<min){
    			//不处理
    		}else{
    			$("#uls").css("margin-left",now_margin_left+"px");
    			u_w = ulwidth-160;
    			$("#uls").css("width",u_w+"px");
    		}
    		
    			
    		
    	}
    }
    
    //删除初始iframe
    function delstartiframe(){
    	data_url ="/manage/index/home.do"; 
    	$(".myiframe").each(function(key,val){
			if($(val).attr("data_url")==data_url&&$(val).attr("x")==="1"){
				$(val).remove();
			}
		});
    }
    //刷新iframe
    function refreshiframe(url){
    	$(".myiframe").each(function(key,val){
			if($(val).attr("data_url")==url){
				$(val).show();
				$(val).attr("src",base+$(val).attr("data_url"));
			}else{
				$(val).hide();
			}
		});
    }
    //iframe跳转
    function jumpiframe(data_url,url){
    	$(".myiframe").each(function(key,val){
			if($(val).attr("data_url")==data_url){
				$(val).show();
				$(val).attr("src",base+url);
			}else{
				$(val).hide();
			}
		});
    }
  //显示iframe,隐藏其他的
	function showiframe(url){
		$(".myiframe").each(function(key,val){
			if($(val).attr("data_url")==url){
				$(val).show();
			}else{
				$(val).hide();
			}
		});
	}
  
    //获取最后第二个标签的url
    function getlasttaburl(){
    	 lasturl ="";
    	 length = $(".cxc").length;
    	if(length=="1"){
    		
    		lasturl = "/manage/index/home.do";
    	} else{
    		$(".cxc").each(function(key,val){
        		if(key == length-2){
        			 lasturl = $(val).attr("data_url");
        		}
        	})
    	}
    	return lasturl;
    }
    
    //判断是否需要添加iframe
    function isaddiframe(url){
    	 b = 0;
    	$(".box").each(function(key,val){
    		if($(val).attr("data_url")==url){
    			 b = 1;
    			 return false;
    		}
    	});
    	if(b=="1"){
    		return false;
    	}else{
    		return true;
    	}
    }
    
    //添加iframe
    function addiframe(url){
    	
    	$(".box").append(" <iframe id='myiframe'  class='myiframe' data_url='"+url+"' src='"+base+url+"'  width='100%' height='100%'></iframe>"); 
    	
    }
    
    //将所有tab改为未选中状态 
	function notchosentab(){
		$(".cxc").each(function(key,val){
    		$(val).css("background","rgba(236, 240, 241, 1)");
    		$(val).attr("class","cxc");
    	})
	}
    
    //更改标签为选中状态
    function changetab(url){
    	$(".cxc").each(function(key,val){
    		if($(val).attr("data_url")==url){
    			$(val).css("background","rgba(219, 229, 231, 1)");
    			$(val).attr("class","cxc active");
    		}
    	})
    }
    
    //添加标签
    function addtab(url,text){
    	//需要判断是否需要添加//暂定li的宽度为160px;测试使用，后根据需求更改
    	$("#uls").append("<li data_url='"+url+"' class='cxc' style='display:inline-block;position: relative;padding:0 20px;background:rgba(219, 229, 231, 1);width:160px;height:45px;line-height:45px;text-align:center;cursor: pointer;overflow:hidden; margin: 8px 3px 0px 0px;' cc='1' onclick='jumpPage(this)' >"+"<a style='color:#3399ff;font-weight:bold;'>"+text+"<span class='a' onclick='deltab(this)' style='position:absolute;top:-4px;right:3px;cursor: pointer;color:white;font-weight:bold;font-size:23px;'>x</span>"+"</a>"+"</li>");
    }
    
    //判断是否需要添加标签
    function isaddtab(url){
    	//遍历查询
    	 a = 0;
    	$(".cxc").each(function(key,val){
    		if($(val).attr("data_url")===url){
    			 a = 1;
    			return false;
    		}
    	})
    	if(a=="1"){
    		return false;
    	}else{
    		return true;
    	}
    }
    
    //关闭按钮
    function deltab(object){
		//删除对应的tab和iframe，先删iframe
		url = $(object).parent().parent().attr("data_url");
		data_url = $("#myiframe").attr("data_url");
		//如果是id的那个，需要把最后一个传下去
		if(data_url===url){
			lasturl = getlasttaburl();
			//显示最后一个,并给他赋予一个id
			giveiframeId(lasturl);
			showiframe(lasturl);
			changetab(lasturl);
		}
		deliframe(url);
		
		//如果是最后一个的话需要添加一个首页，先做个判断
		if(islasttab()){
			//console.log("ok");
			//添加一个首页
			index_url = "/manage/index/home.do";
			addiframe(index_url);
		}
		//删除tab	
		$(object).parent().parent().remove();
		event.stopPropagation();
	}
    //判断是否是最后一个tab
    function islasttab(){
    	length = $(".cxc").length;
    	//console.log(length);
    	if(length=="1"){
    		//console.log("shibushi");
    		return true;
    	}else{
    		return false;
    	}
    }
    
    //赋予iframe一个id
    function giveiframeId(url){
    	$(".myiframe").each(function(key,val){
    		if($(val).attr("data_url")===url){
    			$(val).attr("id","myiframe");
    		}
    	});
    }
    
    //删除iframe
    function deliframe(url){
    	$(".myiframe").each(function(key,val){
			if($(val).attr("data_url")===url){
				$(val).remove();
			}
		});
    }
	  //详情页之类的跳转
    function changePage(title,tab_url){
    	//改变tab的显示名称
    	$(".cxc").each(function(key,val){
    		if($(val).attr("data_url")==tab_url){
    			$(val).children("a").html(title+"<span class='a' onclick='deltab(this)' style='position:absolute;top:-4px;right:3px;cursor: pointer;color:white;font-weight:bold;font-size:23px;'>x</span>");
    		}
    	});
    }


    
</script>
