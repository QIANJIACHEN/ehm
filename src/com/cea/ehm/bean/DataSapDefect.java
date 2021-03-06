package com.cea.ehm.bean;

import java.io.Serializable;

public class DataSapDefect implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	private Integer duty;
	private String dutyName;
	private String series;
	private Integer planeId;
	private String tail;
	private Integer engPosit;
	private Integer engId;
	private String engSn;
	private Integer status;
	private String name;
	private String remark;
	private String ctime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public Integer getPlaneId() {
		return planeId;
	}
	public void setPlaneId(Integer planeId) {
		this.planeId = planeId;
	}
	public String getTail() {
		return tail;
	}
	public void setTail(String tail) {
		this.tail = tail;
	}
	public Integer getEngPosit() {
		return engPosit;
	}
	public void setEngPosit(Integer engPosit) {
		this.engPosit = engPosit;
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
	
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

}
