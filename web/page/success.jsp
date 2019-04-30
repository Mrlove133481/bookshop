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

</head>

<body>


<!--顶部导航条 -->
<div class="am-container header">
    <ul class="message-r">
        <div class="topMessage home">
            <div class="menu-hd"><a href="${pageContext.request.contextPath}/page/index.jsp" target="_top" class="h"
                                    style="color:#b6795f">书城首页</a></div>
        </div>
        <div class="topMessage my-shangcheng">
            <div class="menu-hd MyShangcheng"><a href="#" target="_top" style="color:#b6795f"><i
                    class="am-icon-user am-icon-fw"></i>个人中心</a></div>
        </div>
        <div class="topMessage mini-cart">
            <div class="menu-hd"><a id="mc-menu-hd" href="${pageContext.request.contextPath}/page/shopcart.jsp"
                                    target="_top" style="color:#b6795f"><i
                    class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum"
                                                                                          class="h">0</strong></a></div>
        </div>
        <div class="topMessage favorite">
            <div class="menu-hd"><a href="#" target="_top" style="color:#b6795f"><i
                    class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
        </div>
    </ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
    <div class="logo"><img src="../images/logo.png"/></div>
    <div class="logoBig">
        <li style="margin-top: 20px;"><img src="${pageContext.request.contextPath}/images/logo.png"/></li>
    </div>

    <div class="search-bar pr">
        <a name="index_none_header_sysc" href="#"></a>
        <form>
            <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
            <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
        </form>
    </div>
</div>

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
                <a href="../person/order.html" class="J_MakePoint">查看<span style="color: #b6795f;">已买到的宝贝</span></a>
                <a href="../person/orderinfo.html" class="J_MakePoint">查看<span style="color: #b6795f;">交易详情</span></a>
            </div>
        </div>
    </div>
</div>


<div class="footer ">
    <div class="footer-hd ">
        <p>
            <a href="${pageContext.request.contextPath}/page/index.jsp">书城首页</a>
            <b>|</b>
            <a href="${pageContext.request.contextPath}/page/register.jsp">注册</a>
            <b>|</b>
            <a href="# ">物流</a>
        </p>
    </div>
    <div class="footer-bd ">
        <p>
            <a href="${pageContext.request.contextPath}/page/about.jsp">关于我</a>
            <a href="# ">合作伙伴</a>
            <a href="#">联系我们</a>
            <em>Copyright &copy; 2019.Mrlove store name All rights reserved.</em>
        </p>
    </div>
</div>


</body>
</html>
