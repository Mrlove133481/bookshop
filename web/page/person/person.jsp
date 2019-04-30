<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/4/30
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>个人中心</title>

    <link href="${pageContext.request.contextPath}/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/page/common/admin.css" rel="stylesheet" type="text/css"/>

    <link href="${pageContext.request.contextPath}/page/common/personal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/page/common/vipstyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/page/common/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/page/common/amazeui.js"></script>

    <script src="${pageContext.request.contextPath}/page/common/angular.min.js"></script>
    <script>
        var app=angular.module('myApp',[]); //定义了一个叫myApp的模块
        //定义控制器
        app.controller('myController',function($scope,$http) {
            //查找右边的热卖商品
            $scope.findAll = function (start,end) {
                $http.get('/foreground/selectlimit?start='+start+'&end='+end).success(
                    function (response) {
                        $scope.list = response;
                    }
                );
            }
           //查找两件页面订单
            $scope.limitorder = function (start,end,userId) {
                $http.get('/order/limitorder?start='+start+'&end='+end+'&userId='+userId).success(
                    function (response) {
                        $scope.orders = response;
                    }
                );
            }
        });
    </script>
</head>

<body ng-app="myApp" ng-controller="myController" ng-init="findAll('0','2');limitorder('0','2','${sessionScope.userId}')">
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!--顶部导航条 -->
            <jsp:include page="${pageContext.request.contextPath}/page/common/header.jsp"/>
            <!--悬浮搜索框-->
            <jsp:include page="${pageContext.request.contextPath}/page/common/search.jsp"/>
            <div class="clear"></div>
        </div>
        </div>
    </article>
</header>
<%--分类--%>
<jsp:include page="${pageContext.request.contextPath}/page/common/navigation_bar.jsp"/>

<div class="center">
    <div class="col-main">
        <div class="main-wrap">
            <div class="wrap-left">
                <div class="wrap-list">
                    <div class="m-user">
                        <!--个人信息 -->

                        <div class="m-userinfo">
                            <a href="news.html">
                                <div class="tipsBox"><i class="am-icon-envelope"></i></div>
                            </a>
                            <div class="m-baseinfo">
                                <a class="m-pic" href="information.html">
                                    <img src="../images/getAvatar.do.jpg">
                                </a>
                                <div class="m-info">
                                    <em class="s-name">小叮当</em>
                                    <div class="vip1"><a href="#"><span></span><em>会员专享</em></a></div>
                                    <div class="safeText"><a href="safety.html">账户安全:<em style="margin-left:20px ;">60</em>分</a>
                                        <div class="progressBar"><span style="left: -95px;" class="progress"></span></div>
                                    </div>
                                    <div class="m-address">
                                        <a href="address.html" class="i-trigger">收货地址<i class="am-icon-angle-right" style="padding-left:5px ;"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="m-right">
                                <div class="m-new">
                                    <a href="news.html"><i class="am-icon-dropbox  am-icon-md" style="padding-right:5px ;"></i>消息盒子</a>
                                </div>

                            </div>
                        </div>

                        <!--个人资产-->
                        <div class="m-userproperty">
                            <div class="s-bar">
                                <i class="s-icon"></i>个人资产
                            </div>
                            <p class="m-coupon">
                                <a href="coupon.html">
                                    <em class="m-num">2</em>
                                    <span class="m-title">优惠券</span>
                                </a>
                            </p>
                            <p class="m-wallet">
                                <a href="wallet.html">
                                    <em class="m-num">0.00</em>
                                    <span class="m-title">账户余额</span>
                                </a>
                            </p>
                            <p class="m-bill">
                                <a href="pointnew.html">
                                    <em class="m-num">10</em>
                                    <span class="m-title">总积分</span>
                                </a>
                            </p>
                        </div>

                        <!--我的钱包-->
                        <div class="wallet">
                            <div class="s-bar">
                                <i class="s-icon"></i>商城钱包
                            </div>
                            <p class="m-big squareS">
                                <a href="#">
                                    <i><img src="../images/shopping.png"/></i>
                                    <span class="m-title">能购物</span>
                                </a>
                            </p>
                            <p class="m-big squareA">
                                <a href="#">
                                    <i><img src="../images/safe.png"/></i>
                                    <span class="m-title">够安全</span>
                                </a>
                            </p>
                            <p class="m-big squareL">
                                <a href="#">
                                    <i><img src="../images/profit.png"/></i>
                                    <span class="m-title">很灵活</span>
                                </a>
                            </p>
                        </div>

                    </div>
                    <div class="box-container-bottom"></div>

                    <!--订单 -->
                    <div class="m-order">
                        <div class="s-bar">
                            <i class="s-icon"></i>我的订单
                            <a class="i-load-more-item-shadow" href="order.html">全部订单</a>
                        </div>
                        <div class="orderContentBox" ng-repeat="order in orders">
                            <div class="orderContent">
                                <div class="orderContentpic">
                                    <div class="imgBox">
                                        <a href="orderinfo.html"><img src="${pageContext.request.contextPath}/fileuploadpath/{{order.oderBookImage1}}" width="72px" height="72px"></a>
                                    </div>
                                </div>
                                <div class="detailContent">
                                        <a href="orderinfo.html" class="delivery" ng-if="order.orderReceiveStatus=='0'">出货中</a>
                                        <a href="orderinfo.html" class="delivery" ng-if="order.orderReceiveStatus=='1'">派件</a>
                                        <a href="orderinfo.html" class="delivery" ng-if="order.orderReceiveStatus=='2'">>签收</a>
                                    <div class="orderID">
                                        <span class="time">{{order.orderCreationTime}}</span>
                                    </div>
                                    <div class="orderID">
                                        <span class="num">共${sessionScope.totalnumber}件商品</span>
                                    </div>
                                </div>
                                <div class="state" ng-if="order.orderEvalutionDescription==null">待评价</div>
                                <div class="state" ng-if="order.orderEvalutionDescription!=null">已评价</div>
                                <div class="price"><span class="sym">¥</span>${sessionScope.totalprice}</div>

                            </div>
                            <a  href="/foreground/nowpay?bookId={{order.orderBookNumber}}" class="btnPay">再次购买</a>
                        </div>
                    </div>

                    <div class="user-suggestion">
                        <div class="s-bar">
                            <i class="s-icon"></i>会员中心
                        </div>
                        <div class="s-bar">
                            <a href="suggest.html"><i class="s-icon"></i>意见反馈</a>
                        </div>
                    </div>

                </div>
            </div>
            <div class="wrap-right">

                <!--热卖推荐 -->
                <div class="new-goods" ng-repeat="book in list" >
                    <div class="s-bar">
                        <i class="s-icon"></i>热卖推荐
                    </div>
                    <div class="new-goods-info">
                        <a class="shop-info" href="/foreground/info?bookId={{book.bookId}}" target="_blank">
                            <div >
                                <img src="${pageContext.request.contextPath}/fileuploadpath/{{book.bookImage1}}" alt="">
                            </div>
                            <span class="one-hot-goods">￥{{book.bookPromotionPrice}}</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="clear"></div>

            <!--收藏和足迹-->
            <div data-am-widget="tabs" class="am-tabs collection">
                <ul class="am-tabs-nav am-cf">
                    <li class="am-active"><a href="[data-tab-panel-0]"><i class="am-icon-heart"></i>商品收藏</a></li>
                </ul>
                <div class="am-tabs-bd">
                    <div data-tab-panel-0 class="am-tab-panel am-active">
                        <div class="am-slider am-slider-default am-slider-carousel" data-am-flexslider="{itemWidth:155,slideshow: false}">
                            <ul class="am-slides">
                                <li>
                                    <a><img class="am-thumbnail" src="../images/EZA27501.jpg" /></a>
                                    <strong class="price">¥32.9</strong>
                                </li>
                                <li>
                                    <a><img class="am-thumbnail" src="../images/BxJk6.jpg" /></a>
                                    <strong class="price">¥32.9</strong>
                                </li>
                                <li>
                                    <a><img class="am-thumbnail" src="../images/Hxcag60.jpg" /></a>
                                    <strong class="price">¥32.9</strong>
                                </li>
                                <li>
                                    <a><img class="am-thumbnail" src="../images/youzi.jpg" /></a>
                                    <strong class="price">¥32.9</strong>
                                </li>
                                <li>
                                    <a><img class="am-thumbnail" src="../images/EZA27501.jpg" /></a>
                                    <strong class="price">¥32.9</strong>
                                </li>
                                <li>
                                    <a><img class="am-thumbnail" src="../images/BxJk6.jpg" /></a>
                                    <strong class="price">¥32.9</strong>
                                </li>
                                <li>
                                    <a><img class="am-thumbnail" src="../images/Hxcag60.jpg" /></a>
                                    <strong class="price">¥32.9</strong>
                                </li>
                                <li>
                                    <a><img class="am-thumbnail" src="../images/youzi.jpg" /></a>
                                    <strong class="price">¥32.9</strong>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!--底部-->
        <jsp:include page="${pageContext.request.contextPath}/page/common/footer.jsp"/>
    </div>
    <%--menu--%>
    <jsp:include page="${pageContext.request.contextPath}/page/common/person_menu.jsp"/>
</div>
<!--引导 -->
<div class="navCir">
    <li><a href="../home/home2.html"><i class="am-icon-home "></i>首页</a></li>
    <li><a href="../home/sort.html"><i class="am-icon-list"></i>分类</a></li>
    <li><a href="../home/shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>
    <li class="active"><a href="index.html"><i class="am-icon-user"></i>我的</a></li>
</div>
</body>

</html>