package com.cea.ehm.service;

import java.io.IOException;
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

import com.cea.ehm.bean.DataPlane;
import com.cea.ehm.bean.Duty;
import com.cea.ehm.bean.OilConsumption;
import com.cea.ehm.bean.User;
import com.cea.ehm.dao.DutyMapper;
import com.cea.ehm.dao.OilConsumptionMapper;
import com.cea.ehm.dao.UserMapper;
import com.cea.ehm.dao.DataPlaneMapper;
import com.cea.ehm.util.ExcelUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 滑耗数据 服务层
 */
@Service
public class OilConsumptionService {
	private Logger logger = Logger.getLogger(OilConsumptionService.class);
	@Autowired
	private OilConsumptionMapper oilMapper;
	@Autowired
	private DutyMapper dutyMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private DataPlaneMapper dataplaneMapper;

	/**
	 * 滑耗数据 保存
	 * 
	 * @param oil
	 */
	public void save(OilConsumption oil) {
		oilMapper.save(oil);
	}

	/**
	 * 查询滑耗数据
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<OilConsumption> getList(Map<String, String> paramMap, PageBounds pageBounds) {
		PageList<OilConsumption> oils = oilMapper.getList(paramMap, pageBounds);
		// 提取所有的基地ID 和基地名
		List<Duty> allDuty = dutyMapper.getAllDuty();
		Map<Integer, String> dutyMap = Maps.newHashMap();
		allDuty.forEach(duty -> dutyMap.put(duty.getId(), duty.getName()));
		// 提取所有的用户ID 和用户名
		List<User> allUser = userMapper.getAllUser();
		Map<Integer, String> userMap = Maps.newHashMap();
		allUser.forEach(user -> userMap.put(user.getUserId(), user.getUsername()));
		oils.forEach(oil -> {
			oil.setDutyName(dutyMap.get(oil.getDuty()));
			String username = userMap.get(oil.getUserId());
			oil.setUsername(Optional.ofNullable(username).orElse("admin"));
		});
		return oils;
	}

	/**
	 * 滑耗数据 删除
	 * 
	 * @param oil
	 */
	public void delete(OilConsumption oil) {
		oilMapper.delete(oil);
	}

	/**
	 * 滑耗数据 修改
	 * 
	 * @param oil
	 */
	public void update(OilConsumption oil) {
		oilMapper.update(oil);
	}
	/**
	 * 创建 excel数据表格
	 * 
	 * @return
	 */
	public Workbook createExcel() {
		List<OilConsumption> oils = oilMapper.allOilConsumption();
		// 提取所有的基地ID 和基地名
		List<Duty> allDuty = dutyMapper.getAllDuty();
		Map<Integer, String> dutyMap = Maps.newHashMap();
		allDuty.forEach(duty -> dutyMap.put(duty.getId(), duty.getName()));
		oils.forEach(plane -> {
			String dutyName = dutyMap.get(plane.getDuty());
			plane.setDutyName(Optional.ofNullable(dutyName).orElse("-"));
		});
		// 创建一个Excel文件
		Workbook workbook = new XSSFWorkbook();
		// 创建一个工作表
		Sheet sheet = workbook.createSheet("滑耗数据");
		// 添加表头行
		Row row0 = sheet.createRow(0);
		// 添加表头内容
		//row0.createCell(0).setCellValue("ID");
		row0.createCell(0).setCellValue("分公司");
		row0.createCell(1).setCellValue("机型");
		//row0.createCell(3).setCellValue("飞机ID");
		row0.createCell(2).setCellValue("机号");
		row0.createCell(3).setCellValue("航班号");
		row0.createCell(4).setCellValue("飞行日期");
		row0.createCell(5).setCellValue("空中时间");
		row0.createCell(6).setCellValue("空地时间");
		row0.createCell(7).setCellValue("起飞航站");
		row0.createCell(8).setCellValue("到达航站");
		row0.createCell(9).setCellValue("1发加油前滑油量");
		row0.createCell(10).setCellValue("1发滑油添加量");
		row0.createCell(11).setCellValue("1发加油时间差");
		row0.createCell(12).setCellValue("1发滑油消耗");
		row0.createCell(13).setCellValue("1发滑油消耗率");
		row0.createCell(14).setCellValue("2发加油前滑油量");
		row0.createCell(15).setCellValue("2发滑油添加量");
		row0.createCell(16).setCellValue("2发加油时间差");
		row0.createCell(17).setCellValue("2发滑油消耗");
		row0.createCell(18).setCellValue("2发滑油消耗率");
		row0.createCell(19).setCellValue("3发加油前滑油量");
		row0.createCell(20).setCellValue("3发滑油添加量");
		row0.createCell(21).setCellValue("3发加油时间差");
		row0.createCell(22).setCellValue("3发滑油消耗");
		row0.createCell(23).setCellValue("3发滑油消耗率");
		row0.createCell(24).setCellValue("4发加油前滑油量");
		row0.createCell(25).setCellValue("4发滑油添加量");
		row0.createCell(26).setCellValue("4发加油时间差");
		row0.createCell(27).setCellValue("4发滑油消耗");
		row0.createCell(28).setCellValue("4发滑油消耗率");
		row0.createCell(29).setCellValue("发动机警戒值");
		row0.createCell(30).setCellValue("APU滑油添加量");
		row0.createCell(31).setCellValue("APU滑油消耗率");
		row0.createCell(32).setCellValue("APU滑油消耗警戒值");
		row0.createCell(33).setCellValue("录入人");
		row0.createCell(34).setCellValue("创建时间");
		// 添加数据内容
		for (int i = 0; i < oils.size(); i++) {
			Row row = sheet.createRow(i + 1);
			//row.createCell(0).setCellValue(oils.get(i).getId() + "");
			row.createCell(0).setCellValue(oils.get(i).getDutyName() + "");
			row.createCell(1).setCellValue(oils.get(i).getConfigPlane() + "");
			//row.createCell(3).setCellValue(oils.get(i).getPlaneId() + "");
			row.createCell(2).setCellValue(oils.get(i).getTail() + "");
			row.createCell(3).setCellValue(oils.get(i).getFltNo() + "");
			row.createCell(4).setCellValue(oils.get(i).getFltTime() + "");
			row.createCell(5).setCellValue(oils.get(i).getAirTime() + "");
			row.createCell(6).setCellValue(oils.get(i).getGroundTime() + "");
			row.createCell(7).setCellValue(oils.get(i).getStartTerminal() + "");
			row.createCell(8).setCellValue(oils.get(i).getEndTerminal() + "");
			row.createCell(9).setCellValue(oils.get(i).getRefuelOil1() + "");
			row.createCell(10).setCellValue(oils.get(i).getOilAddition1() + "");
			row.createCell(11).setCellValue(oils.get(i).getRefuelTimeDifference1() + "");
			row.createCell(12).setCellValue(oils.get(i).getOilConsume1() + "");
			row.createCell(13).setCellValue(oils.get(i).getOilConsumeRate1() + "");
			row.createCell(14).setCellValue(oils.get(i).getRefuelOil2() + "");
			row.createCell(15).setCellValue(oils.get(i).getOilAddition2() + "");
			row.createCell(16).setCellValue(oils.get(i).getRefuelTimeDifference2() + "");
			row.createCell(17).setCellValue(oils.get(i).getOilConsume2() + "");
			row.createCell(18).setCellValue(oils.get(i).getOilConsumeRate2() + "");
			row.createCell(19).setCellValue(oils.get(i).getRefuelOil3() + "");
			row.createCell(20).setCellValue(oils.get(i).getOilAddition3()+ "");
			row.createCell(21).setCellValue(oils.get(i).getRefuelTimeDifference3()+ "");
			row.createCell(22).setCellValue(oils.get(i).getOilConsume3() + "");
			row.createCell(23).setCellValue(oils.get(i).getOilConsumeRate3() + "");
			row.createCell(24).setCellValue(oils.get(i).getRefuelOil4()+ "");
			row.createCell(25).setCellValue(oils.get(i).getOilAddition4() + "");
			row.createCell(26).setCellValue(oils.get(i).getRefuelTimeDifference4() + "");
			row.createCell(27).setCellValue(oils.get(i).getOilConsume4()+ "");
			row.createCell(28).setCellValue(oils.get(i).getOilConsumeRate4()+ "");
			row.createCell(29).setCellValue(oils.get(i).getEngVigilance() + "");
			row.createCell(30).setCellValue(oils.get(i).getApuOilAddition() + "");
			row.createCell(31).setCellValue(oils.get(i).getApuOilConsumeRate() + "");
			row.createCell(32).setCellValue(oils.get(i).getApuOilConsumeVigilance()+ "");
			row.createCell(33).setCellValue(oils.get(i).getUserId() + "");
			row.createCell(34	).setCellValue(oils.get(i).getCtime() + "");
		}

		return workbook;
	}

	/**
	 * 处理滑耗数据信息
	 * 
	 * @param file
	 */
	public void process(MultipartFile file) {
		// 提取所有的基地ID 和基地名
		List<Duty> allDuty = dutyMapper.getAllDuty();
		Map<String, Integer> dutyMap = Maps.newHashMap();
		allDuty.forEach(duty -> dutyMap.put(duty.getName(), duty.getId()));
		List<DataPlane> allPlane = dataplaneMapper.allPlane();
		Map<String, Integer> planeMap = Maps.newHashMap();
		allPlane.forEach(plane -> planeMap.put(plane.getTail(), plane.getId()));
		try {
			// 这里得到的是一个集合，里面的每一个元素是String[]数组
			List<String[]> list = ExcelUtil.readExcel(file);
			for (String[] arr : list) {
				int length = arr.length;
				OilConsumption oil = new OilConsumption ();
				//oil.setId(Integer.parseInt(arr[0]));
				if(length>=1) {
					Integer duty = dutyMap.get(arr[0]);
					if(duty==null) {
						Duty dutyinfo = new Duty();
						dutyinfo.setName(arr[0]);
						dutyinfo.setParentId(0);//新增的都默认为0，即父级
						dutyinfo.setType(1);//此处为执管单位，excel数据对应的就是分公司
						dutyinfo.setLocation("");//不知道填啥好，就空吧
						dutyinfo.setRole(0);//不清楚具体值，以后应该会有默认值的吧，到时候再改，别忘了就好
						String date = LocalDateTime.now().toString().replace("T", " ");
						String ctime1 = date.substring(0, date.indexOf("."));
						dutyinfo.setCtime(ctime1);
						if(dutyMapper.selectByName(dutyinfo)==null) {
							dutyMapper.insert(dutyinfo);
						}
						
						//获取id，dutyname对应的
						Duty duty2 = new Duty();
						duty2.setName(arr[0]);
						Integer dutyId=dutyMapper.selectIdByName(duty2);
						oil.setDuty(dutyId);
					}else {
						oil.setDuty(Optional.ofNullable(duty).orElse(0));
					}
					
				}
				if(length>=2) {
					oil.setConfigPlane(arr[1]);
				}
				//oil.setDutyName(arr[1]);
				if(length>=3) {
					Integer planeId = planeMap.get(arr[2]);
					oil.setPlaneId(planeId);
					oil.setTail(arr[2]);
				}
				if(length>=4) {
					oil.setFltNo(arr[3]);
				}
				if(length>=5) {
					if(arr[4]!=null&&!arr[4].equals("")) {
						Calendar cal = Calendar.getInstance();  
				        cal.set(1900,0,1);
				        cal.add(Calendar.DAY_OF_MONTH, Integer.parseInt(arr[4])-2);
				        String flttime= cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
				        oil.setFltTime(flttime);
					}
				}
				if(length>=6) {
					oil.setAirTime(arr[5]);
				}
				if(length>=7) {
					oil.setGroundTime(arr[6]);
				}
				if(length>=8) {
					oil.setStartTerminal(arr[7]);
				}
				if(length>=9) {
					oil.setEndTerminal(arr[8]);
				}
				if(length>=10) {
					oil.setRefuelOil1(arr[9]);
				}
				if(length>=11) {
					oil.setOilAddition1(arr[10]);
				}
				if(length>=12) {
					oil.setRefuelTimeDifference1(arr[11]);
				}
				if(length>=13) {
					oil.setOilConsume1(arr[12]);
				}
				if(length>=14) {
					oil.setOilConsumeRate1(arr[13]);
				}
				if(length>=15) {
					oil.setRefuelOil2(arr[14]);
				}
				if(length>=16) {
					oil.setOilAddition2(arr[15]);
				}
				if(length>=17) {
					oil.setRefuelTimeDifference2(arr[16]);
				}
				if(length>=18) {
					oil.setOilConsume2(arr[17]);
				}
				if(length>=19) {
					oil.setOilConsumeRate2(arr[18]);
				}
				if(length>=20) {
					oil.setRefuelOil3(arr[19]);
				}
				if(length>=21) {
					oil.setOilAddition3(arr[20]);
				}
				if(length>=22) {
					oil.setRefuelTimeDifference3(arr[21]);
				}
				if(length>=23) {
					oil.setOilConsume3(arr[22]);
				}
				if(length>=24) {
					oil.setOilConsumeRate3(arr[23]);
				}
				if(length>=25) {
					oil.setRefuelOil4(arr[24]);
				}
				if(length>=26) {
					oil.setOilAddition4(arr[25]);
				}
				if(length>=27) {
					oil.setRefuelTimeDifference4(arr[26]);
				}
				if(length>=28) {
					oil.setOilConsume4(arr[27]);
				}
				if(length>=29) {
					oil.setOilConsumeRate4(arr[28]);
				}
				if(length>=30) {
					oil.setEngVigilance(arr[29]);
				}
				if(length>=31) {
					oil.setApuOilAddition(arr[30]);
				}
				if(length>=32) {
					oil.setApuOilConsumeRate(arr[31]);
				}
				if(length>=33) {
					oil.setApuOilConsumeVigilance(arr[32]);
				}
				if(length>=34) {
					oil.setUserId(Integer.parseInt(arr[33]));
				}
				if(length>=35) {
					if(arr[34]!=null&&!arr[34].equals("")) {
						Calendar cal = Calendar.getInstance();  
				        cal.set(1900,0,1);
				        cal.add(Calendar.DAY_OF_MONTH, Integer.parseInt(arr[34])-2);
				        String ctime= cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
				        oil.setCtime(ctime);
					}else {
						String date = LocalDateTime.now().toString().replace("T", " ");
						String ctime = date.substring(0, date.indexOf("."));
						oil.setCtime(ctime);
					}
					
				}
				
				
				OilConsumption isExistOil =oilMapper.select(oil);
				if (isExistOil == null) {
					String date = LocalDateTime.now().toString().replace("T", " ");
					String ctime = date.substring(0, date.indexOf("."));
					oil.setCtime(ctime);
					oilMapper.save(oil);
				} else {
					oilMapper.update(oil);
				}
			}
		} catch (IOException e) {
			logger.debug(e);
		}

	}
	
	/**
	 * 获取滑油详情
	 * 
	 * @param id
	 * @return
	 */
	public List<OilConsumption> oilInfo(Map<String, String> paramMap) {
		return oilMapper.oilInfo(paramMap);
	}
}
