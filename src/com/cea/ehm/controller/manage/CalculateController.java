package com.cea.ehm.controller.manage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cea.ehm.bean.RuleComputation;
import com.cea.ehm.bean.RuleInspection;
import com.cea.ehm.bean.RuleInspectionUser;
import com.cea.ehm.bean.RuleParameter;
import com.cea.ehm.bean.User;
import com.cea.ehm.controller.BaseController;
import com.cea.ehm.service.RuleComputationService;
import com.cea.ehm.service.RuleInspectionService;
import com.cea.ehm.service.RuleInspectionUserService;
import com.cea.ehm.service.RuleParameterService;
import com.cea.ehm.util.ConstantUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;

/**
 * 计算
 */
@Controller
@RequestMapping(value = "/manage/calculate")
public class CalculateController extends BaseController {
	@Autowired
	private RuleComputationService computationService;
	@Autowired
	private RuleParameterService parameterService;
	@Autowired
	private RuleInspectionService inspectionService;
	@Autowired
	private RuleInspectionUserService inspectionUserService;

	/**
	 * 显示计算设置
	 */
	@RequestMapping(value = "/settings_new.do")
	public ModelAndView settings_new() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/manage/calculate/settings_new");
		return mv;
	}

	/**
	 * 查询公式 → 列表
	 * 
	 * @param reqPara
	 * @return
	 */
	@PostMapping(value = "/list.do")
	@ResponseBody
	public Map<String, Object> list(@RequestParam Map<String, String> reqPara) {
		PageBounds pageBounds = handlePageInfoForManage(reqPara);
		String sEcho = reqPara.get("draw");
		// 条件参数
		Map<String, String> paramMap = Maps.newHashMap();
		PageList<RuleInspection> pageList = (PageList<RuleInspection>) inspectionService.list(paramMap, pageBounds);
		Pageable page = new PageRequest(pageBounds.getPage(), pageBounds.getLimit());
		Page<RuleInspection> content = new PageImpl<>(pageList, page, pageList.getPaginator().getTotalCount());
		Map<String, Object> map = Maps.newHashMap();
		map.put("data", pageList);
		map.put("iTotalRecords", content.getTotalElements());
		map.put("iTotalDisplayRecords", content.getTotalElements());
		map.put("sEcho", sEcho);
		map.put("draw", sEcho);
		return map;
	}

	/**
	 * 显示公式详细
	 * 
	 * @param id
	 */
	@RequestMapping(value = "/detail.do")
	public ModelAndView detail(Integer id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("id", id);
		mv.setViewName("/manage/calculate/detail");
		return mv;
	}

	/**
	 * 根据 id 查询公式详细
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/oneinspec.do")
	@ResponseBody
	public Map<String, Object> getOneInspec(@RequestParam Map<String, String> reqPara) {
		String id = reqPara.get("id");
		RuleInspection inspection = inspectionService.getOne(Integer.parseInt(id));
		return getSuccessData(inspection);
	}

	/**
	 * 根据 id 删除公式
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/deleteInspec.do")
	@ResponseBody
	public Map<String, Object> deleteInspec(@RequestParam Map<String, String> reqPara) {
		String inspecId = reqPara.get("id");
		// 删人员
		inspectionUserService.delete(Integer.parseInt(inspecId));
		// 删公式对应条件
		computationService.deleteCompu(Integer.parseInt(inspecId));
		// 删公式
		inspectionService.delete(Integer.parseInt(inspecId));
		return getSuccessMessage();
	}

	/**
	 * 根据 公式id 查询条件
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/compu.do")
	@ResponseBody
	public Map<String, Object> getCompu(@RequestParam Map<String, String> reqPara) {
		String id = reqPara.get("id");
		List<RuleComputation> computations = computationService.getCompu(Integer.parseInt(id));
		return getSuccessData(computations);
	}

	/**
	 * 根据 条件 ruleId 查询参数数据
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/param.do")
	@ResponseBody
	public Map<String, Object> getParam(@RequestParam Map<String, String> reqPara) {
		String id = reqPara.get("ruleId");
		List<RuleParameter> parameters = parameterService.getParam(Integer.parseInt(id));
		return getSuccessData(parameters);
	}

	/**
	 * 保存 computation
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/savecomputation.do")
	@ResponseBody
	public Map<String, Object> saveComputation(@RequestParam Map<String, String> reqPara) {
		RuleComputation computation = getComputation(reqPara);
		int id = computationService.saveComputation(computation);
		return getSuccessData(id);
	}

	/**
	 * 保存所有 (inspection computation inspection_user)
	 * 
	 * @param reqPara
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/saveall.do")
	@ResponseBody
	public Map<String, Object> saveAll(@RequestParam Map<String, String> reqPara, HttpServletRequest request) {
		RuleInspection inspection = getInspection(reqPara);
		User user = (User) request.getSession().getAttribute(ConstantUtil.SESSION_LOGIN_USER);
		int userId = 0;
		if (user != null) {
			userId = user.getUserId();
		}
		inspection.setUserId(userId);
		// 保存并获得 监测规则id
		Integer inspectionId = inspectionService.save(inspection);
		computationService.updateCompu(reqPara, inspectionId);
		inspectionUserService.updateInspecUser(reqPara, inspectionId);
		return getSuccessMessage();
	}

	/**
	 * 更新所有 (inspection computation inspection_user)
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/updateall.do")
	@ResponseBody
	public Map<String, Object> updateAll(@RequestParam Map<String, String> reqPara) {
		RuleInspection inspection = getInspection(reqPara);
		inspectionService.update(inspection);
		computationService.updateCompu(reqPara, inspection.getId());
		inspectionUserService.updateInspecUser(reqPara, inspection.getId());
		return getSuccessMessage();
	}

	/**
	 * 根据inspectId 获取推送人员
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/users.do")
	@ResponseBody
	public Map<String, Object> users(@RequestParam Map<String, String> reqPara) {
		String inspectId = reqPara.get("id");
		List<RuleInspectionUser> users = inspectionUserService.users(Integer.parseInt(inspectId));
		return getSuccessData(users);
	}

	/**
	 * 修改 computation
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/updatecomputation.do")
	@ResponseBody
	public Map<String, Object> updateComputation(@RequestParam Map<String, String> reqPara) {
		RuleComputation computation = getComputation(reqPara);
		computationService.updateComputation(computation);
		return getSuccessMessage();
	}

	/**
	 * 删除 computation
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/deletecomputation.do")
	@ResponseBody
	public Map<String, Object> deleteComputation(@RequestParam Map<String, String> reqPara) {
		String id = reqPara.get("id");
		computationService.deleteComputation(Integer.parseInt(id));
		return getSuccessMessage();
	}

	/**
	 * 获取页面传值(条件 computation)
	 * 
	 * @param reqPara
	 * @return
	 */
	public RuleComputation getComputation(Map<String, String> reqPara) {
		String inspecId = reqPara.get("inspecId");
		String id = reqPara.get("id");
		String type = reqPara.get("type");
		String calculationType = reqPara.get("calculationType");
		String calculationRange = reqPara.get("calculationRange");
		String rangeType = reqPara.get("rangeType");
		String flightPhase = reqPara.get("flightPhase");
		String ruleId = reqPara.get("ruleId");
		String max = reqPara.get("max");
		String min = reqPara.get("min");
		String equal = reqPara.get("equal");
		String unequal = reqPara.get("unequal");

		RuleComputation computation = new RuleComputation();
		if (!Strings.isNullOrEmpty(id)) {
			computation.setId(Integer.parseInt(id));
		}
		if (!Strings.isNullOrEmpty(inspecId)) {
			computation.setInspectionId(Integer.parseInt(inspecId));
		}
		computation.setType(Integer.parseInt(type));
		if (!Strings.isNullOrEmpty(calculationType)) {
			computation.setCalculationType(Integer.parseInt(calculationType));
		}
		if (!Strings.isNullOrEmpty(calculationRange)) {
			computation.setCalculationRange(Integer.parseInt(calculationRange));
		}
		if (!Strings.isNullOrEmpty(rangeType)) {
			computation.setRangeType(Integer.parseInt(rangeType));
		}
		if (!Strings.isNullOrEmpty(flightPhase)) {
			computation.setFlightPhase(Integer.parseInt(flightPhase));
		}
		computation.setRuleId(Integer.parseInt(ruleId));
		computation.setMax(max);
		computation.setMin(min);
		computation.setEqual(equal);
		computation.setUnequal(unequal);

		return computation;
	}

	/**
	 * 获取页面传值(inspection)
	 * 
	 * @param reqPara
	 * @return
	 */
	public RuleInspection getInspection(Map<String, String> reqPara) {
		String id = reqPara.get("id");
		String name = reqPara.get("name");
		String engSeries = reqPara.get("engSeries");
		String engType = reqPara.get("engType");
		String engModel = reqPara.get("engModel");
		String engConfig = reqPara.get("engConfig");
		String orderId = reqPara.get("orderId");
		String content = reqPara.get("content");

		RuleInspection inspection = new RuleInspection();
		if (!Strings.isNullOrEmpty(id)) {
			inspection.setId(Integer.parseInt(id));
		}
		inspection.setName(name);
		inspection.setEngSeries(engSeries);
		inspection.setEngType(engType);
		inspection.setEngModel(engModel);
		inspection.setEngConfig(engConfig);
		inspection.setContent(content);
		if (!Strings.isNullOrEmpty(orderId)) {
			inspection.setOrderId(Integer.parseInt(orderId));
		}
		return inspection;
	}

	/**
	 * 查询 第一个参数
	 * 
	 * @return
	 */
	@RequestMapping(value = "/firstParam.do")
	@ResponseBody
	public Map<String, Object> firstParam() {
		List<RuleParameter> parameters = parameterService.firstParam();
		return getSuccessData(parameters);
	}

	/**
	 * 查询 第二个参数
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/secondParam.do")
	@ResponseBody
	public Map<String, Object> secondParam(@RequestParam Map<String, String> reqPara) {
		String pId = reqPara.get("pId");
		List<RuleParameter> parameters = parameterService.secondParam(Integer.parseInt(pId));
		return getSuccessData(parameters);
	}

	/**
	 * 获取所有公式信息
	 * 
	 * @return
	 */
	@PostMapping(value = "/allInspection.do")
	@ResponseBody
	public Map<String, Object> allInspection() {
		List<RuleInspection> inspections = inspectionService.allInspection();
		return getSuccessData(inspections);
	}

	/**
	 * 获取所有公式信息
	 * 
	 * @param reqPara
	 * @return
	 */
	@PostMapping(value = "/allInspectionTwo.do")
	@ResponseBody
	public Map<String, Object> allInspectionTwo(@RequestParam Map<String, String> reqPara) {
		String id = reqPara.get("id");
		List<RuleInspection> inspections = inspectionService.allInspectionTwo(Integer.parseInt(id));
		return getSuccessData(inspections);
	}

	/**
	 * 已选的公式作为条件保存到条件表
	 * 
	 * @param reqPara
	 * @return
	 */
	@RequestMapping(value = "/saveInspec.do")
	@ResponseBody
	public Map<String, Object> saveInspec(@RequestParam Map<String, String> reqPara) {
		String type = reqPara.get("type");
		String ruleId = reqPara.get("ruleId");
		RuleComputation computation = new RuleComputation();
		computation.setType(Integer.parseInt(type));
		computation.setRuleId(Integer.parseInt(ruleId));
		Integer id = computationService.saveInspec(computation);
		return getSuccessData(id);
	}
}
