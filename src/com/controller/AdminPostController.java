package com.controller;

import com.dao.OrderDao;
import com.dao.RoomNumberDao;
import com.entity.Admin;
import com.entity.Order_;
import com.entity.RoomNumber;
import com.exception.PostException;
import com.service.AdminService;
import com.util.JsonUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
@Transactional
@RequestMapping("admin")
public class AdminPostController {
	@Autowired
	private AdminService userService;
	@Autowired
	private RoomNumberDao roomNumberDao;
	@Autowired
	private OrderDao orderDao;

	@ResponseBody
	@RequestMapping(value="/ordersListNotInMoney",produces = "application/json; charset=utf-8")
	public String ordersListNotInMoney() {
		List<Order_> list = orderDao.ordersListNotinMoney();
		List<JSONObject> res = new ArrayList<>();
		for(Order_ order : list) {
			JSONObject obj = new JSONObject();
			obj.put("id",order.getId());
			obj.put("inDate",order.getInDate());
			obj.put("name",order.getName());
			obj.put("type",order.getRoom().getType());
			obj.put("sfzh",order.getSfzh());
			obj.put("status",order.getStatus());
			res.add(obj);
		}
		return res.toString();
	}

	@ResponseBody
	@RequestMapping(value="/inMoney",produces = "application/json; charset=utf-8")
	public String inMoney(int order_id) {
		orderDao.inMoney(order_id);
		return JsonUtils.writeStatus(1,"缴费成功");
	}

	@ResponseBody
	@RequestMapping(value="/checkIn",produces = "application/json; charset=utf-8")
	//入住房间
	public String checkIn(int order_id, int roomNumberId) {
		Order_ order = orderDao.find(order_id);
		if(order.getStatus().equals("已预订")) throw new PostException("订单还没有缴费");
		else if(order.getStatus().equals("已入住")) throw new PostException("错误，请勿重复check in");
		RoomNumber roomNumer = roomNumberDao.find(roomNumberId);
		if(roomNumer.getRoom().getId() != order.getRoom().getId()) throw new PostException("房间类型与订单房间类型不匹配");
		orderDao.checkIn(order_id,roomNumberId);
		return JsonUtils.writeStatus(1,"成功入住！");
	}

	@ResponseBody
	@RequestMapping(value="/roomNumberListCanSelect",produces = "application/json; charset=utf-8")
	public String roomNumberListCanSelect(int order_id) {
		List<JSONObject> res = new ArrayList<JSONObject>();
		Order_ order = orderDao.find(order_id);
		List<RoomNumber> roomNumbers = roomNumberDao.roomNumberListCanSelect(order_id);
		for(RoomNumber roomNumber : roomNumbers) {
			if(null != roomNumberDao.roomByWhichOrdered(roomNumber.getId(),order.getInDate())) {
				continue;
			}
			JSONObject obj = new JSONObject();
			obj.put("id",roomNumber.getId());
			obj.put("roomNumber",roomNumber.getNumber());
			res.add(obj);
		}
		return res.toString();
	}

    @ResponseBody
	@RequestMapping(value="/signInPost",produces = "application/json; charset=utf-8")
	public String loginPost(String username, String password, HttpSession session)  {
		Admin user = userService.getUser(username, password);
		if (user != null) {
			session.setAttribute("user", user);
			return JsonUtils.writeStatus(1, user.getClass().toString());
		} else {
			return JsonUtils.writeStatus(0,"用户名或密码错误");
		}
	}
}

