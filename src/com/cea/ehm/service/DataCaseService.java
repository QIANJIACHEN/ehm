package com.cea.ehm.service;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.DataCase;
import com.cea.ehm.dao.DataCaseMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 故障服务层
 */
@Service
public class DataCaseService {
	private Logger logger = Logger.getLogger(DataCaseService.class);
	@Autowired
	private DataCaseMapper datacaseMapper;

	/**
	 * 查询故障列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<DataCase> getDataCaseList(Map<String, String> paramMap, PageBounds pageBounds) {
		logger.info("数据库查询参数：" + paramMap);
		return datacaseMapper.getDataCaseList(paramMap, pageBounds);
	}

	/**
	 * 保存或更新故障信息
	 * 
	 * @param datacase
	 */
	public void saveOrUpdate(DataCase datacase) {
		// 查询判断故障信息是否存在，考虑保存还是更新
		DataCase selectuser = datacaseMapper.select(datacase);
		if (selectuser == null) {
			datacaseMapper.insert(datacase);
		} else {
			datacaseMapper.update(datacase);	}
	}

	/**
	 * 删除故障信息
	 * 
	 * @param datacase
	 */
	public void delete(DataCase datacase) {
		// 这里是物理删除，删除后故障信息从数据库消失
		datacaseMapper.delete(datacase);
	}

}
