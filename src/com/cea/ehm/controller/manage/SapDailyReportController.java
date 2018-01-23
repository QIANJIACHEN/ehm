package com.cea.ehm.controller.manage;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cea.ehm.bean.SapDailyReport;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.SapDailyReportService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 规则参数
 */
@Controller
@RequestMapping(value = "/manage/sapdailyreport")
public class SapDailyReportController extends BaseController {
	private Logger logger = Logger.getLogger(SapDailyReportController.class);
	@Autowired
	private SapDailyReportService sapdailyreportService;

	/**
	 * 显示规则参数列表页面
	 */
	@RequestMapping(value = "/sapdailyreportlist.do")
	public ModelAndView sapdailyreportlist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/sapdailyreport/sapdailyreportlist");
		return mv;
	}
	
	/**
	 * 显示规则参数记录页面
	 */
	@RequestMapping(value = "/sapdailyreportrecord.do")
	public ModelAndView sapdailyreportrecord() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/sapdailyreport/sapdailyreportrecord");
		return mv;
	}
	
	/**
	 * 显示详情
	 */
	@RequestMapping(value = "/sapdailyreportdetail.do")
	public ModelAndView sapdailyreportdetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/sapdailyreport/sapdailyreportdetail");
		return mv;
	}
	
	/**
	 * 显示规则参数信息页面 
	 */
	@RequestMapping(value = "/sapdailyreportinfo.do")
	public ModelAndView sapdailyreportinfo() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/sapdailyreport/sapdailyreportinfo");
		return mv;
	}
	
	

	/**
	 * 查询规则参数→ 列表
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
		String tail = reqPara.get("tail");
		String engSn = reqPara.get("engSn");
		Map<String, String> paramMap = Maps.newHashMap();
		if(tail!=null&&!tail.equals("")) {
			paramMap.put("tail", tail);
		}
		if(engSn!=null&&!engSn.equals("")) {
			paramMap.put("engSn", engSn);
		}
		
		PageList<SapDailyReport> pageList = (PageList<SapDailyReport>) sapdailyreportService.getSapDailyReportList(paramMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<SapDailyReport> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());

		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 保存或更新规则参数信息
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
		Integer duty = Integer.parseInt(reqPara.get("duty"));
		String series = reqPara.get("series");
		Integer planeId = Integer.parseInt(reqPara.get("planeId"));
		String tail = reqPara.get("tail");
		String engPosit = reqPara.get("engPosit");
		Integer engId = Integer.parseInt(reqPara.get("engId"));
		String engPn = reqPara.get("engPn");
		String engSn = reqPara.get("engSn");
		String rating = reqPara.get("rating");
		String config = reqPara.get("config");
		String etsn = reqPara.get("etsn");
		String ecsn = reqPara.get("ecsn");
		String egtm = reqPara.get("egtm");
		String minLlp = reqPara.get("minLlp");
		String remark = reqPara.get("remark");
		Integer isNormal = Integer.parseInt(reqPara.get("isNormal"));
		String deliveryModeMonitoring = reqPara.get("deliveryModeMonitoring");
		String oilMonitoring = reqPara.get("oilMonitoring");
		String vibratopmMonitoring = reqPara.get("vibratopmMonitoring");
		String magneticPluginSpectionReport = reqPara.get("magneticPluginSpectionReport");
		String borescopeReport = reqPara.get("borescopeReport");
		String cnrReport = reqPara.get("cnrReport");
		String acars = reqPara.get("acars");
		String routeOperation = reqPara.get("routeOperation");
		String engOil = reqPara.get("engOil");
		String etops = reqPara.get("etops");
		Integer hHighLand = Integer.parseInt(reqPara.get("hHighLand"));
		String cntrOptr = reqPara.get("cntrOptr");
		String etime = reqPara.get("etime");
		String etsr = reqPara.get("etsr");
		String ecsr = reqPara.get("ecsr");
		String etsi = reqPara.get("etsi");
		String ecsi = reqPara.get("ecsi");
		String etso = reqPara.get("etso");
		String ecso = reqPara.get("ecso");
		String ptime = reqPara.get("ptime");
		//Integer cUserId = Integer.parseInt(reqPara.get("cUserId"));
		Integer cUserId = 1;//暂时不知道怎么取创建人id和更新人id，默认1和2
		//Integer uUserId = Integer.parseInt(reqPara.get("uUserId"));
		Integer uUserId = 2;
		String date = LocalDateTime.now().toString().replace("T", " ");
		String c = date.substring(0, date.indexOf("."));
		String ctime = c;
		String utime = c;
		//String auditor = reqPara.get("auditor");
		//String atime = reqPara.get("atime");
		String auditor = "1";//默认审核人为1
		String atime = c;//默认审核时间为当前时间
		String monPerformanceNo = reqPara.get("monPerformanceNo");
		Integer isHisData = Integer.parseInt(reqPara.get("isHisData"));
		String doc = reqPara.get("doc");
		
		SapDailyReport sapdailyreport = new SapDailyReport();
		if(id!=null) {
			sapdailyreport.setId(Integer.parseInt(id));
		}
		
		
		sapdailyreport.setSeries(series);
		sapdailyreport.setDuty(duty);
		sapdailyreport.setPlaneId(planeId);
		sapdailyreport.setTail(tail);
		sapdailyreport.setEngPosit(engPosit);
		sapdailyreport.setEngId(engId);
		sapdailyreport.setEngSn(engSn);
		sapdailyreport.setEngPn(engPn);
		sapdailyreport.setRating(rating);
		sapdailyreport.setConfig(config);
		sapdailyreport.setEtsn(etsn);
		sapdailyreport.setEcsn(ecsn);
		sapdailyreport.setEgtm(egtm);
		sapdailyreport.setMinLlp(minLlp);
		sapdailyreport.setRemark(remark);
		sapdailyreport.setIsNormal(isNormal);
		sapdailyreport.setDeliveryModeMonitoring(deliveryModeMonitoring);
		sapdailyreport.setOilMonitoring(oilMonitoring);
		sapdailyreport.setVibratopmMonitoring(vibratopmMonitoring);
		sapdailyreport.setMagneticPluginSpectionReport(magneticPluginSpectionReport);
		sapdailyreport.setBorescopeReport(borescopeReport);
		sapdailyreport.setCnrReport(cnrReport);
		sapdailyreport.setAcars(acars);
		sapdailyreport.setRouteOperation(routeOperation);
		sapdailyreport.setEngOil(engOil);
		sapdailyreport.setEtops(etops);
		sapdailyreport.sethHighLand(hHighLand);
		sapdailyreport.setCntrOptr(cntrOptr);
		sapdailyreport.setEtime(etime);
		sapdailyreport.setEtsr(etsr);
		sapdailyreport.setEcsr(ecsr);
		sapdailyreport.setEtsi(etsi);
		sapdailyreport.setEcsi(ecsi);
		sapdailyreport.setEtso(etso);
		sapdailyreport.setEcso(ecso);
		sapdailyreport.setPtime(ptime);
		sapdailyreport.setCtime(ctime);
		
		//if(auditor!=null) {
		//	sapdailyreport.setAuditor(Integer.parseInt(auditor));
		//	sapdailyreport.setAtime(atime);
		//}
		sapdailyreport.setAuditor(Integer.parseInt(auditor));
		sapdailyreport.setAtime(atime);
		sapdailyreport.setcUserId(cUserId);
		sapdailyreport.setuUserId(uUserId);
		sapdailyreport.setUtime(utime);
		
		sapdailyreport.setMonPerformanceNo(monPerformanceNo);
		sapdailyreport.setIsHisData(isHisData);
		sapdailyreport.setDoc(doc);
		sapdailyreportService.saveOrUpdate(sapdailyreport);
		return null;
	}

	/**
	 * 删除规则参数信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/delete.do")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam Map<String, String> reqPara) {
		logger.info("待删除规则参数信息: " + reqPara);
		String id = reqPara.get("id");
		SapDailyReport sapdailyreport = new SapDailyReport();
		sapdailyreport.setId(Integer.parseInt(id));

		// 删除之前是不是要判断规则参数是否存在？？

		// 这里没做判断, 直接删除
		sapdailyreportService.delete(sapdailyreport);
		return null;
	}
	
	/**
	 * excel 表格导出
	 * 
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/export.do")
	@ResponseBody
	public String export(HttpServletResponse response) throws Exception {
		/**
		 * 实现页面下载框
		 */
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		sapdailyreportService.createExcel().write(os);
		
		byte[] content = os.toByteArray();
		InputStream is = new ByteArrayInputStream(content);
		// 设置response参数，可以打开下载页面
		response.reset();
		response.setContentType("application/vnd.ms-excel;charset=utf-8");
		String fileName = "日报数据.xlsx";
		response.setHeader("Content-Disposition",
				"attachment;filename=" + new String(fileName.getBytes(), "iso-8859-1"));
		ServletOutputStream out = response.getOutputStream();
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			bis = new BufferedInputStream(is);
			bos = new BufferedOutputStream(out);
			byte[] buff = new byte[2048];
			int bytesRead;
			// Simple read/write loop.
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
		} catch (final IOException e) {
			logger.debug(e);
		} finally {
			if (bis != null)
				bis.close();
			if (bos != null)
				bos.close();
		}
		return null;
	}
	
	/**
	 * excel表格 一键上传 处理飞机数据信息
	 * 
	 * @param file
	 * @return
	 */
	@RequestMapping(value = "/inport.do")
	@ResponseBody
	public Map<String, Object> inport(MultipartFile file) {
		sapdailyreportService.process(file);
		return getSuccessMessage();
	}
	
	/**
	 * 
	 * 获取日报详情根据id
	 * @return
	 */
	@RequestMapping(value = "/info.do")
	@ResponseBody
	public Map<String, Object> info(@RequestParam Map<String, String> reqPara) {
		Map<String, Integer> paramMap = Maps.newHashMap();
		logger.info("待查询信息: " + reqPara);
		String id = reqPara.get("id");
		paramMap.put("id", Integer.parseInt(id));
		List<SapDailyReport> data = sapdailyreportService.getSapDailyDetail(paramMap);
		return getSuccessData(data, "");
	}
	
}
