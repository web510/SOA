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
<div class="modal fade" id="ErrorAlert" tabindex="-1" role="dialog"
	 aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close"
						data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					选择席位
				</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<strong><p id="AlertP"></p></strong>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="ErrorAlertClose"
						data-dismiss="modal">确认
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

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

                });
                $('#TTTTT').click(function(){
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
				})
            }

            function refreshTable() {
                $.post('/car/getAllTicket',{
                },function (res) {
                    console.log(res)
                    if(res && res.length > 0){
                        var tbodyHtml = '';
                        for(var i=0;i<res.length;i++){
                            var info = res[i];
                            var button = '<button id="btnId-'+ info.id +'">预订</button>'
                            tbodyHtml += '<tr><td>' + info.id + '</td><td>'+ info.date +'</td><td>'+ info.number +'</td><td>'+ info.start +'</td><td>'+ info.end +'</td><td>' + button +'</td></tr>';
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