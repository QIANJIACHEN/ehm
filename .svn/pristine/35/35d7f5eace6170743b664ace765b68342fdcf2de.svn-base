package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.EngOnwing;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * eng_onwing
 */
public interface EngOnwingMapper {
	/**
	 * 获取 engOnwing 数据
	 * 
	 * @param pageBounds
	 * @param paramMap
	 * @return
	 */
	List<EngOnwing> getList(Map<String, String> paramMap, PageBounds pageBounds);
	/**
	 * 上面一个好像有问题，但我不确定是否有其他作用，暂不修改
	 * 获取engOnwing列表
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<EngOnwing> getEngOnwingList(Map<String, String> paramMap, PageBounds pageBounds);
	/**
	 * 获取详情数据
	 * 
	 * @param paramMap
	 * @return
	 */
	List<EngOnwing> getInfo(Map<String, String> paramMap);
	/**
	 * 获取详情数据
	 * 
	 * @param paramMap
	 * @return
	 */
	List<EngOnwing> getEngOnwingInfo(Map<String, Integer> paramMap);
	
}
