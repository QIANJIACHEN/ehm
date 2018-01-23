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

import com.cea.ehm.bean.EngDeadLineLlp;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.EngDeadLineLlpService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 发动机签发信息
 */
@Controller
@RequestMapping(value = "/manage/engdeadlinellp")
public class EngDeadLineLlpController extends BaseController {
	private Logger logger = Logger.getLogger(EngDeadLineLlpController.class);
	@Autowired
	private EngDeadLineLlpService engdeadlinellpService;

	/**
	 * 显示发动机签发列表页面
	 */
	@RequestMapping(value = "/engdeadlinellplist.do")
	public ModelAndView engdeadlinellplist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/engdeadlinellp/engdeadlinellplist");
		return mv;
	}
	
	/**
	 * 显示发动机签发记录页面
	 */
	@RequestMapping(value = "/engdeadlinellprecord.do")
	public ModelAndView engdeadlinellprecord() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/engdeadlinellp/engdeadlinellprecord");
		return mv;
	}
	
	/**
	 * 显示发动机签发信息页面
	 */
	@RequestMapping(value = "/engdeadlinellpinfo.do")
	public ModelAndView engdeadlinellpinfo() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/engdeadlinellp/engdeadlinellpinfo");
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

		PageList<EngDeadLineLlp> pageList = (PageList<EngDeadLineLlp>) engdeadlinellpService.getEngDeadLineLlpList(paramMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<EngDeadLineLlp> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());

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
		String engSn = reqPara.get("engSn");
		String engId = reqPara.get("engId");
		String deadLineLlp = reqPara.get("deadLineLlp");
		String deadLine211 = reqPara.get("deadLine211");
	
		EngDeadLineLlp engdeadlinellp = new EngDeadLineLlp();
		if(id!=null) {
			engdeadlinellp.setId(Integer.parseInt(id));
		}
		
		engdeadlinellp.setEngSn(engSn);
		engdeadlinellp.setEngId(Integer.parseInt(engId));
		engdeadlinellp.setDeadLineLlp(deadLineLlp);
		engdeadlinellp.setDeadLine211(deadLine211);

		engdeadlinellpService.saveOrUpdate(engdeadlinellp);
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
		EngDeadLineLlp engdeadlinellp = new EngDeadLineLlp();
		engdeadlinellp.setId(Integer.parseInt(id));

		// 删除之前是不是要判断发动机签发是否存在？？

		// 这里没做判断, 直接删除
		engdeadlinellpService.delete(engdeadlinellp);
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
		engdeadlinellpService.createExcel().write(os);

		byte[] content = os.toByteArray();
		InputStream is = new ByteArrayInputStream(content);
		// 设置response参数，可以打开下载页面
		response.reset();
		response.setContentType("application/vnd.ms-excel;charset=utf-8");
		String fileName = "寿命件门限.xlsx";
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
		engdeadlinellpService.process(file);
		return getSuccessMessage();
	}

}
