package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.RuleInspection;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 监测规则持久层接口
 */
public interface RuleInspectionMapper {

	/**
	 * 保存监测规则信息
	 * 
	 * @param inspection
	 */
	Integer insert(RuleInspection inspection);

	/**
	 * 更新监测规则信息
	 * 
	 * @param inspection
	 */
	void update(RuleInspection inspection);

	/**
	 * 根据 id 删除公式
	 * 
	 * @param id
	 */
	void delete(Integer id);

	/**
	 * 查询公式
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<RuleInspection> list(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 根据 id 查询公式详细
	 * 
	 * @param id
	 * @return
	 */
	RuleInspection getOne(Integer id);

	/**
	 * 获取所有公式信息
	 * 
	 * @return
	 */
	List<RuleInspection> allInspection();

	/**
	 * 获取所有公式信息
	 * 
	 * @param id
	 * @return
	 */
	List<RuleInspection> allInspectionTwo(Integer id);

}
