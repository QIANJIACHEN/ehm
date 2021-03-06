package com.cea.ehm.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.HptbActivity;
import com.cea.ehm.bean.HptbHistory;
import com.cea.ehm.dao.HptbMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * htpb服务层
 */
@Service
public class HptbService {
	@Autowired
	private HptbMapper hptbMapper;

	/**
	 * 获取 hptb_activity 列表数据
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<HptbActivity> getHptbActivityList(Map<String, String> paramMap, PageBounds pageBounds) {
		return hptbMapper.getHptbActivityList(paramMap, pageBounds);
	}

	/**
	 * hptb_activity 添加
	 * 
	 * @param hptbActivity
	 */
	public void saveHptbActivity(HptbActivity hptbActivity) {
		hptbMapper.saveHptbActivity(hptbActivity);
	}

	/**
	 * hptb_activity 修改
	 * 
	 * @param hptbActivity
	 */
	public void updateHptbActivity(HptbActivity hptbActivity) {
		hptbMapper.updateHptbActivity(hptbActivity);
	}

	/**
	 * hptb_activity 删除
	 * 
	 * @param hptbActivity
	 */
	public void deleteHptbActivity(HptbActivity hptbActivity) {
		hptbMapper.deleteHptbActivity(hptbActivity);
	}

	/**
	 * 唯一字段查询
	 * 
	 * @param hptbActivity
	 * @return
	 */
	public HptbActivity selectHptbActivity(HptbActivity hptbActivity) {
		return hptbMapper.selectHptbActivity(hptbActivity);
	}

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
	public PageList<HptbHistory> getHptbHistoryList(Map<String, String> paramMap, PageBounds pageBounds) {
		return hptbMapper.getHptbHistoryList(paramMap, pageBounds);
	}

	/**
	 * hptb_history 添加
	 * 
	 * @param hptbHistory
	 */
	public void saveHptbHistory(HptbHistory hptbHistory) {
		hptbMapper.saveHptbHistory(hptbHistory);
	}

	/**
	 * hptb_history 修改
	 * 
	 * @param hptbHistory
	 */
	public void updateHptbHistory(HptbHistory hptbHistory) {
		hptbMapper.updateHptbHistory(hptbHistory);
	}

	/**
	 * hptb_history 删除
	 * 
	 * @param hptbHistory
	 */
	public void deleteHptbHistory(HptbHistory hptbHistory) {
		hptbMapper.deleteHptbHistory(hptbHistory);
	}

	/**
	 * 唯一字段查询
	 * 
	 * @param hptbHistory
	 * @return
	 */
	public HptbHistory selectHptbHistory(HptbHistory hptbHistory) {
		return hptbMapper.selectHptbHistory(hptbHistory);
	}
}
