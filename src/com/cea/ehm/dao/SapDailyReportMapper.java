package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.SapDailyReport;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 计算规则持久层接口
 */
public interface SapDailyReportMapper {

	/**
	 * 查询计算规则列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<SapDailyReport> getSapDailyReportList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存计算规则信息
	 * 
	 * @param user
	 */
	void insert(SapDailyReport sapdailyreport);

	/**
	 * 更新计算规则信息
	 * 
	 * @param user
	 */
	void update(SapDailyReport sapdailyreport);

	/**
	 * 删除计算规则信息
	 * 
	 * @param user
	 */
	void delete(SapDailyReport sapdailyreport);

	/**
	 * 查询计算规则信息
	 * 
	 * @param user
	 */
	SapDailyReport select(SapDailyReport sapdailyreport);
	
	/**
	 * 获取所有日报信息
	 * @return
	 */
	List<SapDailyReport> getAllSapDaily();
	
	/**
	 * 获取详情
	 * 
	 * @param id
	 * @return
	 */
	List<SapDailyReport> getSapDailyDetail(Map<String, Integer> paramMap);
}
