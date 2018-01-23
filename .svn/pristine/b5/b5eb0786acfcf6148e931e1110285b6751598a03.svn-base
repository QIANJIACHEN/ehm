package com.cea.ehm.service;


import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cea.ehm.bean.ControlFleetEngSpare;
import com.cea.ehm.dao.ControlFleetEngSpareMapper;
import com.cea.ehm.dao.DataEngMapper;
import com.cea.ehm.util.ExcelUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import java.io.IOException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 
 */
@Service
public class ControlFleetEngSpareService {
	private Logger logger = Logger.getLogger(ControlFleetEngSpareService.class);
	@Autowired
	private ControlFleetEngSpareMapper controlfleetengspareMapper;
	@Autowired
	private DataEngMapper dataengMapper;
	/**
	 * 查询发动机维修列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<ControlFleetEngSpare> getdatacontrolfleetengspareList(Map<String, String> paramMap, PageBounds pageBounds)
	{
		logger.info("数据库查询参数：" + paramMap);
		return controlfleetengspareMapper.getdatacontrolfleetengspareList(paramMap,pageBounds);
	}
	
	/**
	 * 保存发动机维修信息
	 * 
	 * @param controlFleetEngSpare
	 */
	public void save(ControlFleetEngSpare controlFleetEngSpare) {
		controlfleetengspareMapper.insert(controlFleetEngSpare);
	}
	
	/**
	 * 更新发动机维修信息
	 * 
	 * @param controlFleetEngSpare
	 */
	public void update(ControlFleetEngSpare controlFleetEngSpare) {
		controlfleetengspareMapper.update(controlFleetEngSpare);
	}
	
	/*
	 * 删除发动机维修信息
	 * 
	 * @param controlFleetEngSpare
	 */
	public void delete(ControlFleetEngSpare controlFleetEngSpare) {
		controlfleetengspareMapper.delete(controlFleetEngSpare);
	}
	
	
	
	/**
	 * 创建 excel数据表格
	 * 
	 * @return
	 */
	public Workbook createExcel() {
		List<ControlFleetEngSpare> ControlFleetEngSpare = controlfleetengspareMapper.allFleetEngSpare();
		// 创建一个Excel文件
		Workbook workbook = new XSSFWorkbook();
		// 创建一个工作表
		Sheet sheet = workbook.createSheet("发动机维修信息");
		// 添加表头行
		Row row0 = sheet.createRow(0);
		// 添加表头内容
		row0.createCell(0).setCellValue("发动机ID");
		row0.createCell(1).setCellValue("发动机编号");
		row0.createCell(2).setCellValue("拆发时间");
		row0.createCell(3).setCellValue("状态");
		row0.createCell(4).setCellValue("INSTALL_PLAN");
		row0.createCell(5).setCellValue("LLP_SAP");
		row0.createCell(6).setCellValue("CONFIG_ACCESS");
		row0.createCell(7).setCellValue("备注");

		// 添加数据内容
		for (int i = 0; i < ControlFleetEngSpare.size(); i++) {
			Row row = sheet.createRow(i + 1);
			row.createCell(0).setCellValue(ControlFleetEngSpare.get(i).getEngId() + "");
			row.createCell(1).setCellValue(ControlFleetEngSpare.get(i).getEngSn() + "");
			row.createCell(2).setCellValue(ControlFleetEngSpare.get(i).getRemoveDate() + "");
			row.createCell(3).setCellValue(ControlFleetEngSpare.get(i).getCondition() + "");
			row.createCell(4).setCellValue(ControlFleetEngSpare.get(i).getInstallPlan() + "");
			row.createCell(5).setCellValue(ControlFleetEngSpare.get(i).getLlpSap() + "");
			row.createCell(6).setCellValue(ControlFleetEngSpare.get(i).getConfigAccess() + "");
			row.createCell(7).setCellValue(ControlFleetEngSpare.get(i).getRemark() + "");
		}

		return workbook;
	}
	
	/**
	 * 处理飞机数据信息
	 * 
	 * @param file
	 */
	public void process(MultipartFile file) {
		try {
			// 这里得到的是一个集合，里面的每一个元素是String[]数组
			List<String[]> list = ExcelUtil.readExcel(file);
			for (String[] arr : list) {
				ControlFleetEngSpare controlFleetEngSpare = new ControlFleetEngSpare();
				String engSn = arr[0];
				Integer engId = dataengMapper.getEngIdByEngSn(engSn);
				
				if(engId!=null) {
					controlFleetEngSpare.setEngId(engId);
				}else {
					controlFleetEngSpare.setEngId(0);
				}
				int length = arr.length;
				if(length>=1) {
					controlFleetEngSpare.setEngSn(arr[0]);
				}
				if(length>=2) {
					Calendar cal = Calendar.getInstance();  
			        cal.set(1900,0,1);
			        cal.add(Calendar.DAY_OF_MONTH, Integer.parseInt(arr[1])-2);
			        String removeDate = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
					
					controlFleetEngSpare.setRemoveDate(removeDate);
				}
				if(length>=3) {
					controlFleetEngSpare.setCondition(arr[2]);
				}
				if(length>=4) {
					controlFleetEngSpare.setInstallPlan(arr[3]);
				}
				if(length>=5) {
					controlFleetEngSpare.setLlpSap(arr[4]);
				}
				if(length>=6) {
					controlFleetEngSpare.setConfigAccess(arr[5]);
				}
				if(length>=7) {
					controlFleetEngSpare.setRemark(arr[6]);
				}
				controlfleetengspareMapper.insert(controlFleetEngSpare);
			
			}
		} catch (IOException e) {
			logger.debug(e);
		}

	}
	
	public static Date stringToDate(String time){   
	    SimpleDateFormat formatter;   
	    int tempPos=time.indexOf("AD") ;   
	    time=time.trim() ;   
	    formatter = new SimpleDateFormat ("yyyy.MM.dd G 'at' hh:mm:ss z");   
	    if(tempPos>-1){   
	      time=time.substring(0,tempPos)+   
	           "公元"+time.substring(tempPos+"AD".length());//china   
	      formatter = new SimpleDateFormat ("yyyy.MM.dd G 'at' hh:mm:ss z");   
	    }   
	    tempPos=time.indexOf("-");   
	    if(tempPos>-1&&(time.indexOf(" ")<0)){   
	      formatter = new SimpleDateFormat ("yyyyMMddHHmmssZ");   
	    }   
	    else if((time.indexOf("/")>-1) &&(time.indexOf(" ")>-1)){   
	      formatter = new SimpleDateFormat ("yyyy/MM/dd HH:mm:ss");   
	    }   
	    else if((time.indexOf("-")>-1) &&(time.indexOf(" ")>-1)){   
	      formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");   
	    }   
	    else if((time.indexOf("/")>-1) &&(time.indexOf("am")>-1) ||(time.indexOf("pm")>-1)){   
	      formatter = new SimpleDateFormat ("yyyy-MM-dd KK:mm:ss a");   
	    }   
	    else if((time.indexOf("-")>-1) &&(time.indexOf("am")>-1) ||(time.indexOf("pm")>-1)){   
	      formatter = new SimpleDateFormat ("yyyy-MM-dd KK:mm:ss a");   
	    }   
	    ParsePosition pos = new ParsePosition(0);   
	    java.util.Date ctime = formatter.parse(time, pos);   
	  
	    return ctime;   
	}

}
