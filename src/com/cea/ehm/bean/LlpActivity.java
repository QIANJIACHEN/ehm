package com.cea.ehm.bean;

import java.io.Serializable;
import java.util.Date;


public class LlpActivity implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id;
	private String engSn;
	private String iin;
	private String llpPn;
	private String llpSn;
	private String planeType;
	private String engPn;
	private String onDate;
	private String onEtsn;
	private String onEcsn;
	private String onPtsn;
	private String onPcsn;
	private String limitSpecial;
	private String remark;
	private Date ctime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEngSn() {
		return engSn;
	}
	public void setEngSn(String engSn) {
		this.engSn = engSn;
	}
	public String getIin() {
		return iin;
	}
	public void setIin(String iin) {
		this.iin = iin;
	}
	public String getLlpPn() {
		return llpPn;
	}
	public void setLlpPn(String llpPn) {
		this.llpPn = llpPn;
	}
	public String getLlpSn() {
		return llpSn;
	}
	public void setLlpSn(String llpSn) {
		this.llpSn = llpSn;
	}
	public String getPlaneType() {
		return planeType;
	}
	public void setPlaneType(String planeType) {
		this.planeType = planeType;
	}
	public String getEngPn() {
		return engPn;
	}
	public void setEngPn(String engPn) {
		this.engPn = engPn;
	}
	public String getOnDate() {
		return onDate;
	}
	public void setOnDate(String onDate) {
		this.onDate = onDate;
	}
	public String getOnEtsn() {
		return onEtsn;
	}
	public void setOnEtsn(String onEtsn) {
		this.onEtsn = onEtsn;
	}
	public String getOnEcsn() {
		return onEcsn;
	}
	public void setOnEcsn(String onEcsn) {
		this.onEcsn = onEcsn;
	}
	public String getOnPtsn() {
		return onPtsn;
	}
	public void setOnPtsn(String onPtsn) {
		this.onPtsn = onPtsn;
	}
	public String getOnPcsn() {
		return onPcsn;
	}
	public void setOnPcsn(String onPcsn) {
		this.onPcsn = onPcsn;
	}
	public String getLimitSpecial() {
		return limitSpecial;
	}
	public void setLimitSpecial(String limitSpecial) {
		this.limitSpecial = limitSpecial;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getCtime() {
		return ctime;
	}
	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
