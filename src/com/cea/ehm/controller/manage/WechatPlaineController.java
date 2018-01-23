package com.cea.ehm.controller.manage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cea.ehm.controller.BaseController;

/**
 * 发动机性能数据
 */
@Controller
@RequestMapping(value = "/manage/wechat")
public class WechatPlaineController extends BaseController {

	/**
	 * 显示飞机列表页面
	 */
	@RequestMapping(value = "/plainelist.do")
	public ModelAndView wechatplainelist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/plainelist");
		return mv;
	}
	
	/**
	 * 显示航班列表页面
	 */
	@RequestMapping(value = "/flightlist.do")
	public ModelAndView wechatflightlist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/flightlist");
		return mv;
	}
	
	/**
	 * 显示发动机维修列表页面
	 */
	@RequestMapping(value = "/engmaintenancelist.do")
	public ModelAndView engmaintenancelist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/engmaintenancelist");
		return mv;
	}
	
	/**
	 * 显示水洗列表页面
	 */
	@RequestMapping(value = "/waterwashlist.do")
	public ModelAndView waterwashlist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/waterwashlist");
		return mv;
	}
	
	/**
	 * 显示发动机备发表页面
	 */
	@RequestMapping(value = "/engreadylist.do")
	public ModelAndView engreadylist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/engreadylist");
		return mv;
	}
	
	/**
	 * 显示发动机简报页面
	 */
	@RequestMapping(value = "/engreport.do")
	public ModelAndView engreport() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/engreport");
		return mv;
	}
	
	/**
	 * 显示发动机状态简报页面
	 */
	@RequestMapping(value = "/engstatusreport.do")
	public ModelAndView engstatusreport() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/engstatusreport");
		return mv;
	}
	
	/**
	 * 显示发动机IDPLUG数据页面
	 */
	@RequestMapping(value = "/engidpdata.do")
	public ModelAndView engidpdata() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/engidpdata");
		return mv;
	}
	
	/**
	 * 显示SAP日报表页面
	 */
	@RequestMapping(value = "/sapreport.do")
	public ModelAndView sapreport() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/sapreport");
		return mv;
	}
	/**
	 * 显示发动机性能数据表页面
	 */
	@RequestMapping(value = "/engperformance.do")
	public ModelAndView engperformance() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/engperformance");
		return mv;
	}
	
	/**
	 * 显示滑油健康报告列表页面
	 */
	@RequestMapping(value = "/oilconsumereport.do")
	public ModelAndView oilconsumereport() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/oilconsumereport");
		return mv;
	}
	
	/**
	 * 显示滑油压力监控列表页面
	 */
	@RequestMapping(value = "/oilpressuremonitor.do")
	public ModelAndView oilpressuremonitor() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/oilpressuremonitor");
		return mv;
	}
	
	/**
	 * 显示滑耗监控列表页面
	 */
	@RequestMapping(value = "/oilconsumemonitor.do")
	public ModelAndView oilconsumemonitor() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/oilconsumemonitor");
		return mv;
	}
	
	/**
	 * 显示震动监控列表页面
	 */
	@RequestMapping(value = "/shakemonitorlist.do")
	public ModelAndView shakemonitorlist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/shakemonitorlist");
		return mv;
	}
	
	/**
	 * 显示发动机列表页面
	 */
	@RequestMapping(value = "/englist.do")
	public ModelAndView wechatenglist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/englist");
		return mv;
	}

	/**
	 * 显示消息列表页面
	 */
	@RequestMapping(value = "/news.do")
	public ModelAndView wechatnews() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/news");
		return mv;
	}

	/**
	 * 显示部门列表页面- 通讯录
	 */
	@RequestMapping(value = "/department.do")
	public ModelAndView wechatdepartment() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/department");
		return mv;
	}
	
	/**
	 * 显示部门详情页面- 通讯录
	 */
	@RequestMapping(value = "/departmentdetail.do")
	public ModelAndView departmentdetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/departmentdetail");
		return mv;
	}

	/**
	 * 显示工作台页面
	 */
	@RequestMapping(value = "/workingtable.do")
	public ModelAndView wechatworkingtable() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/workingtable");
		return mv;
	}

	/**
	 * 显示我的页面
	 */
	@RequestMapping(value = "/mine.do")
	public ModelAndView wechatmine() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/wechat/mine");
		return mv;
	}

}
