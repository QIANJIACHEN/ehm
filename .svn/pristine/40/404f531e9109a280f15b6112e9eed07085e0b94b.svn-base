package com.cea.ehm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.cea.ehm.bean.User;
import com.cea.ehm.util.ConstantUtil;

/**
 * (拦截器) 拦截未登录用户 和 无权限操作
 */
public class ManageInterceptor implements HandlerInterceptor {
	private Logger logger = Logger.getLogger(ManageInterceptor.class);
//	@Autowired
//	private FuncMapper funcMapper;

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
//				return false;
//			}
			return true;
		} else {
			response.sendRedirect(request.getContextPath() + "/manage/login/login.jsp");
		}
		return true;
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
