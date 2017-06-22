<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="include/header.jsp"/>
<!-- details -->
<div class="details">
	<div class="container">
		<h2>旅游订单</h2>
	</div>
</div>
<jsp:include page="include/order.jsp"/>
<!-- details -->
<!-- footer -->
<jsp:include page="include/footer.jsp"/>
	<!-- footer -->

<script>
	(function ($) {
	    $(document).ready(function () {
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
            refreshTable();
        });
	})(jQuery);
</script>
</body>
</html>