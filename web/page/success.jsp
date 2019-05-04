<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/4/30
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>付款成功页面</title>
    <link href="${pageContext.request.contextPath}/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/page/common/demo.css" rel="stylesheet" type="text/css"/>

    <link href="${pageContext.request.contextPath}/page/common/sustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<style type="text/css">
    a:hover, a:focus {
        color: #b6795f;
    }
</style>

</head>

<body>


<!--顶部导航条 -->
<jsp:include page="${pageContext.request.contextPath}/page/common/header.jsp"/>
<!--悬浮搜索框-->
<jsp:include page="${pageContext.request.contextPath}/page/common/search.jsp"/>

<div class="clear"></div>



<div class="take-delivery">
    <div class="status">
        <h2>您已成功付款</h2>
        <div class="successInfo">
            <ul>
                <li>付款金额<em style="color: #b6795f;">¥${sessionScope.totalmoney}</em></li>
                <div class="user-info" style="    border: 2px solid #b6795f;">
                    <p>收货人：${sessionScope.order.orderReceiver}</p>
                    <p>联系电话：${sessionScope.order.orderReceiverphone}</p>
                    <p>收货地址：${sessionScope.order.orderReceiverlocation}</p>
                </div>
                请认真核对您的收货信息，如有错误请联系客服

            </ul>
            <div class="option">
                <span class="info">您可以</span>
                <a href="/page/person/order.jsp" class="J_MakePoint">查看<span style="color: #b6795f;">已买到的宝贝</span></a>
                <a href="../person/orderinfo.html" class="J_MakePoint">查看<span style="color: #b6795f;">交易详情</span></a>
            </div>
        </div>
    </div>
</div>


<!--底部-->
<jsp:include page="${pageContext.request.contextPath}/page/common/footer.jsp"/>


</body>
</html>
