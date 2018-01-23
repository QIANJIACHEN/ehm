package com.cea.ehm.controller.manage;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
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

import com.cea.ehm.bean.FleetEng;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.FleetEngService;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 发动机备发信息
 */
@Controller
@RequestMapping(value = "/manage/fleeteng")
public class FleetEngController extends BaseController {
	private Logger logger = Logger.getLogger(FleetEngController.class);
	@Autowired
	private FleetEngService fleetengService;

	/**
	 * 显示发动机备发列表页面
	 */
	@RequestMapping(value = "/fleetenglist.do")
	public ModelAndView fleetenglist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/fleeteng/fleetenglist");
		return mv;
	}
	
	/**
	 * 显示发动机备发添加/编辑
	 */
	@RequestMapping(value = "/fleetengadd.do")
	public ModelAndView fleetengadd() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/fleeteng/fleetengadd");
		return mv;
	}
	
	/**
	 * 显示发动机备发信息页面
	 */
	@RequestMapping(value = "/fleetenginfo.do")
	public ModelAndView fleetenginfo() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/fleeteng/fleetenginfo");
		return mv;
	}

	/**
	 * 查询发动机备发→ 列表
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

		PageList<FleetEng> pageList = (PageList<FleetEng>) fleetengService.getFleetEngList(paramMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<FleetEng> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());

		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 保存或更新发动机备发信息
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
		String tail = reqPara.get("tail");
		String planeId = reqPara.get("planeId");
		String engPosition = reqPara.get("engPosition");
		String engSn = reqPara.get("engSn");
		String engId = reqPara.get("engId");
		String engPn = reqPara.get("engPn");
		
		FleetEng fleeteng = new FleetEng();
		if(id!=null) {
			fleeteng.setId(Integer.parseInt(id));
		}
		
		fleeteng.setEngSn(engSn);
		fleeteng.setTail(tail);
		if(planeId!=null) {
			fleeteng.setPlaneId(Integer.parseInt(planeId));
		}
		if(engPosition!=null) {
			fleeteng.setEngPosition(Integer.parseInt(engPosition));
		}
		
		fleeteng.setEngSn(engSn);
		if(engId!=null) {
			fleeteng.setEngId(Integer.parseInt(engId));
		}
		
		fleeteng.setEngPn(engPn);
		fleetengService.saveOrUpdate(fleeteng);
		return null;
	}

	/**
	 * 删除发动机备发信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/delete.do")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam Map<String, String> reqPara) {
		logger.info("待删除发动机备发信息: " + reqPara);
		String id = reqPara.get("id");
		FleetEng fleeteng = new FleetEng();
		fleeteng.setId(Integer.parseInt(id));

		// 删除之前是不是要判断发动机备发是否存在？？

		// 这里没做判断, 直接删除
		fleetengService.delete(fleeteng);
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
		fleetengService.createExcel().write(os);

		byte[] content = os.toByteArray();
		InputStream is = new ByteArrayInputStream(content);
		// 设置response参数，可以打开下载页面
		response.reset();
		response.setContentType("application/vnd.ms-excel;charset=utf-8");
		String fileName = "机队清单.xlsx";
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
		fleetengService.process(file);
		return getSuccessMessage();
	}

}

