package com.cea.ehm.dao;

import java.util.Map;

import com.cea.ehm.bean.LlpActivity;
import com.cea.ehm.bean.LlpHistory;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 水洗持久层接口
 */
public interface LlpActivityMapper {

	/**
	 * 查询水洗列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<LlpActivity> getLlpActivityList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存水洗信息
	 * 
	 * @param user
	 */
	void insert(LlpActivity llpactivity);

	/**
	 * 更新水洗信息
	 * 
	 * @param user
	 */
	void update(LlpActivity llpactivity);

	/**
	 * 删除水洗信息
	 * 
	 * @param user
	 */
	void delete(LlpActivity llpactivity);

	/**
	 * 查询水洗信息
	 * 
	 * @param user
	 */
	LlpActivity select(LlpActivity llpactivity);

	
	PageList<LlpHistory> getLlpHistoryList(Map<String, String> paramMap, PageBounds pageBounds);
	void addHistory(LlpHistory llpHistory);
	void editHistory(LlpHistory llpHistory);
	void deleteHistory(LlpHistory llpHistory);

}