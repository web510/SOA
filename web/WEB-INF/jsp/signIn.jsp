<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="include/header.jsp"/>
<div class="login-page">
		<div class="container">
			<div class="account_grid">
				<div class="col-md-6 login-left wow fadeInLeft" data-wow-delay="0.4s">
					<h3>NEW CUSTOMERS</h3>
					<p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
					<a class="acount-btn" href="register.html">Create an Account</a>
			   </div>
			   <div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
					<h3>REGISTERED CUSTOMERS</h3>
					<p>If you have an account with us, please log in.</p>
					<form>
						<div>
							<span>Email Address<label>*</label></span>
							<input id="username" type="text">
						</div>
						<div>
							<span>Password<label>*</label></span>
							<input id="password" type="password">
						</div>
						<a class="forgot" href="#">Forgot Your Password?</a>
						<input id="signIn" type="button" value="Sign In">
					</form>
			   </div>	
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- footer -->
<jsp:include page="include/footer.jsp"/>
	<!-- footer -->
</body>

<script>
	(function ($) {
	    $('#signIn').click(function () {
	        var username = $('#username').val(),
	            password = $('#password').val();
			$.post('/admin/signInPost',{
			    username: username,
			    password: password
			},function (res) {
			    //TODO {status,message}
			    if(res.status == 1){
					alert("登录成功");
					window.location.href = '/index';
				} else {
					alert(res.message);
				}
            });
        })
    })(jQuery);
</script>
</html>