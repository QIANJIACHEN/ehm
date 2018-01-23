package com.cea.ehm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.Func;
import com.cea.ehm.dao.FuncMapper;
import com.google.common.base.Strings;

/**
 * 角色功能服务
 */
@Service
public class FuncService {
	@Autowired
	private FuncMapper funcMapper;

	/**
	 * 添加所有的角色功能
	 * 
	 * @param func
	 */
	public void saveRoleFunc(Func func) {
		funcMapper.saveRoleFunc(func);
	}

	/**
	 * 查询角色功能信息
	 * 
	 * @param func
	 * @return
	 */
	public List<Func> getRoleFunc(Func func) {
		return funcMapper.getRoleFunc(func);
	}

	/**
	 * 编辑角色功能信息
	 * 
	 * @param roleId
	 * @param funcs
	 */
	public void updateRoleFunc(String roleId, String funcs) {
		Func func = new Func();
		func.setRoleId(Integer.parseInt(roleId));
		// 更新前移除角色 和功能的对应关系(flag → 0)
		funcMapper.updateFlag(func);
		String rep = funcs.replace("[", "").replace("]", "").replace("\"", "");
		if (rep.contains(",")) {
			String[] ids = rep.split(",");
			for (String id : ids) {
				func.setId(Integer.parseInt(id));
				funcMapper.updateRoleFunc(func);
			}
		} else {
			if (!Strings.isNullOrEmpty(rep)) {
				func.setId(Integer.parseInt(rep));
				funcMapper.updateRoleFunc(func);
			}
		}
	}

	/**
	 * 更新功能名称
	 * 
	 * @param func
	 */
	public void updataFuncName(Func func) {
		funcMapper.updataFuncName(func);
	}

}
