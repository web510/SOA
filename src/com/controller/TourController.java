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
import java.util.HashMap;
import java.util.Map;

/**
 * Created by onlymzzhang on 2017/6/21.
 */
@Controller
@RequestMapping("tour")
@Transactional
public class TourController {
    String base_url = "http://www.hs6666.cn/";
    @ResponseBody
    @RequestMapping(value="/click_reserve",produces = "application/json; charset=utf-8")
    //订房
    public String click_reserve(HttpSession session) {
        User user = (User)session.getAttribute("user");
        if(user == null) throw new PostException("你还没有登录! ");
        Map<String,String> mp = new HashMap<String,String>();
        mp.put("user_id",""+(-user.getId()));
        mp.put("state","1");
        mp.put("p_number",user.getPhone());
        String res = JsonUtils.getString(base_url+"welcome/click_reserve",mp).toString();
        if(res.equals("ok")) return JsonUtils.writeStatus(1,"");
        else return JsonUtils.writeStatus(0,res);
    }
    @ResponseBody
    @RequestMapping(value="/check_state",produces = "application/json; charset=utf-8")
    //订房
    public String check_state(HttpSession session) {
        User user = (User)session.getAttribute("user");
        if(user == null) throw new PostException("你还没有登录! ");
        Map<String,String> mp = new HashMap<String,String>();
        mp.put("user_id",""+(-user.getId()));
        String res = JsonUtils.getString(base_url+"welcome/check_state",mp).toString();
        if(res.equals("yes")) return JsonUtils.writeStatus(1,"已经预定");
        else return JsonUtils.writeStatus(0,"没有预定");
    }
    @ResponseBody
    @RequestMapping(value="/click_cancel",produces = "application/json; charset=utf-8")
    //订房
    public String click_cancel(HttpSession session) {
        User user = (User)session.getAttribute("user");
        if(user == null) throw new PostException("你还没有登录! ");
        Map<String,String> mp = new HashMap<String,String>();
        mp.put("user_id",""+(-user.getId()));
        String res = JsonUtils.getString(base_url+"welcome/click_cancel",mp).toString();
        if(res.equals("ok")) return JsonUtils.writeStatus(1,"");
        else {
            System.out.println(res);
            return JsonUtils.writeStatus(0,"");
        }
    }
    @ResponseBody
    @RequestMapping(value="/travel",produces = "application/json; charset=utf-8")
    //订房
    public String travel(HttpSession session) {
        User user = (User)session.getAttribute("user");
        if(user == null) throw new PostException("你还没有登录! ");
        Map<String,String> mp = new HashMap<String,String>();
        mp.put("user_id",""+(-user.getId()));
        return JsonUtils.getRemoteList(base_url+"welcome/travel",mp).toString();
    }
}
