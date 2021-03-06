package com.cea.ehm.controller.manage;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.condition.PatternsRequestCondition;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import com.cea.ehm.bean.Func;
import com.cea.ehm.bean.Role;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.FuncService;
import com.cea.ehm.service.RoleService;
import com.cea.ehm.util.ExcelUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

/**
 * 权限管理控制层
 */
@Controller
@RequestMapping(value = "/manage/manage")
public class ManageController extends BaseController {
	private Logger logger = Logger.getLogger(ManageController.class);
	@Autowired
	private RoleService roleService;
	@Autowired
	private FuncService funcService;

	/**
	 * 获取项目中所有的URL请求
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/allURL.do")
	@ResponseBody
	public Map<String, Object> allURL(HttpServletRequest request) {
		List<Func> funcs = Lists.newArrayList();
		WebApplicationContext wc = (WebApplicationContext) request
				.getAttribute(DispatcherServlet.WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		RequestMappingHandlerMapping bean = wc.getBean(RequestMappingHandlerMapping.class);
		Map<RequestMappingInfo, HandlerMethod> handlerMethods = bean.getHandlerMethods();
		for (RequestMappingInfo rmi : handlerMethods.keySet()) {
			PatternsRequestCondition pc = rmi.getPatternsCondition();
			Set<String> pSet = pc.getPatterns();
			pSet.forEach(url -> {
				Func func = new Func();
				func.setUrl(url);
				funcs.add(func);
			});
		}
		logger.info("所有URL请求数量： " + funcs.size());
		List<Role> roles = roleService.allRole();
		for (Role role : roles) {
			Func isExistRoleFunc = new Func();
			isExistRoleFunc.setRoleId(role.getId());
			List<Func> roleFunc = funcService.getRoleFunc(isExistRoleFunc);
			if (roleFunc.size() == 0) {
				for (Func func : funcs) {
					func.setRoleId(role.getId());
					func.setFlag(0);
					funcService.saveRoleFunc(func);
				}
			}
		}
		return getSuccessMessage();
	}

	/**
	 * 显示角色列表页面
	 */
	@RequestMapping(value = "/rolelist.do")
	public ModelAndView rolelist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/manage/rolelist");
		return mv;
	}

	/**
	 * 查询 角色 → 列表
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/listRole.do")
	@ResponseBody
	public Map<String, Object> listRole(@RequestParam Map<String, String> reqPara) {
		logger.info("页面请求参数: " + reqPara);
		PageBounds pageBounds = handlePageInfoForManage(reqPara);
		String sEcho = reqPara.get("draw");
		Map<String, String> paramMap = Maps.newHashMap();
		// 条件参数
		String name = reqPara.get("name");
		if (!Strings.isNullOrEmpty(name)) {
			paramMap.put("name", name);
		}
		PageList<Role> pageList = (PageList<Role>) roleService.getRoleList(paramMap, pageBounds);

		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<Role> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 保存角色信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/saveRole.do")
	@ResponseBody
	public Map<String, Object> saveRole(@RequestParam Map<String, String> reqPara) {
		logger.info("待编辑角色信息: " + reqPara);
		String name = reqPara.get("name");
		String pId = reqPara.get("pId");
		String status = reqPara.get("status");
		String remark = reqPara.get("remark");
		String listorder = reqPara.get("listorder");

		Role role = new Role();
		role.setName(name);
		role.setpId(Integer.parseInt(pId));
		role.setStatus(Integer.parseInt(status));
		role.setRemark(remark);
		String date = LocalDateTime.now().toString().replace("T", " ");
		String time = date.substring(0, date.indexOf("."));
		role.setCtime(time);
		role.setUtime(time);
		role.setListorder(Integer.parseInt(listorder));

		roleService.save(role);
		return getSuccessMessage();
	}

	/**
	 * 更新角色信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/updateRole.do")
	@ResponseBody
	public Map<String, Object> updateRole(@RequestParam Map<String, String> reqPara) {
		logger.info("待编辑角色信息: " + reqPara);
		String id = reqPara.get("id");
		String name = reqPara.get("name");
		String pId = reqPara.get("pId");
		String status = reqPara.get("status");
		String remark = reqPara.get("remark");
		String listorder = reqPara.get("listorder");

		Role role = new Role();
		role.setId(Integer.parseInt(id));
		role.setName(name);
		role.setpId(Integer.parseInt(pId));
		role.setStatus(Integer.parseInt(status));
		role.setRemark(remark);
		String date = LocalDateTime.now().toString().replace("T", " ");
		String time = date.substring(0, date.indexOf("."));
		role.setUtime(time);
		role.setListorder(Integer.parseInt(listorder));

		roleService.update(role);
		return getSuccessMessage();
	}

	/**
	 * 删除角色信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/deleteRole.do")
	@ResponseBody
	public Map<String, Object> deleteRole(@RequestParam Map<String, String> reqPara) {
		String id = reqPara.get("id");
		Role role = new Role();
		role.setId(Integer.parseInt(id));
		roleService.delete(role);
		return getSuccessMessage();
	}

	/**
	 * 获取所有(有效的)角色信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/allrole.do")
	@ResponseBody
	public Map<String, Object> allRole() {
		List<Role> roles = roleService.allRole();
		return getSuccessData(roles, "");
	}

	/**
	 * 显示权限设置列表页面
	 */
	@RequestMapping(value = "/rolefunclist.do")
	public ModelAndView rolefunclist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/manage/rolefunclist");
		return mv;
	}

	/**
	 * 查询角色 对应功能信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/roleFunc.do")
	@ResponseBody
	public Map<String, Object> roleFunc(@RequestParam Map<String, String> reqPara) {
		String roleId = reqPara.get("roleId");
		Func func = new Func();
		if (!Strings.isNullOrEmpty(roleId)) {
			func.setRoleId(Integer.parseInt(roleId));
		}
		List<Func> roleFuncs = funcService.getRoleFunc(func);
		return getSuccessData(roleFuncs, "");
	}

	/**
	 * 编辑角色功能信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/updateRoleFunc.do")
	@ResponseBody
	public Map<String, Object> updateRoleFunc(@RequestParam Map<String, String> reqPara) {
		logger.info("待编辑角色功能信息: " + reqPara);
		String roleId = reqPara.get("roleId");
		String funcs = reqPara.get("func");
		funcService.updateRoleFunc(roleId, funcs);
		return getSuccessMessage();
	}

	/**
	 * excel表格 一键上传 更新功能名称
	 * 
	 * @param file
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/updataFuncName.do")
	@ResponseBody
	public Map<String, Object> updataFuncName(MultipartFile file) throws IOException {
		// 这里得到的是一个集合，里面的每一个元素是String[]数组
		List<String[]> list = ExcelUtil.readExcel(file);
		list.forEach(arr -> {
			Func func = new Func();
			func.setName(arr[2]);
			func.setUrl(arr[3]);
			funcService.updataFuncName(func);
		});
		return getSuccessMessage();
	}

}
