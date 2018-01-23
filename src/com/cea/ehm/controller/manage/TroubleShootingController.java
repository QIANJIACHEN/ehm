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

import com.cea.ehm.bean.RecordEngReplace;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.RecordEngReplaceService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 排故专家
 */
@Controller
@RequestMapping(value = "/manage/troubleshooting")
public class TroubleShootingController extends BaseController {
	private Logger logger = Logger.getLogger(TroubleShootingController.class);
	@Autowired 
	RecordEngReplaceService recordService;
	
	/**
	 * 显示排故专家列表
	 */
	@RequestMapping(value = "/troublelist.do")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/troubleshooting/troublelist");
		return mv;
	}
	
	/**
	 * 故障记录列表
	 */
	@RequestMapping(value="record.do")
	public ModelAndView record() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/troubleshooting/record");
		return mv;
	}
	@RequestMapping(value="recordinfo.do")
	@ResponseBody
	public Map<String, Object> recordinfo(@RequestParam Map<String, String> ReqData){
		PageBounds pageBounds = handlePageInfoForManage(ReqData);
		String sEcho = ReqData.get("draw");
		Map<String, String> paramMap = Maps.newHashMap();
		PageList<RecordEngReplace> pageList =  (PageList<RecordEngReplace>) recordService.recordinfo(paramMap, pageBounds);
		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<RecordEngReplace> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
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
		recordService.createExcel().write(os);

		byte[] content = os.toByteArray();
		InputStream is = new ByteArrayInputStream(content);
		// 设置response参数，可以打开下载页面
		response.reset();
		response.setContentType("application/vnd.ms-excel;charset=utf-8");

		String fileName = "发动机故障记录.xlsx";
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
	 * excel表格 一键上传 处理发动机故障记录信息
	 * 
	 * @param file
	 * @return
	 */
	@RequestMapping(value = "/inport.do")
	@ResponseBody
	public Map<String, Object> inport(MultipartFile file) {
		recordService.process(file);
		return getSuccessMessage();
	}
}
