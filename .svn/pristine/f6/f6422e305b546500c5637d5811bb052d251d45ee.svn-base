package com.cea.ehm.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.RuleInspectionUser;
import com.cea.ehm.bean.User;
import com.cea.ehm.dao.RuleInspectionUserMapper;
import com.cea.ehm.dao.UserMapper;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

/**
 * 监测推送人员
 */
@Service
public class RuleInspectionUserService {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RuleInspectionUserMapper inspecUserMapper;

	/**
	 * 更新 inspection_user
	 * 
	 * @param reqPara
	 * @param inspecId
	 */
	public void updateInspecUser(Map<String, String> reqPara, Integer inspecId) {
		// 获得userid
		String userIds = reqPara.get("userIds").replace("[", "").replace("]", "");
		List<Integer> userIdsList = Lists.newArrayList();
		if (userIds.contains(",")) {
			String[] idArr = userIds.split(",");
			for (String userId : idArr) {
				userIdsList.add(Integer.parseInt(userId));
			}
		} else {
			if (!Strings.isNullOrEmpty(userIds)) {
				userIdsList.add(Integer.parseInt(userIds));
			}
		}
		// 提取所有 userid 和 duty
		List<User> allUser = userMapper.getAllUser();
		Map<Integer, Integer> userMap = Maps.newHashMap();
		allUser.forEach(user -> {
			userMap.put(user.getUserId(), user.getDuty());
		});

		// 根据inspectId 删除推送人员
		inspecUserMapper.delete(inspecId);

		if (userIdsList.size() > 0) {
			userIdsList.forEach(userId -> {
				RuleInspectionUser inspectionUser = new RuleInspectionUser();
				inspectionUser.setInspectionId(inspecId);
				inspectionUser.setUserId(userId);
				inspectionUser.setDuty(userMap.get(userId));
				String date = LocalDateTime.now().toString().replace("T", " ");
				String ctime = date.substring(0, date.indexOf("."));
				inspectionUser.setCtime(ctime);

				inspecUserMapper.insert(inspectionUser);
			});
		}

	}

	/**
	 * 根据 inspecId 删除推送人员
	 * 
	 * @param inspecId
	 */
	public void delete(Integer inspecId) {
		inspecUserMapper.delete(inspecId);
	}

	/**
	 * 根据inspectId 获取推送人员
	 * 
	 * @param inspecId
	 * @return
	 */
	public List<RuleInspectionUser> users(Integer inspecId) {
		return inspecUserMapper.users(inspecId);
	}
}
