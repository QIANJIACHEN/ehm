package com.cea.ehm.bean;

import java.io.Serializable;

/**
 * 规则参数表
 */
public class RuleParameter implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	/**
	 * 上级ID
	 */
	private Integer parentId;
	/**
	 * 0：表；1：字段
	 */
	private Integer type;
	/**
	 * 值
	 */
	private String val;
	/**
	 * 注释
	 */
	private String annotation;
	/**
	 * 创建时间
	 */
	private String ctime;
	/**
	 * 是否加入计算；0：否；1：是
	 */
	private Integer isCalculate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}

	public String getAnnotation() {
		return annotation;
	}

	public void setAnnotation(String annotation) {
		this.annotation = annotation;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

	public Integer getIsCalculate() {
		return isCalculate;
	}

	public void setIsCalculate(Integer isCalculate) {
		this.isCalculate = isCalculate;
	}

}
