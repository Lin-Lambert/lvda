package com.lvda.dao;

import com.lvda.domain.User;

public interface UserDao {

	User checkCode(String user_code);

	void save(User user);

	User login(User user);

}
