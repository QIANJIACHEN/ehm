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

import com.cea.ehm.bean.LlpActivity;
import com.cea.ehm.bean.LlpHistory;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.LlpActivityService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 故障信息
 */
@Controller
@RequestMapping(value = "/manage/llpactivity")
public class LlpActivityController extends BaseController {
	private Logger logger = Logger.getLogger(LlpActivityController.class);
	@Autowired
	private LlpActivityService llpactivityService;
	/**
	 * 显示故障列表页面
	 */
	@RequestMapping(value = "/llpactivitylist.do")
	public ModelAndView llpactivitylist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/llpactivity/llpactivitylist");
		return mv;
	}
	
	/**
	 * 显示故障添加/编辑
	 */
	@RequestMapping(value = "/llpactivityadd.do")
	public ModelAndView llpactivityadd() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/llpactivity/llpactivityadd");
		return mv;
	}
	
	/**
	 * 显示故障信息页面
	 */
	@RequestMapping(value = "/llpactivityinfo.do")
	public ModelAndView llpactivityinfo() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/llpactivity/llpactivityinfo");
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
		paramMap.put("engSn", key);

		PageList<LlpActivity> pageList = (PageList<LlpActivity>) llpactivityService.getLlpActivityList(paramMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<LlpActivity> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());

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
		String engSn = reqPara.get("engSn");
		String iin = reqPara.get("iin");
		String llpPn = reqPara.get("llpPn");
		String llpSn = reqPara.get("planeType");
		String planeType = reqPara.get("planeType");
		String engPn = reqPara.get("engPn");
		String onDate = reqPara.get("onDate");
		String onEtsn = reqPara.get("onEtsn");
		String onEcsn = reqPara.get("onEcsn");
		String onPtsn = reqPara.get("onPtsn");
		String onPcsn = reqPara.get("onPcsn");
		String limitSpecial = reqPara.get("limitSpecial");
		String remark = reqPara.get("remark");
		String date = LocalDateTime.now().toString().replace("T", " ");
		String c = date.substring(0, date.indexOf("."));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date ctime = sdf.parse(c);
		LlpActivity llpactivity = new LlpActivity();
		llpactivity.setId(id);
		llpactivity.setEngSn(engSn);
		llpactivity.setIin(iin);
		llpactivity.setLlpPn(llpPn);
		llpactivity.setLlpSn(llpSn);
		llpactivity.setPlaneType(planeType);
		llpactivity.setEngPn(engPn);
		llpactivity.setOnDate(onDate);
		llpactivity.setOnEtsn(onEtsn);
		llpactivity.setOnEcsn(onEcsn);
		llpactivity.setOnPtsn(onPtsn);
		llpactivity.setOnPcsn(onPcsn);
		llpactivity.setLimitSpecial(limitSpecial);
		llpactivity.setRemark(remark);
		llpactivity.setCtime(ctime);
		llpactivityService.saveOrUpdate(llpactivity);
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
		LlpActivity llpactivity = new LlpActivity();
		llpactivity.setId(id);

		// 删除之前是不是要判断故障是否存在？？

		// 这里没做判断, 直接删除
		llpactivityService.delete(llpactivity);
		return null;
	}
	
	
	//LLP历史页面
	@RequestMapping(value = "/llphistorylist.do")
	public ModelAndView llphistorylist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/llpactivity/llphistorylist");
		return mv;
	}
	//LLP历史列表数据
	@RequestMapping(value="llphistory.do")
	@ResponseBody
	public Map<String, Object> llphistory(@RequestParam Map<String, String> reqPara) {
		PageBounds pageBounds = handlePageInfoForManage(reqPara);
		// ？？
		String sEcho = reqPara.get("draw");
		// 条件参数
		String key = reqPara.get("key");
		Map<String, String> paramMap = Maps.newHashMap();
		paramMap.put("engSnUsed", key);

		PageList<LlpHistory> pageList = (PageList<LlpHistory>) llpactivityService.getLlpHistoryList(paramMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<LlpHistory> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());

		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}
	//LLP历史添加和修改
	@RequestMapping(value="llphistoryaddupdata.do")
	@ResponseBody
	public void llphistoryaddupdata(@RequestParam Map<String, String> reqPara) {
		Integer type = Integer.parseInt(reqPara.get("type"));
		Integer id = 0;
		if(type == 2) {
			id = Integer.parseInt(reqPara.get("id"));
		}
		String engSnUsed = reqPara.get("engSnUsed");
		String iin = reqPara.get("iin");
		String llpPn = reqPara.get("llpPn");
		String llpSn = reqPara.get("llpSn");
		String planeType = reqPara.get("planeType");
		String engPn = reqPara.get("engPn");
		String onData = reqPara.get("onDate");
		String onEtsn = reqPara.get("onEtsn");
		String onEcsn = reqPara.get("onEcsn");
		String onPtsn = reqPara.get("onPtsn");
		String onPcsn = reqPara.get("onPcsn");
		String offData = reqPara.get("offDate");
		String offEtsn = reqPara.get("offEtsn");
		String offEcsn = reqPara.get("offEcsn");
		String offPtsn = reqPara.get("offPtsn");
		String offPcsn = reqPara.get("offPcsn");
		String limitSpecial = reqPara.get("limitSpecial");
		String remark = reqPara.get("remark");
		LlpHistory lh = new LlpHistory();
		if(type == 2) {
			lh.setId(id);
		}
		lh.setIin(iin);
		lh.setLlpPn(llpPn);
		lh.setLlpSn(llpSn);
		lh.setPlaneType(planeType);
		lh.setEngPn(engPn);
		lh.setEngSnUsed(engSnUsed);
		lh.setOnDate(onData);
		lh.setOnEcsn(onEcsn);
		lh.setOnEtsn(onEtsn);
		lh.setOnPcsn(onPcsn);
		lh.setOnPtsn(onPtsn);
		lh.setOffDate(offData);
		lh.setOffEcsn(offEcsn);
		lh.setOffEtsn(offEtsn);
		lh.setOffPcsn(offPcsn);
		lh.setOffPtsn(offPtsn);
		lh.setLimitSpecial(limitSpecial);
		lh.setRemark(remark);
		if(type == 1) {
			llpactivityService.addHistory(lh);
		}else {
			llpactivityService.editHistory(lh);
		}
	}
	@RequestMapping(value="deletehistory.do")
	@ResponseBody
	public void deletehistory(@RequestParam Map<String, String> reqPara) {
		Integer id = Integer.parseInt(reqPara.get("id"));
		LlpHistory lh = new LlpHistory();
		lh.setId(id);
		llpactivityService.deletehistory(lh);
	}
}

