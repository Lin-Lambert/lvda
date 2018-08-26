package com.lvda.web.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.lvda.domain.Link;
import com.lvda.service.LinkService;
import com.lvda.utils.FastJsonUtil;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 用户的控制器
 * @author Administrator
 */
public class LinkAction extends ActionSupport implements ModelDriven<Link>{
	
	private static final long serialVersionUID = -3413092622818913571L;
	
	private Link link = new Link();
	
	public Link getModel() {
		return link;
	}
	
	private LinkService linkService;
	public void setLinkService(LinkService linkService) {
		this.linkService = linkService;
	}
	
	public String findAll() {
		List<Link> list = linkService.findAll(link);
		String jsonString = FastJsonUtil.toJSONString(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		FastJsonUtil.write_json(response, jsonString);
		return NONE;
	}
}









