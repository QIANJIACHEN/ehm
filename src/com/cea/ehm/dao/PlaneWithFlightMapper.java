package com.cea.ehm.dao;

import java.util.Map;

import com.cea.ehm.bean.PlaneWithFlight;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 飞机 航班关联信息
 */
public interface PlaneWithFlightMapper {

	/**
	 * 保存飞机 航班关联信息
	 * 
	 * @param pwf
	 */
	void save(PlaneWithFlight pwf);

	/**
	 * 查询飞机 航班关联信息
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<PlaneWithFlight> getList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 修改飞机 航班关联信息
	 * 
	 * @param pwf
	 */
	void update(PlaneWithFlight pwf);

	/**
	 * 删除飞机 航班关联信息
	 * 
	 * @param pwf
	 */
	void delete(PlaneWithFlight pwf);

}
