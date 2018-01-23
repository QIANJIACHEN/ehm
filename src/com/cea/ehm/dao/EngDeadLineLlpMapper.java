package com.cea.ehm.dao;

import java.util.List;
import java.util.Map;

import com.cea.ehm.bean.EngDeadLineLlp;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 寿命件门限持久层接口
 */
public interface EngDeadLineLlpMapper {

	/**
	 * 查询寿命件门限列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	PageList<EngDeadLineLlp> getEngDeadLineLlpList(Map<String, String> paramMap, PageBounds pageBounds);

	/**
	 * 保存寿命件门限
	 * 
	 * @param engdeadlinellp
	 */
	void insert(EngDeadLineLlp engdeadlinellp);

	/**
	 * 更新寿命件门限
	 * 
	 * @param engdeadlinellp
	 */
	void update(EngDeadLineLlp engdeadlinellp);

	/**
	 * 删除寿命件门限
	 * 
	 * @param engdeadlinellp
	 */
	void delete(EngDeadLineLlp engdeadlinellp);

	/**
	 * 查询寿命件门限
	 * 
	 * @param engdeadlinellp
	 */
	EngDeadLineLlp select(EngDeadLineLlp engdeadlinellp);
	
	List<EngDeadLineLlp> getAllEngDeadLineLlpInfo();

}
