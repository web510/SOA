package com.controller;

import com.dao.OrderDao;
import com.dao.RoomDao;
import com.entity.Order_;
import com.entity.Room;
import com.exception.PostException;
import com.util.JsonUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.transaction.Transactional;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by onlymzzhang on 2017/6/21.
 */
@Controller
@RequestMapping("SOA")
@Transactional
public class SOAController {
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private RoomDao roomDao;

    @ResponseBody
    @RequestMapping(value="/orderRoom",produces = "application/json; charset=utf-8")
    //订房
    public String orderRoom(String sfzh, String name, Date inDate, String roomType,String phone) {
        if(!orderDao.getCanOrder(inDate,roomType)) throw new PostException("房间已满，无法预订");
        Room room = roomDao.find(roomType);
        Order_ order = orderDao.insert(inDate,name,sfzh,phone,room);
        return JsonUtils.writeStatus(1,String.valueOf(order.getId()));
    }
    //取消订房
    @ResponseBody
    @RequestMapping(value="/cancelOrder",produces = "application/json; charset=utf-8")
    public String cancelOrder(int id) {
        Order_ order = orderDao.find(id);
        if(null==order) throw new PostException("没有该预订记录");
        else if(!order.getStatus().equals("已预订")) throw new PostException("该订单"+order.getStatus());
        orderDao.cancelOrder(id);
        return JsonUtils.writeStatus(1,"预订已取消");
    }
    @ResponseBody
    @RequestMapping(value="/queryOrders",produces = "application/json; charset=utf-8")
    //查询订单
    public String queryOrders(String sfzh, String name, String phone) {
        List<Order_> list = orderDao.queryOrders(sfzh,name,phone);
        List<JSONObject> res = new ArrayList<>();
        for(Order_ order : list){
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
    //查询房间剩余信息
    @ResponseBody
    @RequestMapping(value="/queryRoom",produces = "application/json; charset=utf-8")
    public String queryRoom(String sfzh, String name, String inDate, String outDate, String roomType) {
        return JsonUtils.writeStatus(1,"");
    }
}
