package com.cea.ehm.controller.manage;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.ArrayList;
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

import com.cea.ehm.bean.DataPlane;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.DataPlaneService;
import com.cea.ehm.service.RecordDataPlaneService;
import com.cea.ehm.util.ConstantUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;



/**
 * 飞机信息控制层
 */
@Controller
@RequestMapping(value = "/manage/dataplane")
public class DataPlaneController extends BaseController {
	private Logger logger = Logger.getLogger(DataPlaneController.class);

	@Autowired
	private DataPlaneService planeService;
	@Autowired
	private RecordDataPlaneService recordService;

	/**
	 * 显示飞机信息详情页面
	 */
	@RequestMapping(value = "/dataplanelistdetail.do")
	public ModelAndView dataplanelistdetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/dataplane/dataplanelistdetail");
		return mv;
	}

	/**
	 * 显示飞机信息列表页面
	 */
	@RequestMapping(value = "/dataplanelist.do")
	public ModelAndView dataplanelist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/dataplane/dataplanelist");
		return mv;
	}

	//根据tail获取飞机信息

	@RequestMapping(value = "/info.do")
	@ResponseBody
	public Map<String, Object> info(@RequestParam Map<String, String> reqPara) {
		logger.info("页面请求参数: " + reqPara);
		Map<String, String> paramMap = Maps.newHashMap();

		// 根据tail来查吧
		String tail = reqPara.get("tail");
		paramMap.put("tail", tail);
		List<DataPlane> data = planeService.planeInfo(paramMap);

		return getSuccessData(data, "");
	}

	/**
	 * 查询飞机信息 → 列表
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
		// 条件参数
		String tail = reqPara.get("tail");
		String duty = reqPara.get("duty");
		paramMap.put("tail", tail);
		if (!Strings.isNullOrEmpty(duty)) {
			paramMap.put("duty", duty);
		}
		PageList<DataPlane> pageList = (PageList<DataPlane>) planeService.getdataplaneList(paramMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<DataPlane> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 保存飞机信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/save.do")
	@ResponseBody
	public Map<String, Object> save(@RequestParam Map<String, String> reqPara) {
		DataPlane dataPlane = getDataPlane(reqPara);
		DataPlane selectDataPlane = planeService.select(dataPlane);
		if (selectDataPlane != null) {
			return getFailureMessage(ConstantUtil.RES_MSG_EXIST, 1);
		}
		planeService.save(dataPlane);
		return getSuccessMessage();
	}

	/**
	 * 更新飞机信息
	 * 
	 * @param reqPara
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/update.do")
	@ResponseBody
	public Map<String, Object> update(@RequestParam Map<String, String> reqPara, HttpServletRequest request) {
		DataPlane dataPlane = getDataPlane(reqPara);
		// 更新前的数据， 插入属性变更记录中
		DataPlane oldPlane = planeService.selectById(dataPlane);
		recordService.save(oldPlane, request);
		planeService.update(dataPlane);
		return getSuccessMessage();
	}

	/**
	 * 删除飞机信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/delete.do")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam Map<String, String> reqPara) {
		logger.info("待删除飞机信息: " + reqPara);
		String id = reqPara.get("id");
		DataPlane dataplane = new DataPlane();
		dataplane.setId(Integer.parseInt(id));
		planeService.delete(dataplane);
		return getSuccessMessage();
	}

	/**
	 * 获取待编辑的飞机信息
	 * 
	 * @param reqPara
	 * @return
	 */
	public DataPlane getDataPlane(Map<String, String> reqPara) {
		logger.info("待编辑飞机信息: " + reqPara);

		String id = reqPara.get("id");
		String tail = reqPara.get("tail");
		String duty = reqPara.get("duty");
		String ratingPlane = reqPara.get("ratingPlane");
		String configPlane = reqPara.get("configPlane");
		String egsnOriginal = reqPara.get("egsnOriginal");
		String series = reqPara.get("series");
		String type = reqPara.get("type");
		String model = reqPara.get("model");
		String attribute = reqPara.get("attribute");
		String etops = reqPara.get("etops");
		String hHighLand = reqPara.get("hHighLand");
		String variable = reqPara.get("variable");
		String serial = reqPara.get("serial");
		String line = reqPara.get("line");
		String effectivity = reqPara.get("effectivity");
		String operater = reqPara.get("operater");
		String owner = reqPara.get("owner");
		String remark = reqPara.get("remark");
		String importWay = reqPara.get("importWay");
		String condition = reqPara.get("condition");

		DataPlane dataplane = new DataPlane();

		if (!Strings.isNullOrEmpty(id)) {
			dataplane.setId(Integer.parseInt(id));
		}
		dataplane.setTail(tail);
		dataplane.setDuty(Integer.parseInt(duty));
		dataplane.setRatingPlane(ratingPlane);
		dataplane.setConfigPlane(configPlane);
		dataplane.setEgsnOriginal(egsnOriginal);
		dataplane.setSeries(series);
		dataplane.setType(type);
		dataplane.setModel(model);
		dataplane.setAttribute(attribute);
		dataplane.setEtops(etops);
		dataplane.sethHighLand(Integer.parseInt(hHighLand));
		dataplane.setVariable(variable);
		dataplane.setSerial(serial);
		dataplane.setLine(line);
		dataplane.setEffectivity(effectivity);
		dataplane.setOperater(operater);
		dataplane.setOwner(owner);
		dataplane.setRemark(remark);
		dataplane.setImportWay(importWay);
		String date = LocalDateTime.now().toString().replace("T", " ");
		String time = date.substring(0, date.indexOf("."));
		dataplane.setCtime(time);
		dataplane.setCondition(condition);

		return dataplane;
	}

	/**
	 * 获取所有飞机信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/allplane.do")
	@ResponseBody
	public Map<String, Object> allPlane(HttpServletRequest request) {
		List<DataPlane> planes = planeService.allPlane();
		Map<Integer, String> planesMap = Maps.newHashMap();
		planes.forEach(plane -> planesMap.put(plane.getId(), plane.getTail()));
		request.getSession().setAttribute("planesMap", planesMap);
		return getSuccessData(planes, "");
	}

	/**
	 * 获取MODEL的分组信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getPlaneGroupByModel.do")
	@ResponseBody
	public Map<String,Object> getPlaneGroupByModel() {
		List<DataPlane> planes = planeService.getPlaneGroupByModel();
		//Integer count = planeService.getModelCount();//这方法不用了应该
		List<DataPlane> model = planeService.getModel();//获取model
		//List<DataPlane> operater = planeService.getOperater();//获取operater

		Map<String, Object> info = Maps.newHashMap();
		Map<String, Object> result = Maps.newHashMap();
		//String arr[][] = new String[4][2];
		List<String> model1 = new ArrayList<String>();
		for(int a =0;a<model.size();a++) {
			model1.add(model.get(a).getModel());
		}
		
		for( int i = 0 ; i < planes.size() ; i++) {//内部不锁定，效率最高，但在多线程要考虑并发操作的问题。
			List<String> list = new ArrayList<String>();
			for(int j = 0;j<planes.size();j++) {
					//String a = "";
				if(planes.get(j).getOperater().equals(planes.get(i).getOperater())) {
					//String a1 = planes.get(j).getOperater();
					logger.info("打印数据是否有问题："+planes.get(j).getOperater());
					logger.info("打印数据是否有问题："+planes.get(j).getNum());
					
				    list.add(String.valueOf(planes.get(j).getNum()));
				    //arr[k][1] = String.valueOf(planes.get(i).getNum());
				    
				    
				}
			}
			
			String[] arr = list.toArray(new String[0]);
			info.put(planes.get(i).getOperater(), arr); 
		    
		}
		result.put("yuanshi", planes);
		result.put("model", model1);
		result.put("data", info);
		return result;
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
		planeService.createExcel().write(os);

		byte[] content = os.toByteArray();
		InputStream is = new ByteArrayInputStream(content);
		// 设置response参数，可以打开下载页面
		response.reset();
		response.setContentType("application/vnd.ms-excel;charset=utf-8");
		String fileName = "飞机数据.xlsx";
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
		planeService.process(file);
		return getSuccessMessage();
	}

}
