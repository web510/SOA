<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="include/header.jsp"/>
<!-- details -->
<div class="details">
	<div class="container">
		<h2>车票订单</h2>
	</div>

</div>

<div id="hotelOrderSearch">
	<div class="booking-form">
		<div class="col-md-6">
			<form>
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
				<h5>房型</h5>
				<select id="roomType" name="roomType" class="arrival">
					<option>标准间</option>
					<option>大床房</option>
					<option>总统套房</option>
				</select>

				<input id="submit" class="prt-btn" type="button" value="确认">
				<input type="reset" value="重置">
				<%--<input id="roomType" type="text" value="">--%>
			</form>
		</div>
	</div>
</div>


<div id="hotelOrderList" style="display: none;">
	<jsp:include page="include/order.jsp"/>
</div>
<!-- details -->
<!-- footer -->
<jsp:include page="include/footer.jsp"/>
<!-- footer -->

<script>

    (function ($) {
        $(document).ready(function () {
            function navActive(i) {
                $('.nav-tab').addClass('.nav-Nactive');
                $('nav-tab:nth-child('+ i +')').addClass('.nav-active');
            }
            navActive(2);

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
                $.post('/hotel/queryOrders',{
                },function (res) {
                    if(res && res.length > 0){
                        var tbodyHtml = '';
                        for(var i=0;i<res.length;i++){
                            var info = res[i];
                            var button = '<button id="btnId-'+ info.id +'">删除</button>'
                            tbodyHtml += '<tr><td>' + i+1 + '</td><td>'+ info.name +'</td><td>'+ info.sfzh +'</td><td>'+ info.inDate +'</td><td>'+ info.type +'</td><td>'+ info.status +'</td><td>' + button +'</td></tr>';
                        }
                        $('#orderInfo tbody').html(tbodyHtml);
                        $('#hotelOrderSearch').hide();
                        $('#hotelOrderList').show();
                        delectOrder();
                    } else {
                        alert('查询失败:' + res.message);
                    }
                });
            }
            //预定
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

        });
    })(jQuery);
</script>
</body>
</html>