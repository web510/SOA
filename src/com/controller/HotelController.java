package com.controller;

import com.entity.Order_;
import com.entity.User;
import com.exception.PostException;
import com.service.HotelService;
import com.util.JsonUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by onlymzzhang on 2017/6/21.
 */
@Controller
@RequestMapping("hotel")
@Transactional
public class HotelController {
    String base_url = "http://localhost:8081/";
    @Autowired
    private HotelService hotelService;
    @ResponseBody
    @RequestMapping(value="/orderRoom",produces = "application/json; charset=utf-8")
    //订房
    public String orderRoom(Date inDate, String roomType, HttpSession session) {
        User user = (User)session.getAttribute("user");
        if(user == null) throw new PostException("你还没有登录! ");
        Map<String,String> params = new HashMap<String ,String>();
        params.put("sfzh",user.getSfzh());
        params.put("roomType",roomType);
        params.put("inDate",inDate.toString());
        params.put("name",user.getRealName());
        params.put("phone",user.getPhone());

        String res = JsonUtils.getRemoteObject(base_url+"SOA/orderRoom",params).toString();
        System.out.println(res);
        return res;
    }
    //取消订房
    @ResponseBody
    @RequestMapping(value="/cancelOrder",produces = "application/json; charset=utf-8")
    public String cancelOrder(int id) {
        return "";
        //return JsonUtils.getRemoteObject(base_url+"SOA/cancelOrder","id="+id).toString();
    }
    //查询订单
    @ResponseBody
    @RequestMapping(value="/queryOrders",produces = "application/json; charset=utf-8")
    public String queryOrders(HttpSession session) {
        User user = (User)session.getAttribute("user");
        if(user == null) throw new PostException("你还没有登录! ");
        Map<String,String> params = new HashMap<String ,String>();
        params.put("sfzh",user.getSfzh());
        params.put("name",user.getRealName());
        params.put("phone",user.getPhone());
        return JsonUtils.getRemoteList(base_url+"SOA/queryOrders",params).toString();
    }
    //查询房间剩余信息
    @ResponseBody
    @RequestMapping(value="/queryRoom",produces = "application/json; charset=utf-8")
    public String queryRoom(String sfzh, String name, String inDate, String outDate, String roomType) {
        return JsonUtils.writeStatus(1,"");
    }
}
