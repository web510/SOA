package JunitTest;

import com.util.JsonUtils;
import org.json.JSONObject;

/**
 * Created by onlymzzhang on 2017/6/22.
 */
public class Test {
    static public void main(String[] args) {
        JSONObject obj = JsonUtils.getRemoteObject("http://localhost:8080/admin/signInPost","username=admin&password=123456");
        System.out.println(obj.toString());
    }
}
