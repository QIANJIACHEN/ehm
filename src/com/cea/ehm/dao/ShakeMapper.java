package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.Shake;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 震动数据 持久层接口
 */
public interface ShakeMapper {

	/**
	 * 查询震动数据（起飞）
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<Shake> listOne(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 查询震动数据（巡航）
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<Shake> listTwo(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 查询震动数据（所有）
	 * 
	 * @param paramMap
	 * @return
	 */
	List<Shake> list(Map<String, String> paramMap);
	List<Shake> getshakeServiceDetailbyid(Map<String, Integer> paramMap);
}
