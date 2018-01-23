package com.cea.ehm.service;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.EngSpare;
import com.cea.ehm.dao.EngSpareMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 发动机备发服务层
 */
@Service
public class EngSpareService {
	private Logger logger = Logger.getLogger(EngSpareService.class);
	@Autowired
	private EngSpareMapper engspareMapper;

	/**
	 * 查询发动机备发列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<EngSpare> getEngSpareList(Map<String, String> paramMap, PageBounds pageBounds) {
		logger.info("数据库查询参数：" + paramMap);
		return engspareMapper.getEngSpareList(paramMap, pageBounds);
	}

	/**
	 * 保存或更新发动机备发信息
	 * 
	 * @param engspare
	 */
	public void saveOrUpdate(EngSpare engspare) {
		// 查询判断发动机备发信息是否存在，考虑保存还是更新
		EngSpare selectuser = engspareMapper.select(engspare);
		if (selectuser == null) {
			engspareMapper.insert(engspare);
		} else {
			engspareMapper.update(engspare);
		}
	}

	/**
	 * 删除发动机备发信息
	 * 
	 * @param engspare
	 */
	public void delete(EngSpare engspare) {
		// 这里是物理删除，删除后发动机备发信息从数据库消失
		engspareMapper.delete(engspare);
	}

}
