package com.cea.ehm.controller.manage;

import java.time.LocalDateTime;
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

import com.cea.ehm.bean.PlaneWithFlight;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.PlaneWithFlightService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;

/**
 * 飞机 航班关联信息
 */
@Controller
@RequestMapping(value = "/manage/pwf")
public class PlaneWithFlightController extends BaseController {

	@Autowired
	private PlaneWithFlightService pwfService;

	/**
	 * 显示飞机航班关联页面
	 */
	@RequestMapping(value = "/pwflist.do")
	public ModelAndView pwfList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/planewithflight/pwflist");
		return mv;
	}

	/**
	 * 保存飞机 航班关联信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/save.do")
	@ResponseBody
	public Map<String, Object> save(@RequestParam Map<String, String> reqPara) {
		String planeId = reqPara.get("planeId");
		String flightId = reqPara.get("flightId");

		PlaneWithFlight pwf = new PlaneWithFlight();
		pwf.setPlaneId(Integer.parseInt(planeId));
		pwf.setFlightId(Integer.parseInt(flightId));
		String date = LocalDateTime.now().toString().replace("T", " ");
		String ctime = date.substring(0, date.indexOf("."));
		pwf.setCtime(ctime);
		pwfService.save(pwf);
		return getSuccessMessage();
	}

	/**
	 * 查询飞机 航班关联信息 → 列表
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
		String planeId = reqPara.get("planeId");
		String flightId = reqPara.get("flightId");
		Map<String, String> paramMap = Maps.newHashMap();
		if (!Strings.isNullOrEmpty(planeId)) {
			paramMap.put("planeId", planeId);
		}
		if (!Strings.isNullOrEmpty(flightId)) {
			paramMap.put("flightId", flightId);
		}
		PageList<PlaneWithFlight> pageList = (PageList<PlaneWithFlight>) pwfService.getList(paramMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<PlaneWithFlight> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}
	

	/**
	 * 修改飞机 航班关联信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/update.do")
	@ResponseBody
	public Map<String, Object> update(@RequestParam Map<String, String> reqPara) {
		String id = reqPara.get("id");
		String planeId = reqPara.get("planeId");
		String flightId = reqPara.get("flightId");

		PlaneWithFlight pwf = new PlaneWithFlight();
		pwf.setId(Integer.parseInt(id));
		pwf.setPlaneId(Integer.parseInt(planeId));
		pwf.setFlightId(Integer.parseInt(flightId));
		pwfService.update(pwf);
		return getSuccessMessage();
	}
	
	/**
	 * 删除飞机 航班关联信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/delete.do")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam Map<String, String> reqPara) {
		String id = reqPara.get("id");
		PlaneWithFlight pwf = new PlaneWithFlight();
		pwf.setId(Integer.parseInt(id));
		pwfService.delete(pwf);
		return getSuccessMessage();
	}
}
