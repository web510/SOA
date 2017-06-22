package com.util;

import net.sf.json.JSON;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;

public class JsonUtils {
    public static String writeStatus(int status,String message) {
        JSONObject obj = new JSONObject();
        obj.put("status",status);
        obj.put("message",message);
        return obj.toString();
    }
    public static<T> String writeTableList(Long total, List<T> data) {
        JSONObject obj = new JSONObject();
        obj.put("total",total);
        obj.put("rows",data);
        return obj.toString();
    }
    public static JSONArray getRemoteList(String url , String param) {
        String sr=HttpRequest.sendPost(url, param);
        return new JSONArray(sr);
    }
    public static JSONObject getRemoteObject(String url , String param) {
        //发送 POST 请求
        String sr=HttpRequest.sendPost(url, param);
        return new JSONObject(sr);
    }
}
