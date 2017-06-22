<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE HTML><!DOCTYPE HTML>
<html>
<head>
<title>Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Motel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="applijewelleryion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="/front/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/front/css/style.css" rel='stylesheet' type='text/css' />
<script src="/front/js/jquery-1.11.1.min.js"></script>
   <!--//webfonts-->
<script type="text/javascript" src="/front/js/bootstrap.js"></script>
</head>
<body>
<!-- banner -->
	<div class="banner1">
		<div class="header">
			<div class="container">
				<div class="logo">
					<h1><a href="index.html">Motel</a></h1>
				</div>
				<nav class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>
					<!--/.navbar-header-->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="active"><a href="index">主页</a></li>
							<li><a href="rooms">房间预订</a></li>
							<li><a href="myOrder">我的订单</a></li>
							<li><a href="contact">联系我们</a></li>
							<li><a href="signIn">登录</a></li>
						</ul>
					</div>
					<!--/.navbar-collapse-->
				</nav>
				<div class="search-box">
					<div id="sb-search" class="sb-search">
						<form>
							<input class="sb-search-input" placeholder="Enter your search term..." type="search" name="search" id="search">
							<input class="sb-search-submit" type="button" value="">
							<span class="sb-icon-search"> </span>
							</form>
					</div>
				</div>
					<div class="clearfix"> </div>

				<!-- search-scripts -->
					<script src="/front/js/classie.js"></script>
					<script src="/front/js/uisearch.js"></script>
					<script>
						new UISearch( document.getElementById( 'sb-search' ) );
					</script>
				<!-- //search-scripts -->

			</div>
		</div>
	</div>		
		<!-- banner -->
<!-- details -->
	<div class="details">
		<div class="container">
			<h2>订单查询</h2>
			<div class="booking-form">
				 <div class="col-md-6">
					<form>
						<h5>身份证号</h5>
						<input id="sfzh" type="text" value="">
						<h5>姓名</h5>
						<input id="name" type="text" value="">
						<h5>电话</h5>
						<input id="phone" type="text" value="">
						<input id="submit" type="button" value="确认">
						<input type="reset" value="重置">
					</form>
				</div>
			 </div>

			<div id="orderInfo" style="display: none">
				<table class="table table-hover">
					<thead>
					<tr>
						<th>#</th>
						<th>姓名</th>
						<th>身份证</th>
						<th>入住日期</th>
						<th>房型</th>
						<th>状态</th>
						<th>操作</th>

					</tr>
					</thead>
					<tbody>
					<%--<tr>--%>
						<%--<td>1</td>--%>
						<%--<td>Mark</td>--%>
						<%--<td>Otto</td>--%>
						<%--<td>@mdo</td>--%>
						<%--<td>Otto</td>--%>
						<%--<td>@mdo</td>--%>
					<%--</tr>--%>
					</tbody>
				</table>
			</div>

			</div>
		 </div>
	</div>
<!-- details -->
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-2 deco">
				<h4>Navigation</h4>
				<li><a href="index.html">Home</a></li>
				<li><a href="shortcodes.html">Short Codes </a></li>
				<li><a href="sigin.html">Sign in</a></li> 
				<li><a href="contact.html">Contact</a></li>
			</div>
			<div class="col-md-2 deco">
				<h4>Links</h4> 
				<li><a href="#">Qui Sommes-Nous ?</a></li>
				<li><a href="#">Mentions Légales </a></li>
				<li><a href="#">Conditions D'Utilisation </a></li>
			</div>
			<div class="col-md-2 deco">
				<h4>Social</h4>
				<div class="soci">
					<li><a href="#"><i class="f-1"> </i></a></li>
					<li><a href="#"><i class="t-1"> </i></a></li>
					<li><a href="#"><i class="g-1"> </i></a></li>
				</div>
			</div>
			<div class="col-md-3 cardss">
				<h4>Payment Sécure</h4>
				<li><i class="visa"></i></li>
				<li><i class="ma"></i></li>
				<li><i class="paypal"></i></li>
				<div class="clearfix"> </div>
			</div>
			<div class="col-md-3 pos">
			<h4>NewsLetter</h4>
					   <form method="post">
						 <input type="text" class="textbox" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}">
						 <div class="smt">
							<input type="submit" value="Subscribe">
						 </div>
					   </form>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<div class="footer-bottom">
			<div class="container">
				<p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
</p>
			</div>
		</div>
	<!-- footer -->

<script>
	(function ($) {
	    $(document).ready(function () {
            $('#submit').click(function () {
                refreshTable();
            });
            //删除
			function delectOrder() {
                $('#orderInfo button').click(function (event) {
                    //console.log(event)
                    var id = event.currentTarget.id;
                    id = id.match(/(btnId-)([0-9]*)/)[2];
                    id = parseInt(id);
                    $.post('SOA/cancelOrder',{
                        id: id,
                    },function (res) {
                        if(res.status == 1){
                            alert("删除成功");
                            refreshTable();
						}
						else if(res.status == 0) {
                            alert(res.message);
						}

                    });
                });
            }

            function refreshTable() {
                $.post('/SOA/queryOrders',{
                    sfzh: $('#sfzh').val(),
                    name: $('#name').val(),
                    phone: $('#phone').val()
                },function (res) {
                    if(res && res.length > 0){
                        var tbodyHtml = '';
                        $('.booking-form').hide();
                        for(var i=0;i<res.length;i++){
                            var info = res[i];
                            var button = '<button id="btnId-'+ info.id +'">删除</button>'
                            tbodyHtml += '<tr><td>' + i+1 + '</td><td>'+ info.name +'</td><td>'+ info.sfzh +'</td><td>'+ info.inDate +'</td><td>'+ info.type +'</td><td>'+ info.status +'</td><td>' + button +'</td></tr>';
                        }
                        $('#orderInfo tbody').html(tbodyHtml);
                        $('#orderInfo').show();
                        delectOrder();
                    } else {
                        alert('查询失败:' + res.message);
                    }
                });
            }

        });
	})(jQuery);
</script>
</body>
</html>