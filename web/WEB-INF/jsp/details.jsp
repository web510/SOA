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
			<div class="col-md-7 details-left">
				<img src="/front/images/16.jpg" class="img-responsive" alt="">
			</div>
			<div class="col-md-5 details-right">
				<span><strong>€ 250</strong> € 300 per guest</span>
				<li>Book the service at the best price</li>
				<li>Secure payment by credit card</li>
				<li>No booking fee</li>
				<p> Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and a type specimen book. It has the leap into electronic typesetting, It was popularised in the 1960s with the relesoftware like Aldus PageMaker including versions of Lorem Ipsum.</p>
			</div>
			<div class="clearfix"> </div>
			<div class="details-top">
				<h3>Lorem Ipsum has been the industry's standard dummy tex</h3>
				<h5>Buy the online room booking, save 2 euro and skip the line!</h5>
				<h6>Validity : from 1 January 2015 to 31 August 2015</h6>
				<h4>Included</h4>
				<li>Kids under 5: free</li>
				<li>publishing packages and web .Many desktop publishing packages and web page editors </li>
				<h4>Not included</h4>
				<li> will uncover many web sites still in their infancy. Various versions have evolved over the years,</li>
				<h4>Additional information</h4>
				<p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
			</div>
			<div class="booking-form">
				 <div class="col-md-6">			 
					<form>
						<h5>身份证号</h5>
						<input id="sfzh" type="text" value="">
						<h5>姓名</h5>
						<input id="name" type="text" value="">
						<h5>电话</h5>
						<input id="phone" type="text" value="">
						<%--<h5>入住日期</h5>
						<input id="inDate" type="text" value="" class="time">--%>
						<h5>房型</h5>
						<select id="roomType" name="roomType" class="arrival">
							<option>标准间</option>
							<option>大床房</option>
							<option>总统套房</option>
						</select>

						<h5 id="arrival">入住日期</h5>
						<select id="inDay" class="arrival">
							<option>01</option>
							<option>02</option>
							<option>03</option>
							<option>04</option>
							<option>05</option>
							<option>06</option>
							<option>08</option>
							<option>09</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
							<option>13</option>
							<option>14</option>
							<option>15</option>
							<option>16</option>
							<option>17</option>
							<option>18</option>
							<option>19</option>
							<option>20</option>
							<option>21</option>
							<option>22</option>
							<option>23</option>
							<option>24</option>
							<option>25</option>
							<option>26</option>
							<option>27</option>
							<option>28</option>
							<option>29</option>
							<option>30</option>
							<option>31</option>
						</select>
						<select id="inMon" class="arrival">
							<option>01</option>
							<option>02</option>
							<option>03</option>
							<option>04</option>
							<option>05</option>
							<option>06</option>
							<option>07</option>
							<option>08</option>
							<option>09</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
						</select>
						<select id="inYear" class="arrival">
							<option>2015</option>
							<option>2016</option>
							<option>2017</option>
							<option>2018</option>
							<option>2019</option>
							<option>2020</option>
						</select>
						<input id="submit" type="button" value="确认">
						<input type="reset" value="重置">
						<%--<input id="roomType" type="text" value="">--%>
					</form>
				</div>
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
		$('#submit').click(function () {
            var inDate = $('#inYear').val() + '-' +
                    $('#inMon').val() + '-' +
                    $('#inDay').val(),
				roomType = $('#roomType').val();
			$.post('/SOA/orderRoom',{
			    sfzh: $('#sfzh').val(),
				name: $('#name').val(),
				inDate: inDate,
				roomType: roomType,
				phone: $('#phone').val()
			},function (res) {
			    if(res.status == 1){
			        alert('预定成功');
				} else {
			        alert('预定失败:' + res.message);
				}
            });
        });
	})(jQuery);
</script>
</body>
</html>