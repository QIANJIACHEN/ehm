package com.cea.ehm.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.DataPlane;
import com.cea.ehm.bean.PlaneFlight;
import com.cea.ehm.bean.PlaneWithFlight;
import com.cea.ehm.dao.DataPlaneMapper;
import com.cea.ehm.dao.PlaneFlightMapper;
import com.cea.ehm.dao.PlaneWithFlightMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 飞机 航班关联信息
 */
@Service
public class PlaneWithFlightService {

	@Autowired
	private PlaneWithFlightMapper pwfMapper;
	@Autowired
	private DataPlaneMapper planeMapper;
	@Autowired
	private PlaneFlightMapper flightMapper;

	/**
	 * 保存飞机 航班关联信息
	 * 
	 * @param pwf
	 */
	public void save(PlaneWithFlight pwf) {
		pwfMapper.save(pwf);
	}

	/**
	 * 查询飞机 航班关联信息
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<PlaneWithFlight> getList(Map<String, String> paramMap, PageBounds pageBounds) {
		PageList<PlaneWithFlight> pwfs = pwfMapper.getList(paramMap, pageBounds);
		// 提取所有的飞机ID 和飞机号
		List<DataPlane> allPlane = planeMapper.allPlane();
		Map<Integer, String> planeMap = Maps.newHashMap();
		allPlane.forEach(plane -> planeMap.put(plane.getId(), plane.getTail()));
		// 提取所有的航班ID 和航班号
		List<PlaneFlight> allFlight = flightMapper.allFlight();
		Map<Integer, String> flightMap = Maps.newHashMap();
		allFlight.forEach(flight -> flightMap.put(flight.getId(), flight.getNumber()));
		pwfs.forEach(pwf -> {
			String tail = planeMap.get(pwf.getPlaneId());
			String number = flightMap.get(pwf.getFlightId());
			pwf.setTail(Optional.ofNullable(tail).orElse("-"));
			pwf.setNumber(Optional.ofNullable(number).orElse("-"));
		});
		return pwfs;
	}

	/**
	 * 修改飞机 航班关联信息
	 * 
	 * @param pwf
	 */
	public void update(PlaneWithFlight pwf) {
		pwfMapper.update(pwf);
	}

	/**
	 * 删除飞机 航班关联信息
	 * 
	 * @param pwf
	 */
	public void delete(PlaneWithFlight pwf) {
		pwfMapper.delete(pwf);
	}

}
