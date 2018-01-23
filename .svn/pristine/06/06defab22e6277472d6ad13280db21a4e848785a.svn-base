package com.cea.ehm.controller.manage;

import java.text.ParseException;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cea.ehm.bean.EngSpare;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.EngSpareService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 发动机备发信息
 */
@Controller
@RequestMapping(value = "/manage/engspare")
public class EngSpareController extends BaseController {
	private Logger logger = Logger.getLogger(EngSpareController.class);
	@Autowired
	private EngSpareService engspareService;

	/**
	 * 显示发动机备发列表页面
	 */
	@RequestMapping(value = "/engsparelist.do")
	public ModelAndView engsparelist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/engspare/engsparelist");
		return mv;
	}
	
	/**
	 * 显示发动机备发添加/编辑
	 */
	@RequestMapping(value = "/engspareadd.do")
	public ModelAndView engspareadd() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/engspare/engspareadd");
		return mv;
	}
	
	/**
	 * 显示发动机备发信息页面
	 */
	@RequestMapping(value = "/engspareinfo.do")
	public ModelAndView engspareinfo() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/engspare/engspareinfo");
		return mv;
	}

	/**
	 * 查询发动机备发→ 列表
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/list.do")
	@ResponseBody
	public Map<String, Object> list(@RequestParam Map<String, String> reqPara) {
		logger.info("页面请求参数: " + reqPara);
		PageBounds pageBounds = handlePageInfoForManage(reqPara);
		// ？？
		String sEcho = reqPara.get("draw");
		// 条件参数
		String key = reqPara.get("key");
		Map<String, String> paramMap = Maps.newHashMap();
		paramMap.put("engSn", key);

		PageList<EngSpare> pageList = (PageList<EngSpare>) engspareService.getEngSpareList(paramMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<EngSpare> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());

		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 保存或更新发动机备发信息
	 * 
	 * @param reqPara
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/saveOrUpdate.do")
	@ResponseBody
	public Map<String, Object> saveOrUpdate(@RequestParam Map<String, String> reqPara) throws ParseException {
		logger.info("待编辑用户信息: " + reqPara);
		String id = reqPara.get("id");
		String engSn = reqPara.get("engSn");
		String removeDate = reqPara.get("removeDate");
		String removalCause = reqPara.get("removalCause");
		String condition_ = reqPara.get("condition_");
		String factory = reqPara.get("factory");
		String arrived = reqPara.get("arrived");
		String induction = reqPara.get("induction");
		String completePlan = reqPara.get("completePlan");
		String complete = reqPara.get("complete");
		String ship = reqPara.get("ship");
		String tat = reqPara.get("tat");
		
		EngSpare engspare = new EngSpare();
		engspare.setId(id);
		engspare.setEngSn(engSn);
		engspare.setRemoveDate(removeDate);
		engspare.setRemovalCause(removalCause);
		engspare.setCondition_(condition_);
		engspare.setFactory(factory);
		engspare.setArrived(arrived);
		engspare.setInduction(induction);
		engspare.setCompletePlan(completePlan);
		engspare.setComplete(complete);
		engspare.setShip(ship);
		engspare.setTat(tat);
		engspareService.saveOrUpdate(engspare);
		return null;
	}

	/**
	 * 删除发动机备发信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/delete.do")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam Map<String, String> reqPara) {
		logger.info("待删除发动机备发信息: " + reqPara);
		String id = reqPara.get("id");
		EngSpare engspare = new EngSpare();
		engspare.setId(id);

		// 删除之前是不是要判断发动机备发是否存在？？

		// 这里没做判断, 直接删除
		engspareService.delete(engspare);
		return null;
	}
	
}

