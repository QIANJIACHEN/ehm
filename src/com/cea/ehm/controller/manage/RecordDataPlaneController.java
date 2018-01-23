package com.cea.ehm.controller.manage;

import java.text.ParseException;
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

import com.cea.ehm.bean.RecordDataPlane;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.RecordDataPlaneService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 飞机属性更变记录信息
 */
@Controller
@RequestMapping(value = "/manage/recorddataplane")
public class RecordDataPlaneController extends BaseController {
	private Logger logger = Logger.getLogger(RecordDataPlaneController.class);
	@Autowired
	private RecordDataPlaneService recorddataplaneService;

	/**
	 * 显示飞机属性更变记录列表页面
	 */
	@RequestMapping(value = "/recorddataplanelist.do")
	public ModelAndView recorddataplanelist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/recorddataplane/recorddataplanelist");
		return mv;
	}

	/**
	 * 飞机属性更变记录详情页面
	 */
	@RequestMapping(value = "/recorddataplanedetail")
	public ModelAndView recorddataplanedetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/recorddataplane/recorddataplanedetail");
		return mv;
	}
	
	/**
	 * 根据id查询详情
	 */
	@RequestMapping(value = "/detail" )
	@ResponseBody
	public Map<String,Object> detail(@RequestParam Map<String, String> reqPara){
		logger.info("页面请求参数: " + reqPara);
		Map<String, Integer> paramMap = Maps.newHashMap();
		String id = reqPara.get("id");
		paramMap.put("id", Integer.parseInt(id));
		Map<String, Object> map = Maps.newHashMap();
		List<RecordDataPlane> data = recorddataplaneService.getRecordDataPlaneById(paramMap);
		map.put("data",data);
		return map;
	}
	
	
	/**
	 * 查询飞机属性更变记录→ 列表
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
		String tail = reqPara.get("tail");
		Map<String, String> paramMap = Maps.newHashMap();
		paramMap.put("tail", tail);
		PageList<RecordDataPlane> pageList = (PageList<RecordDataPlane>) recorddataplaneService
				.getRecordDataPlaneList(paramMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<RecordDataPlane> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 保存或更新飞机属性更变记录信息
	 * 
	 * @param reqPara
	 * @return
	 * @throws ParseException
	 */
	@Deprecated
	@RequestMapping(value = "/saveOrUpdate.do")
	@ResponseBody
	public Map<String, Object> saveOrUpdate(@RequestParam Map<String, String> reqPara) throws ParseException {
		logger.info("待编辑用户信息: " + reqPara);
		String id = reqPara.get("id");
		String tail = reqPara.get("tail");
		String duty = reqPara.get("duty");
		String ratingPlane = reqPara.get("ratingPlane");
		String configPlane = reqPara.get("configPlane");
		String egsnOriginal = reqPara.get("egsnOriginal");
		String series = reqPara.get("series");
		String type = reqPara.get("type");
		String model = reqPara.get("model");
		String attribute = reqPara.get("attribute");
		String etops = reqPara.get("etops");
		String hHighLand = reqPara.get("hHighLand");
		String variable = reqPara.get("variable");
		String serial = reqPara.get("serial");
		String line = reqPara.get("line");
		String operater = reqPara.get("operater");
		String owner = reqPara.get("owner");
		String remark = reqPara.get("remark");
		String importWay = reqPara.get("importWay");
		// String userId = reqPara.get("userId");
		String userId = "1";// 暂时录入人默认1
		String date = LocalDateTime.now().toString().replace("T", " ");
		String ctime = date.substring(0, date.indexOf("."));

		RecordDataPlane recorddataplane = new RecordDataPlane();
		if (id != null) {
			recorddataplane.setId(Integer.parseInt(id));
		}

		recorddataplane.setTail(tail);
		recorddataplane.setDuty(Integer.parseInt(duty));
		recorddataplane.setRatingPlane(ratingPlane);
		recorddataplane.setConfigPlane(configPlane);
		recorddataplane.setEgsnOriginal(egsnOriginal);
		recorddataplane.setSeries(series);
		recorddataplane.setType(type);
		recorddataplane.setModel(model);
		recorddataplane.setAttribute(attribute);
		recorddataplane.setEtops(etops);
		recorddataplane.sethHighLand(Integer.parseInt(hHighLand));
		recorddataplane.setVariable(variable);
		recorddataplane.setSerial(serial);
		recorddataplane.setLine(line);
		recorddataplane.setOperater(operater);
		recorddataplane.setOwner(owner);
		recorddataplane.setRemark(remark);
		recorddataplane.setImportWay(importWay);
		recorddataplane.setUserId(Integer.parseInt(userId));
		recorddataplane.setCtime(ctime);
		// recorddataplaneService.saveOrUpdate(recorddataplane);
		return null;
	}

	/**
	 * 删除飞机属性更变记录信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@Deprecated
	@RequestMapping(value = "/delete.do")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam Map<String, String> reqPara) {
		logger.info("待删除飞机属性更变记录信息: " + reqPara);
		String id = reqPara.get("id");
		RecordDataPlane recorddataplane = new RecordDataPlane();
		recorddataplane.setId(Integer.parseInt(id));
		recorddataplaneService.delete(recorddataplane);
		return getSuccessMessage();
	}
}
