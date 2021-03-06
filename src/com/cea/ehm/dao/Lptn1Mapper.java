package com.cea.ehm.dao;

import java.util.Map;

import com.cea.ehm.bean.Lptn1Activity;
import com.cea.ehm.bean.Lptn1History;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

public interface Lptn1Mapper {

	/**
	 * 获取 lptn1_activity 列表数据
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<Lptn1Activity> getLptn1ActivityList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * Lptn1_activity 添加
	 * 
	 * @param lptn1Activity
	 */
	void saveLptn1Activity(Lptn1Activity lptn1Activity);

	/**
	 * lptn1_activity 修改
	 * 
	 * @param lptn1Activity
	 */
	void updateLptn1Activity(Lptn1Activity lptn1Activity);

	/**
	 * lptn1_activity 删除
	 * 
	 * @param lptn1Activity
	 */
	void deleteLptn1Activity(Lptn1Activity lptn1Activity);

	/**
	 * 唯一字段查询
	 * 
	 * @param lptn1Activity
	 * @return
	 */
	Lptn1Activity selectLptn1Activity(Lptn1Activity lptn1Activity);

	/**
	 * *** ( lptn1_history ) ***
	 */

	/**
	 * 获取 lptn1_history 列表数据
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<Lptn1History> getLptn1HistoryList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * lptn1_history 添加
	 * 
	 * @param lptn1History
	 */
	void saveLptn1History(Lptn1History lptn1History);

	/**
	 * lptn1_history 修改
	 * 
	 * @param lptn1History
	 */
	void updateLptn1History(Lptn1History lptn1History);

	/**
	 * lptn1_history 删除
	 * 
	 * @param lptn1History
	 */
	void deleteLptn1History(Lptn1History lptn1History);

	/**
	 * 唯一字段查询
	 * 
	 * @param lptn1History
	 * @return
	 */
	Lptn1History selectLptn1History(Lptn1History lptn1History);

}
