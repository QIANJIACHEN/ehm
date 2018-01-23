package com.cea.ehm.dao;

import java.util.Map;

import com.cea.ehm.bean.AuthRule;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 规则权限持久层接口
 */
public interface AuthRuleMapper {

	/**
	 * 查询规则权限列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<AuthRule> getAuthRuleList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存规则权限信息
	 * 
	 * @param authRule
	 */
	void insert(AuthRule authRule);

	/**
	 * 更新规则权限信息
	 * 
	 * @param authRule
	 */
	void update(AuthRule authRule);

	/**
	 * 删除规则权限信息
	 * 
	 * @param authRule
	 */
	void delete(AuthRule authRule);

	/**
	 * 查询规则权限信息
	 * 
	 * @param authRule
	 */
	AuthRule select(AuthRule authRule);

}
