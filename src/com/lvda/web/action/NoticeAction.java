package com.lvda.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import com.lvda.domain.Notice;
import com.lvda.domain.PageBean;
import com.lvda.service.NoticeService;
import com.lvda.utils.FastJsonUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;

/**
 * 用户的控制器
 * 
 * @author Administrator
 */
public class NoticeAction extends ActionSupport implements ModelDriven<Notice> {

	private static final long serialVersionUID = -3413092622818913571L;

	private Notice notice = new Notice();

	public Notice getModel() {
		return notice;
	}

	private NoticeService noticeService;

	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	public String findAll() {
		List<Notice> list = noticeService.findAll(notice);
		String jsonString = FastJsonUtil.toJSONString(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		FastJsonUtil.write_json(response, jsonString);
		return NONE;
	}

	private Integer pageCode = 1;

	public void setPageCode(Integer pageCode) {
		if (pageCode == null) {
			pageCode = 1;
		}
		this.pageCode = pageCode;
	}

	private Integer pageSize = 3;

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public String findByPage() {
		DetachedCriteria criteria = DetachedCriteria.forClass(notice.getClass());
		PageBean<Notice> pageBean = noticeService.findByPage(pageCode, pageSize, criteria);
		List<Notice> notices = pageBean.getBeanList();
		String jsonString = FastJsonUtil.toJSONString(notices);
		HttpServletResponse response = ServletActionContext.getResponse();
		FastJsonUtil.write_json(response, jsonString);
		return NONE;
	}

	public String findByPage1() {
		DetachedCriteria criteria = DetachedCriteria.forClass(notice.getClass());
		PageBean<Notice> page = noticeService.findByPage(pageCode, pageSize, criteria);
		ValueStack vs = ActionContext.getContext().getValueStack();
		vs.set("page", page);
		return "page1";
	}

	public String findByPage2() {
		DetachedCriteria criteria = DetachedCriteria.forClass(notice.getClass());
		PageBean<Notice> page = noticeService.findByPage(pageCode, 10, criteria);
		ValueStack vs = ActionContext.getContext().getValueStack();
		vs.set("page", page);
		return "page2";
	}

	public String save() {
		noticeService.save(notice);
		return "save";
	}

	public String findById() {
		Notice notice1 = noticeService.findById(notice.getNotice_id());
		ValueStack vs = ActionContext.getContext().getValueStack();
		vs.set("notice", notice1);
		return "find";
	}

	public String initUpdate() {
		Notice notice1 = noticeService.findById(notice.getNotice_id());
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().setAttribute("notice", notice1);
		return "initUpdate";
	}

	public String update() {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().removeAttribute("notice");
		noticeService.update(notice);
		return "update";
	}

	public String delete() {
		Notice notice1 = noticeService.findById(notice.getNotice_id());
		noticeService.delete(notice1);
		return "delete";
	}
}
