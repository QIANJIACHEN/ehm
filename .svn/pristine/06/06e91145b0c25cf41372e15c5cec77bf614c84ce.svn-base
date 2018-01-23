package com.cea.ehm.dao;

import java.util.Map;

import com.cea.ehm.bean.AuthAccess;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 权限授权持久层接口
 */
public interface AuthAccessMapper {

	/**
	 * 查询权限授权列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<AuthAccess> getAuthAccessList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存权限授权信息
	 * 
	 * @param authAccess
	 */
	void insert(AuthAccess authAccess);

	/**
	 * 更新权限授权信息
	 * 
	 * @param authAccess
	 */
	void update(AuthAccess authAccess);

	/**
	 * 删除权限授权信息
	 * 
	 * @param authAccess
	 */
	void delete(AuthAccess authAccess);

	/**
	 * 查询权限授权信息
	 * 
	 * @param authAccess
	 */
	AuthAccess select(AuthAccess authAccess);

}
