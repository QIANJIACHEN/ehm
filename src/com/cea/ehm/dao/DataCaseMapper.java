package com.cea.ehm.dao;

import java.util.Map;

import com.cea.ehm.bean.DataCase;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 水洗持久层接口
 */
public interface DataCaseMapper {

	/**
	 * 查询水洗列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<DataCase> getDataCaseList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存水洗信息
	 * 
	 * @param user
	 */
	void insert(DataCase datacase);

	/**
	 * 更新水洗信息
	 * 
	 * @param user
	 */
	void update(DataCase datacase);

	/**
	 * 删除水洗信息
	 * 
	 * @param user
	 */
	void delete(DataCase datacase);

	/**
	 * 查询水洗信息
	 * 
	 * @param user
	 */
	DataCase select(DataCase datacase);

}
