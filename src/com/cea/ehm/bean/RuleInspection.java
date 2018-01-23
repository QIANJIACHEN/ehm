package com.cea.ehm.bean;

import java.io.Serializable;

/**
 * 监测规则
 */
public class RuleInspection implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 录入人
	 */
	private Integer userId;
	/**
	 * 0：开启；1：关闭
	 */
	private Integer type;
	/**
	 * 警告提示内容
	 */
	private String content;
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
	 * 优先级
	 */
	private Integer orderId;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

}
