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
import com.cea.ehm.bean.EngDeadLineLlp;
import com.cea.ehm.dao.DataEngMapper;
import com.cea.ehm.dao.EngDeadLineLlpMapper;
import com.cea.ehm.util.ExcelUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 发动机备发服务层
 */
@Service
public class EngDeadLineLlpService {
	private Logger logger = Logger.getLogger(EngDeadLineLlpService.class);
	@Autowired
	private EngDeadLineLlpMapper engdeadlinellpMapper;
	@Autowired
	private DataEngMapper dataengMapper;
	/**
	 * 查询发动机备发列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<EngDeadLineLlp> getEngDeadLineLlpList(Map<String, String> paramMap, PageBounds pageBounds) {
		logger.info("数据库查询参数：" + paramMap);
		return engdeadlinellpMapper.getEngDeadLineLlpList(paramMap, pageBounds);
	}

	/**
	 * 保存或更新机队清单
	 * 
	 * @param engdeadlinellp
	 */
	public void saveOrUpdate(EngDeadLineLlp engdeadlinellp) {
		// 查询判断机队清单是否存在，考虑保存还是更新
		EngDeadLineLlp selectuser = engdeadlinellpMapper.select(engdeadlinellp);
		if (selectuser == null) {
			engdeadlinellpMapper.insert(engdeadlinellp);
		} else {
			engdeadlinellpMapper.update(engdeadlinellp);
		}
	}

	/**
	 * 删除机队清单
	 * 
	 * @param engdeadlinellp
	 */
	public void delete(EngDeadLineLlp engdeadlinellp) {
		// 这里是物理删除，删除后机队清单从数据库消失
		engdeadlinellpMapper.delete(engdeadlinellp);
	}

	/**
	 * 创建 excel数据表格
	 * 
	 * @return
	 */
	public Workbook createExcel() {
		List<EngDeadLineLlp> allInfo = engdeadlinellpMapper.getAllEngDeadLineLlpInfo();
		// 创建一个Excel文件
		Workbook workbook = new XSSFWorkbook();
		// 创建一个工作表
		Sheet sheet = workbook.createSheet("ENG_DEADLINE_LLP");
		// 添加表头行
		Row row0 = sheet.createRow(0);
		// 添加表头内容
		row0.createCell(0).setCellValue("ENG_SN");
		row0.createCell(1).setCellValue("DEADLINE_LLP");
		row0.createCell(2).setCellValue("DEADLINE_211");

		// 添加数据内容
		for (int i = 0; i < allInfo.size(); i++) {
			Row row = sheet.createRow(i + 1);
			row.createCell(0).setCellValue(allInfo.get(i).getEngSn() + "");
			row.createCell(1).setCellValue(allInfo.get(i).getDeadLineLlp() + "");
			row.createCell(2).setCellValue(allInfo.get(i).getDeadLine211() + "");
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
		try {
			// 这里得到的是一个集合，里面的每一个元素是String[]数组
			List<String[]> list = ExcelUtil.readExcel(file);
			
			for (String[] arr : list) {
				
				int length = arr.length;
				
				EngDeadLineLlp engdeadlinellp = new EngDeadLineLlp();
				
				if(length>=1) {
					Integer engId = engMap.get(arr[0]);
					engdeadlinellp.setEngId(Optional.ofNullable(engId).orElse(0));
					engdeadlinellp.setEngSn(arr[0]);
				}
				if(length>=2) {
					engdeadlinellp.setDeadLineLlp(arr[1]);
				}
				if(length>=3) {
					engdeadlinellp.setDeadLine211(arr[2]);
				}
				engdeadlinellpMapper.insert(engdeadlinellp);
				
			}
		} catch (IOException e) {
			logger.debug(e);
		}

	}
}
