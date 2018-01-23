package com.cea.ehm.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.DataEng;
import com.cea.ehm.bean.RecordDataEng;
import com.cea.ehm.bean.User;
import com.cea.ehm.dao.RecordDataEngMapper;
import com.cea.ehm.dao.UserMapper;
import com.cea.ehm.util.ConstantUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.collect.Maps;

/**
 * 发动机更变记录服务层
 */
@Service
public class RecordDataEngService {
	private Logger logger = Logger.getLogger(RecordDataEngService.class);
	@Autowired
	private RecordDataEngMapper recorddataengMapper;
	@Autowired
	private UserMapper userMapper;

	/**
	 * 查询发动机更变记录列表
	 * 
	 * @param paramMap
	 * @param pageBounds
	 * @return
	 */
	public PageList<RecordDataEng> getRecordDataEngList(Map<String, String> paramMap, PageBounds pageBounds) {
		logger.info("数据库查询参数：" + paramMap);
		PageList<RecordDataEng> records = recorddataengMapper.getRecordDataEngList(paramMap, pageBounds);
		// 提取所有的用户ID 和用户名
		List<User> allUser = userMapper.getAllUser();
		Map<Integer, String> userMap = Maps.newHashMap();
		allUser.forEach(user -> userMap.put(user.getUserId(), user.getUsername()));
		records.forEach(record -> {
			String username = userMap.get(record.getUserId());
			record.setUsername(Optional.ofNullable(username).orElse("admin"));
		});
		return records;
	}
	
	/**
	 * 根据engSn查询记录
	 * @return 
	 */
	public List<RecordDataEng> getlistbyeng(Map<String, String> paramMap) {
		logger.info("数据库查询参数：" + paramMap);
		List<RecordDataEng> data = recorddataengMapper.getlistbyeng(paramMap);
		return data;
	}
	/**
	 * 根据id查询记录
	 * @return 
	 */
	public List<RecordDataEng> getRecordDataEngbyid(Map<String, Integer> paramMap) {
		logger.info("数据库查询参数：" + paramMap);
		List<RecordDataEng> data = recorddataengMapper.getRecordDataEngbyid(paramMap);
		return data;
	}
	
		
	/**
	 * 保存发动机更变记录信息
	 * 
	 * @param request
	 * 
	 * @param recorddataeng
	 */
	public void save(DataEng eng, HttpServletRequest request) {
		RecordDataEng record = new RecordDataEng();
		record.setEngSn(eng.getEngSn());
		record.setEngSnSap(eng.getEngSnSap());
		record.setEngSeries(eng.getEngSeries());
		record.setEngType(eng.getEngType());
		record.setEngModel(eng.getEngModel());
		record.setEngConfig(eng.getEngConfig());
		record.setDeliveryMode(eng.getDeliveryMode());
		record.setOwner(eng.getOwner());
		record.setCodeConfig(eng.getCodeConfig());
		record.setEngConfigration(eng.getEngConfigration());
		record.setEngPn(eng.getEngPn());

		User user = (User) request.getSession().getAttribute(ConstantUtil.SESSION_LOGIN_USER);
		int userId = (user != null) ? user.getUserId() : 0;
		record.setUserId(userId);
		String date = LocalDateTime.now().toString().replace("T", " ");
		String ctime = date.substring(0, date.indexOf("."));
		record.setCtime(ctime);
		recorddataengMapper.insert(record);
	}

	/**
	 * 保存或更新发动机更变记录信息
	 * 
	 * @param recorddataeng
	 */
	@Deprecated
	public void saveOrUpdate(RecordDataEng recorddataeng) {
		// 查询判断发动机更变记录信息是否存在，考虑保存还是更新
		RecordDataEng selectuser = recorddataengMapper.select(recorddataeng);
		if (selectuser == null) {
			recorddataengMapper.insert(recorddataeng);
		} else {
			recorddataengMapper.update(recorddataeng);
		}
	}

	/**
	 * 删除发动机更变记录信息
	 * 
	 * @param recorddataeng
	 */
	@Deprecated
	public void delete(RecordDataEng recorddataeng) {
		// 这里是物理删除，删除后发动机更变记录信息从数据库消失
		recorddataengMapper.delete(recorddataeng);
	}

}
