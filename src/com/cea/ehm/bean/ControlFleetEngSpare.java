package com.cea.ehm.bean;

import java.io.Serializable;

/*
 * 发动机维修表
 */
public class ControlFleetEngSpare implements Serializable {
	private static final long serialVersionUID = 1L;
	/*
	 *主键id 
	 */
	private Integer id;
	/*
	 * 发动机ID
	 */
	private Integer engId;
	/*
	 * 发动机编号
	 */
	private String engSn;
	/*
	 * 移除时间
	 */
	private String removeDate;
	/*
	 * 条件
	 */
	private String condition;
	/*
	 * 安装计划
	 */
	private String installPlan;
	/*
	 * LLP_SAP
	 */
	private String llpSap;
	/*
	 * CONFIG_ACCESS
	 */
	private String configAccess;
	/*
	 * 备注
	 */
	private String remark;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getEngId() {
		return engId;
	}
	public void setEngId(Integer engId) {
		this.engId = engId;
	}
	public String getEngSn() {
		return engSn;
	}
	public void setEngSn(String engSn) {
		this.engSn = engSn;
	}
	public String getRemoveDate() {
		return removeDate;
	}
	public void setRemoveDate(String removeDate) {
		this.removeDate = removeDate;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getInstallPlan() {
		return installPlan;
	}
	public void setInstallPlan(String installPlan) {
		this.installPlan = installPlan;
	}
	public String getLlpSap() {
		return llpSap;
	}
	public void setLlpSap(String llpSap) {
		this.llpSap = llpSap;
	}
	public String getConfigAccess() {
		return configAccess;
	}
	public void setConfigAccess(String configAccess) {
		this.configAccess = configAccess;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
	

	
}
