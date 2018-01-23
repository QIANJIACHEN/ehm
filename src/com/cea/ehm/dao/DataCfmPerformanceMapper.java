package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.DataCfmPerformance;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 发动机性能数据持久层接口
 */
public interface DataCfmPerformanceMapper {

	/**
	 * 查询发动机性能数据列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<DataCfmPerformance> getDataCfmPerformanceList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存发动机性能数据信息
	 * 
	 * @param datacfmperformance
	 */
	void insert(DataCfmPerformance datacfmperformance);

	/**
	 * (根据 id) 更新发动机性能数据信息
	 * 
	 * @param datacfmperformance
	 */
	void update(DataCfmPerformance datacfmperformance);

	/**
	 * (根据 engineType) 更新发动机性能数据信息
	 * 
	 * @param performance
	 */
	void updateTwo(DataCfmPerformance performance);

	/**
	 * 删除发动机性能数据信息
	 * 
	 * @param datacfmperformance
	 */
	void delete(DataCfmPerformance datacfmperformance);

	/**
	 * (根据 发动机类型) 查询发动机性能数据信息
	 * 
	 * @param datacfmperformance
	 */
	DataCfmPerformance select(DataCfmPerformance datacfmperformance);

	/**
	 * 获取所有 发动机性能数据
	 * 
	 * @return
	 */
	List<DataCfmPerformance> allDataCfmPerformance();

	/**
	 * 获取所有发动机性能数据
	 * 
	 * @param paramMap
	 * @return
	 */
	List<DataCfmPerformance> all(Map<String, String> paramMap);

	/**
	 * 根据 id 查询发动机性能数据
	 * 
	 * @param id
	 * @return
	 */
	DataCfmPerformance getOne(Integer id);

}
