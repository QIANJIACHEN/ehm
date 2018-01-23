package com.cea.ehm.dao;

import java.util.Map;

import com.cea.ehm.bean.HptnActivity;
import com.cea.ehm.bean.HptnHistory;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

public interface HptnMapper {

	/**
	 * 获取 hptn_activity 列表数据
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<HptnActivity> getHptnActivityList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * hptn_activity（HPTN表）添加
	 * 
	 * @param hptnActivity
	 */
	void saveHptnActivity(HptnActivity hptnActivity);

	/**
	 * hptn_activity（HPTN表）修改
	 * 
	 * @param hptnActivity
	 */
	void updateHptnActivity(HptnActivity hptnActivity);

	/**
	 * hptn_activity（HPTN表）删除
	 * 
	 * @param hptnActivity
	 */
	void deleteHptnActivity(HptnActivity hptnActivity);

	/**
	 * 唯一字段查询
	 * 
	 * @param hptnActivity
	 * @return
	 */
	HptnActivity selectHptnActivity(HptnActivity hptnActivity);

	/**
	 * *** ( hptn_history ) ***
	 */

	/**
	 * 获取 hptn_history 列表数据
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<HptnHistory> getHptnHistoryList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * hptn_history 添加
	 * 
	 * @param HptnHistory
	 */
	void saveHptnHistory(HptnHistory HptnHistory);

	/**
	 * hptn_history 修改
	 * 
	 * @param HptnHistory
	 */
	void updateHptnHistory(HptnHistory HptnHistory);

	/**
	 * hptn_history 删除
	 * 
	 * @param HptnHistory
	 */
	void deleteHptnHistory(HptnHistory HptnHistory);

	/**
	 * 唯一字段查询
	 * 
	 * @param hptnHistory
	 * @return
	 */
	HptnHistory selectHptnHistory(HptnHistory hptnHistory);

}
