package com.cea.ehm.controller.manage;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
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

import com.cea.ehm.bean.ControlFleetEngSpare;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.ControlFleetEngSpareService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;

/* *
 * 发动机维修控制器
 */
@Controller
@RequestMapping(value = "manage/controlfleetengspare")
public class ControlFleetEngSpareController extends BaseController {
	private Logger logger = Logger.getLogger(ControlFleetPlaneController.class);

	@Autowired
	private ControlFleetEngSpareService controlfleetengspareService;

	/*
	 * * 显示发动机维修列表界面
	 */
	@RequestMapping(value = "/fleetengsparelist.do")
	public ModelAndView controFleetEngSpareList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manage/controlfleetengspare/controfleetengsparelist");
		return mv;
	}

	/**
	 * 查询发动机维修
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/list.do")
	@ResponseBody
	public Map<String, Object> list(@RequestParam Map<String, String> reqPara) {
		logger.info("页面请求参数：" + reqPara);
		PageBounds pageBounds = handlePageInfoForManage(reqPara);
		String sEcho = reqPara.get("draw");

		// 条件参数
		String engSn = reqPara.get("engSn");
		Map<String, String> paraMap = Maps.newHashMap();
		paraMap.put("engSn", engSn);

		PageList<ControlFleetEngSpare> pageList = (PageList<ControlFleetEngSpare>) controlfleetengspareService
				.getdatacontrolfleetengspareList(paraMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<ControlFleetEngSpare> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/*
	 * 获取发动机维修的数据
	 * 
	 * @param reqPara
	 * 
	 * @return
	 */
	public ControlFleetEngSpare getControlFleetEngSpare(Map<String, String> reqPara) {
		logger.info("获取到的发动机维修信息：" + reqPara);

		String id = reqPara.get("id");
		String engId = reqPara.get("engId");
		String engSn = reqPara.get("engSn");
		String removeDate = reqPara.get("removeDate");
		String condition = reqPara.get("condition");
		String installPlan = reqPara.get("installPlan");
		String llpSap = reqPara.get("llpSap");
		String configAccess = reqPara.get("configAccess");
		String remark = reqPara.get("remark");

		ControlFleetEngSpare controlFleetEngSpare = new ControlFleetEngSpare();

		if (!Strings.isNullOrEmpty(id)) {
			controlFleetEngSpare.setId(Integer.parseInt(id));
		}
		if (!Strings.isNullOrEmpty(engId)) {
			controlFleetEngSpare.setEngId(Integer.parseInt(engId));
		}

		controlFleetEngSpare.setEngSn(engSn);
		controlFleetEngSpare.setRemoveDate(removeDate);
		controlFleetEngSpare.setCondition(condition);
		controlFleetEngSpare.setInstallPlan(installPlan);
		controlFleetEngSpare.setLlpSap(llpSap);
		controlFleetEngSpare.setConfigAccess(configAccess);
		controlFleetEngSpare.setRemark(remark);
		return controlFleetEngSpare;
	}

	/*
	 * 保存发动机维修信息
	 * 
	 * @param reqPara
	 * 
	 * @return
	 */
	@RequestMapping(value = "/save.do")
	@ResponseBody
	public Map<String, Object> save(@RequestParam Map<String, String> reqPara) {
		ControlFleetEngSpare controlFleetEngSpare = getControlFleetEngSpare(reqPara);
		// ControlFleetEngSpare selectControlFleetEngSpare =
		// controlfleetengspareService.select(controlFleetEngSpare);
		controlfleetengspareService.save(controlFleetEngSpare);
		return getSuccessMessage();
	}

	/**
	 * 更新发动机维修数据信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/update.do")
	@ResponseBody
	public Map<String, Object> update(@RequestParam Map<String, String> reqPara) {
		ControlFleetEngSpare controlFleetEngSpare = getControlFleetEngSpare(reqPara);
		controlfleetengspareService.update(controlFleetEngSpare);
		return getSuccessMessage();
	}

	/*
	 * 删除发动机维修信息
	 * 
	 * @param reqPara
	 * 
	 * @return
	 */
	@RequestMapping(value = "/delete.do")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam Map<String, String> reqPara) {
		logger.info("待删除飞机发动机关联信息: " + reqPara);
		String id = reqPara.get("id");
		ControlFleetEngSpare controlFleetEngSpare = new ControlFleetEngSpare();
		controlFleetEngSpare.setId(Integer.parseInt(id));
		// 这里没做判断, 直接删除
		controlfleetengspareService.delete(controlFleetEngSpare);
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
		controlfleetengspareService.createExcel().write(os);

		byte[] content = os.toByteArray();
		InputStream is = new ByteArrayInputStream(content);
		// 设置response参数，可以打开下载页面
		response.reset();
		response.setContentType("application/vnd.ms-excel;charset=utf-8");
		String fileName = "发动机维修记录.xlsx";
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
	 * excel表格 一键上传 处理发动机维修数据信息
	 * 
	 * @param file
	 * @return
	 */
	@RequestMapping(value = "/inport.do")
	@ResponseBody
	public Map<String, Object> inport(MultipartFile file) {
		controlfleetengspareService.process(file);
		return getSuccessMessage();
	}

}
