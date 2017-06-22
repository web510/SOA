package com.service;

import com.entity.Order_;
import com.entity.Room;
import com.exception.PostException;
import com.util.JsonUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;


@Service
public class HotelService {
    String base_url = "http://localhost:8081/";
    public JSONObject orderRoom(String sfzh, String name, Date inDate, String roomType, String phone) {
        return JsonUtils.getRemoteObject(base_url+"SOA/orderRoom","sfzh="+sfzh+"&name="+name+"&inDate="+inDate+"&roomType="+roomType+"&phone="+phone);
    }
}
