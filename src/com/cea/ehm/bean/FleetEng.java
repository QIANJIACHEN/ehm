package com.cea.ehm.bean;
import java.io.Serializable;
public class FleetEng implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	//TAIL
	private String tail;
	//PLANE_ID
	private Integer planeId;
	//ENG_POSITION
	private Integer engPosition;
	//ENG_SN
	private String engSn;
	//ENG_ID 
	private Integer engId;
	//ENG_PN
	private String engPn;
	
	
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
	public Integer getPlaneId() {
		return planeId;
	}
	public void setPlaneId(Integer planeId) {
		this.planeId = planeId;
	}
	public Integer getEngPosition() {
		return engPosition;
	}
	public void setEngPosition(Integer engPosition) {
		this.engPosition = engPosition;
	}
	public String getEngSn() {
		return engSn;
	}
	public void setEngSn(String engSn) {
		this.engSn = engSn;
	}
	public Integer getEngId() {
		return engId;
	}
	public void setEngId(Integer engId) {
		this.engId = engId;
	}
	public String getEngPn() {
		return engPn;
	}
	public void setEngPn(String engPn) {
		this.engPn = engPn;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
