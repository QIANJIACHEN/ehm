package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;
import com.cea.ehm.bean.WaterWash;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 水洗持久层接口
 */
public interface WaterWashMapper {

	/**
	 * 查询水洗列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<WaterWash> getWaterWashList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存水洗信息
	 * 
	 * @param user
	 */
	void insert(WaterWash waterwash);

	/**
	 * 更新水洗信息
	 * 
	 * @param user
	 */
	void update(WaterWash waterwash);
	/**
	 * 删除水洗信息
	 * 
	 * @param user
	 */
	void delete(WaterWash waterwash);

	/**
	 * 查询水洗信息
	 * 
	 * @param user
	 */
	WaterWash select(WaterWash waterwash);
	
	/**
	 * 获取所有 水洗数据
	 * 
	 * @return
	 */
	List<WaterWash> allWaterWash();

	/**
	 * 根据id获取水洗数据
	 */
	List<WaterWash> getWaterWashById(Map<String,Integer> paramMap);
}
