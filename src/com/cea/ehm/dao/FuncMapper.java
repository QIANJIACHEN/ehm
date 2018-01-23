package com.cea.ehm.dao;

import java.util.List;

import com.cea.ehm.bean.Func;

/**
 * 角色功能数据库接口
 */
public interface FuncMapper {

	/**
	 * 添加所有的角色功能
	 * 
	 * @param func
	 */
	void saveRoleFunc(Func func);

	/**
	 * 查询角色功能信息(flag 0 1 都查)
	 * 
	 * @param func
	 * @return
	 */
	List<Func> getRoleFunc(Func func);

	/**
	 * 查询角色功能信息(flag = 1)
	 * 
	 * @param func
	 * @return
	 */
	List<Func> getRoleFuncTwo(Func func);

	/**
	 * flag → 0
	 * 
	 * @param func
	 */
	void updateFlag(Func func);

	/**
	 * 更新角色功能信息flag → 1
	 * 
	 * @param func
	 */
	void updateRoleFunc(Func func);

	/**
	 * 更新功能名称
	 * 
	 * @param func
	 */
	void updataFuncName(Func func);

}
