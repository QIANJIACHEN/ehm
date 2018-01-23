package com.cea.ehm.bean;
import java.io.Serializable;
public class EngDeadLineLlp implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	//ENG_SN
	private String engSn;
	//ENG_ID
	private Integer engId;
	//DEADLINE_LLP
	private String deadLineLlp;
	//DEADLINE_211
	private String deadLine211;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getDeadLineLlp() {
		return deadLineLlp;
	}
	public void setDeadLineLlp(String deadLineLlp) {
		this.deadLineLlp = deadLineLlp;
	}
	public String getDeadLine211() {
		return deadLine211;
	}
	public void setDeadLine211(String deadLine211) {
		this.deadLine211 = deadLine211;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
