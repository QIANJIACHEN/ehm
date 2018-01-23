package com.cea.ehm.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.Duty;
import com.cea.ehm.bean.EngOnwing;
import com.cea.ehm.dao.DutyMapper;
import com.cea.ehm.dao.EngOnwingMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * EngOnwing
 */
@Service
public class EngOnwingService {
	private Logger logger = Logger.getLogger(EngOnwingService.class);
	@Autowired
	private EngOnwingMapper engOnwingMapper;
	@Autowired
	private DutyMapper dutyMapper;

	/**
	 * 获取 engOnwing 数据
	 * 
	 * @param pageBounds
	 * @param paramMap
	 * @return
	 */
	public List<EngOnwing> getList(Map<String, String> paramMap, PageBounds pageBounds) {
		List<EngOnwing> engOnwings = engOnwingMapper.getList(paramMap, pageBounds);
		List<Duty> dutys = dutyMapper.getAllDuty();
		Map<Integer, String> map = Maps.newHashMap();
		dutys.forEach(duty -> map.put(duty.getId(), duty.getName()));
		engOnwings.forEach(engOnwing -> engOnwing.setDutyName(map.get(engOnwing.getDuty())));
		return engOnwings;
	}
	
	/**
	 * 查询发动机签发列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<EngOnwing> getEngOnwingList(Map<String, String> paramMap, PageBounds pageBounds) {
		logger.info("数据库查询参数：" + paramMap);
		return engOnwingMapper.getEngOnwingList(paramMap, pageBounds);
	}
	/**
	 * 获取详情
	 * 
	 * @param paramMap
	 * @return
	 */
	public List<EngOnwing> getInfo(Map<String,String> paramMap) {
		return engOnwingMapper.getInfo(paramMap);
	}

	/**
	 * 获取详情
	 * 
	 * @param paramMap
	 * @return
	 */
	public List<EngOnwing> getEngOnwingInfo(Map<String,Integer> paramMap) {
		return engOnwingMapper.getEngOnwingInfo(paramMap);
	}
}
