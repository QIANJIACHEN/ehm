package com.cea.ehm.bean;

import java.io.Serializable;

/**
 * 航班 飞机 关联
 */
public class PlaneWithFlight implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	/**
	 * 航班ID
	 */
	private Integer flightId;
	private String number;
	/**
	 * 飞机ID
	 */
	private Integer planeId;
	private String tail;
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

	public Integer getFlightId() {
		return flightId;
	}

	public void setFlightId(Integer flightId) {
		this.flightId = flightId;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
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

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

}
