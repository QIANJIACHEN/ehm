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

import com.cea.ehm.bean.EngFleet;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.EngFleetService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 发动机签发信息
 */
@Controller
@RequestMapping(value = "/manage/engfleet")
public class EngFleetController extends BaseController {
	private Logger logger = Logger.getLogger(EngFleetController.class);
	@Autowired
	private EngFleetService engfleetService;

	/**
	 * 显示发动机签发列表页面
	 */
	@RequestMapping(value = "/engfleetlist.do")
	public ModelAndView engfleetlist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/engfleet/engfleetlist");
		return mv;
	}
	
	/**
	 * 显示发动机签发记录页面
	 */
	@RequestMapping(value = "/engfleetrecord.do")
	public ModelAndView engfleetrecord() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/engfleet/engfleetrecord");
		return mv;
	}
	
	/**
	 * 显示发动机签发信息页面
	 */
	@RequestMapping(value = "/engfleetinfo.do")
	public ModelAndView engfleetinfo() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/engfleet/engfleetinfo");
		return mv;
	}

	/**
	 * 查询发动机签发→ 列表
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

		PageList<EngFleet> pageList = (PageList<EngFleet>) engfleetService.getEngFleetList(paramMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<EngFleet> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());

		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 保存或更新发动机签发信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/saveOrUpdate.do")
	@ResponseBody
	public Map<String, Object> saveOrUpdate(@RequestParam Map<String, String> reqPara) {
		logger.info("待编辑用户信息: " + reqPara);
		String id = reqPara.get("id");
		String duty = reqPara.get("duty");
		String modle = reqPara.get("modle");
		String tail = reqPara.get("tail");
		String engPosit = reqPara.get("engPosit");
		String engSn = reqPara.get("engSn");
		String engPn = reqPara.get("engPn");
		String rating = reqPara.get("rating");
		String configPlane = reqPara.get("configPlane");
		String llpLifeTime = reqPara.get("llpLifeTime");
		String etsn = reqPara.get("etsn");
		String ecsn = reqPara.get("ecsn");
		String svTime = reqPara.get("svTime");
		String inTime = reqPara.get("inTime");
		String tsi = reqPara.get("tsi");
		String csi = reqPara.get("csi");
		String tsr = reqPara.get("tsr");
		String csr = reqPara.get("csr");
		String tso = reqPara.get("tso");
		String cso = reqPara.get("cso");
		String llp211sb = reqPara.get("llp211sb");
		String hptbLifeTime = reqPara.get("hptbLifeTime");
		String engLifeTime = reqPara.get("engLifeTime");
		String uninstallTime = reqPara.get("uninstallTime");
		String remark = reqPara.get("remark");
		String date = LocalDateTime.now().toString().replace("T", " ");
		String time = date.substring(0, date.indexOf("."));
		EngFleet engfleet = new EngFleet();
		if(id!=null) {
			engfleet.setId(Integer.parseInt(id));
		}
		
		engfleet.setCtime(time);
		engfleet.setDuty(Integer.parseInt(duty));
		engfleet.setModle(modle);
		engfleet.setTail(tail);
		engfleet.setEngPosit(engPosit);
		engfleet.setEngSn(engSn);
		engfleet.setEngPn(engPn);
		engfleet.setRating(rating);
		engfleet.setConfigPlane(configPlane);
		engfleet.setLlpLifeTime(llpLifeTime);
		engfleet.setEtsn(etsn);
		engfleet.setEcsn(ecsn);
		engfleet.setSvTime(svTime);
		engfleet.setInTime(inTime);
		engfleet.setTsi(tsi);
		engfleet.setCsi(csi);
		engfleet.setTsr(tsr);
		engfleet.setCsr(csr);
		engfleet.setTso(tso);
		engfleet.setCso(cso);
		engfleet.setLlp211sb(llp211sb);
		engfleet.setHptbLifeTime(hptbLifeTime);
		engfleet.setEngLifeTime(engLifeTime);
		engfleet.setUninstallTime(uninstallTime);
		engfleet.setRemark(remark);
		engfleetService.saveOrUpdate(engfleet);
		return null;
	}

	/**
	 * 删除发动机签发信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/delete.do")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam Map<String, String> reqPara) {
		logger.info("待删除发动机签发信息: " + reqPara);
		String id = reqPara.get("id");
		EngFleet engfleet = new EngFleet();
		engfleet.setId(Integer.parseInt(id));

		// 删除之前是不是要判断发动机签发是否存在？？

		// 这里没做判断, 直接删除
		engfleetService.delete(engfleet);
		return null;
	}
	
}
