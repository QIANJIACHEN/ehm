package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.PlaneFlight;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

public interface PlaneFlightMapper {

	/**
	 * 查询航班信息
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<PlaneFlight> getList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 航班信息 保存
	 * 
	 * @param flight
	 */
	void save(PlaneFlight flight);

	/**
	 * 航班信息 修改
	 * 
	 * @param flight
	 */
	void update(PlaneFlight flight);

	/**
	 * 航班信息 删除
	 * 
	 * @param flight
	 */
	void delete(PlaneFlight flight);

	/**
	 * 获取所有的航班信息
	 * 
	 * @return
	 */
	List<PlaneFlight> allFlight();

}
