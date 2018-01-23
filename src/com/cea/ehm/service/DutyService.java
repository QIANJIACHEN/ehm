package com.cea.ehm.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.Duty;
import com.cea.ehm.bean.Role;
import com.cea.ehm.dao.DutyMapper;
import com.cea.ehm.dao.RoleMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 部门服务层
 */
@Service
public class DutyService {
	private Logger logger = Logger.getLogger(DutyService.class);
	@Autowired
	private DutyMapper dutyMapper;
	@Autowired
	private RoleMapper roleMapper;

	/**
	 * 查询部门列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<Duty> getDutyList(Map<String, String> paramMap, PageBounds pageBounds) {
		logger.info("数据库查询参数：" + paramMap);
		PageList<Duty> dutyList = dutyMapper.getDutyList(paramMap, pageBounds);
		// 提取所有的角色ID 和角色名
		List<Role> allRole = roleMapper.allRole();
		Map<Integer, String> roleMap = Maps.newHashMap();
		allRole.forEach(role -> roleMap.put(role.getId(), role.getName()));
		// 提取所有的基地ID 和基地名
		List<Duty> allDuty = dutyMapper.getAllDuty();
		Map<Integer, String> dutyMap = Maps.newHashMap();
		allDuty.forEach(duty -> dutyMap.put(duty.getId(), duty.getName()));
		for (Duty duty : dutyList) {
			String roleName = roleMap.get(duty.getRole());
			duty.setRoleName(Optional.ofNullable(roleName).orElse("-"));
			String parentName = dutyMap.get(duty.getParentId());
			duty.setParentName(Optional.ofNullable(parentName).orElse("-"));
		}
		return dutyList;
	}

	/*
	 * 根据id查询duty数据
	 */
	
	public List<Duty> getDutyById(Map<String, Integer> paramMap){
		logger.info("数据库查询参数：" + paramMap);
		List<Duty> dutyinfo = dutyMapper.getDutyById(paramMap);
		// 提取所有的角色ID 和角色名
		List<Role> allRole = roleMapper.allRole();
		Map<Integer, String> roleMap = Maps.newHashMap();
		allRole.forEach(role -> roleMap.put(role.getId(), role.getName()));
		// 提取所有的基地ID 和基地名
		List<Duty> allDuty = dutyMapper.getAllDuty();
		Map<Integer, String> dutyMap = Maps.newHashMap();
		allDuty.forEach(duty -> dutyMap.put(duty.getId(), duty.getName()));
		for (Duty duty : dutyinfo) {
			String roleName = roleMap.get(duty.getRole());
			duty.setRoleName(Optional.ofNullable(roleName).orElse("-"));
			String parentName = dutyMap.get(duty.getParentId());
			duty.setParentName(Optional.ofNullable(parentName).orElse("-"));
		}
		return dutyinfo;
	}
	
	/**
	 * 保存部门信息
	 * 
	 * @param duty
	 */
	public void save(Duty duty) {
		dutyMapper.insert(duty);
	}

	/**
	 * 更新部门信息
	 * 
	 * @param duty
	 */
	public void update(Duty duty) {
		dutyMapper.update(duty);
	}

	/**
	 * 删除部门信息
	 * 
	 * @param duty
	 */
	public void delete(Duty duty) {
		dutyMapper.delete(duty);
	}

	/**
	 * 获取所有的基地信息
	 * 
	 * @return
	 */
	public List<Duty> getAllDuty() {
		return dutyMapper.getAllDuty();
	}

}
