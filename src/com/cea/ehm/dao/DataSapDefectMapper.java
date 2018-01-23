package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.DataSapDefect;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * SAP缺陷清单记录持久层接口
 */
public interface DataSapDefectMapper {

	/**
	 * 查询SAP缺陷清单记录列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<DataSapDefect> getDataSapDefectList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存SAP缺陷清单记录
	 * 
	 * @param datasapdefect
	 */
	void insert(DataSapDefect datasapdefect);

	/**
	 * 更新SAP缺陷清单记录
	 * 
	 * @param datasapdefect
	 */
	void update(DataSapDefect datasapdefect);

	/**
	 * 删除SAP缺陷清单记录
	 * 
	 * @param datasapdefect
	 */
	void delete(DataSapDefect datasapdefect);

	/**
	 * 查询SAP缺陷清单记录
	 * 
	 * @param datasapdefect
	 */
	DataSapDefect select(DataSapDefect datasapdefect);
	
	List<DataSapDefect> getAllDataSapDefectInfo();

}
