package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.DataPlane;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 飞机信息持久层接口
 */
public interface DataPlaneMapper {

	/**
	 * 查询飞机信息列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<DataPlane> getdataplaneList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存飞机信息
	 * 
	 * @param dataplane
	 */
	void insert(DataPlane dataplane);

	/**
	 * 更新飞机信息
	 * 
	 * @param dataplane
	 */
	void update(DataPlane dataplane);

	/**
	 * 根据tail 更新飞机信息
	 * 
	 * @param plane
	 */
	void updateTwo(DataPlane plane);

	/**
	 * 删除飞机信息
	 * 
	 * @param dataplane
	 */
	void delete(DataPlane dataplane);

	/**
	 * 根据 tail 查询飞机信息
	 * 
	 * @param dataplane
	 */
	DataPlane select(DataPlane dataplane);

	/**
	 * 根据 id 查询飞机信息
	 */
	DataPlane selectById(DataPlane dataplane);

	/**
	 * 获取所有飞机信息
	 * 
	 * @return
	 */
	List<DataPlane> allPlane();
	/**
	 * 根据tail获取飞机信息
	 * @return
	 */
	List<DataPlane> planeInfo(Map<String, String> paramMap);
	
	/**
	 * 获取MODEL的分组信息
	 */
	List<DataPlane> getPlaneGroupByModel();
	/*
	 * 获取model
	 */
	List<DataPlane> getModel();
	/*
	 * 获取OPERATER
	 */
	List<DataPlane> getOperater();
}
