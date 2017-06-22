package com.service;

import com.dao.AdminDao;
import com.entity.Admin;
import com.exception.PostException;
import com.util.JsonUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class AdminService {
	@Autowired
	private AdminDao adminDao;
	public Admin getUser(String userName, String password)  {
		return adminDao.find(userName, password);
	}
}
