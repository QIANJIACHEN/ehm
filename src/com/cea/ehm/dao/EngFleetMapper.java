package com.cea.ehm.dao;

import java.util.Map;

import com.cea.ehm.bean.EngFleet;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 发动机签发持久层接口
 */
public interface EngFleetMapper {

	/**
	 * 查询发动机签发列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<EngFleet> getEngFleetList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存发动机签发信息
	 * 
	 * @param engfleet
	 */
	void insert(EngFleet engfleet);

	/**
	 * 更新发动机签发信息
	 * 
	 * @param engfleet
	 */
	void update(EngFleet engfleet);

	/**
	 * 删除发动机签发信息
	 * 
	 * @param engfleet
	 */
	void delete(EngFleet engfleet);

	/**
	 * 查询发动机签发信息
	 * 
	 * @param engfleet
	 */
	EngFleet select(EngFleet engfleet);

}
