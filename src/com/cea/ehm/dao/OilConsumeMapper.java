package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.OilConsume;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 滑耗数据 持久层接口
 */
public interface OilConsumeMapper {

	/**
	 * 查询滑耗数据
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<OilConsume> list(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 获取所有滑耗数据
	 * 
	 * @param paramMap
	 * @return
	 */
	List<OilConsume> all(Map<String, String> paramMap);

}
