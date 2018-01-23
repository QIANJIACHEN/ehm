package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.OilConsumption;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 滑耗数据 持久层接口
 */
public interface OilConsumptionMapper {

	/**
	 * 滑耗数据 保存
	 * 
	 * @param oil
	 */
	void save(OilConsumption oil);

	/**
	 * 查询滑耗数据
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<OilConsumption> getList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 滑耗数据 删除
	 * 
	 * @param oil
	 */
	void delete(OilConsumption oil);
	/**
	 * 滑耗数据 查询
	 * 
	 * @param oil
	 */
	OilConsumption select(OilConsumption oil);

	/**
	 * 滑耗数据 修改
	 * 
	 * @param oil
	 */
	void update(OilConsumption oil);
	/**
	 * 获取所有 滑耗数据
	 * 
	 * @return
	 */
	List<OilConsumption> allOilConsumption();
	
	/**
	 * 获取滑油数据详情
	 * 
	 * @return
	 */
	List<OilConsumption> oilInfo(Map<String, String> paramMap);
	

}
