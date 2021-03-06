package com.cea.ehm.bean;

import java.io.Serializable;

/**
 * 发动机表(data_eng)
 */
public class DataEng implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	/**
	 * 发动机SN
	 */
	private String engSn;
	/**
	 * SAP平台显示的方式
	 */
	private String engSnSap;
	/**
	 * 发动机序列
	 */
	private String engSeries;
	/**
	 * 发动机类型
	 */
	private String engType;
	/**
	 * 发动机模型
	 */
	private String engModel;
	/**
	 * 发动机构型
	 */
	private String engConfig;
	/**
	 * 原始厂商
	 */
	private String deliveryMode;
	/**
	 * 所有人
	 */
	private String owner;
	/**
	 * CODE_CONFIG
	 */
	private String codeConfig;
	/**
	 * 发动机型号另一种标识
	 */
	private String engConfigration;
	/*
	 * engConfigration数量（可用于记录数量）
	 */
	private Integer num;
	/**
	 * 创建时间
	 */
	private String ctime;
	/**
	 * 发动机设备号
	 */
	private String engPn;
	/**
	 * 状态
	 */
	private String condition;
	/**
	 * 备注
	 */
	private String remark;
	/*
	 * 部门名称
	 */
	private String dutyName;
	private String tail;
	
	public String getTail() {
		return tail;
	}

	public void setTail(String tail) {
		this.tail = tail;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEngSn() {
		return engSn;
	}

	public void setEngSn(String engSn) {
		this.engSn = engSn;
	}

	public String getEngSnSap() {
		return engSnSap;
	}

	public void setEngSnSap(String engSnSap) {
		this.engSnSap = engSnSap;
	}

	public String getEngSeries() {
		return engSeries;
	}

	public void setEngSeries(String engSeries) {
		this.engSeries = engSeries;
	}

	public String getEngType() {
		return engType;
	}

	public void setEngType(String engType) {
		this.engType = engType;
	}

	public String getEngModel() {
		return engModel;
	}

	public void setEngModel(String engModel) {
		this.engModel = engModel;
	}

	public String getEngConfig() {
		return engConfig;
	}

	public void setEngConfig(String engConfig) {
		this.engConfig = engConfig;
	}
	
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getDeliveryMode() {
		return deliveryMode;
	}

	public void setDeliveryMode(String deliveryMode) {
		this.deliveryMode = deliveryMode;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getCodeConfig() {
		return codeConfig;
	}

	public void setCodeConfig(String codeConfig) {
		this.codeConfig = codeConfig;
	}

	public String getEngConfigration() {
		return engConfigration;
	}

	public void setEngConfigration(String engConfigration) {
		this.engConfigration = engConfigration;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

	public String getEngPn() {
		return engPn;
	}

	public void setEngPn(String engPn) {
		this.engPn = engPn;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getDutyName() {
		return dutyName;
	}

	public void setDutyName(String dutyName) {
		this.dutyName = dutyName;
	}
	
}
