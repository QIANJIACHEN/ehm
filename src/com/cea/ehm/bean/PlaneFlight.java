package com.cea.ehm.bean;

import java.io.Serializable;

/**
 * 航班
 */
public class PlaneFlight implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	/**
	 * 飞行时间
	 */
	private String flyTime;
	/**
	 * 空中时间
	 */
	private Double airTime;
	/**
	 * 空地时间
	 */
	private Double floorTime;
	/**
	 * 飞起航站
	 */
	private String sTerminal;
	/**
	 * 到达航站
	 */
	private String eTerminal;
	/**
	 * 创建时间
	 */
	private String ctime;
	/**
	 * 航班号
	 */
	private String number;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFlyTime() {
		return flyTime;
	}

	public void setFlyTime(String flyTime) {
		this.flyTime = flyTime;
	}

	public Double getAirTime() {
		return airTime;
	}

	public void setAirTime(Double airTime) {
		this.airTime = airTime;
	}

	public Double getFloorTime() {
		return floorTime;
	}

	public void setFloorTime(Double floorTime) {
		this.floorTime = floorTime;
	}

	public String getsTerminal() {
		return sTerminal;
	}

	public void setsTerminal(String sTerminal) {
		this.sTerminal = sTerminal;
	}

	public String geteTerminal() {
		return eTerminal;
	}

	public void seteTerminal(String eTerminal) {
		this.eTerminal = eTerminal;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

}
