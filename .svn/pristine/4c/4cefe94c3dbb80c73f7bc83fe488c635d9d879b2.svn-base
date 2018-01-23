package com.cea.ehm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.PlaneFlight;
import com.cea.ehm.dao.PlaneFlightMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 航班 服务层
 */
@Service
public class PlaneFlightService {
	@Autowired
	private PlaneFlightMapper flightMapper;

	/**
	 * 航班信息 保存
	 * 
	 * @param flight
	 */
	public void save(PlaneFlight flight) {
		flightMapper.save(flight);
	}

	/**
	 * 查询航班信息
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<PlaneFlight> getList(Map<String, String> paramMap, PageBounds pageBounds) {
		return flightMapper.getList(paramMap, pageBounds);
	}

	/**
	 * 航班信息 删除
	 * 
	 * @param flight
	 */
	public void delete(PlaneFlight flight) {
		flightMapper.delete(flight);
	}

	/**
	 * 航班信息 修改
	 * 
	 * @param flight
	 */
	public void update(PlaneFlight flight) {
		flightMapper.update(flight);
	}

	/**
	 * 获取所有的航班信息
	 * 
	 * @return
	 */
	public List<PlaneFlight> allFlight() {
		return flightMapper.allFlight();
	}

}
