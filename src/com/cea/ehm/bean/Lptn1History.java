package com.cea.ehm.bean;

import java.io.Serializable;

/**
 * (ehm_lptn1_history)
 */
public class Lptn1History implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String engSnUsed;
	private String lptn1Pn;
	private String lptn1Sn;
	private String engPn;
	private String onDate;
	private String onEtsn;
	private String onEcsn;
	private String onPtsn;
	private String onPcsn;
	private String offDate;
	private String offEtsn;
	private String offEcsn;
	private String offPtsn;
	private String offPcsn;
	private String limitSpecial;
	private String code;
	private String remark;
	private String ctime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEngSnUsed() {
		return engSnUsed;
	}

	public void setEngSnUsed(String engSnUsed) {
		this.engSnUsed = engSnUsed;
	}

	public String getLptn1Pn() {
		return lptn1Pn;
	}

	public void setLptn1Pn(String lptn1Pn) {
		this.lptn1Pn = lptn1Pn;
	}

	public String getLptn1Sn() {
		return lptn1Sn;
	}

	public void setLptn1Sn(String lptn1Sn) {
		this.lptn1Sn = lptn1Sn;
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

	public String getOffDate() {
		return offDate;
	}

	public void setOffDate(String offDate) {
		this.offDate = offDate;
	}

	public String getOffEtsn() {
		return offEtsn;
	}

	public void setOffEtsn(String offEtsn) {
		this.offEtsn = offEtsn;
	}

	public String getOffEcsn() {
		return offEcsn;
	}

	public void setOffEcsn(String offEcsn) {
		this.offEcsn = offEcsn;
	}

	public String getOffPtsn() {
		return offPtsn;
	}

	public void setOffPtsn(String offPtsn) {
		this.offPtsn = offPtsn;
	}

	public String getOffPcsn() {
		return offPcsn;
	}

	public void setOffPcsn(String offPcsn) {
		this.offPcsn = offPcsn;
	}

	public String getLimitSpecial() {
		return limitSpecial;
	}

	public void setLimitSpecial(String limitSpecial) {
		this.limitSpecial = limitSpecial;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

}
