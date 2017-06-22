package JunitTest;

import com.util.JsonUtils;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;

/**
 * Created by onlymzzhang on 2017/6/22.
 */
public class Test {
    static public void main(String[] args) throws UnsupportedEncodingException {
        System.out.println("中文");

        System.out.println(new String("中文".getBytes()));

        System.out.println(new String("中文".getBytes("GB2312"), "UTF8"));


        //String param = "sfzh=1&name=1&inDate=2015-01-01&roomType=标准间&phone=1";
        //JSONObject obj = JsonUtils.getRemoteObject("http://localhost:8081/SOA/orderRoom", param);
        //System.out.println(obj.toString());
    }
}
