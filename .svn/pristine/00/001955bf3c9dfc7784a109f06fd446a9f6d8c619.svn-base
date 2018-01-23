package com.cea.ehm.service;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.LlpActivity;
import com.cea.ehm.bean.LlpHistory;
import com.cea.ehm.dao.LlpActivityMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * LLP服务层
 */
@Service
public class LlpActivityService {
	private Logger logger = Logger.getLogger(LlpActivityService.class);
	@Autowired
	private LlpActivityMapper llpactivityMapper;

	/**
	 * 查询LLP列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<LlpActivity> getLlpActivityList(Map<String, String> paramMap, PageBounds pageBounds) {
		logger.info("数据库查询参数：" + paramMap);
		return llpactivityMapper.getLlpActivityList(paramMap, pageBounds);
	}

	/**
	 * 保存或更新LLP信息
	 * 
	 * @param llpactivity
	 */
	public void saveOrUpdate(LlpActivity llpactivity) {
		// 查询判断LLP信息是否存在，考虑保存还是更新
		LlpActivity selectuser = llpactivityMapper.select(llpactivity);
		if (selectuser == null) {
			llpactivityMapper.insert(llpactivity);
		} else {
			llpactivityMapper.update(llpactivity);	}
	}

	/**
	 * 删除LLP信息
	 * 
	 * @param llpactivity
	 */
	public void delete(LlpActivity llpactivity) {
		// 这里是物理删除，删除后LLP信息从数据库消失
		llpactivityMapper.delete(llpactivity);
	}

	/**
	 * 查询LLP历史列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<LlpHistory> getLlpHistoryList(Map<String, String> paramMap, PageBounds pageBounds) {
		return llpactivityMapper.getLlpHistoryList(paramMap, pageBounds);
	}
	public void addHistory(LlpHistory llpHistory) {
		llpactivityMapper.addHistory(llpHistory);
	}
	public void editHistory(LlpHistory llpHistory) {
		llpactivityMapper.editHistory(llpHistory);
	}
	public void deletehistory(LlpHistory llpHistory) {
		llpactivityMapper.deleteHistory(llpHistory);
	}
}
