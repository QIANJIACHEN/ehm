package com.cea.ehm.controller.manage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cea.ehm.controller.BaseController;

/**
 * 部门
 */
@Controller
@RequestMapping(value = "/manage/exhaust")
public class ExhaustController extends BaseController {

	
	/**
	 * 显示排气温度列表
	 */
	@RequestMapping(value = "/exhaustlist.do")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/exhaust/exhaustlist");
		return mv;
	}
	
}
