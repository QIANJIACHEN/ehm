package com.cea.ehm.util;

/*
 * 常量信息
 */
public final class ConstantUtil {

	public static final String KEY_PAGE_INDEX = "pageIndex";
	public static final String KEY_PAGE_SIZE = "pageSize";

	public static final int PAGE_INDEX = 1;
	public static final int PAGE_SIZE = 20;

	/**
	 * 用户名
	 */
	public static final String SESSION_USERNAME = "SESSION_USERNAME";
	/**
	 * 密码
	 */
	public static final String SESSION_PASSWORD = "SESSION_PASSWORD";
	/**
	 * 用户
	 */
	public static final String SESSION_LOGIN_USER = "SESSION_LOGIN_USER";
	/**
	 * 权限规则
	 */
	public static final String SESSION_RULE_TYPE = "SESSION_RULE_TYPE";
	/**
	 * 参数错误 code 201
	 */
	public static final Integer RES_CODE_201 = 201;
	/**
	 * 缺少必填参数 code 301
	 */
	public static final Integer RES_CODE_301 = 301;
	/**
	 * 参数不合法 code 300
	 */
	public static final Integer RES_CODE_300 = 300;
	/**
	 * 登录信息已过期
	 */
	public static final Integer RES_CODE_401 = 401;
	/**
	 * 唯一字段判断，数据已存在
	 */
	public static final String RES_MSG_EXIST = "数据已存在！";

}
