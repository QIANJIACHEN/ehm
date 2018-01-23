package com.cea.ehm.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.HptnActivity;
import com.cea.ehm.bean.HptnHistory;
import com.cea.ehm.dao.HptnMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * htpn服务层
 */
@Service
public class HptnService {
	@Autowired
	private HptnMapper hptnMapper;

	/**
	 * 获取 hptn_activity 列表数据
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<HptnActivity> getHptnActivityList(Map<String, String> paramMap, PageBounds pageBounds) {
		return hptnMapper.getHptnActivityList(paramMap, pageBounds);
	}

	/**
	 * hptn_activity（HPTN表）添加
	 * 
	 * @param hptnActivity
	 */
	public void saveHptnActivity(HptnActivity hptnActivity) {
		hptnMapper.saveHptnActivity(hptnActivity);
	}

	/**
	 * hptn_activity（HPTN表）修改
	 * 
	 * @param hptnActivity
	 */
	public void updateHptnActivity(HptnActivity hptnActivity) {
		hptnMapper.updateHptnActivity(hptnActivity);
	}

	/**
	 * hptn_activity（HPTN表）删除
	 * 
	 * @param hptnActivity
	 */
	public void deleteHptnActivity(HptnActivity hptnActivity) {
		hptnMapper.deleteHptnActivity(hptnActivity);
	}

	/**
	 * 唯一字段查询
	 * 
	 * @param hptnActivity
	 * @return
	 */
	public HptnActivity selectHptnActivity(HptnActivity hptnActivity) {
		return hptnMapper.selectHptnActivity(hptnActivity);
	}

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
	public PageList<HptnHistory> getHptnHistoryList(Map<String, String> paramMap, PageBounds pageBounds) {
		return hptnMapper.getHptnHistoryList(paramMap, pageBounds);
	}

	/**
	 * hptn_history 添加
	 * 
	 * @param hptnHistory
	 */
	public void saveHptnHistory(HptnHistory hptnHistory) {
		hptnMapper.saveHptnHistory(hptnHistory);
	}

	/**
	 * hptn_history 修改
	 * 
	 * @param hptnHistory
	 */
	public void updateHptnHistory(HptnHistory hptnHistory) {
		hptnMapper.updateHptnHistory(hptnHistory);
	}

	/**
	 * hptn_history 删除
	 * 
	 * @param hptnHistory
	 */
	public void deleteHptnHistory(HptnHistory hptnHistory) {
		hptnMapper.deleteHptnHistory(hptnHistory);
	}

	/**
	 * 唯一字段查询
	 * 
	 * @param hptnHistory
	 * @return
	 */
	public HptnHistory selectHptnHistory(HptnHistory hptnHistory) {
		return hptnMapper.selectHptnHistory(hptnHistory);
	}

}
