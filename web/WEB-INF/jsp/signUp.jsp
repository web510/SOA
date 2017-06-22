<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="include/header.jsp"/>
<div class="login-page">
		<div class="container">
			<div class="account_grid">
			   <div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
					<h4>注册</h4>
						<div>
							<span>用户名<label>*</label></span>
							<input id="username" type="text">
						</div>
					   <div>
						   <span>真实姓名<label>*</label></span>
						   <input id="realName" type="text">
					   </div>
				   <div>
						<div>
							<span>身份证<label>*</label></span>
							<input id="sfzh" type="text">
						</div>
				   <div>
					   <span>联系电话<label>*</label></span>
					   <input id="phone" type="text">
				   </div>
				   <div>
					   <span>密码<label>*</label></span>
					   <input id="password" type="password">
				   </div>
						<input id="signUp" class="prt-btn" type="button" value="注册	">
					</form>
			   </div>
				   <div style="margin-top:100px"></div>
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
	    $('#signUp').click(function () {
	        var username = $('#username').val(),
                realName = $('#realName').val(),
	            password = $('#password').val(),
				sfzh     = $('#sfzh').val(),
				phone    = $('#phone').val()
			;
			$.post('/user/register',{
                username: username,
                realName: realName,
			    password: password,
                sfzh: sfzh,
                phone: phone
			},function (res) {
			    //TODO {status,message}
			    if(res.status == 1){
					alert("注册成功");
					window.location.href = '/index';
				} else {
					alert(res.message);
				}
            });
        })
    })(jQuery);
</script>
</html>