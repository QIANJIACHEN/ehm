package com.cea.ehm.controller.manage;

import java.util.List;
import java.util.Map;

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

import com.cea.ehm.bean.Shake;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.ShakeService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 震动
 */
@Controller
@RequestMapping(value = "/manage/shakemonitor")
public class ShakeMonitorController extends BaseController {
	@Autowired
	private ShakeService shakeService;

	/**
	 * 显示震动监控列表
	 */
	@RequestMapping(value = "/shakelist.do")
	public ModelAndView shakelist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/shakemonitor/shakelist");
		return mv;
	}

	/**
	 * 显示震动监控列表图表
	 */
	@RequestMapping(value = "/shakechart.do")
	public ModelAndView shakeChart() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/shakemonitor/shakechart");
		return mv;
	}

	/**
	 * 显示震动健康报告
	 */
	@RequestMapping(value = "/shakereport.do")
	public ModelAndView report() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/shakemonitor/shakereport");
		return mv;
	}

	/**
	 * 显示震动健康报告图表
	 */
	@RequestMapping(value = "/shakereportchart.do")
	public ModelAndView shakeReportChart() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/shakemonitor/shakereportchart");
		return mv;
	}

	/**
	 * 查询震动数据（起飞）→ 列表
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/listOne.do")
	@ResponseBody
	public Map<String, Object> listOne(@RequestParam Map<String, String> reqPara) {
		PageBounds pageBounds = handlePageInfoForManage(reqPara);
		String sEcho = reqPara.get("draw");
		// 条件参数
		Map<String, String> paramMap = Maps.newHashMap();
		String dutyId = reqPara.get("dutyId");
		String engSn = reqPara.get("engSn");
		paramMap.put("dutyId", dutyId);
		paramMap.put("engSn", engSn);
		PageList<Shake> pageList = (PageList<Shake>) shakeService.listOne(paramMap, pageBounds);
		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<Shake> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 查询震动数据（巡航）→ 列表
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/listTwo.do")
	@ResponseBody
	public Map<String, Object> listTwo(@RequestParam Map<String, String> reqPara) {
		PageBounds pageBounds = handlePageInfoForManage(reqPara);
		String sEcho = reqPara.get("draw");
		// 条件参数
		Map<String, String> paramMap = Maps.newHashMap();
		String dutyId = reqPara.get("dutyId");
		String engSn = reqPara.get("engSn");
		paramMap.put("dutyId", dutyId);
		paramMap.put("engSn", engSn);
		PageList<Shake> pageList = (PageList<Shake>) shakeService.listTwo(paramMap, pageBounds);
		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<Shake> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 查询震动数据（所有）
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/list.do")
	@ResponseBody
	public Map<String, Object> list(@RequestParam Map<String, String> reqPara) {
		String tail = reqPara.get("tail");
		String flightPhase = reqPara.get("flightPhase");
		Map<String, String> paramMap = Maps.newHashMap();
		paramMap.put("tail", tail);
		paramMap.put("flightPhase", flightPhase);
		List<Shake> shakes = shakeService.list(paramMap);
		return getSuccessData(shakes);
	}
	/**
	 * 震动数据详情（所有）
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/shakemonitordetail.do")
	@ResponseBody
	public  ModelAndView shakemonitordetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/shakemonitor/shakemonitordetail");
		return mv;
	}
	/**
	 * 震动数据详情数据
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/detail.do")
	@ResponseBody
	public Map<String,Object> detail(@RequestParam Map<String,String> reqPara){
		Map<String, Integer> paramMap = Maps.newHashMap();
		String id = reqPara.get("id");
		paramMap.put("id", Integer.parseInt(id));
		Map<String, Object> map = Maps.newHashMap();
		List<Shake> data = shakeService.getshakeServiceDetailbyid(paramMap);
		map.put("data", data);
		return map;
	}
}
