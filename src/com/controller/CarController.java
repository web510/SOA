package com.controller;

import com.entity.User;
import com.exception.PostException;
import com.util.JsonUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by onlymzzhang on 2017/6/21.
 */
@Controller
@RequestMapping("car")
@Transactional
public class CarController {
    String base_url = "http://222.27.167.184:8081/";
    //取消订房
    @ResponseBody
    @RequestMapping(value="/getAllTicket",produces = "application/json; charset=utf-8")
    public String getAllTicket() {
        Map<String , String> params = new HashMap<String,String>();
        return JsonUtils.getRemoteObject(base_url+"getAllTicket",params).toString();
    }
}
