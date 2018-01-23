package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.FleetEng;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 机队清单持久层接口
 */
public interface FleetEngMapper {

	/**
	 * 查询机队清单列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<FleetEng> getFleetEngList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存机队清单
	 * 
	 * @param fleeteng
	 */
	void insert(FleetEng fleeteng);

	/**
	 * 更新机队清单
	 * 
	 * @param fleeteng
	 */
	void update(FleetEng fleeteng);

	/**
	 * 删除机队清单
	 * 
	 * @param fleeteng
	 */
	void delete(FleetEng fleeteng);

	/**
	 * 查询机队清单
	 * 
	 * @param fleeteng
	 */
	FleetEng select(FleetEng fleeteng);
	
	List<FleetEng> getAllFleetEngInfo();

}
