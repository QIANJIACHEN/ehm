package com.cea.ehm.service;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.EngFleet;
import com.cea.ehm.dao.EngFleetMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 发动机签发服务层
 */
@Service
public class EngFleetService {
	private Logger logger = Logger.getLogger(EngFleetService.class);
	@Autowired
	private EngFleetMapper engfleetMapper;

	/**
	 * 查询发动机签发列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<EngFleet> getEngFleetList(Map<String, String> paramMap, PageBounds pageBounds) {
		logger.info("数据库查询参数：" + paramMap);
		return engfleetMapper.getEngFleetList(paramMap, pageBounds);
	}

	/**
	 * 保存或更新发动机签发信息
	 * 
	 * @param engfleet
	 */
	public void saveOrUpdate(EngFleet engfleet) {
		// 查询判断发动机签发信息是否存在，考虑保存还是更新
		EngFleet selectuser = engfleetMapper.select(engfleet);
		if (selectuser == null) {
			engfleetMapper.insert(engfleet);
		} else {
			engfleetMapper.update(engfleet);
		}
	}

	/**
	 * 删除发动机签发信息
	 * 
	 * @param engfleet
	 */
	public void delete(EngFleet engfleet) {
		// 这里是物理删除，删除后发动机签发信息从数据库消失
		engfleetMapper.delete(engfleet);
	}

}
