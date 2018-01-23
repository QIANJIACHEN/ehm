package com.cea.ehm.dao;

import java.util.List;

import com.cea.ehm.bean.RuleComputation;

/**
 * 计算规则持久层接口
 */
public interface RuleComputationMapper {

	/**
	 * 保存 computation 并返回主键id的值
	 * 
	 * @param computation
	 * @return
	 */
	Integer saveComputation(RuleComputation computation);

	/**
	 * 删除 computation
	 * 
	 * @param id
	 */
	void deleteComputation(Integer id);

	/**
	 * 修改 computation
	 * 
	 * @param computation
	 */
	void updateComputation(RuleComputation computation);

	/**
	 * 根据 公式id 查询条件
	 * 
	 * @param inspecId
	 * @return
	 */
	List<RuleComputation> getCompu(Integer inspecId);

	/**
	 * 根据 公式id 删除条件
	 * 
	 * @param inspecId
	 */
	void deleteCompu(Integer inspecId);

}
