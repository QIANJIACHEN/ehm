package com.cea.ehm.service;

import java.io.IOException;
import java.util.Calendar;
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
import com.cea.ehm.bean.EngConditionFleet;
import com.cea.ehm.dao.EngConditionFleetMapper;
import com.cea.ehm.dao.DataEngMapper;
import com.cea.ehm.util.ExcelUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 发动机状态简报服务层
 */
@Service
public class EngConditionFleetService {
	private Logger logger = Logger.getLogger(EngConditionFleetService.class);
	@Autowired
	private EngConditionFleetMapper engconditionfleetMapper;
	@Autowired
	private DataEngMapper dataengMapper;
	/**
	 * 查询发动机状态简报列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<EngConditionFleet> getEngConditionFleetList(Map<String, String> paramMap, PageBounds pageBounds) {
		logger.info("数据库查询参数：" + paramMap);
		return engconditionfleetMapper.getEngConditionFleetList(paramMap, pageBounds);
	}

	/**
	 * 保存或更新发动机状态简报信息
	 * 
	 * @param engconditionfleet
	 */
	public void saveOrUpdate(EngConditionFleet engconditionfleet) {
		// 查询判断发动机状态简报信息是否存在，考虑保存还是更新
		EngConditionFleet selectuser = engconditionfleetMapper.select(engconditionfleet);
		if (selectuser == null) {
			engconditionfleetMapper.insert(engconditionfleet);
		} else {
			engconditionfleetMapper.update(engconditionfleet);
		}
	}

	/**
	 * 删除发动机状态简报信息
	 * 
	 * @param engconditionfleet
	 */
	public void delete(EngConditionFleet engconditionfleet) {
		// 这里是物理删除，删除后发动机状态简报信息从数据库消失
		engconditionfleetMapper.delete(engconditionfleet);
	}
	
	/**
	 * 获取发动机状态详情
	 * 
	 * @param engconditionfleet
	 */
	public List<EngConditionFleet> engconditionfleetinfo(Map<String, Integer> paramMap) {
		return engconditionfleetMapper.engconditionfleetinfo(paramMap);
	}

	/**
	 * 创建 excel数据表格
	 * 
	 * @return
	 */
	public Workbook createExcel() {
		//获取数据
		List<EngConditionFleet> allInfo = engconditionfleetMapper.getAllEngConditionFleet();
		// 创建一个Excel文件
		Workbook workbook = new XSSFWorkbook();
		// 创建一个工作表
		Sheet sheet = workbook.createSheet("发动机状态简报");
		// 添加表头行
		Row row0 = sheet.createRow(0);
		// 添加表头内容
		row0.createCell(0).setCellValue("ENG_SN");
		row0.createCell(1).setCellValue("DATA_INSTALL");
		row0.createCell(2).setCellValue("TSI_START");
		row0.createCell(3).setCellValue("CSI_START");
		row0.createCell(4).setCellValue("SV_TIME");
		row0.createCell(5).setCellValue("TSR_START");
		row0.createCell(6).setCellValue("CSR_START");
		row0.createCell(7).setCellValue("TSO_START");
		row0.createCell(8).setCellValue("CSO_START");

		// 添加数据内容
		for (int i = 0; i < allInfo.size(); i++) {
			Row row = sheet.createRow(i + 1);
			row.createCell(0).setCellValue(allInfo.get(i).getEngSn() + "");
			row.createCell(1).setCellValue(allInfo.get(i).getCtime() + "");
			row.createCell(2).setCellValue(allInfo.get(i).getTsiStart() + "");
			row.createCell(3).setCellValue(allInfo.get(i).getCsiStart() + "");
			row.createCell(4).setCellValue(allInfo.get(i).getSvTime() + "");
			row.createCell(5).setCellValue(allInfo.get(i).getTsrStart() + "");
			row.createCell(6).setCellValue(allInfo.get(i).getCsrStart() + "");
			row.createCell(7).setCellValue(allInfo.get(i).getTsoStart() + "");
			row.createCell(8).setCellValue(allInfo.get(i).getCsoStart() + "");
		}

		return workbook;
	}

	/**
	 * 处理飞机数据信息
	 * 
	 * @param file
	 */
	public void process(MultipartFile file) {
		List<DataEng> alleng = dataengMapper.allDataEng();
		Map<String, Integer> engMap = Maps.newHashMap();
		alleng.forEach(eng -> engMap.put(eng.getEngSn(), eng.getId()));
		try {
			// 这里得到的是一个集合，里面的每一个元素是String[]数组
			List<String[]> list = ExcelUtil.readExcel(file);
			for (String[] arr : list) {
				EngConditionFleet engconditionfleet = new EngConditionFleet();
				int length = arr.length;
				if(length>=1) {
					Integer engId = engMap.get(arr[0]);
					engconditionfleet.setEngId(Optional.ofNullable(engId).orElse(0));
					engconditionfleet.setEngSn(arr[0]);
				}
				if(length>=2) {
					Calendar cal = Calendar.getInstance();  
			        cal.set(1900,0,1);
			        cal.add(Calendar.DAY_OF_MONTH, Integer.parseInt(arr[1])-2);
			        String ctime = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
			        engconditionfleet.setCtime(ctime);
				}
				if(length>=3) {
					engconditionfleet.setTsiStart(arr[2]);
				}
				if(length>=4) {
					engconditionfleet.setCsiStart(arr[3]);
				}
				if(length>=5) {
					engconditionfleet.setSvTime(arr[4]);
				}
				if(length>=6) {
					engconditionfleet.setTsrStart(arr[5]);
				}
				if(length>=7) {
					engconditionfleet.setCsrStart(arr[6]);
				}
				if(length>=8) {
					engconditionfleet.setTsoStart(arr[7]);
				}
				if(length>=9) {
					engconditionfleet.setCsoStart(arr[8]);
				}
				
				engconditionfleetMapper.insert(engconditionfleet);
				
			}
		} catch (IOException e) {
			logger.debug(e);
		}

	}

}
