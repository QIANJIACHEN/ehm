package com.cea.ehm.service;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.AuthAccess;
import com.cea.ehm.dao.AuthAccessMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 权限授权服务层
 */
@Service
public class AuthAccessService {
	private Logger logger = Logger.getLogger(AuthAccessService.class);
	@Autowired
	private AuthAccessMapper authaccessMapper;

	/**
	 * 查询权限授权列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<AuthAccess> getRoleList(Map<String, String> paramMap, PageBounds pageBounds) {
		logger.info("数据库查询参数：" + paramMap);
		return authaccessMapper.getAuthAccessList(paramMap, pageBounds);
	}

	/**
	 * 保存或更新权限授权信息
	 * 
	 * @param authaccess
	 */
	public void saveOrUpdate(AuthAccess authaccess) {
		// 查询判断是否存在，考虑保存还是更新
		AuthAccess selectauthaccess = authaccessMapper.select(authaccess);
		if (selectauthaccess == null) {
			authaccessMapper.insert(authaccess);
		} else {
			authaccessMapper.update(authaccess);
		}
	}

	/**
	 * 删除权限授权信息
	 * 
	 * @param authaccess
	 */
	public void delete(AuthAccess authaccess) {
		// 这里是物理删除，删除后用户信息从数据库消失
		authaccessMapper.delete(authaccess);
	}

}
