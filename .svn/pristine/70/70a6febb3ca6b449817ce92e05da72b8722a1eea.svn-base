package com.cea.ehm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.Shake;
import com.cea.ehm.dao.ShakeMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 震动数据服务层
 */
@Service
public class ShakeService {
	@Autowired
	private ShakeMapper shakeMapper;

	/**
	 * 查询震动数据（起飞）
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<Shake> listOne(Map<String, String> paramMap, PageBounds pageBounds) {
		return shakeMapper.listOne(paramMap, pageBounds);
	}

	/**
	 * 查询震动数据（巡航）
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<Shake> listTwo(Map<String, String> paramMap, PageBounds pageBounds) {
		return shakeMapper.listTwo(paramMap, pageBounds);
	}

	/**
	 * 查询震动数据（所有）
	 * 
	 * @param paramMap
	 * @return
	 */
	public List<Shake> list(Map<String, String> paramMap) {
		return shakeMapper.list(paramMap);
	}
	
	public List<Shake> getshakeServiceDetailbyid(Map<String, Integer> paramMap) {
		List<Shake> data = shakeMapper.getshakeServiceDetailbyid(paramMap);
		return data;
	}
}
