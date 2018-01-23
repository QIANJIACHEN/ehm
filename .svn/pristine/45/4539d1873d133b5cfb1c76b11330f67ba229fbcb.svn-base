package com.cea.ehm.dao;

import java.util.Map;

import com.cea.ehm.bean.RecordEngSvSchedule;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 维修记录接口
 */
public interface RecordEngSvScheduleMapper {
	/**
	 * 查询维修记录列表
	 * 
	 * @param paraMap
	 * @param pageBounds
	 * @return
	 */
	PageList<RecordEngSvSchedule> getRecordEngSvScheduleList(Map<String, String> paramMap, PageBounds pageBounds);
	 
	/*
	 * 保存发动机维修表
	 * 
	 * @param paraMap
	 * @param pageBounds
	 * @return
	 */
	void insert(RecordEngSvSchedule recordEngSvSchedule);
	
	/**
	 * 更新发动机维修表
	 * 
	 * @param ParaMap
	 * @param pageBounds
	 * @return
	 */
	void update(RecordEngSvSchedule recordEngSvSchedule);
	
	/*
	 * 删除
	 * 
	 * @param paraMap
	 * @param pageBounds
	 * @return
	 */
	void delete(RecordEngSvSchedule recordEngSvSchedule);
}