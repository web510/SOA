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

    @GetMapping("/signUp")
    public String getSignUp() {return "signUp";}

    @GetMapping("/rooms")
    public String getRooms() {return "rooms";}

    @GetMapping("/details")
    public String getDetails() {return "details";}

    @GetMapping("/hotelOrder")
    public String getHotelOrder() {return "hotelOrder";}

    @GetMapping("/ticketOrder")
    public String getTicketOrder() {return "ticketOrder";}

    @GetMapping("/travelOrder")
    public String getTravelOrder() {return "travelOrder";}


    @GetMapping("/admin/{view}")
    public void getView2() {}

}
