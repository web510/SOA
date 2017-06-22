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
					<th>姓名</th>
					<th>身份证</th>
					<th>入住日期</th>
					<th>房型</th>
					<th>状态</th>
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
                    $.post('car/dingpiao',{
                        id: id,
                    },function (res) {
                        if(res.status == 1){
                            alert("订票成功");
                            refreshTable();
                        }
                        else if(res.status == 0) {
                            alert(res.message);
                        }

                    });
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