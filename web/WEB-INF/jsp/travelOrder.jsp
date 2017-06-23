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
				<a class="hvr-shutter-in-horizontal" style="float:right" href="details.html">现在预订</a>
			</div>
		</div>
	</div>
</div>

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
            function navActive(i) {
                $('.nav-tab').addClass('.nav-Nactive');
                $('nav-tab:nth-child('+ i +')').addClass('.nav-active');
            }
            navActive(2);

            //预订
            function delectOrder() {
                $('#hotelOrderList tr button').click(function (event) {
                    var id = event.currentTarget.id;
                    id = id.match(/(travelId-)([0-9]*)/)[2];
                    var radiosHtml = '';
                    radiosHtml += '<label><input type="radio" name="travelIn" value="一等座"/>一等座</label>一等座   ';
                    radiosHtml += '<label><input type="radio" name="travelIn" value="二等座"/>二等座</label>二等座   ';
                    $('#travelRadios').html(radiosHtml);
                    var yes = function () {
                        var level = $("input[name='travelIn']:checked").val();
                        $.post('car/dingpiao',{
                            number: id,
                            level: level
                        },function (res) {
                            console.log(res);
                            if(res.status == 1){
                                alert("订票成功");
                                refreshTable();
                            }
                            else if(res.status == 0) {
                                alert(res.message);
                            }

                        });
                    }
                    $('#travelOk').click(yes);
                });
            }

            function refreshTable() {
                $.post('/tour/getAlltravel',{
                },function (res) {
                    if(res && res.length > 0){
                        var tbodyHtml = '';
                        for(var i=0;i<res.length;i++){
                            var info = res[i];
								var button = '<button id="travelId-'+ info.number +'" class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#travelModal\">预订</button>'
                            tbodyHtml += '<tr><td>' + info.id + '</td><td>'+ info.date +'</td><td>'+ info.number +'</td><td>'+ info.start +'</td><td>'+ info.end +'</td><td>' + button +'</td></tr>';
                        }
                        $('#orderInfo tbody').html(tbodyHtml);
                        delectOrder();
                    } else {
                        alert('查询失败:' + res.message);
                    }
                });
            }


            refreshTable();
			/*//预定
			 $('#submit').click(function () {
			 var inDate = $('#inYear').val() + '-' +
			 $('#inMon').val() + '-' +
			 $('#inDay').val(),
			 roomType = $('#roomType').val();
			 $.post('/hotel/orderRoom',{
			 inDate: inDate,
			 roomType: roomType,
			 },function (res) {
			 if(res.status == 1){
			 alert('预定成功');
			 refreshTable();
			 } else {
			 alert('预定失败:' + res.message);
			 }
			 });
			 });
			 */
        });
    })(jQuery);
</script>
</body>
</html>