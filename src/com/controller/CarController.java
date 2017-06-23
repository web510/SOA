package com.controller;

import com.entity.User;
import com.exception.PostException;
import com.util.JsonUtils;
import org.json.JSONArray;
import org.json.JSONObject;
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
    //获取所有车票
    @ResponseBody
    @RequestMapping(value="/getAllTicket",produces = "application/json; charset=utf-8")
    public String getAllTicket() {
        Map<String , String> params = new HashMap<String,String>();
//        JSONArray remoteList = JsonUtils.getRemoteList(base_url + "getAllTicket", params);
//        for(int i=0;i<remoteList.length();i++) {
//            JSONObject obj = (JSONObject)remoteList.get(i);
//            int id = (int)obj.get("id");
//
//        }
        return JsonUtils.getRemoteList(base_url+"getAllTicket",params).toString();
    }
    @ResponseBody
    @RequestMapping(value="/dingpiao",produces = "application/json; charset=utf-8")
    public String dingpiao(String number, String level) {
        Map<String , String> params = new HashMap<String,String>();
        params.put("number",number);
        params.put("level",level);
        return JsonUtils.getRemoteObject(base_url+"getAllTicket",params).toString();
    }
}
