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

import com.cea.ehm.bean.DataEng;
import com.cea.ehm.bean.DataIdPlug;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.DataEngService;
import com.cea.ehm.service.DataIdPlugService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;

/**
 * IDPLUG数据控制层
 */
@Controller
@RequestMapping(value = "/manage/dataidplug")
public class DataIdPlugController extends BaseController {
	private Logger logger = Logger.getLogger(DataIdPlugController.class);
	@Autowired
	private DataIdPlugService dataIdPlugService;
	@Autowired
	private DataEngService dataEngService;

	/**
	 * 显示IDPLUG数据列表页面
	 */
	@RequestMapping(value = "/dataidpluglist.do")
	public ModelAndView dataidpluglist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/dataidplug/dataidpluglist");
		return mv;
	}

	/**
	 * 查询 IDPLUG数据信息 → 列表
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
		Map<String, String> paramMap = Maps.newHashMap();

		PageList<DataIdPlug> pageList = (PageList<DataIdPlug>) dataIdPlugService.getDataIdPlugList(paramMap,
				pageBounds);
		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<DataIdPlug> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 保存 IDPLUG数据 信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/save.do")
	@ResponseBody
	public Map<String, Object> save(@RequestParam Map<String, String> reqPara) {
		DataIdPlug dataIdPlug = getDataIdPlug(reqPara);
		dataIdPlugService.save(dataIdPlug);
		return getSuccessMessage();
	}

	/**
	 * 更新 IDPLUG数据 信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/update.do")
	@ResponseBody
	public Map<String, Object> update(@RequestParam Map<String, String> reqPara) {
		DataIdPlug dataIdPlug = getDataIdPlug(reqPara);
		dataIdPlugService.update(dataIdPlug);
		return getSuccessMessage();
	}

	/**
	 * 删除 IDPLUG数据 信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/delete.do")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam Map<String, String> reqPara) {
		String id = reqPara.get("id");
		DataIdPlug dataIdPlug = new DataIdPlug();
		dataIdPlug.setId(Integer.parseInt(id));
		dataIdPlugService.delete(dataIdPlug);
		return getSuccessMessage();
	}

	/**
	 * 获取待编辑的IDPLUG数据信息
	 * 
	 * @param reqPara
	 * @return
	 */
	public DataIdPlug getDataIdPlug(Map<String, String> reqPara) {
		logger.info("待编辑IDPLUG数据信息: " + reqPara);
		String id = reqPara.get("id");
		String engId = reqPara.get("engId");
		String rating = reqPara.get("rating");
		String planeType = reqPara.get("planeType");
		String idPlugPn = reqPara.get("idPlugPn");

		DataEng dataEng = new DataEng();
		dataEng.setId(Integer.parseInt(engId));
		DataEng dataEngTwo = dataEngService.selectTwo(dataEng);

		DataIdPlug dataIdPlug = new DataIdPlug();
		if (!Strings.isNullOrEmpty(id)) {
			dataIdPlug.setId(Integer.parseInt(id));
		}
		dataIdPlug.setEngId(Integer.parseInt(engId));
		dataIdPlug.setEngPn(dataEngTwo.getEngPn());
		dataIdPlug.setEngModel(dataEngTwo.getEngModel());
		dataIdPlug.setConfig(dataEngTwo.getEngConfig());
		dataIdPlug.setRating(rating);
		dataIdPlug.setPlaneType(planeType);
		dataIdPlug.setIdPlugPn(idPlugPn);

		return dataIdPlug;
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
		dataIdPlugService.createExcel().write(os);

		byte[] content = os.toByteArray();
		InputStream is = new ByteArrayInputStream(content);
		// 设置response参数，可以打开下载页面
		response.reset();
		response.setContentType("application/vnd.ms-excel;charset=utf-8");

		String fileName = "IDPLUG数据.xlsx";
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
	 * excel表格 一键上传 处理发动机数据信息
	 * 
	 * @param file
	 * @return
	 */
	@RequestMapping(value = "/inport.do")
	@ResponseBody
	public Map<String, Object> inport(MultipartFile file) {
		dataIdPlugService.process(file);
		return getSuccessMessage();
	}
}
