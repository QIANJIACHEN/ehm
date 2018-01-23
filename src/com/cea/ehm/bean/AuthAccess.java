package com.cea.ehm.bean;

import java.io.Serializable;

/**
 * 权限授权表(auth_access)
 */
public class AuthAccess implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键 id
	 */
	private String id;
	/**
	 * 规则所属module
	 */
	private String module;
	/**
	 * 权限规则分类,请加应用前缀,如admin_
	 */
	private String type;
	/**
	 * 规则唯一英文标识,全小写
	 */
	private String name;
	/**
	 * 额外参数
	 */
	private String param;
	/**
	 * 规则中文注释
	 */
	private String title;
	/**
	 * 0：无效；1：有效
	 */
	private String status;
	/**
	 * 规则附加
	 */
	private String condition;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

}
