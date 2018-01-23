package com.cea.ehm.bean;

import java.io.Serializable;

public class EngConditionFleet implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	/**
	 * 发动机ID
	 */
	private Integer engId;
	/**
	 * 发动机编号
	 */
	private String engSn;
	/**
	 * 创建时间
	 */
	private String ctime;
	/**
	 * TSI_START
	 */
	private String tsiStart;
	/**
	 * CSI_START
	 */
	private String csiStart;
	/**
	 * SV_TIME
	 */
	private String svTime;

	/**
	 * TSR_START
	 */
	private String tsrStart;
	/**
	 * CSR_START
	 */
	private String csrStart;
	/**
	 * TSO_START
	 */
	private String tsoStart;
	/**
	 * CSO_START
	 */
	private String csoStart;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public String getTsiStart() {
		return tsiStart;
	}
	public void setTsiStart(String tsiStart) {
		this.tsiStart = tsiStart;
	}
	public String getCsiStart() {
		return csiStart;
	}
	public void setCsiStart(String csiStart) {
		this.csiStart = csiStart;
	}
	public String getSvTime() {
		return svTime;
	}
	public void setSvTime(String svTime) {
		this.svTime = svTime;
	}
	public String getTsrStart() {
		return tsrStart;
	}
	public void setTsrStart(String tsrStart) {
		this.tsrStart = tsrStart;
	}
	public String getCsrStart() {
		return csrStart;
	}
	public void setCsrStart(String csrStart) {
		this.csrStart = csrStart;
	}
	public String getTsoStart() {
		return tsoStart;
	}
	public void setTsoStart(String tsoStart) {
		this.tsoStart = tsoStart;
	}
	public String getCsoStart() {
		return csoStart;
	}
	public void setCsoStart(String csoStart) {
		this.csoStart = csoStart;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
