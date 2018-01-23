package com.cea.ehm.controller.manage;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
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
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.DataEngService;
import com.cea.ehm.service.RecordDataEngService;
import com.cea.ehm.util.ConstantUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;

/**
 * 发动机信息控制层
 */
@Controller
@RequestMapping(value = "/manage/dataeng")
public class DataEngController extends BaseController {
	private Logger logger = Logger.getLogger(DataEngController.class);

	@Autowired
	private DataEngService engService;
	@Autowired
	private RecordDataEngService recordService;

	/**
	 * 显示发动机信息列表页面
	 */
	@RequestMapping(value = "/dataenglist.do")
	public ModelAndView dataenglist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/dataeng/dataenglist");
		return mv;
	}

	/**
	 * 显示发动机信息详情页面
	 */
	@RequestMapping(value = "/dataenglistdetail.do")
	public ModelAndView dataenglistdetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/dataeng/dataenglistdetail");
		return mv;
	}

	/**
	 * 根据engSn获取发动机信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/info.do")
	@ResponseBody
	public Map<String, Object> info(@RequestParam Map<String, String> reqPara) {
		logger.info("页面请求参数: " + reqPara);
		Map<String, String> paramMap = Maps.newHashMap();

		// 根据engSn来查吧
		String engSn = reqPara.get("engSn");
		paramMap.put("engSn", engSn);
		List<DataEng> data = engService.engInfo(paramMap);

		return getSuccessData(data, "");
	}

	/**
	 * 查询发动机信息 → 列表
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

		PageList<DataEng> pageList = (PageList<DataEng>) engService.getdataengList(paramMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<DataEng> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 保存发动机信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/save.do")
	@ResponseBody
	public Map<String, Object> save(@RequestParam Map<String, String> reqPara) {
		DataEng dataEng = getDataEng(reqPara);
		DataEng selectDataEng = engService.select(dataEng);
		if (selectDataEng != null) {
			return getFailureMessage(ConstantUtil.RES_MSG_EXIST, 1);
		}
		engService.save(dataEng);
		return getSuccessMessage();
	}

	/**
	 * 更新发动机信息
	 * 
	 * @param reqPara
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/update.do")
	@ResponseBody
	public Map<String, Object> update(@RequestParam Map<String, String> reqPara, HttpServletRequest request) {
		DataEng dataEng = getDataEng(reqPara);
		// 更新前的数据， 插入属性变更记录中
		DataEng oldEng = engService.selectTwo(dataEng);
		recordService.save(oldEng, request);
		engService.update(dataEng);
		return getSuccessMessage();
	}

	/**
	 * 删除发动机信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/delete.do")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam Map<String, String> reqPara) {
		logger.info("待删除发动机信息: " + reqPara);
		String id = reqPara.get("id");
		DataEng dataeng = new DataEng();
		dataeng.setId(Integer.parseInt(id));
		engService.delete(dataeng);
		return getSuccessMessage();
	}

	/**
	 * 获取待编辑的发动机信息
	 * 
	 * @param reqPara
	 * @return
	 */
	public DataEng getDataEng(Map<String, String> reqPara) {
		logger.info("待编辑发动机信息: " + reqPara);

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
		String condition = reqPara.get("condition");
		String remark = reqPara.get("remark");

		DataEng dataeng = new DataEng();

		if (!Strings.isNullOrEmpty(id)) {
			dataeng.setId(Integer.parseInt(id));
		}
		dataeng.setEngSn(engSn);
		dataeng.setEngSnSap(engSnSap);
		dataeng.setEngSeries(engSeries);
		dataeng.setEngType(engType);
		dataeng.setEngModel(engModel);
		dataeng.setEngConfig(engConfig);
		dataeng.setDeliveryMode(deliveryMode);
		dataeng.setOwner(owner);
		dataeng.setCodeConfig(codeConfig);
		dataeng.setEngConfigration(engConfigration);
		String date = LocalDateTime.now().toString().replace("T", " ");
		String time = date.substring(0, date.indexOf("."));
		dataeng.setCtime(time);
		dataeng.setEngPn(engPn);
		dataeng.setCondition(condition);
		dataeng.setRemark(remark);
		return dataeng;
	}

	/**
	 * 获取所有的发动机信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/allDataEng.do")
	@ResponseBody
	public Map<String, Object> allDataEng() {
		List<DataEng> dataEngs = engService.allDataEng();
		return getSuccessData(dataEngs);
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
		engService.createExcel().write(os);

		byte[] content = os.toByteArray();
		InputStream is = new ByteArrayInputStream(content);
		// 设置response参数，可以打开下载页面
		response.reset();
		response.setContentType("application/vnd.ms-excel;charset=utf-8");

		String fileName = "发动机数据.xlsx";
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
		engService.process(file);
		return getSuccessMessage();
	}

	/**
	 * 获取所有 发动机序列
	 * 
	 * @return
	 */
	@RequestMapping(value = "/allEngSeries.do")
	@ResponseBody
	public Map<String, Object> allEngSeries() {
		List<String> engSeriesList = engService.allEngSeries();
		return getSuccessData(engSeriesList);
	}
	
	/**
	 * 获取所有 发动机类型
	 * 
	 * @return
	 */
	@RequestMapping(value = "/allEngType.do")
	@ResponseBody
	public Map<String, Object> allEngType() {
		List<String> engTypeList = engService.allEngType();
		return getSuccessData(engTypeList);
	}
	
	/**
	 * 获取所有 发动机模型
	 * 
	 * @return
	 */
	@RequestMapping(value = "/allEngModel.do")
	@ResponseBody
	public Map<String, Object> allEngModel() {
		List<String> engModelList = engService.allEngModel();
		return getSuccessData(engModelList);
	}
	
	/**
	 * 获取所有 发动机构型
	 * 
	 * @return
	 */
	@RequestMapping(value = "/allEngConfig.do")
	@ResponseBody
	public Map<String, Object> allEngConfig() {
		List<String> engConfigList = engService.allEngConfig();
		return getSuccessData(engConfigList);
	}
	
	/*
	 * 根据ENG_CONFIGRATION分组统计数量
	 */
	@RequestMapping(value = "/getEngConfigrationGroup")
	@ResponseBody
	public Map<String,Object> getEngConfigrationGroup(){
		List<String> engConfigrationGroupList = engService.getEngConfigrationGroup();
		return getSuccessData(engConfigrationGroupList);
	}
	
	/**
	 * 根据duty分组统计数量
	 */
	@RequestMapping(value = "/getDutyGroup")
	@ResponseBody
	public Map<String,Object> getDutyGroup(){
		List<String> dutyGroupList = engService.getdutyGroupList();
		return getSuccessData(dutyGroupList);
	}
	
	/*
	 * 根据ENG_MODEL（发动机推力构型？不太确定）
	 */
	@RequestMapping(value = "/getEngModelGroup")
	@ResponseBody
	public Map<String,Object> getEngModelGroup(){
		List<String> engModelGroupList = engService.getEngModelGroup();
		return getSuccessData(engModelGroupList);
	}
	/*
	 * 根据ENG_CONFIG分组
	 */
	@RequestMapping(value = "/getEngConfigswGroup")
	@ResponseBody
	public Map<String,Object> getEngConfigGroup(){
		List<String> engConfigGroupList = engService.getEngConfigGroup();
		return getSuccessData(engConfigGroupList);
	}
}
