package com.cea.ehm.bean;

import java.io.Serializable;

public class Duty implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	/**
	 * 上级ID
	 */
	private Integer parentId;
	/**
	 * 上级名
	 */
	private String parentName;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 角色ID
	 */
	private Integer role;
	/**
	 * 角色名
	 */
	private String roleName;
	/**
	 * 所在地
	 */
	private String location;
	/**
	 * 创建时间
	 */
	private String ctime;
	/**
	 * 分类
	 */
	private Integer type;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

}
