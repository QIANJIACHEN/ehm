package com.cea.ehm.bean;

import java.io.Serializable;

/**
 * 飞机属性变更记录表（ record_data_plane）
 */
public class RecordDataPlane implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键 id
	 */
	private Integer id;
	/**
	 * tail
	 */
	private String tail;
	/**
	 * 基地
	 */
	private Integer duty;
	private String dutyName;
	/**
	 * 推力
	 */
	private String ratingPlane;
	/**
	 * 构型
	 */
	private String configPlane;
	/**
	 * 原始的发动机编码
	 */
	private String egsnOriginal;
	/**
	 * 型号1级
	 */
	private String series;
	/**
	 * 型号2级
	 */
	private String type;
	/**
	 * 型号3级
	 */
	private String model;
	/**
	 * 属性
	 */
	private String attribute;
	/**
	 * ETOPS
	 */
	private String etops;
	/**
	 * 高高原
	 */
	private Integer hHighLand;
	/**
	 * VARIABLE
	 */
	private String variable;
	/**
	 * MSN
	 */
	private String serial;
	/**
	 * LINE
	 */
	private String line;
	private String manual;
	/**
	 * 运营人
	 */
	private String operater;
	/**
	 * 所有人
	 */
	private String owner;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 引进方式
	 */
	private String importWay;
	/**
	 * 录入人 关联用户表id
	 */
	private Integer userId;
	private String username;
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

	public String getTail() {
		return tail;
	}

	public void setTail(String tail) {
		this.tail = tail;
	}

	public Integer getDuty() {
		return duty;
	}

	public void setDuty(Integer duty) {
		this.duty = duty;
	}

	public String getDutyName() {
		return dutyName;
	}

	public void setDutyName(String dutyName) {
		this.dutyName = dutyName;
	}

	public String getRatingPlane() {
		return ratingPlane;
	}

	public void setRatingPlane(String ratingPlane) {
		this.ratingPlane = ratingPlane;
	}

	public String getConfigPlane() {
		return configPlane;
	}

	public void setConfigPlane(String configPlane) {
		this.configPlane = configPlane;
	}

	public String getEgsnOriginal() {
		return egsnOriginal;
	}

	public void setEgsnOriginal(String egsnOriginal) {
		this.egsnOriginal = egsnOriginal;
	}

	public String getSeries() {
		return series;
	}

	public void setSeries(String series) {
		this.series = series;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	public String getEtops() {
		return etops;
	}

	public void setEtops(String etops) {
		this.etops = etops;
	}

	public Integer gethHighLand() {
		return hHighLand;
	}

	public void sethHighLand(Integer hHighLand) {
		this.hHighLand = hHighLand;
	}

	public String getVariable() {
		return variable;
	}

	public void setVariable(String variable) {
		this.variable = variable;
	}

	public String getSerial() {
		return serial;
	}

	public void setSerial(String serial) {
		this.serial = serial;
	}

	public String getLine() {
		return line;
	}

	public void setLine(String line) {
		this.line = line;
	}

	public String getOperater() {
		return operater;
	}

	public void setOperater(String operater) {
		this.operater = operater;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getImportWay() {
		return importWay;
	}

	public void setImportWay(String importWay) {
		this.importWay = importWay;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

	public String getManual() {
		return manual;
	}

	public void setManual(String manual) {
		this.manual = manual;
	}
	
}
