package com.controller;

import com.entity.User;
import com.exception.PostException;
import com.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.sql.Date;

/**
 * Created by onlymzzhang on 2017/6/21.
 */
@Controller
@RequestMapping("hotel")
@Transactional
public class TourController {
    String base_url = "http://www.hs6666.cn/";
    @ResponseBody
    @RequestMapping(value="/orderRoom",produces = "application/json; charset=utf-8")
    //订房
    public String orderRoom(Date inDate, String roomType, HttpSession session) {
        User user = (User)session.getAttribute("user");
        if(user == null) throw new PostException("你还没有登录! ");
        String res = JsonUtils.getRemoteObject(base_url+"SOA/orderRoom",null).toString();
        System.out.println(res);
        return res;
    }
}
