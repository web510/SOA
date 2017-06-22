package com;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BaseController {
    @GetMapping("/error")
    public String getError() {return "/html/error.jsp";}

    @GetMapping("/index")
    public String getIndex() {return "index";}

    @GetMapping("/signIn")
    public String getSignIn() {return "signIn";}

    @GetMapping("/rooms")
    public String getRooms() {return "rooms";}

    @GetMapping("/details")
    public String getDetails() {return "details";}

    @GetMapping("/myOrder")
    public String getMyOrder() {return "myOrder";}

    @GetMapping("/admin/{view}")
    public void getView2() {}

}
