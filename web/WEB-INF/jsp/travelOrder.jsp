<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="include/header.jsp"/>
<!-- details -->
<div class="details">
	<div class="container">
		<h2>景点订单</h2>
	</div>

</div>

<div class="details left" id="hotelOrderList">
	<div class="container">
		<div id="orderInfo">
			<div class="col-md-4 tels-left">
				<h4>门票 <span> ￥68</span></h4>
				<img src="/front/images/tour.jpg" class="img-responsive" alt="马来西亚">
				<p>千岛湖，位于浙江省淳安县境内，是新安江大坝截流后形成的人工湖。千岛湖的碧水，因与钱塘江、富春江、新安江逶迤相接,益发悠长壮美。那水色，浓浓淡淡，浅浅深深，浅淡似翠绿的丝绸,深浓如湛蓝的大海。外来人进了千岛湖，眼瞳先被染绿，心也教水陶醉。清洌中透着微甜，是甘露，也是山泉。</p>
				<a id="travelOrder" class="hvr-shutter-in-horizontal" style="float:right">现在预订</a>
			</div>
		</div>
	</div>
</div>
<div style="margin-bottom: 50px"></div>

<!-- details -->
<!-- footer -->
<jsp:include page="include/footer.jsp"/>
<!-- footer -->
<!-- Modal -->
<div class="modal fade" id="travelModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">预定</h4>
			</div>
			<div class="modal-body" id="travelRadios">
				<%--<input type="radio" />--%>
			</div>
			<div class="modal-footer">
				<button id="travelOk" type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>

<script>
    (function ($) {
        $(document).ready(function () {

            function refreshButton() {
                $.post('/tour/check_state', {
                }, function (res) {
                    if (res.status == 0) {
                        $('#travelOrder').html('现在预定');
                        $('#travelOrder').click(function () {
                            $.post('/tour/click_reserve', {}, function (res) {
                                if(res.status == 1)
                                    refreshButton();
                                else
                                    alert(res.message);
                            })
                        });
                    } else if (res.status == 1) {
                        $('#travelOrder').html('取消预定');
                        $('#travelOrder').click(function () {
                            $.post('/tour/click_cancel', {}, function () {
                                refreshButton();
                            })
                        });
                    }
                });
            }
            refreshButton();
            
            /*$.post('/tour/check_state', {
			}, function (res) {
                if (res.status == 0) {
                    $('#travelOrder').html('现在预定');
                    $('#travelOrder').click(function () {
                        $.post('/tour/click_reserve', {}, function (res) {
                            if(res.status == 1)
                            	window.location.href = "travelOrder";
                            else
                                alert(res.message);
                        })
                    });
                } else if (res.status == 1) {
                    $('#travelOrder').html('取消预定');
                    $('#travelOrder').click(function () {
                        $.post('/tour/click_cancel', {}, function () {
                            window.location.href = "travelOrder";
                        })
                    });
                }
            });*/
        })
    })(jQuery);
</script>
</body>
</html>