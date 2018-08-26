package com.lvda.service;

import org.springframework.transaction.annotation.Transactional;

import com.lvda.dao.UserDao;
import com.lvda.domain.User;
import com.lvda.utils.MD5Utils;

/**
 * 用户的业务层
 * @author Administrator
 */
@Transactional
public class UserServiceImpl implements UserService {
	
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	/**
	 * 通过登录名进行验证
	 */
	public User checkCode(String user_code) {
		return userDao.checkCode(user_code);
	}

	/**
	 * 保存用户，密码需要加密
	 */
	public void save(User user) {
		userDao.save(user);
	}

	/**
	 * 登录通过登录名和密码做校验
	 * 先给密码加密，再查询
	 */
	public User login(User user) {
		return userDao.login(user);
	}
}










