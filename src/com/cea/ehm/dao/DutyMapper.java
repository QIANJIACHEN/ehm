package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.Duty;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 部门持久层接口
 */
public interface DutyMapper {

	/**
	 * 查询部门列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<Duty> getDutyList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存部门信息
	 * 
	 * @param duty
	 */
	void insert(Duty duty);

	/**
	 * 更新部门信息
	 * 
	 * @param duty
	 */
	void update(Duty duty);

	/**
	 * 删除部门信息
	 * 
	 * @param duty
	 */
	void delete(Duty duty);

	/**
	 * 获取所有的基地信息
	 * 
	 * @return
	 */
	List<Duty> getAllDuty();

	/*
	 * 通过id获取duty信息
	 */
	List<Duty> getDutyById(Map<String,Integer> paramMap);
	/**
	 * 获取id根据名字
	 */
	Integer selectIdByName(Duty duty);
	/*
	 * 判断是否存在根据基地名
	 */
	Duty selectByName(Duty duty);
}
