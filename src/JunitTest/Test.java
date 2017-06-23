package JunitTest;

import com.util.JsonUtils;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by onlymzzhang on 2017/6/22.
 */
public class Test {
    static public void main(String[] args) throws UnsupportedEncodingException {
        System.out.println("中文");

        System.out.println(new String("中文".getBytes()));

        System.out.println(new String("中文".getBytes("GB2312"), "UTF8"));


        Map<String,String> mp = new HashMap<String,String>();
        String str = JsonUtils.getString("http://www.hs6666.cn/index/click_reserve", mp);
        System.out.println(str);
//        str = JsonUtils.getString("http://222.27.167.184:8081/getAllTicket", mp);
//        System.out.println(str);
    }
}
