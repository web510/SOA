package com.service;

import com.dao.UserDao;
import com.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserService {
	@Autowired
	private UserDao adminDao;
	public User getUser(String userName, String password)  {
		return adminDao.find(userName, password);
	}
}
