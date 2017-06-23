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



<div class="details" id="hotelOrderList">
	<div class="container">
		<div id="orderInfo">
			<table class="table table-hover">
				<thead>
				<tr>
					<th>#</th>
					<th>日期</th>
					<th>车次</th>
					<th>始发站</th>
					<th>终点站</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<%-- --%>
				</tbody>
			</table>
		</div>
	</div>
</div>
<!-- details -->
<!-- footer -->
<jsp:include page="include/footer.jsp"/>
<!-- footer -->
<!-- Modal -->
<div class="modal fade" id="ticketModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">预定</h4>
			</div>
			<div class="modal-body" id="ticketRadios">
				<%--<input type="radio" />--%>
			</div>
			<div class="modal-footer">
				<button id="ticketOk" type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
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
                    id = id.match(/(ticketId-)([0-9]*)/)[2];
                    var radiosHtml = '';
                    radiosHtml += '<label><input type="radio" name="ticketIn" value="一等座"/>一等座</label>一等座   ';
                    radiosHtml += '<label><input type="radio" name="ticketIn" value="二等座"/>二等座</label>二等座   ';
                    $('#ticketRadios').html(radiosHtml);
                    var yes = function () {
                        var level = $("input[name='ticketIn']:checked").val();
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
                    $('#ticketOk').click(yes);
                });
            }

            function refreshTable() {
                $.post('/car/getAllTicket',{
                },function (res) {
                    console.log(res)
                    if(res && res.length > 0){
                        var tbodyHtml = '';
                        for(var i=0;i<res.length;i++){
                            var info = res[i];
                            var button = '<button id="ticketId-'+ info.number +'" class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#ticketModal\">预订</button>'
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