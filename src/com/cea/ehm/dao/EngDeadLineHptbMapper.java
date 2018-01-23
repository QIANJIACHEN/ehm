package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.EngDeadLineHptb;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 重要部件门限持久层接口
 */
public interface EngDeadLineHptbMapper {

	/**
	 * 查询重要部件门限列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<EngDeadLineHptb> getEngDeadLineHptbList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存重要部件门限
	 * 
	 * @param engdeadlinehptb
	 */
	void insert(EngDeadLineHptb engdeadlinehptb);

	/**
	 * 更新重要部件门限
	 * 
	 * @param engdeadlinehptb
	 */
	void update(EngDeadLineHptb engdeadlinehptb);

	/**
	 * 删除重要部件门限
	 * 
	 * @param engdeadlinehptb
	 */
	void delete(EngDeadLineHptb engdeadlinehptb);

	/**
	 * 查询重要部件门限
	 * 
	 * @param engdeadlinehptb
	 */
	EngDeadLineHptb select(EngDeadLineHptb engdeadlinehptb);
	
	List<EngDeadLineHptb> getAllEngDeadLineHptbInfo();

}
