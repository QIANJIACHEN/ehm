package com.cea.ehm.service;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cea.ehm.dao.RecordEngSvScheduleMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.cea.ehm.bean.RecordEngSvSchedule;

@Service
public class RecordEngSvScheduleService {
	private Logger logger = Logger.getLogger(RecordEngSvScheduleService.class);
	@Autowired
	private RecordEngSvScheduleMapper recordEngSvScheduleMapper;
	
	/*
	 * 查询发动机维修记录列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<RecordEngSvSchedule> getRecordEngSvScheduleList(Map<String, String> paramMap, PageBounds pageBounds) {
		logger.info("查询数据参数："+paramMap);
		return recordEngSvScheduleMapper.getRecordEngSvScheduleList(paramMap, pageBounds);
	}
	
	/*
	 * 保存发动机维修记录表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public void save(RecordEngSvSchedule recordEngSvSchedule) {
		recordEngSvScheduleMapper.insert(recordEngSvSchedule);
	}
	
	/*
	 * 更新发动机维修信息
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public void update(RecordEngSvSchedule recordEngSvSchedule) {
		recordEngSvScheduleMapper.update(recordEngSvSchedule);
	}
	
	/**
	 * 删除维修记录信息
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public void delete(RecordEngSvSchedule recordEngSvSchedule) {
		recordEngSvScheduleMapper.delete(recordEngSvSchedule);
	}
}