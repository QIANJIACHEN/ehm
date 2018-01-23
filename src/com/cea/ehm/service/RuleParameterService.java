package com.cea.ehm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.RuleParameter;
import com.cea.ehm.dao.RuleParameterMapper;
import com.google.common.collect.Lists;

/**
 * 规则参数
 */
@Service
public class RuleParameterService {
	@Autowired
	private RuleParameterMapper parameterMapper;

	/**
	 * 查询 第一个参数
	 * 
	 * @return
	 */
	public List<RuleParameter> firstParam() {
		return parameterMapper.firstParam();
	}

	/**
	 * 查询 第二个参数
	 * 
	 * @param pId
	 * @return
	 */
	public List<RuleParameter> secondParam(Integer pId) {
		return parameterMapper.secondParam(pId);
	}

	/**
	 * 根据 id 查询参数数据
	 * 
	 * @param id
	 * @return
	 */
	public List<RuleParameter> getParam(Integer id) {
		RuleParameter cParam = parameterMapper.getParam(id);
		RuleParameter pParam = parameterMapper.getParam(cParam.getParentId());
		List<RuleParameter> params = Lists.newArrayList();
		params.add(pParam);
		params.add(cParam);
		return params;
	}

}
