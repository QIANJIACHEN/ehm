package com.cea.ehm.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.Role;
import com.cea.ehm.dao.RoleMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 角色服务层
 */
@Service
public class RoleService {
	@Autowired
	private RoleMapper roleMapper;

	/**
	 * 查询角色列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<Role> getRoleList(Map<String, String> paramMap, PageBounds pageBounds) {
		PageList<Role> roleList = roleMapper.getRoleList(paramMap, pageBounds);
		// 提取所有的角色ID 和角色名
		Map<Integer, String> roleMap = Maps.newHashMap();
		roleList.forEach(role -> roleMap.put(role.getId(), role.getName()));
		for (Role role : roleList) {
			String roleName = roleMap.get(role.getpId());
			role.setpName(Optional.ofNullable(roleName).orElse("-"));
		}
		return roleList;
	}

	/**
	 * 保存角色信息
	 * 
	 * @param role
	 */
	public void save(Role role) {
		roleMapper.insert(role);
	}

	/**
	 * 更新角色信息
	 * 
	 * @param role
	 */
	public void update(Role role) {
		roleMapper.update(role);
	}

	/**
	 * 删除角色信息
	 * 
	 * @param role
	 */
	public void delete(Role role) {
		// 这里是物理删除，删除后用户信息从数据库消失
		roleMapper.delete(role);
	}

	/**
	 * 获取所有有效的角色信息
	 * 
	 * @return
	 */
	public List<Role> allRole() {
		return roleMapper.allRole();
	}

}
