package com.cea.ehm.dao;

import java.util.Map;

import com.cea.ehm.bean.EngSpare;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 飞机信息持久层接口
 */
public interface EngSpareMapper {

	/**
	 * 查询飞机信息列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<EngSpare> getEngSpareList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存飞机信息
	 * 
	 * @param engspare
	 */
	void insert(EngSpare engspare);

	/**
	 * 更新飞机信息
	 * 
	 * @param engspare
	 */
	void update(EngSpare engspare);

	/**
	 * 删除飞机信息
	 * 
	 * @param engspare
	 */
	void delete(EngSpare engspare);

	/**
	 * 查询飞机信息
	 * 
	 * @param engspare
	 */
	EngSpare select(EngSpare engspare);

}
