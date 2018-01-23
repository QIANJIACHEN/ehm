package com.cea.ehm.controller.manage;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
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

import com.cea.ehm.bean.DataCase;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.DataCaseService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 故障信息
 */
@Controller
@RequestMapping(value = "/manage/datacase")
public class DataCaseController extends BaseController {
	private Logger logger = Logger.getLogger(DataCaseController.class);
	@Autowired
	private DataCaseService datacaseService;
	/**
	 * 显示故障列表页面
	 */
	@RequestMapping(value = "/datacaselist.do")
	public ModelAndView datacaselist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/datacase/datacaselist");
		return mv;
	}
	
	/**
	 * 显示故障添加/编辑
	 */
	@RequestMapping(value = "/datacaseadd.do")
	public ModelAndView datacaseadd() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/datacase/datacaseadd");
		return mv;
	}
	
	/**
	 * 显示故障信息页面
	 */
	@RequestMapping(value = "/datacaseinfo.do")
	public ModelAndView datacaseinfo() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/datacase/datacaseinfo");
		return mv;
	}

	/**
	 * 查询故障→ 列表
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
		paramMap.put("name", key);

		PageList<DataCase> pageList = (PageList<DataCase>) datacaseService.getDataCaseList(paramMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<DataCase> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());

		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 保存或更新故障信息
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
		String case_ = reqPara.get("case_");
		String resource = reqPara.get("resource");
		String date = LocalDateTime.now().toString().replace("T", " ");
		String c = date.substring(0, date.indexOf("."));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date ctime = sdf.parse(c);
		DataCase datacase = new DataCase();
		datacase.setId(id);
		datacase.setCase_(case_);
		datacase.setResource(resource);
		datacase.setCtime(ctime);
		datacaseService.saveOrUpdate(datacase);
		return null;
	}

	/**
	 * 删除故障信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/delete.do")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam Map<String, String> reqPara) {
		logger.info("待删除故障信息: " + reqPara);
		String id = reqPara.get("id");
		DataCase datacase = new DataCase();
		datacase.setId(id);

		// 删除之前是不是要判断故障是否存在？？

		// 这里没做判断, 直接删除
		datacaseService.delete(datacase);
		return null;
	}
	
}

