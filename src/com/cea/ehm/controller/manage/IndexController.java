package com.cea.ehm.controller.manage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cea.ehm.controller.BaseController;

/**
 * 部门
 */
@Controller
@RequestMapping(value = "/manage/index")
public class IndexController extends BaseController {

	
	/**
	 * 显示部门列表
	 */
	@RequestMapping(value = "/index.do")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/index/index");
		return mv;
	}
	@RequestMapping(value = "/home.do")
	public ModelAndView indexlist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/index/home");
		return mv;
	}
}
