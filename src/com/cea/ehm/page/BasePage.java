package com.cea.ehm.page;

import org.apache.commons.lang.StringUtils;

/**
 * 分页技术
 */
public class BasePage {

	private Integer page = 1;

	// private Integer pageIndex = 1;

	private Integer rows = 10;

	private Integer page_size = 10;// 用于接口

	private String orderByField;

	private String ascOrDesc;

	/**
	 * 分页导航
	 */
	private Pager pager = new Pager();

	public Pager getPager() {
		pager.setPageId(getPage());
		pager.setPageSize(getRows());
		if (page_size != 10) {
			pager.setPageSize(page_size);
		}
		String orderField = "";
		if (StringUtils.isNotBlank(orderByField)) {
			orderField = orderByField;
		}
		if (StringUtils.isNotBlank(orderField) && StringUtils.isNotBlank(ascOrDesc)) {
			orderField += " " + ascOrDesc;
		}
		pager.setOrderField(orderField);
		return pager;
	}

	public Pager getPagerDirectly() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		if (page <= 0) {
			return;
		}
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer page_size) {
		this.rows = page_size;
	}

	public String getOrderByField() {
		return orderByField;
	}

	public void setOrderByField(String orderByField) {
		this.orderByField = orderByField;
	}

	public String getAscOrDesc() {
		return ascOrDesc;
	}

	public void setAscOrDesc(String ascOrDesc) {
		this.ascOrDesc = ascOrDesc;
	}

	public Integer getPageIndex() {
		return page;
	}

	public void setPageIndex(Integer pageIndex) {
		this.page = pageIndex;
		// this.pageIndex = pageIndex;
	}

	public Integer getPage_size() {
		return page_size;
	}

	public void setPage_size(Integer page_size) {
		this.page_size = page_size;
	}
}
