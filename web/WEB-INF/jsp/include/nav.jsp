<%@ page import="com.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
        <li class="nav-tab"><a href="index">主页</a></li>
        <li class="nav-tab"><a href="travelOrder">景点</a></li>
        <li class="nav-tab"><a href="hotelOrder">酒店</a></li>
        <li class="nav-tab"><a href="ticketOrder">车票</a></li>
        <%
            if(session.getAttribute("user")==null) {
        %><li class="nav-tab"><a href="signIn">登录</a></li><%
    }
    else {
    %><li class="nav-tab"><a href="signIn">欢迎你，<%=((User)session.getAttribute("user")).getRealName() %></a></li><%
        }
    %>
    </ul>
</div>