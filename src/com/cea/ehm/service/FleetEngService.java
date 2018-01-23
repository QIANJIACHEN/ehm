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
import com.cea.ehm.bean.DataPlane;
import com.cea.ehm.bean.FleetEng;
import com.cea.ehm.dao.DataEngMapper;
import com.cea.ehm.dao.DataPlaneMapper;
import com.cea.ehm.dao.FleetEngMapper;
import com.cea.ehm.util.ExcelUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 发动机备发服务层
 */
@Service
public class FleetEngService {
	private Logger logger = Logger.getLogger(FleetEngService.class);
	@Autowired
	private FleetEngMapper fleetengMapper;
	@Autowired
	private DataEngMapper dataengMapper;
	@Autowired
	private DataPlaneMapper dataplaneMapper;
	/**
	 * 查询发动机备发列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<FleetEng> getFleetEngList(Map<String, String> paramMap, PageBounds pageBounds) {
		logger.info("数据库查询参数：" + paramMap);
		return fleetengMapper.getFleetEngList(paramMap, pageBounds);
	}

	/**
	 * 保存或更新机队清单
	 * 
	 * @param fleeteng
	 */
	public void saveOrUpdate(FleetEng fleeteng) {
		// 查询判断机队清单是否存在，考虑保存还是更新
		FleetEng selectuser = fleetengMapper.select(fleeteng);
		if (selectuser == null) {
			fleetengMapper.insert(fleeteng);
		} else {
			fleetengMapper.update(fleeteng);
		}
	}

	/**
	 * 删除机队清单
	 * 
	 * @param fleeteng
	 */
	public void delete(FleetEng fleeteng) {
		// 这里是物理删除，删除后机队清单从数据库消失
		fleetengMapper.delete(fleeteng);
	}

	/**
	 * 创建 excel数据表格
	 * 
	 * @return
	 */
	public Workbook createExcel() {
		List<FleetEng> allInfo = fleetengMapper.getAllFleetEngInfo();
		// 创建一个Excel文件
		Workbook workbook = new XSSFWorkbook();
		// 创建一个工作表
		Sheet sheet = workbook.createSheet("FLEET_ENG");
		// 添加表头行
		Row row0 = sheet.createRow(0);
		// 添加表头内容
		row0.createCell(0).setCellValue("TAIL");
		row0.createCell(1).setCellValue("ENG_POSITION");
		row0.createCell(2).setCellValue("ENG_SN");
		row0.createCell(3).setCellValue("ENG_PN");

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
		List<DataPlane> allplane = dataplaneMapper.allPlane();
		Map<String, Integer> planeMap = Maps.newHashMap();
		allplane.forEach(plane -> planeMap.put(plane.getTail(), plane.getId()));
		try {
			// 这里得到的是一个集合，里面的每一个元素是String[]数组
			List<String[]> list = ExcelUtil.readExcel(file);
			
			for (String[] arr : list) {
				
				int length = arr.length;
				
				FleetEng fleeteng = new FleetEng();
				if(length>=1) {
					Integer planeId = planeMap.get(arr[0]);
					fleeteng.setPlaneId(Optional.ofNullable(planeId).orElse(0));
					fleeteng.setTail(Optional.ofNullable(arr[0]).orElse("0"));
				}
				if(length>=2) {
					fleeteng.setEngPosition(Integer.parseInt(Optional.ofNullable(arr[1]).orElse("0")));
				}
				if(length>=3) {
					Integer engId = engMap.get(arr[2]);
					fleeteng.setEngId(Optional.ofNullable(engId).orElse(0));
					fleeteng.setEngSn(arr[2]);
				}
				if(length>=4) {
					fleeteng.setEngPn(arr[3]);
				}
				
				fleetengMapper.insert(fleeteng);
				
			}
		} catch (IOException e) {
			logger.debug(e);
		}

	}
}
