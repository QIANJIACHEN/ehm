package com.cea.ehm.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.RuleComputation;
import com.cea.ehm.bean.RuleInspection;
import com.cea.ehm.dao.RuleComputationMapper;
import com.cea.ehm.dao.RuleInspectionMapper;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

/**
 * 计算
 */
@Service
public class RuleComputationService {
	@Autowired
	private RuleComputationMapper computationMapper;
	@Autowired
	private RuleInspectionMapper inspectionMapper;

	/**
	 * 保存 computation
	 * 
	 * @param computation
	 */
	public Integer saveComputation(RuleComputation computation) {
		String date = LocalDateTime.now().toString().replace("T", " ");
		String ctime = date.substring(0, date.indexOf("."));
		computation.setCtime(ctime);
		if (computation.getInspectionId() == null) {
			computation.setInspectionId(0);
		}
		computation.setRuleType(2);
		computationMapper.saveComputation(computation);
		return computation.getId();
	}

	/**
	 * 删除 computation
	 * 
	 * @param id
	 */
	public void deleteComputation(Integer id) {
		computationMapper.deleteComputation(id);
	}

	/**
	 * 修改 computation
	 * 
	 * @param computation
	 */
	public void updateComputation(RuleComputation computation) {
		computationMapper.updateComputation(computation);
	}

	/**
	 * 更新条件 中对inspecid的引用
	 * 
	 * @param reqPara
	 * @param inspecId
	 */
	public void updateCompu(Map<String, String> reqPara, Integer inspecId) {
		// 获得条件id
		String compuIds = reqPara.get("compuIds").replace("[", "").replace("]", "");
		List<Integer> compuIdsList = Lists.newArrayList();
		if (compuIds.contains(",")) {
			String[] idArr = compuIds.split(",");
			for (String compuId : idArr) {
				compuIdsList.add(Integer.parseInt(compuId));
			}
		} else {
			compuIdsList.add(Integer.parseInt(compuIds));
		}
		// 更新条件 中对inspecid的引用
		compuIdsList.forEach(compuId -> {
			RuleComputation computation = new RuleComputation();
			computation.setId(compuId);
			computation.setInspectionId(inspecId);
			computationMapper.updateComputation(computation);
		});
	}

	/**
	 * 根据 公式id 查询条件
	 * 
	 * @param inspecId
	 * @return
	 */
	public List<RuleComputation> getCompu(Integer inspecId) {
		List<RuleComputation> compus = computationMapper.getCompu(inspecId);
		// 提取公式ID 和 公式名
		List<RuleInspection> allInspection = inspectionMapper.allInspection();
		Map<Integer, String> inspecMap = Maps.newHashMap();
		allInspection.forEach(inspec -> {
			inspecMap.put(inspec.getId(), inspec.getName());
		});
		compus.forEach(compu -> {
			compu.setRuleName(Optional.ofNullable(inspecMap.get(compu.getRuleId())).orElse("-"));
		});
		return compus;
	}

	/**
	 * 根据 公式id 删除条件
	 * 
	 * @param inspecId
	 */
	public void deleteCompu(Integer inspecId) {
		computationMapper.deleteCompu(inspecId);
	}

	/**
	 * 已选的公式作为条件保存到条件表
	 * 
	 * @param compu
	 * @return
	 */
	public Integer saveInspec(RuleComputation compu) {
		compu.setCalculationRange(-1);
		compu.setCalculationType(-1);
		String date = LocalDateTime.now().toString().replace("T", " ");
		String ctime = date.substring(0, date.indexOf("."));
		compu.setCtime(ctime);
		compu.setEqual("-1");
		compu.setFlightPhase(-1);
		compu.setInspectionId(0);
		compu.setMax("-1");
		compu.setMin("-1");
		compu.setRangeType(-1);
		compu.setRuleType(1);
		compu.setUnequal("-1");
		computationMapper.saveComputation(compu);
		return compu.getId();
	}

}
