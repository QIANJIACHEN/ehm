package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.RecordDataEng;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 发动机更变记录持久层接口
 */
public interface RecordDataEngMapper {
	/**
	 * 查询发动机更变记录列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<RecordDataEng> getRecordDataEngList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存发动机更变记录信息
	 * 
	 * @param user
	 */
	void insert(RecordDataEng recorddataeng);

	/**
	 * 更新发动机更变记录信息
	 * 
	 * @param user
	 */
	@Deprecated
	void update(RecordDataEng recorddataeng);

	/**
	 * 删除发动机更变记录信息
	 * 
	 * @param user
	 */
	@Deprecated
	void delete(RecordDataEng recorddataeng);

	/**
	 * 查询发动机更变记录信息
	 * 
	 * @param user
	 */
	@Deprecated
	RecordDataEng select(RecordDataEng recorddataeng);

	/**
	 * 根据id查询记录
	 */
	List<RecordDataEng> getRecordDataEngbyid(Map<String, Integer> paramMap);

	/**
	 * 根据engSn查询记录
	 */
	List<RecordDataEng> getlistbyeng(Map<String, String> paramMap);
}
