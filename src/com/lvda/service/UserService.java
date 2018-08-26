package com.lvda.service;

import com.lvda.domain.User;

public interface UserService {

	User checkCode(String user_code);

	void save(User user);

	User login(User user);

}
