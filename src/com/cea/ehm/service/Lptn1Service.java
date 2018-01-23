package com.cea.ehm.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.Lptn1Activity;
import com.cea.ehm.bean.Lptn1History;
import com.cea.ehm.dao.Lptn1Mapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * lptn1服务层
 */
@Service
public class Lptn1Service {
	@Autowired
	private Lptn1Mapper lptn1Mapper;

	/**
	 * 获取 lptn1_activity 列表数据
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<Lptn1Activity> getLptn1ActivityList(Map<String, String> paramMap, PageBounds pageBounds) {
		return lptn1Mapper.getLptn1ActivityList(paramMap, pageBounds);
	}

	/**
	 * lptn1_activity 添加
	 * 
	 * @param lptn1Activity
	 */
	public void saveLptn1Activity(Lptn1Activity lptn1Activity) {
		lptn1Mapper.saveLptn1Activity(lptn1Activity);
	}

	/**
	 * lptn1_activity 修改
	 * 
	 * @param lptn1Activity
	 */
	public void updateLptn1Activity(Lptn1Activity lptn1Activity) {
		lptn1Mapper.updateLptn1Activity(lptn1Activity);
	}

	/**
	 * lptn1_activity 删除
	 * 
	 * @param lptn1Activity
	 */
	public void deleteLptn1Activity(Lptn1Activity lptn1Activity) {
		lptn1Mapper.deleteLptn1Activity(lptn1Activity);
	}

	/**
	 * 唯一字段查询
	 * 
	 * @param lptn1Activity
	 * @return
	 */
	public Lptn1Activity selectLptn1Activity(Lptn1Activity lptn1Activity) {
		return lptn1Mapper.selectLptn1Activity(lptn1Activity);
	}

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
	public PageList<Lptn1History> getLptn1HistoryList(Map<String, String> paramMap, PageBounds pageBounds) {
		return lptn1Mapper.getLptn1HistoryList(paramMap, pageBounds);
	}

	/**
	 * lptn1_history 添加
	 * 
	 * @param lptn1History
	 */
	public void saveLptn1History(Lptn1History lptn1History) {
		lptn1Mapper.saveLptn1History(lptn1History);
	}

	/**
	 * lptn1_history 修改
	 * 
	 * @param lptn1History
	 */
	public void updateLptn1History(Lptn1History lptn1History) {
		lptn1Mapper.updateLptn1History(lptn1History);
	}

	/**
	 * lptn1_history 删除
	 * 
	 * @param lptn1History
	 */
	public void deleteLptn1History(Lptn1History lptn1History) {
		lptn1Mapper.deleteLptn1History(lptn1History);
	}

	/**
	 * 唯一字段查询
	 * 
	 * @param lptn1History
	 * @return
	 */
	public Lptn1History selectLptn1History(Lptn1History lptn1History) {
		return lptn1Mapper.selectLptn1History(lptn1History);
	}
}
