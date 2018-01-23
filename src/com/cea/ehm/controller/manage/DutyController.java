package com.cea.ehm.controller.manage;

import java.time.LocalDateTime;
import java.util.List;
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

import com.cea.ehm.bean.Duty;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.DutyService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;

/**
 * 部门
 */
@Controller
@RequestMapping(value = "/manage/duty")
public class DutyController extends BaseController {
	private Logger logger = Logger.getLogger(DutyController.class);
	@Autowired
	private DutyService dutyService;

	/**
	 * 显示部门列表
	 */
	@RequestMapping(value = "/dutylist.do")
	public ModelAndView dutylist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/duty/dutylist");
		return mv;
	}

	/*
	 * 显示部门详情
	 */
	@RequestMapping(value = "/dutydetail.do")
	public ModelAndView dutydetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/duty/dutydetail");
		return mv;
	}
	/*
	 * 根据id获取duty数据
	 */
	@RequestMapping(value = "/detail.do")
	@ResponseBody
	public Map<String,Object> detail(@RequestParam Map<String, String> reqPara){
		logger.info("页面请求参数: " + reqPara);
		Map<String, Integer> paramMap = Maps.newHashMap();
		String id = reqPara.get("id");
		paramMap.put("id", Integer.parseInt(id));
		Map<String, Object> map = Maps.newHashMap();
		List<Duty> data = dutyService.getDutyById(paramMap);
		map.put("data", data);
		return map;
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
		logger.info("页面请求参数: " + reqPara);
		PageBounds pageBounds = handlePageInfoForManage(reqPara);
		String sEcho = reqPara.get("draw");
		// 条件参数
		Map<String, String> paramMap = Maps.newHashMap();
		String name = reqPara.get("name");
		String role = reqPara.get("role");
		paramMap.put("name", name);
		if (!Strings.isNullOrEmpty(role)) {
			paramMap.put("role", role);
		}
		PageList<Duty> pageList = (PageList<Duty>) dutyService.getDutyList(paramMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<Duty> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 保存部门信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/save.do")
	@ResponseBody
	public Map<String, Object> save(@RequestParam Map<String, String> reqPara) {
		Duty duty = getDuty(reqPara);
		dutyService.save(duty);
		return getSuccessMessage();
	}

	/**
	 * 更新部门信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/update.do")
	@ResponseBody
	public Map<String, Object> update(@RequestParam Map<String, String> reqPara) {
		Duty duty = getDuty(reqPara);
		dutyService.update(duty);
		return getSuccessMessage();
	}

	/**
	 * 获取部门信息
	 * 
	 * @param reqPara
	 * @return
	 */
	public Duty getDuty(Map<String, String> reqPara) {
		logger.info("待编辑部门信息: " + reqPara);
		String id = reqPara.get("id");
		String parentId = reqPara.get("parentId");
		String name = reqPara.get("name");
		String role = reqPara.get("role");
		String location = reqPara.get("location");
		String type = reqPara.get("type");

		Duty duty = new Duty();
		if (id != null) {
			duty.setId(Integer.parseInt(id));
		}
		duty.setParentId(Integer.parseInt(parentId));
		duty.setName(name);
		duty.setRole(Integer.parseInt(role));
		String date = LocalDateTime.now().toString().replace("T", " ");
		String time = date.substring(0, date.indexOf("."));
		duty.setCtime(time);
		duty.setLocation(location);
		duty.setType(Integer.parseInt(type));

		return duty;
	}

	/**
	 * 删除部门信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/delete.do")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam Map<String, String> reqPara) {
		logger.info("待删除部门信息: " + reqPara);
		String id = reqPara.get("id");
		Duty duty = new Duty();
		duty.setId(Integer.parseInt(id));
		dutyService.delete(duty);
		return getSuccessMessage();
	}

	/**
	 * 获取所有的基地信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/allduty.do")
	@ResponseBody
	public Map<String, Object> getAllDuty() {
		List<Duty> dutys = dutyService.getAllDuty();
		return getSuccessData(dutys, "");
	}

}
