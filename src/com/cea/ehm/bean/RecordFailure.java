package com.cea.ehm.bean;

import java.io.Serializable;

public class RecordFailure implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String duty;
	private String stries;
	private String tail;
	private String engPosit;
	private String engSn;
	private Integer status;
	private String name;
	private String remark;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getStries() {
		return stries;
	}

	public void setStries(String stries) {
		this.stries = stries;
	}

	public String getTail() {
		return tail;
	}

	public void setTail(String tail) {
		this.tail = tail;
	}

	public String getEngPosit() {
		return engPosit;
	}

	public void setEngPosit(String engPosit) {
		this.engPosit = engPosit;
	}

	public String getEngSn() {
		return engSn;
	}

	public void setEngSn(String engSn) {
		this.engSn = engSn;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
