package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.User;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 用户持久层接口
 */
public interface UserMapper {

	/**
	 * 查询用户列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<User> getUserList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 查询用户信息
	 * 
	 * @param user
	 */
	User select(User user);

	/**
	 * 保存用户信息
	 * 
	 * @param user
	 */
	void insert(User user);

	/**
	 * 更新用户信息
	 * 
	 * @param user
	 */
	void update(User user);

	/**
	 * 删除用户信息
	 * 
	 * @param user
	 */
	void delete(User user);

	/**
	 * 通过 账号和密码 查询用户
	 * 
	 * @param user
	 * @return
	 */
	User getUserByUsernameAndPassword(User user);

	/**
	 * 获取所有用户信息
	 * 
	 * @return
	 */
	List<User> getAllUser();

	/*
	 * 根据id获取用户信息
	 */
	List<User> getUserById(Map<String, Integer> paramMap);

	/**
	 * 根据基地查询用户信息
	 * 
	 * @param map
	 * @return
	 */
	List<User> listByDuty(Map<String, Integer> map);
}
