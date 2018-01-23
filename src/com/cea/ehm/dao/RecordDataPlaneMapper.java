package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.RecordDataPlane;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 飞机属性更变记录持久层接口
 */
public interface RecordDataPlaneMapper {

	/**
	 * 查询飞机属性更变记录列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<RecordDataPlane> getRecordDataPlaneList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存飞机属性更变记录
	 * 
	 * @param user
	 */
	void insert(RecordDataPlane recorddataplane);

	/**
	 * 更新飞机属性更变记录信息
	 * 
	 * @param user
	 */
	@Deprecated
	void update(RecordDataPlane recorddataplane);

	/**
	 * 删除飞机属性更变记录信息
	 * 
	 * @param user
	 */
	@Deprecated
	void delete(RecordDataPlane recorddataplane);

	/**
	 * 查询飞机属性更变记录信息
	 * 
	 * @param user
	 */
	@Deprecated
	RecordDataPlane select(RecordDataPlane recorddataplane);

	/*
	 * 根据id查询记录
	 */
	List<RecordDataPlane> getRecordDataPlaneById(Map<String, Integer> paramMap);
	
}
