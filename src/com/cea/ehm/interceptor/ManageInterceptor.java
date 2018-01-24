package com.cea.ehm.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.cea.ehm.bean.Func;
import com.cea.ehm.bean.User;
import com.cea.ehm.dao.FuncMapper;
import com.cea.ehm.util.ConstantUtil;
import com.google.common.collect.Lists;

/**
 * (拦截器) 拦截未登录用户 和 无权限操作
 */
public class ManageInterceptor implements HandlerInterceptor {
	private Logger logger = Logger.getLogger(ManageInterceptor.class);
	@Autowired
	private FuncMapper funcMapper;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		String uri = request.getRequestURI();
		uri = uri.substring(request.getContextPath().length());
		logger.info("用户请求地址: " + uri);
		if (uri.contains("/manage/auth/login.do") || uri.contains("/manage/auth/logout.do")) {
			return true;
		}
		/**
		 * 拦截无权限的用户
		 */
		User sessionuser = (User) request.getSession().getAttribute(ConstantUtil.SESSION_LOGIN_USER);
		if (sessionuser != null) {
//			Integer role = sessionuser.getRole();
//			Func func = new Func();
//			func.setRoleId(role);
//			List<Func> funcs = funcMapper.getRoleFuncTwo(func);
//			List<String> urls = Lists.newArrayList();
//			funcs.forEach(roleFunc -> urls.add(roleFunc.getUrl()));
//			if (!urls.contains(uri)) {
//				response.sendRedirect(request.getContextPath() + "/manage/manage/nopower.jsp");
//				return false;
//			}
		} else {
			// 用户不存在，重定向到登录页面
			if (isAjax(request)) {
				response.setHeader("sessionstatus", "timeout");// 在响应头设置session状态
				return false;
			} else {
				response.sendRedirect(request.getContextPath() + "/manage/login/login.jsp");
				return false;
			}
		}
		return true;
	}

	/**
	 * 判断是否ajax请求
	 * 
	 * @param request
	 * @return
	 */
	public boolean isAjax(HttpServletRequest request) {
		if (request != null && "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
			Object o, Exception e) throws Exception {
	}
}
