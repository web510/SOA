package com.controller;

import com.dao.UserDao;
import com.entity.User;
import com.exception.PostException;
import com.service.UserService;
import com.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

@Controller
@Transactional
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private UserDao userDao;

	@ResponseBody
	@RequestMapping(value="/register",produces = "application/json; charset=utf-8")
	public String register(String username, String password, String realName, String phone, String sfzh,  HttpSession session)  {
		User user = userDao.findWithoutPassword(username);
		if(user!=null) throw new PostException("该用户名已存在！");
		user = new User();
		user.setPhone(phone);
		user.setPassword(password);
		user.setRealName(realName);
		user.setSfzh(sfzh);
		user.setUserName(username);
		userDao.insertUser(user);
		return JsonUtils.writeStatus(1,"注册成功！");
	}


	@ResponseBody
	@RequestMapping(value="/signInPost",produces = "application/json; charset=utf-8")
	public String loginPost(String username, String password, HttpSession session)  {
		User user = userService.getUser(username, password);
		if (user != null) {
			session.setAttribute("user", user);
			return JsonUtils.writeStatus(1, user.getClass().toString());
		} else {
			return JsonUtils.writeStatus(0,"用户名或密码错误");
		}
	}
}

