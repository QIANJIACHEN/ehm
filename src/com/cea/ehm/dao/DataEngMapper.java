package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.DataEng;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 发动机信息持久层接口
 */
public interface DataEngMapper {

	/**
	 * 查询发动机信息列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<DataEng> getdataengList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存发动机信息
	 * 
	 * @param dataeng
	 */
	void insert(DataEng dataeng);

	/**
	 * 根据 id 更新发动机信息
	 * 
	 * @param dataeng
	 */
	void update(DataEng dataeng);

	/**
	 * 根据 sn 更新发动机信息
	 * 
	 * @param dataeng
	 */
	void updateTwo(DataEng dataeng);

	/**
	 * 删除发动机信息
	 * 
	 * @param dataeng
	 */
	void delete(DataEng dataeng);

	/**
	 * (ENG_SN)查询发动机信息
	 * 
	 * @param dataeng
	 */
	DataEng select(DataEng dataeng);

	/**
	 * (id)查询发动机信息
	 * 
	 * @param dataeng
	 * @return
	 */
	DataEng selectTwo(DataEng dataeng);

	/**
	 * allDataEng()
	 * 
	 * @return
	 */
	List<DataEng> allDataEng();

	/**
	 * 根据tail获取飞机信息
	 * 
	 * @return
	 */
	List<DataEng> engInfo(Map<String, String> paramMap);

	/**
	 * 获取所有 发动机序列
	 * 
	 * @return
	 */
	List<String> allEngSeries();

	/**
	 * 获取所有 发动机类型
	 * 
	 * @return
	 */
	List<String> allEngType();

	/**
	 * 获取所有 发动机模型
	 * 
	 * @return
	 */
	List<String> allEngModel();

	/**
	 * 获取所有 发动机构型
	 * 
	 * @return
	 */
	List<String> allEngConfig();
	
	/**
	 * 根据engSn获取engId
	 */
	Integer getEngIdByEngSn(String engSn);
	
	/**
	 * 根据ENG_CONFIGRATION分组统计数量
	 */
	List<String> getEngConfigrationGroup();
	
	/**
	 * 根据duty分组统计数量
	 */
	List<String> getdutyGroupList();
	
	/**
	 * 根据ENG_MODEL（发动机推力构型？不太确定）
	 */
	List<String> getEngModelGroup();
	/*
	 * 根据ENG_CONFIG
	 */
	List<String> getEngConfigGroup();
}
