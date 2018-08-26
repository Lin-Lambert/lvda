package com.lvda.web.action;

import org.apache.struts2.ServletActionContext;

import com.lvda.domain.User;
import com.lvda.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 用户的控制器
 * @author Administrator
 */
public class UserAction extends ActionSupport implements ModelDriven<User>{
	
	private static final long serialVersionUID = -3413092622818913571L;
	
	private User user = new User();
	
	public User getModel() {
		return user;
	}
	
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	/**
	 * 登录功能
	 * @return
	 */
	public String login(){
		User existUser = userService.login(user);
		// 判断，登录名或者密码错误了
		if(existUser == null){
			return "login";
		}else{
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
			// 登录成功
			return "loginOK";
		}
	}
	
	/**
	 * 退出功能
	 * @return
	 */
	public String exit(){
		ServletActionContext.getRequest().getSession().removeAttribute("existUser");
		return LOGIN;
	}
}









