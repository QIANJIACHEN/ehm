package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.Role;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 角色持久层接口
 */
public interface RoleMapper {

	/**
	 * 查询角色列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<Role> getRoleList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存角色信息
	 * 
	 * @param role
	 */
	void insert(Role role);

	/**
	 * 更新角色信息
	 * 
	 * @param role
	 */
	void update(Role role);

	/**
	 * 删除角色信息
	 * 
	 * @param role
	 */
	void delete(Role role);

	/**
	 * 查询角色信息
	 * 
	 * @param role
	 */
	Role select(Role role);

	/**
	 * 获取所有有效的角色信息
	 * 
	 * @return
	 */
	List<Role> allRole();

}
