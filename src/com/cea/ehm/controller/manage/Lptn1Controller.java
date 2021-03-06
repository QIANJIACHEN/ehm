package com.cea.ehm.controller.manage;

import java.time.LocalDateTime;
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

import com.cea.ehm.bean.Lptn1Activity;
import com.cea.ehm.bean.Lptn1History;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.Lptn1Service;
import com.cea.ehm.util.ConstantUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * Lptn1
 */
@Controller
@RequestMapping(value = "/manage/lptn1")
public class Lptn1Controller extends BaseController {
	private Logger logger = Logger.getLogger(Lptn1Controller.class);
	@Autowired
	private Lptn1Service lptn1Service;

	/**
	 * lptn1_activity 列表页面
	 * 
	 * @return
	 **/
	@RequestMapping(value = "lptn1activitylist.do")
	public ModelAndView lptn1activitylist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/lptn1/lptn1activitylist");
		return mv;
	}

	/**
	 * lptn1_activity 数据
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/lptn1activity.do")
	@ResponseBody
	public Map<String, Object> lptn1activity(@RequestParam Map<String, String> reqPara) {
		logger.info("页面请求参数: " + reqPara);
		PageBounds pageBounds = handlePageInfoForManage(reqPara);
		String sEcho = reqPara.get("draw");
		Map<String, String> paramMap = Maps.newHashMap();
		// 条件参数
		String engSn = reqPara.get("engSn");
		paramMap.put("engSn", engSn);
		PageList<Lptn1Activity> pageList = (PageList<Lptn1Activity>) lptn1Service.getLptn1ActivityList(paramMap,
				pageBounds);
		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<Lptn1Activity> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 获取 lptn1Activity 信息
	 * 
	 * @param reqData
	 * @return
	 */
	public Lptn1Activity getLptn1Activity(Map<String, String> reqPara) {
		logger.info("待编辑信息: " + reqPara);

		String id = reqPara.get("id");
		String engSn = reqPara.get("engSn");
		String lptn1Pn = reqPara.get("lptn1Pn");
		String lptn1Sn = reqPara.get("lptn1Sn");
		String engPn = reqPara.get("engPn");
		String onDate = reqPara.get("onDate");
		String onEtsn = reqPara.get("onEtsn");
		String onEcsn = reqPara.get("onEcsn");
		String onPtsn = reqPara.get("onPtsn");
		String onPcsn = reqPara.get("onPcsn");
		String limitSpecial = reqPara.get("limitSpecial");
		String code = reqPara.get("code");
		String remark = reqPara.get("remark");

		Lptn1Activity lptn1Activity = new Lptn1Activity();
		if (id != null) {
			lptn1Activity.setId(Integer.parseInt(id));
		}
		lptn1Activity.setEngSn(engSn);
		lptn1Activity.setLptn1Pn(lptn1Pn);
		lptn1Activity.setLptn1Sn(lptn1Sn);
		lptn1Activity.setEngPn(engPn);
		lptn1Activity.setOnDate(onDate);
		lptn1Activity.setOnEtsn(onEtsn);
		lptn1Activity.setOnEcsn(onEcsn);
		lptn1Activity.setOnPtsn(onPtsn);
		lptn1Activity.setOnPcsn(onPcsn);
		lptn1Activity.setLimitSpecial(limitSpecial);
		lptn1Activity.setCode(code);
		lptn1Activity.setRemark(remark);
		String date = LocalDateTime.now().toString().replace("T", " ");
		String time = date.substring(0, date.indexOf("."));
		lptn1Activity.setCtime(time);
		return lptn1Activity;
	}

	/**
	 * lptn1_activity 添加
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/saveLptn1Activity.do")
	@ResponseBody
	public Map<String, Object> saveLptn1Activity(@RequestParam Map<String, String> reqPara) {
		Lptn1Activity lptn1Activity = getLptn1Activity(reqPara);
		Lptn1Activity selectLptn1Activity = lptn1Service.selectLptn1Activity(lptn1Activity);
		if (selectLptn1Activity != null) {
			return getFailureMessage(ConstantUtil.RES_MSG_EXIST, 1);
		}
		lptn1Service.saveLptn1Activity(lptn1Activity);
		return getSuccessMessage();
	}

	/**
	 * lptn1_activity 修改
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/updateLptn1Activity.do")
	@ResponseBody
	public Map<String, Object> updateLptn1Activity(@RequestParam Map<String, String> reqPara) {
		Lptn1Activity lptn1Activity = getLptn1Activity(reqPara);
		lptn1Service.updateLptn1Activity(lptn1Activity);
		return getSuccessMessage();
	}

	/**
	 * lptn1_activity 删除
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/deleteLptn1Activity.do")
	@ResponseBody
	public Map<String, Object> deleteLptn1Activity(@RequestParam Map<String, String> reqPara) {
		Integer id = Integer.parseInt(reqPara.get("id"));
		Lptn1Activity lptn1Activity = new Lptn1Activity();
		lptn1Activity.setId(id);
		lptn1Service.deleteLptn1Activity(lptn1Activity);
		return getSuccessMessage();
	}

	/**
	 * *** ( lptn1_history ) ***
	 */

	/**
	 * lptn1history 列表页面
	 * 
	 * @return
	 **/
	@RequestMapping(value = "lptn1historylist.do")
	public ModelAndView lptn1historylist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/lptn1/lptn1historylist");
		return mv;
	}

	/**
	 * lptn1_history数据
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/lptn1history.do")
	@ResponseBody
	public Map<String, Object> lptn1history(@RequestParam Map<String, String> reqPara) {
		logger.info("页面请求参数: " + reqPara);
		PageBounds pageBounds = handlePageInfoForManage(reqPara);
		String sEcho = reqPara.get("draw");
		Map<String, String> paramMap = Maps.newHashMap();
		// 条件参数
		String engSnUsed = reqPara.get("engSnUsed");
		paramMap.put("engSnUsed", engSnUsed);
		PageList<Lptn1History> pageList = (PageList<Lptn1History>) lptn1Service.getLptn1HistoryList(paramMap,
				pageBounds);
		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<Lptn1History> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 获取 lptn1History 信息
	 * 
	 * @param reqData
	 * @return
	 */
	public Lptn1History getLptn1History(Map<String, String> reqPara) {
		logger.info("待编辑信息: " + reqPara);

		String id = reqPara.get("id");
		String engSnUsed = reqPara.get("engSnUsed");
		String lptn1Pn = reqPara.get("lptn1Pn");
		String lptn1Sn = reqPara.get("lptn1Sn");
		String engPn = reqPara.get("engPn");
		String onDate = reqPara.get("onDate");
		String onEtsn = reqPara.get("onEtsn");
		String onEcsn = reqPara.get("onEcsn");
		String onPtsn = reqPara.get("onPtsn");
		String onPcsn = reqPara.get("onPcsn");
		String offDate = reqPara.get("offDate");
		String offEtsn = reqPara.get("offEtsn");
		String offEcsn = reqPara.get("offEcsn");
		String offPtsn = reqPara.get("offPtsn");
		String offPcsn = reqPara.get("offPcsn");
		String limitSpecial = reqPara.get("limitSpecial");
		String code = reqPara.get("code");
		String remark = reqPara.get("remark");

		Lptn1History lptn1History = new Lptn1History();
		if (id != null) {
			lptn1History.setId(Integer.parseInt(id));
		}
		lptn1History.setEngSnUsed(engSnUsed);
		lptn1History.setLptn1Pn(lptn1Pn);
		lptn1History.setLptn1Sn(lptn1Sn);
		lptn1History.setEngPn(engPn);
		lptn1History.setOnDate(onDate);
		lptn1History.setOnEtsn(onEtsn);
		lptn1History.setOnEcsn(onEcsn);
		lptn1History.setOnPtsn(onPtsn);
		lptn1History.setOnPcsn(onPcsn);
		lptn1History.setOffDate(offDate);
		lptn1History.setOffEtsn(offEtsn);
		lptn1History.setOffEcsn(offEcsn);
		lptn1History.setOffPtsn(offPtsn);
		lptn1History.setOffPcsn(offPcsn);
		lptn1History.setLimitSpecial(limitSpecial);
		lptn1History.setCode(code);
		lptn1History.setRemark(remark);
		String date = LocalDateTime.now().toString().replace("T", " ");
		String time = date.substring(0, date.indexOf("."));
		lptn1History.setCtime(time);
		return lptn1History;
	}

	/**
	 * lptn1_history 添加
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/saveLptn1History.do")
	@ResponseBody
	public Map<String, Object> saveLptn1History(@RequestParam Map<String, String> reqPara) {
		Lptn1History lptn1History = getLptn1History(reqPara);
		Lptn1History selectLptn1History = lptn1Service.selectLptn1History(lptn1History);
		if (selectLptn1History != null) {
			return getFailureMessage(ConstantUtil.RES_MSG_EXIST, 1);
		}
		lptn1Service.saveLptn1History(lptn1History);
		return getSuccessMessage();
	}

	/**
	 * lptn1_history 修改
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/updateLptn1History.do")
	@ResponseBody
	public Map<String, Object> updateLptn1History(@RequestParam Map<String, String> reqPara) {
		Lptn1History lptn1History = getLptn1History(reqPara);
		lptn1Service.updateLptn1History(lptn1History);
		return getSuccessMessage();
	}

	/**
	 * lptn1_history 删除
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/deleteLptn1History.do")
	@ResponseBody
	public Map<String, Object> deleteLptn1History(@RequestParam Map<String, String> reqPara) {
		Integer id = Integer.parseInt(reqPara.get("id"));
		Lptn1History lptn1History = new Lptn1History();
		lptn1History.setId(id);
		lptn1Service.deleteLptn1History(lptn1History);
		return getSuccessMessage();
	}

}
