package com.cea.ehm.bean;

import java.io.Serializable;

/**
 * 用户表(user)
 */
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 用户id
	 */
	private Integer userId;
	/**
	 * 用户名
	 */
	private String username;
	/**
	 * 姓名
	 */
	private String realName;
	/**
	 * 密码
	 */
	private String password;
	/**
	 * 职位
	 */
	private String position;
	/**
	 * 角色ID
	 */
	private Integer role;
	/**
	 * 角色名
	 */
	private String roleName;
	/**
	 * 手机号
	 */
	private String phone;
	/**
	 * 创建时间
	 */
	private String ctime;
	/**
	 * 基地ID
	 */
	private Integer duty;
	/**
	 * 基地名
	 */
	private String dutyName;
	/**
	 * 邮箱
	 */
	private String email;
	/**
	 * 工号
	 */
	private String number;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	/**
	 * 选择框
	 */
	@SuppressWarnings("unused")
	private String checkbox;

	public String getCheckbox() {
		return "<input data-id='"+getUserId()+"' class='func' type='checkbox' />";
	}
	

}
