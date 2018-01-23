package com.cea.ehm.bean;

import java.io.Serializable;

/**
 * eng_onwing
 */
public class EngOnwing implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String expr;
	private Integer planeId;
	private String tail;
	private String model;
	private Integer engPosition;
	private Integer engId;
	private String engSn;
	private String engPn;
	private String etops;
	private Integer hHighLand;
	private Integer duty;
	private String dutyName;
	private String operater;
	private String idPlugPn;
	private String owner;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getExpr() {
		return expr;
	}

	public void setExpr(String expr) {
		this.expr = expr;
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

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public Integer getEngPosition() {
		return engPosition;
	}

	public void setEngPosition(Integer engPosition) {
		this.engPosition = engPosition;
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

	public String getEngPn() {
		return engPn;
	}

	public void setEngPn(String engPn) {
		this.engPn = engPn;
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

	public String getOperater() {
		return operater;
	}

	public void setOperater(String operater) {
		this.operater = operater;
	}

	public String getIdPlugPn() {
		return idPlugPn;
	}

	public void setIdPlugPn(String idPlugPn) {
		this.idPlugPn = idPlugPn;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

}
