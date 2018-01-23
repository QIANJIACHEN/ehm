package com.cea.ehm.controller.manage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cea.ehm.controller.BaseController;

/**
 * 部门
 */
@Controller
@RequestMapping(value = "/manage/llp")
public class LlpController extends BaseController {

	
	/**
	 * 显示llp余寿管理列表
	 */
	@RequestMapping(value = "/llplist.do")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/llp/llplist");
		return mv;
	}
	
}
