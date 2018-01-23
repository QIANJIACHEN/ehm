package com.cea.ehm.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.RuleInspection;
import com.cea.ehm.dao.RuleInspectionMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * inspection
 */
@Service
public class RuleInspectionService {
	@Autowired
	private RuleInspectionMapper inspectionMapper;

	/**
	 * 保存 inspection
	 * 
	 * @param inspection
	 * @return
	 */
	public Integer save(RuleInspection inspection) {
		inspection.setType(0);
		String date = LocalDateTime.now().toString().replace("T", " ");
		String ctime = date.substring(0, date.indexOf("."));
		inspection.setCtime(ctime);
		inspectionMapper.insert(inspection);
		return inspection.getId();
	}

	/**
	 * 查询公式
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<RuleInspection> list(Map<String, String> paramMap, PageBounds pageBounds) {
		return inspectionMapper.list(paramMap, pageBounds);
	}

	/**
	 * 根据 id 查询公式详细
	 * 
	 * @param id
	 * @return
	 */
	public RuleInspection getOne(Integer id) {
		return inspectionMapper.getOne(id);
	}

	/**
	 * 根据 id 删除公式
	 * 
	 * @param id
	 */
	public void delete(Integer id) {
		inspectionMapper.delete(id);
	}

	/**
	 * 更新 inspection
	 * 
	 * @param inspection
	 */
	public void update(RuleInspection inspection) {
		inspectionMapper.update(inspection);
	}

	/**
	 * 获取所有公式信息
	 * 
	 * @return
	 */
	public List<RuleInspection> allInspection() {
		return inspectionMapper.allInspection();
	}

	/**
	 * 获取所有公式信息
	 * 
	 * @param id
	 * @return
	 */
	public List<RuleInspection> allInspectionTwo(Integer id) {
		return inspectionMapper.allInspectionTwo(id);
	}

}
