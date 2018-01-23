package com.cea.ehm.controller.manage;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cea.ehm.bean.PlaneFlight;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.PlaneFlightService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 航班信息
 */
@Controller
@RequestMapping(value = "/manage/flight")
public class PlaneFlightController extends BaseController {
	@Autowired
	private PlaneFlightService flightService;

	/**
	 * 显示航班列表页面
	 */
	@RequestMapping(value = "/flightlist.do")
	public ModelAndView flightlist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/planeflight/flightlist");
		return mv;
	}

	/**
	 * 查询航班信息 → 列表
	 * 
	 * @param reqPara
	 * @return
	 */
	@PostMapping(value = "/list.do")
	@ResponseBody
	public Map<String, Object> list(@RequestParam Map<String, String> reqPara) {
		PageBounds pageBounds = handlePageInfoForManage(reqPara);
		String sEcho = reqPara.get("draw");
		// 条件参数
		String number = reqPara.get("number");
		String sTerminal = reqPara.get("sTerminal");
		String eTerminal = reqPara.get("eTerminal");
		Map<String, String> paramMap = Maps.newHashMap();
		paramMap.put("number", number);
		paramMap.put("sTerminal", sTerminal);
		paramMap.put("eTerminal", eTerminal);

		PageList<PlaneFlight> pageList = (PageList<PlaneFlight>) flightService.getList(paramMap, pageBounds);
		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<PlaneFlight> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 航班信息 保存
	 * 
	 * @param flight
	 * @return
	 */
	@RequestMapping(value = "/save.do")
	@ResponseBody
	public Map<String, Object> save(PlaneFlight flight) {
		String date = LocalDateTime.now().toString().replace("T", " ");
		String ctime = date.substring(0, date.indexOf("."));
		flight.setCtime(ctime);
		flightService.save(flight);
		return getSuccessMessage();
	}

	/**
	 * 航班信息 修改
	 * 
	 * @param flight
	 * @return
	 */
	@RequestMapping(value = "/update.do")
	@ResponseBody
	public Map<String, Object> update(PlaneFlight flight) {
		flightService.update(flight);
		return getSuccessMessage();
	}

	/**
	 * 航班信息 删除
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/delete.do")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam Map<String, String> reqPara) {
		String id = reqPara.get("id");
		PlaneFlight flight = new PlaneFlight();
		flight.setId(Integer.parseInt(id));
		flightService.delete(flight);
		return getSuccessMessage();
	}

	/**
	 * 获取所有的航班信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/allflight.do")
	@ResponseBody
	public Map<String, Object> allFlight() {
		List<PlaneFlight> flights = flightService.allFlight();
		return getSuccessData(flights, "");
	}

}
