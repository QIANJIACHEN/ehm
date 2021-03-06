package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.DataIdPlug;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * IDPLUG数据
 */
public interface DataIdPlugMapper {

	/**
	 * 查询 IDPLUG数据信息 → 列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<DataIdPlug> getDataIdPlugList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存 IDPLUG数据 信息
	 * 
	 * @param dataIdPlug
	 */
	void save(DataIdPlug dataIdPlug);

	/**
	 * 更新 IDPLUG数据 信息
	 * 
	 * @param dataIdPlug
	 */
	void update(DataIdPlug dataIdPlug);

	/**
	 * 删除 IDPLUG数据 信息
	 * 
	 * @param dataIdPlug
	 */
	void delete(DataIdPlug dataIdPlug);

	/*
	 * 获取所有IDPLUG数据
	 */
	
	List<DataIdPlug> getAllDataIdPlug();
}
