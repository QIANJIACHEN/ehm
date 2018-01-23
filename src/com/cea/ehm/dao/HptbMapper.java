package com.cea.ehm.dao;

import java.util.Map;

import com.cea.ehm.bean.HptbActivity;
import com.cea.ehm.bean.HptbHistory;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

public interface HptbMapper {

	/**
	 * 获取 Hptb_activity 列表数据
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<HptbActivity> getHptbActivityList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * hptb_activity 添加
	 * 
	 * @param hptbActivity
	 */
	void saveHptbActivity(HptbActivity hptbActivity);

	/**
	 * hptb_activity 修改
	 * 
	 * @param hptbActivity
	 */
	void updateHptbActivity(HptbActivity hptbActivity);

	/**
	 * hptb_activity 删除
	 * 
	 * @param hptbActivity
	 */
	void deleteHptbActivity(HptbActivity hptbActivity);

	/**
	 * 唯一字段查询
	 * 
	 * @param hptbActivity
	 * @return
	 */
	HptbActivity selectHptbActivity(HptbActivity hptbActivity);

	/**
	 * *** ( hptb_history ) ***
	 */

	/**
	 * 获取 hptb_history 列表数据
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<HptbHistory> getHptbHistoryList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * hptb_history 添加
	 * 
	 * @param hptbHistory
	 */
	void saveHptbHistory(HptbHistory hptbHistory);

	/**
	 * hptb_history 修改
	 * 
	 * @param hptbHistory
	 */
	void updateHptbHistory(HptbHistory hptbHistory);

	/**
	 * hptb_history 删除
	 * 
	 * @param hptbHistory
	 */
	void deleteHptbHistory(HptbHistory hptbHistory);

	/**
	 * 唯一字段查询
	 * 
	 * @param hptbHistory
	 * @return
	 */
	HptbHistory selectHptbHistory(HptbHistory hptbHistory);
}
