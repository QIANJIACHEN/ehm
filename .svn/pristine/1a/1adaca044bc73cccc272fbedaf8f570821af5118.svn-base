package com.cea.ehm.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
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

import com.cea.ehm.bean.DataCfmPerformance;
import com.cea.ehm.bean.DataEng;
import com.cea.ehm.bean.DataPlane;
import com.cea.ehm.dao.DataCfmPerformanceMapper;
import com.cea.ehm.dao.DataEngMapper;
import com.cea.ehm.dao.DataPlaneMapper;
import com.cea.ehm.util.ExcelUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 发动机性能数据服务层
 */
@Service
public class DataCfmPerformanceService {
	private Logger logger = Logger.getLogger(DataCfmPerformanceService.class);
	@Autowired
	private DataCfmPerformanceMapper datacfmperformanceMapper;
	@Autowired
	private DataEngMapper engMapper;
	@Autowired
	private DataPlaneMapper dataplaneMapper;
	/**
	 * 查询发动机性能数据列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<DataCfmPerformance> getDataCfmPerformanceList(Map<String, String> paramMap, PageBounds pageBounds) {
		return datacfmperformanceMapper.getDataCfmPerformanceList(paramMap, pageBounds);
	}

	/**
	 * 根据 id 查询发动机性能数据
	 * 
	 * @param parseInt
	 * @return
	 */
	public DataCfmPerformance getOne(Integer id) {
		DataCfmPerformance performance = datacfmperformanceMapper.getOne(id);
		// 提取所有 发动机id 和 发动机sn
		List<DataEng> allEng = engMapper.allDataEng();
		Map<Integer, String> map = Maps.newHashMap();
		allEng.forEach(eng -> map.put(eng.getId(), eng.getEngSn()));
		performance.setEngSn(map.get(performance.getEngId()));
		return performance;
	}

	/**
	 * 保存发动机性能数据信息
	 * 
	 * @param datacfmperformance
	 */
	public void save(DataCfmPerformance datacfmperformance) {
		datacfmperformanceMapper.insert(datacfmperformance);
	}

	/**
	 * 更新发动机性能数据信息
	 * 
	 * @param datacfmperformance
	 */
	public void update(DataCfmPerformance datacfmperformance) {
		datacfmperformanceMapper.update(datacfmperformance);
	}

	/**
	 * 删除发动机性能数据信息
	 * 
	 * @param datacfmperformance
	 */
	public void delete(DataCfmPerformance datacfmperformance) {
		datacfmperformanceMapper.delete(datacfmperformance);
	}

	/**
	 * 创建 excel数据表格
	 * 
	 * @return
	 */
	public Workbook createExcel() {
		List<DataCfmPerformance> performance = datacfmperformanceMapper.allDataCfmPerformance();
		// 创建一个Excel文件
		Workbook workbook = new XSSFWorkbook();
		// 创建一个工作表
		Sheet sheet = workbook.createSheet("发动机性能数据");
		// 添加表头行
		Row row0 = sheet.createRow(0);
		// 添加表头内容
		row0.createCell(0).setCellValue("tail");
		row0.createCell(1).setCellValue("EPOSITION");
		row0.createCell(2).setCellValue("ESN");
		row0.createCell(3).setCellValue("FLIGHT_PHASE");
		row0.createCell(4).setCellValue("飞行时间");
		row0.createCell(5).setCellValue("发动机类型");
		row0.createCell(6).setCellValue("ZPHSR");
		row0.createCell(7).setCellValue("GPCN25_SMOOTHED");
		row0.createCell(8).setCellValue("DEGT_SMOOTHED");
		row0.createCell(9).setCellValue("ZPHSF");
		row0.createCell(10).setCellValue("EGTHDM_D");
		row0.createCell(11).setCellValue("ZVB1F_SMOOTHED");
		row0.createCell(12).setCellValue("GWFM");
		row0.createCell(13).setCellValue("EGTHDM");
		row0.createCell(14).setCellValue("GWFM_D");
		row0.createCell(15).setCellValue("ZVB1R");
		row0.createCell(16).setCellValue("EGTHDM_D_SMOOTHED");
		row0.createCell(17).setCellValue("ZTOIL");
		row0.createCell(18).setCellValue("ZVB2F");
		row0.createCell(19).setCellValue("ZVB2R");
		row0.createCell(20).setCellValue("ZVB1F");
		row0.createCell(21).setCellValue("ZVB2R_SMOOTHED");
		row0.createCell(22).setCellValue("DEGT_D_SMOOTHED");
		row0.createCell(23).setCellValue("GPCN25_D");
		row0.createCell(24).setCellValue("ZVB1R_SMOOTHED");
		row0.createCell(25).setCellValue("ZTOIL_SMOOTHED");
		row0.createCell(26).setCellValue("GWFM_SMOOTHED");
		row0.createCell(27).setCellValue("GPCN25");
		row0.createCell(28).setCellValue("GWFM_D_SMOOTHED");
		row0.createCell(29).setCellValue("GPCN25_D_SMOOTHED");
		row0.createCell(30).setCellValue("ZVB2F_SMOOTHED");
		row0.createCell(31).setCellValue("ZPOIL_SMOOTHED");
		row0.createCell(32).setCellValue("EGTHDM_SMOOTHED");
		row0.createCell(33).setCellValue("DEGT_D");
		row0.createCell(34).setCellValue("ZPOIL");
		row0.createCell(35).setCellValue("ZT49");
		row0.createCell(36).setCellValue("DEGT");
		row0.createCell(37).setCellValue("CTIME");

		// 添加数据内容
		for (int i = 0; i < performance.size(); i++) {
			Row row = sheet.createRow(i + 1);
			row.createCell(0).setCellValue(performance.get(i).getTail() + "");
			row.createCell(1).setCellValue(performance.get(i).getEposition() + "");
			row.createCell(2).setCellValue(performance.get(i).getEsn() + "");
			row.createCell(3).setCellValue(performance.get(i).getFlightPhase() + "");
			row.createCell(4).setCellValue(performance.get(i).getFlightDateTime() + "");
			row.createCell(5).setCellValue(performance.get(i).getEngineType() + "");
			row.createCell(6).setCellValue(performance.get(i).getZphsr() + "");
			row.createCell(7).setCellValue(performance.get(i).getGpcn25Smoothed() + "");
			row.createCell(8).setCellValue(performance.get(i).getDegtSmoothed() + "");
			row.createCell(9).setCellValue(performance.get(i).getZphsf() + "");
			row.createCell(10).setCellValue(performance.get(i).getEgthdmD() + "");
			row.createCell(11).setCellValue(performance.get(i).getZvb1fSmoothed() + "");
			row.createCell(12).setCellValue(performance.get(i).getGwfm() + "");
			row.createCell(13).setCellValue(performance.get(i).getEgthdm() + "");
			row.createCell(14).setCellValue(performance.get(i).getGwfmD() + "");
			row.createCell(15).setCellValue(performance.get(i).getZvb1r() + "");
			row.createCell(16).setCellValue(performance.get(i).getEgthdmDSmoothed() + "");
			row.createCell(17).setCellValue(performance.get(i).getZtoil() + "");
			row.createCell(18).setCellValue(performance.get(i).getZvb2f() + "");
			row.createCell(19).setCellValue(performance.get(i).getZvb2r() + "");
			row.createCell(20).setCellValue(performance.get(i).getZvb1f() + "");
			row.createCell(21).setCellValue(performance.get(i).getZvb2rSmoothed() + "");
			row.createCell(22).setCellValue(performance.get(i).getDegtDSmoothed() + "");
			row.createCell(23).setCellValue(performance.get(i).getGpcn25D() + "");
			row.createCell(24).setCellValue(performance.get(i).getZvb1rSmoothed() + "");
			row.createCell(25).setCellValue(performance.get(i).getZtoilSmoothed() + "");
			row.createCell(26).setCellValue(performance.get(i).getGwfmSmoothed() + "");
			row.createCell(27).setCellValue(performance.get(i).getGpcn25() + "");
			row.createCell(28).setCellValue(performance.get(i).getGwfmDSmoothed() + "");
			row.createCell(29).setCellValue(performance.get(i).getGpcn25DSmoothed() + "");
			row.createCell(30).setCellValue(performance.get(i).getZvb2fSmoothed() + "");
			row.createCell(31).setCellValue(performance.get(i).getZpoilSmoothed() + "");
			row.createCell(32).setCellValue(performance.get(i).getEgthdmSmoothed() + "");
			row.createCell(33).setCellValue(performance.get(i).getDegtD() + "");
			row.createCell(34).setCellValue(performance.get(i).getZpoil() + "");
			row.createCell(35).setCellValue(performance.get(i).getZt49() + "");
			row.createCell(36).setCellValue(performance.get(i).getDegt() + "");
			row.createCell(37).setCellValue(performance.get(i).getCtime() + "");
		}
		return workbook;
	}

	/**
	 * 处理发动机性能数据
	 * 
	 * @param file
	 */
	public void process(MultipartFile file) {
		List<DataEng> alleng = engMapper.allDataEng();
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
				DataCfmPerformance performance = new DataCfmPerformance();
				if(length>=1) {
					Integer planeId = planeMap.get(arr[0]);
					performance.setPlaneId(Optional.ofNullable(planeId).orElse(0));
					performance.setTail(arr[0]);
				}
				if(length>=2) {
					performance.setEposition(arr[1]);
				}
				if(length>=3) {
					Integer engId = engMap.get(arr[2]);
					performance.setEngId(Optional.ofNullable(engId).orElse(0));
					performance.setEsn(arr[2]);
				}
				if(length>=4) {
					performance.setFlightPhase(arr[3]);
				}
				if(length>=5) {
					if(arr[4]!=null&&!arr[4].equals("")) {
						
					logger.info("这个带时分秒的数据时怎么样的呢："+arr[4]);
					BigDecimal a1 = new BigDecimal(arr[4]);
					Integer onedaytime = 24*60*60;
					BigDecimal a2 = new BigDecimal(onedaytime);
					BigDecimal a3 = a1.multiply(a2);
					BigDecimal a4 = new BigDecimal("2147483647");
					logger.info("秒数是否正确："+a3);
					logger.info("转换后的："+a3.longValue());
					int b = a3.compareTo(a4);
					if(b==0) {
						//不现实的吧这么巧，大约1968年附近
						
					}else if(b==-1) {
						//也不太现实的吧
					}else if(b==1) {
						//正常数据，加个70年，emmm，到2036年应该没问题
						BigDecimal a5 = a3.subtract(a4);//差（a3-a4）
						Calendar cal = Calendar.getInstance();  
				        cal.set(1900,1,1,00,00,00);
				        cal.add(Calendar.SECOND,2147483647);
				        logger.info("第一次计算后的时间："+cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH))+"-"+cal.get(Calendar.DAY_OF_MONTH)+" "+cal.get(Calendar.HOUR_OF_DAY)+":"+cal.get(Calendar.MINUTE)+":"+cal.get(Calendar.SECOND));
				        Calendar cc = Calendar.getInstance();  
				        cc.set(cal.get(Calendar.YEAR),cal.get(Calendar.MONTH),cal.get(Calendar.DAY_OF_MONTH),cal.get(Calendar.HOUR_OF_DAY),cal.get(Calendar.MINUTE),cal.get(Calendar.SECOND));
				        logger.info("看看是偶数或者奇数："+(a5.intValue()-24*60*60*2));
				        Integer b1 = a5.intValue()-24*60*60*2;
				        //判断b1奇数偶数
				        if(b1%2==1) {
				        	Integer b2 = b1+343;
				        	cc.add(Calendar.SECOND,b2);
				        	if(cc.get(Calendar.MONTH)==9) {
				        		//我也不知道为啥会这样9月会有31号,这个函数有毒啊，8月有31日的读成了9月1日- -，这个就很他妈尴尬了
				        		if(cc.get(Calendar.DAY_OF_MONTH)==1) {
				        			String flightDateTime = cc.get(Calendar.YEAR)+"-08-31"+" "+cc.get(Calendar.HOUR_OF_DAY)+":"+cc.get(Calendar.MINUTE)+":"+cc.get(Calendar.SECOND);
					        		performance.setFlightDateTime(flightDateTime);
				        		} else {
				        			String flightDateTime = cc.get(Calendar.YEAR)+"-09-"+(cc.get(Calendar.DAY_OF_MONTH)-1)+" "+cc.get(Calendar.HOUR_OF_DAY)+":"+cc.get(Calendar.MINUTE)+":"+cc.get(Calendar.SECOND);
					        		performance.setFlightDateTime(flightDateTime);
				        		}
				        		
				        	}else {
				        		String flightDateTime = cc.get(Calendar.YEAR)+"-"+cc.get(Calendar.MONTH)+"-"+cc.get(Calendar.DAY_OF_MONTH)+" "+cc.get(Calendar.HOUR_OF_DAY)+":"+cc.get(Calendar.MINUTE)+":"+cc.get(Calendar.SECOND);
					        	logger.info("看看flightDateTime："+cc.get(Calendar.YEAR)+"-"+(cc.get(Calendar.MONTH))+"-"+cc.get(Calendar.DAY_OF_MONTH)+" "+cc.get(Calendar.HOUR_OF_DAY)+":"+cc.get(Calendar.MINUTE)+":"+cc.get(Calendar.SECOND));
					        	performance.setFlightDateTime(flightDateTime);
				        	}
				        	
				        }else {
				        	Integer b2 = b1+344;
				        	cc.add(Calendar.SECOND,b2);
				        	if(cc.get(Calendar.MONTH)==9) {
				        		//我也不知道为啥会这样9月会有31号,这个函数有毒啊，8月有31日的读成了9月1日- -，这个就很他妈尴尬了
				        		if(cc.get(Calendar.DAY_OF_MONTH)==1) {
				        			String flightDateTime = cc.get(Calendar.YEAR)+"-08-31"+" "+cc.get(Calendar.HOUR_OF_DAY)+":"+cc.get(Calendar.MINUTE)+":"+cc.get(Calendar.SECOND);
					        		performance.setFlightDateTime(flightDateTime);
				        		} else {
				        			String flightDateTime = cc.get(Calendar.YEAR)+"-09-"+(cc.get(Calendar.DAY_OF_MONTH)-1)+" "+cc.get(Calendar.HOUR_OF_DAY)+":"+cc.get(Calendar.MINUTE)+":"+cc.get(Calendar.SECOND);
					        		performance.setFlightDateTime(flightDateTime);
				        		}
				        		
				        	}else {
				        		String flightDateTime = cc.get(Calendar.YEAR)+"-"+cc.get(Calendar.MONTH)+"-"+cc.get(Calendar.DAY_OF_MONTH)+" "+cc.get(Calendar.HOUR_OF_DAY)+":"+cc.get(Calendar.MINUTE)+":"+cc.get(Calendar.SECOND);
					        	logger.info("看看flightDateTime："+cc.get(Calendar.YEAR)+"-"+(cc.get(Calendar.MONTH))+"-"+cc.get(Calendar.DAY_OF_MONTH)+" "+cc.get(Calendar.HOUR_OF_DAY)+":"+cc.get(Calendar.MINUTE)+":"+cc.get(Calendar.SECOND));
					        	performance.setFlightDateTime(flightDateTime);
				        	}
				        }
				        
				        //logger.info("第一次计算后的时间："+cc.get(Calendar.YEAR)+"-"+(cc.get(Calendar.MONTH))+"-"+cc.get(Calendar.DAY_OF_MONTH)+" "+cc.get(Calendar.HOUR)+":"+cc.get(Calendar.MINUTE)+":"+cc.get(Calendar.SECOND));
				        
				        
					}
					
					}
			        
//			        String flightDateTime = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH))+"-"+cal.get(Calendar.DAY_OF_MONTH)+" "+cal.get(Calendar.HOUR)+":"+cal.get(Calendar.MINUTE)+":"+cal.get(Calendar.SECOND);
//			        logger.info("这个带时分秒的数据时怎么样的呢："+flightDateTime);
//					performance.setFlightDateTime(flightDateTime);
				}
				if(length>=6) {
					performance.setEngineType(arr[5]);
				}
				if(length>=7) {
					performance.setZphsr(arr[6]);
				}
				if(length>=8) {
					performance.setGpcn25Smoothed(arr[7]);
				}
				if(length>=9) {
					performance.setDegtSmoothed(arr[8]);
				}
				if(length>=10) {
					performance.setZphsf(arr[9]);
				}
				if(length>=11) {
					performance.setEgthdmD(arr[10]);
				}
				if(length>=12) {
					performance.setZvb1fSmoothed(arr[11]);
				}
				if(length>=13) {
					performance.setGwfm(arr[12]);
				}
				if(length>=14) {
					performance.setEgthdm(arr[13]);
				}
				if(length>=15) {
					performance.setGwfmD(arr[14]);
				}
				if(length>=16) {
					performance.setZvb1r(arr[15]);
				}
				if(length>=17) {
					performance.setEgthdmDSmoothed(arr[16]);
				}
				if(length>=18) {
					performance.setZtoil(arr[17]);
				}
				if(length>=19) {
					performance.setZvb2f(arr[18]);
				}
				if(length>=20) {
					performance.setZvb2r(arr[19]);
				}
				if(length>=21) {
					performance.setZvb1f(arr[20]);
				}
				if(length>=22) {
					performance.setZvb2rSmoothed(arr[21]);
				}
				if(length>=23) {
					performance.setDegtDSmoothed(arr[22]);
				}
				if(length>=24) {
					performance.setGpcn25D(arr[23]);
				}
				if(length>=25) {
					performance.setZvb1rSmoothed(arr[24]);
				}
				if(length>=26) {
					performance.setZtoilSmoothed(arr[25]);
				}
				if(length>=27) {
					performance.setGwfmSmoothed(arr[26]);
				}
				if(length>=28) {
					performance.setGpcn25(arr[27]);
				}
				if(length>=29) {
					performance.setGwfmDSmoothed(arr[28]);
				}
				if(length>=30) {
					performance.setGpcn25DSmoothed(arr[29]);
				}
				if(length>=31) {
					performance.setZvb2fSmoothed(arr[30]);
				}
				if(length>=32) {
					performance.setZpoilSmoothed(arr[31]);
				}
				if(length>=33) {
					performance.setEgthdmSmoothed(arr[32]);
				}
				if(length>=34) {
					performance.setDegtD(arr[33]);
				}
				if(length>=35) {
					performance.setZpoil(arr[34]);
				}
				if(length>=36) {
					performance.setZt49(arr[35]);
				}
				if(length>=37) {
					performance.setDegt(arr[36]);
				}
				if(length>=38) {
					if(arr[37]!=null&&!arr[37].equals("")) {
						Calendar cal = Calendar.getInstance();  
				        cal.set(1900,0,1);
				        cal.add(Calendar.DAY_OF_MONTH, Integer.parseInt(arr[37])-2);
				        String ctime = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
				        performance.setCtime(ctime);
					}else {
						String date = LocalDateTime.now().toString().replace("T", " ");
						String ctime = date.substring(0, date.indexOf("."));
						performance.setCtime(ctime);
					}
				}else {
					String date = LocalDateTime.now().toString().replace("T", " ");
					String ctime = date.substring(0, date.indexOf("."));
					performance.setCtime(ctime);
				}
				
				
				

//				DataCfmPerformance isExistPerformance = datacfmperformanceMapper.select(performance);
//				if (isExistPerformance == null) {
					
					datacfmperformanceMapper.insert(performance);
//				} else {
//					datacfmperformanceMapper.updateTwo(performance);
//				}
			}
		} catch (IOException e) {
			logger.debug(e);
		}
	}

	/**
	 * 获取所有发动机性能数据
	 * 
	 * @param paramMap
	 * @return
	 */
	public List<DataCfmPerformance> all(Map<String, String> paramMap) {
		return datacfmperformanceMapper.all(paramMap);
	}

}
