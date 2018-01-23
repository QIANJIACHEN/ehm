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

import com.cea.ehm.bean.RecordDataEng;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.RecordDataEngService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 发动机更变记录信息
 */
@Controller
@RequestMapping(value = "/manage/recorddataeng")
public class RecordDataEngController extends BaseController {
	private Logger logger = Logger.getLogger(RecordDataEngController.class);
	@Autowired
	private RecordDataEngService recorddataengService;

	/**
	 * 显示发动机更变记录列表页面
	 */
	@RequestMapping(value = "/recorddataenglist.do")
	public ModelAndView recorddataenglist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/recorddataeng/recorddataenglist");
		return mv;
	}
	/*
	 * 发动机更变详情页面
	 */
	@RequestMapping(value = "/recorddataengdetail")
	public ModelAndView recorddataengdetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/recorddataeng/recorddataengdetail");
		return mv;
	}
	/*
	 * 根据id查询详情
	 */
	@RequestMapping(value = "/detail.do")
	@ResponseBody
	public Map<String,Object> detail(@RequestParam Map<String,String> reqPara){
		logger.info("页面请求参数: " + reqPara);
		Map<String, Integer> paramMap = Maps.newHashMap();
		String id = reqPara.get("id");
		paramMap.put("id", Integer.parseInt(id));
		Map<String, Object> map = Maps.newHashMap();
		List<RecordDataEng> data = recorddataengService.getRecordDataEngbyid(paramMap);
		map.put("data", data);
		return map;
	}
	/**
	 * 查询发动机更变记录→ 列表
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
		String engSn = reqPara.get("engSn");
		Map<String, String> paramMap = Maps.newHashMap();
		paramMap.put("engSn", engSn);
		PageList<RecordDataEng> pageList = (PageList<RecordDataEng>) recorddataengService.getRecordDataEngList(paramMap,
				pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<RecordDataEng> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 保存或更新发动机更变记录信息
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
		String engSn = reqPara.get("engSn");
		String engSnSap = reqPara.get("engSnSap");
		String engSeries = reqPara.get("engSeries");
		String engType = reqPara.get("engType");
		String engModel = reqPara.get("engModel");
		String engConfig = reqPara.get("engConfig");
		String deliveryMode = reqPara.get("deliveryMode");
		String owner = reqPara.get("owner");
		String codeConfig = reqPara.get("codeConfig");
		String engConfigration = reqPara.get("engConfigration");
		String engPn = reqPara.get("engPn");
		// String userId = reqPara.get("userId");
		String userId = "1";// 暂时默认1
		String date = LocalDateTime.now().toString().replace("T", " ");
		String ctime = date.substring(0, date.indexOf("."));

		RecordDataEng recorddataeng = new RecordDataEng();
		if (id != null) {
			recorddataeng.setId(Integer.parseInt(id));
		}

		recorddataeng.setEngSn(engSn);
		recorddataeng.setEngSnSap(engSnSap);
		recorddataeng.setEngSeries(engSeries);
		recorddataeng.setEngType(engType);
		recorddataeng.setEngModel(engModel);
		recorddataeng.setEngConfig(engConfig);
		recorddataeng.setDeliveryMode(deliveryMode);
		recorddataeng.setOwner(owner);
		recorddataeng.setCodeConfig(codeConfig);
		recorddataeng.setEngConfigration(engConfigration);
		recorddataeng.setEngPn(engPn);
		recorddataeng.setUserId(Integer.parseInt(userId));
		recorddataeng.setCtime(ctime);
		// recorddataengService.saveOrUpdate(recorddataeng);
		return null;
	}

	/**
	 * 删除发动机更变记录信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@Deprecated
	@RequestMapping(value = "/delete.do")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam Map<String, String> reqPara) {
		logger.info("待删除发动机更变记录信息: " + reqPara);
		String id = reqPara.get("id");
		RecordDataEng recorddataeng = new RecordDataEng();
		recorddataeng.setId(Integer.parseInt(id));

		// 删除之前是不是要判断发动机更变记录是否存在？？

		// 这里没做判断, 直接删除
		recorddataengService.delete(recorddataeng);
		return null;
	}

	/**
	 * 根据engSn查询记录
	 */
	@RequestMapping(value = "/getlistbyeng.do")
	@ResponseBody
	public Map<String,Object> getlistbyeng(@RequestParam Map<String, String> reqPara){
		logger.info("页面请求参数: " + reqPara);
		String engSn = reqPara.get("engSn");
		Map<String, String> paramMap = Maps.newHashMap();
		paramMap.put("engSn", engSn);
		List<RecordDataEng> data = recorddataengService.getlistbyeng(paramMap);
		Map<String, Object> map = Maps.newHashMap();
		map.put("data",data);
		return map;
	}
}
