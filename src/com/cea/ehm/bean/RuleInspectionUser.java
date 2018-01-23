package com.cea.ehm.bean;

import java.io.Serializable;

/**
 * 监测推送人员表
 */
public class RuleInspectionUser implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	/**
	 * 规则ID
	 */
	private Integer inspectionId;
	/**
	 * 基地
	 */
	private Integer duty;
	/**
	 * 人员
	 */
	private Integer userId;
	/**
	 * 创建时间
	 */
	private String ctime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getInspectionId() {
		return inspectionId;
	}

	public void setInspectionId(Integer inspectionId) {
		this.inspectionId = inspectionId;
	}

	public Integer getDuty() {
		return duty;
	}

	public void setDuty(Integer duty) {
		this.duty = duty;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

}
