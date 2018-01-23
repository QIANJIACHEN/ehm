package com.cea.ehm.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cea.ehm.bean.ControlFleetPlane;
import com.cea.ehm.bean.DataEng;
import com.cea.ehm.bean.DataPlane;
import com.cea.ehm.dao.ControlFleetPlaneMapper;
import com.cea.ehm.dao.DataEngMapper;
import com.cea.ehm.util.ExcelUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 飞机发动机关联服务层
 */
@Service
public class ControlFleetPlaneService {
	private Logger logger = Logger.getLogger(ControlFleetPlaneService.class);
	@Autowired
	private ControlFleetPlaneMapper controlfleetplaneMapper;
	@Autowired
	private DataEngMapper dataengMapper;
	/**
	 * 查询飞机发动机关联列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<ControlFleetPlane> getControlFleetPlaneList(Map<String, String> paramMap, PageBounds pageBounds) {
		logger.info("数据库查询参数：" + paramMap);
		return controlfleetplaneMapper.getControlFleetPlaneList(paramMap, pageBounds);
	}
	
	/**
	 * 保存或更新飞机发动机关联信息
	 * 
	 * @param controlfleetplane
	 */
	public void saveOrUpdate(ControlFleetPlane controlfleetplane) {
		// 查询判断飞机发动机关联信息是否存在，考虑保存还是更新
		ControlFleetPlane selectuser = controlfleetplaneMapper.select(controlfleetplane);
		if (selectuser == null) {
			controlfleetplaneMapper.insert(controlfleetplane);
		} else {
			controlfleetplaneMapper.update(controlfleetplane);
		}
	}

	/**
	 * 删除飞机发动机关联信息
	 * 
	 * @param controlfleetplane
	 */
	public void delete(ControlFleetPlane controlfleetplane) {
		// 这里是物理删除，删除后飞机发动机关联信息从数据库消失
		controlfleetplaneMapper.delete(controlfleetplane);
	}

	/**
	 * 获取所有飞机
	 * @return 
	 * 
	 */
	public  List<DataPlane> getPlane() {
		return controlfleetplaneMapper.getPlane();
		
	}
	
	/**
	 * 查询飞机发动机关联列表通过tail
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public List<ControlFleetPlane> getlistbyplane(Map<String, String> paramMap) {
		logger.info("数据库查询参数：" + paramMap);
		return controlfleetplaneMapper.getlistbyplane(paramMap);
	}
	
	/**
	 * 创建 excel数据表格
	 * 
	 * @return
	 */
	public Workbook createExcel() {
		List<ControlFleetPlane> allInfo = controlfleetplaneMapper.allControlFleetPlane();
		// 创建一个Excel文件
		Workbook workbook = new XSSFWorkbook();
		// 创建一个工作表
		Sheet sheet = workbook.createSheet("飞机发动机关联");
		// 添加表头行
		Row row0 = sheet.createRow(0);
		// 添加表头内容
		row0.createCell(0).setCellValue("飞机号");
		row0.createCell(1).setCellValue("发动机位置");
		row0.createCell(2).setCellValue("发动机编号");
		row0.createCell(3).setCellValue("发动机设备号");
		row0.createCell(4).setCellValue("CODE_POSITION");
		row0.createCell(5).setCellValue("备注");

		// 添加数据内容
		for (int i = 0; i < allInfo.size(); i++) {
			Row row = sheet.createRow(i + 1);
			row.createCell(0).setCellValue(allInfo.get(i).getTail() + "");
			if(allInfo.get(i).getEngPosition()==1) {
				row.createCell(1).setCellValue("左" + "");
			}else if(allInfo.get(i).getEngPosition()==2) {
				row.createCell(1).setCellValue("右" + "");
			}
			row.createCell(2).setCellValue(allInfo.get(i).getEngSn() + "");
			row.createCell(3).setCellValue(allInfo.get(i).getEngPn() + "");
		}
		return workbook;
	}

	/**
	 * 处理发动机数据信息
	 * 
	 * @param file
	 */
	public void process(MultipartFile file) {
		List<DataEng> alleng = dataengMapper.allDataEng();
		Map<String, Integer> engMap = Maps.newHashMap();
		alleng.forEach(eng -> engMap.put(eng.getEngSn(), eng.getId()));
		List<DataPlane> allplane = controlfleetplaneMapper.getPlane();
		Map<String, Integer> planeMap = Maps.newHashMap();
		allplane.forEach(plane -> planeMap.put(plane.getTail(), plane.getId()));
		try {
			// 这里得到的是一个集合，里面的每一个元素是String[]数组
			List<String[]> list = ExcelUtil.readExcel(file);
			
			for (String[] arr : list) {
				
				int length = arr.length;
				
				ControlFleetPlane controlfleetplane = new ControlFleetPlane();
				if(length>=1) {
					Integer planeId = planeMap.get(arr[0]);
					controlfleetplane.setPlaneId(Optional.ofNullable(planeId).orElse(0));
					controlfleetplane.setTail(Optional.ofNullable(arr[0]).orElse("0"));
				}
				if(length>=2) {
					controlfleetplane.setEngPosition(Integer.parseInt(Optional.ofNullable(arr[1]).orElse("0")));
				}
				if(length>=3) {
					Integer engId = engMap.get(arr[2]);
					controlfleetplane.setEngId(Optional.ofNullable(engId).orElse(0));
					controlfleetplane.setEngSn(arr[2]);
				}
				if(length>=4) {
					controlfleetplane.setEngPn(arr[3]);
				}
				ControlFleetPlane isExistEng = controlfleetplaneMapper.select(controlfleetplane);
				if (isExistEng == null) {
					controlfleetplaneMapper.insert(controlfleetplane);
				} else {
					controlfleetplaneMapper.update(controlfleetplane);
				}
			}
		} catch (IOException e) {
			logger.debug(e);
		}

	}
}
