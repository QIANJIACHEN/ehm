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

import com.cea.ehm.bean.EngOnwing;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.EngOnwingService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * engOnwing
 */
@Controller
@RequestMapping(value = "/manage/engonwing")
public class EngOnwingController extends BaseController {
	@Autowired
	private EngOnwingService engOnwingService;

	/**
	 * 显示 engOnwing列表页面
	 */
	@RequestMapping(value = "/engonwinglist.do")
	public ModelAndView engonwinglist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/engonwing/engonwinglist");
		return mv;
	}
	
	/**
	 * 显示详情页面
	 */
	@RequestMapping(value = "/engonwingdetail.do")
	public ModelAndView dataplanelistdetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/engonwing/engonwingdetail");
		return mv;
	}

	/**
	 * 查询 → 列表
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/list.do")
	@ResponseBody
	public Map<String, Object> list(@RequestParam Map<String, String> reqPara) {
		PageBounds pageBounds = handlePageInfoForManage(reqPara);
		String sEcho = reqPara.get("draw");
		Map<String, String> paramMap = Maps.newHashMap();
		PageList<EngOnwing> pageList = (PageList<EngOnwing>) engOnwingService.getEngOnwingList(paramMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<EngOnwing> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}
	
	/**
	 * 详情
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/info.do")
	@ResponseBody
	public Map<String, Object> info(@RequestParam Map<String, String> reqPara) {
		Map<String, Integer> paramMap = Maps.newHashMap();

		// 根据planeId来查吧
		String id = reqPara.get("id");
		if(id!=null&&!id.equals("")) {
			paramMap.put("id", Integer.parseInt(id));
			List<EngOnwing> data = engOnwingService.getEngOnwingInfo(paramMap);

			return getSuccessData(data, "");
		}
		return null;
		
		
	}
	

}
