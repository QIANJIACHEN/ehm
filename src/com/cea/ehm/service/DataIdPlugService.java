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

import com.cea.ehm.bean.DataEng;
import com.cea.ehm.bean.DataIdPlug;
import com.cea.ehm.dao.DataEngMapper;
import com.cea.ehm.dao.DataIdPlugMapper;
import com.cea.ehm.util.ExcelUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * IDPLUG数据 服务层
 */
@Service
public class DataIdPlugService {
	private Logger logger = Logger.getLogger(ControlFleetPlaneService.class);
	@Autowired
	DataIdPlugMapper dataIdPlugMapper;
	@Autowired
	private DataEngMapper dataengMapper;
	/**
	 * 查询 IDPLUG数据信息 → 列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<DataIdPlug> getDataIdPlugList(Map<String, String> paramMap, PageBounds pageBounds) {
		return dataIdPlugMapper.getDataIdPlugList(paramMap, pageBounds);
	}

	/**
	 * 保存 IDPLUG数据 信息
	 * 
	 * @param dataIdPlug
	 */
	public void save(DataIdPlug dataIdPlug) {
		dataIdPlugMapper.save(dataIdPlug);
	}

	/**
	 * 更新 IDPLUG数据 信息
	 * 
	 * @param dataIdPlug
	 */
	public void update(DataIdPlug dataIdPlug) {
		dataIdPlugMapper.update(dataIdPlug);
	}

	/**
	 * 删除 IDPLUG数据 信息
	 * 
	 * @param dataIdPlug
	 */
	public void delete(DataIdPlug dataIdPlug) {
		dataIdPlugMapper.delete(dataIdPlug);
	}
	
	/**
	 * 创建 excel数据表格
	 * 
	 * @return
	 */
	public Workbook createExcel() {
		List<DataIdPlug> allInfo = dataIdPlugMapper.getAllDataIdPlug();
		// 创建一个Excel文件
		Workbook workbook = new XSSFWorkbook();
		// 创建一个工作表
		Sheet sheet = workbook.createSheet("IDPLUG数据");
		// 添加表头行
		Row row0 = sheet.createRow(0);
		// 添加表头内容
		row0.createCell(0).setCellValue("发动机设备号");
		row0.createCell(1).setCellValue("发动机型号");
		row0.createCell(2).setCellValue("转速");
		row0.createCell(3).setCellValue("构型");
		row0.createCell(4).setCellValue("飞机型号");
		row0.createCell(5).setCellValue("IDPLUG_PN");

		// 添加数据内容
		for (int i = 0; i < allInfo.size(); i++) {
			Row row = sheet.createRow(i + 1);
			row.createCell(0).setCellValue(allInfo.get(i).getEngPn() + "");
			row.createCell(1).setCellValue(allInfo.get(i).getEngModel() + "");
			row.createCell(2).setCellValue(allInfo.get(i).getRating() + "");
			row.createCell(3).setCellValue(allInfo.get(i).getConfig() + "");
			row.createCell(4).setCellValue(allInfo.get(i).getPlaneType() + "");
			row.createCell(5).setCellValue(allInfo.get(i).getIdPlugPn() + "");
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
		alleng.forEach(eng -> engMap.put(eng.getEngPn(), eng.getId()));
		try {
			// 这里得到的是一个集合，里面的每一个元素是String[]数组
			List<String[]> list = ExcelUtil.readExcel(file);
			
			for (String[] arr : list) {
				
				int length = arr.length;
				
				DataIdPlug dataIdPlug = new DataIdPlug();
				if(length>=1) {
					Integer engId = engMap.get(arr[0]);
					dataIdPlug.setEngId(Optional.ofNullable(engId).orElse(0));
					dataIdPlug.setEngPn(arr[0]);
				}
				if(length>=2) {
					dataIdPlug.setEngModel(arr[1]);
				}
				if(length>=3) {
					dataIdPlug.setRating(arr[2]);
				}
				if(length>=4) {
					dataIdPlug.setConfig(arr[3]);
				}
				if(length>=5) {
					dataIdPlug.setPlaneType(arr[4]);
				}
				if(length>=6) {
					dataIdPlug.setIdPlugPn(arr[5]);
				}
				
				dataIdPlugMapper.save(dataIdPlug);
			}
		} catch (IOException e) {
			logger.debug(e);
		}

	}

}
