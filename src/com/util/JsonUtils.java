package com.util;

import net.sf.json.JSON;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
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
    public static JSONArray getRemoteList(String url , Map<String,String> params) {
        String body = JsonUtils.sendPost(url,params);
        return new JSONArray(body);
    }
    public static JSONObject getRemoteObject(String url , Map<String,String> params) {
        String body = JsonUtils.sendPost(url,params);
        return new JSONObject(body);
    }


    public static String sendPost(String url, Map<String,String> params){
        //实例化httpClient
        CloseableHttpClient httpclient = HttpClients.createDefault();
        //实例化post方法
        HttpPost httpPost = new HttpPost(url);
        //处理参数
        List<NameValuePair> nvps = new ArrayList <NameValuePair>();
        Set<String> keySet = params.keySet();
        for(String key : keySet) {
            nvps.add(new BasicNameValuePair(key, params.get(key)));
        }
        //结果
        CloseableHttpResponse response = null;
        String content="";
        try {
            //提交的参数
            UrlEncodedFormEntity uefEntity  = new UrlEncodedFormEntity(nvps, "UTF-8");
            //将参数给post方法
            httpPost.setEntity(uefEntity);
            //执行post方法
            response = httpclient.execute(httpPost);
            if(response.getStatusLine().getStatusCode()==200){
                content = EntityUtils.toString(response.getEntity(),"utf-8");
                System.out.println(content);
            }
            else System.out.println(response.getStatusLine().getStatusCode());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return content;
    }

    public static String getString(String url, Map<String, String> params) {
        String body = JsonUtils.sendPost(url,params);
        return body;
    }
}
