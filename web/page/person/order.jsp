<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/5/4
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>订单管理</title>

    <link href="${pageContext.request.contextPath}/page/common/admin.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="${pageContext.request.contextPath}/page/common/personal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/page/common/orstyle.css" rel="stylesheet" type="text/css">

    <script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/amazeui.js"></script>

    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/angular.min.js"></script>
    <script>
        var app=angular.module('myApp',[]); //定义了一个叫myApp的模块
        //定义控制器
        app.controller('myController',function($scope,$http) {
            $scope.findorders = function (userId) {
                $http.get('/order/allorder?userId='+userId).success(
                    function (response) {
                        $scope.orderslist = response;
                    }
                )
            }
        });
    </script>
    <style>
        .am-btn-danger {
            background-color: #b6795f;
            border-color: #b6795f;
        }
    </style>
</head>

<body ng-app="myApp" ng-controller="myController" ng-init="findorders('${sessionScope.users.userId}')">
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
<!--分类-->
<jsp:include page="${pageContext.request.contextPath}/page/common/navigation_bar.jsp"/>
<div class="center">
    <div class="col-main">
        <div class="main-wrap">

            <div class="user-order">

                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
                </div>
                <hr/>

                <div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

                    <ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
                        <li class="am-active"><a href="#tab1">所有订单</a></li>
                        <li><a href="#tab2">待付款</a></li>
                        <li><a href="#tab3">待发货</a></li>
                        <li><a href="#tab4">待收货</a></li>
                        <li><a href="#tab5">待评价</a></li>
                    </ul>

                    <div class="am-tabs-bd">
                        <%--所有订单--%>
                        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                            <%--表单头--%>
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-number">
                                    <td class="td-inner">数量</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">商品操作</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                                <div class="th th-status">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-change">
                                    <td class="td-inner">交易操作</td>
                                </div>
                            </div>
                            <div class="order-main">
                                <div class="order-list">
                                    <!--交易成功-->
                                    <div class="order-status5" ng-repeat="orders in orderslist">
                                        <div class="order-title">
                                            <div class="dd-num">订单编号：<a href="javascript:;">{{orders.userorder.orderNumber}}</a></div>
                                            <span>成交时间：{{orders.userorder.orderCreationTime}}</span>
                                        </div>
                                        <div class="order-content">
                                            <div class="order-left">
                                                <ul class="item-list" ng-repeat="order in orders.userorders">
                                                    <li class="td td-item">
                                                        <div class="item-pic">
                                                            <a href="#" class="J_MakePoint">
                                                                <img src="${pageContext.request.contextPath}/fileuploadpath/{{order.oderBookImage1}}" class="itempic J_ItemImg">
                                                            </a>
                                                        </div>
                                                        <div class="item-info">
                                                            <div class="item-basic-info">
                                                                <a href="#">
                                                                    <p>{{order.orderBookName}}</p>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="td td-price">
                                                        <div class="item-price">
                                                            {{order.orderPrice}}
                                                        </div>
                                                    </li>
                                                    <li class="td td-number">
                                                        <div class="item-number">
                                                            <span>×</span>{{order.orderAmount}}
                                                        </div>
                                                    </li>
                                                    <li class="td td-operation">
                                                        <div class="item-operation">
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="order-right">
                                                <li class="td td-amount">
                                                    <div class="item-amount">
                                                        合计：{{orders.userorder.orderTotalprice}}
                                                        <p>含运费：<span>0.00</span></p>
                                                    </div>
                                                </li>
                                                <div class="move-right">
                                                    <li class="td td-status">
                                                        <div class="item-status">
                                                            <p class="Mystatus" ng-if="orders.userorder.orderReceiveStatus=='0'">买家已付款</p>
                                                            <p class="Mystatus" ng-if="orders.userorder.orderReceiveStatus=='1'">卖家已发货</p>
                                                            <p class="Mystatus" ng-if="orders.userorder.orderReceiveStatus=='2'">交易成功</p>
                                                            <p class="order-info"><a href="orderinfo.html">订单详情</a></p>
                                                            <p class="order-info" ng-if="orders.userorder.orderReceiveStatus=='1'"><a href="logistics.html">查看物流</a></p>
                                                        </div>
                                                    </li>
                                                    <li class="td td-change">
                                                        <div class="am-btn am-btn-danger anniu" ng-if="orders.userorder.orderReceiveStatus=='0'">
                                                            提醒发货</div>
                                                        <div class="am-btn am-btn-danger anniu" ng-if="orders.userorder.orderReceiveStatus=='1'">
                                                            确认收货</div>
                                                        <div class="am-btn am-btn-danger anniu" ng-if="orders.userorder.orderReceiveStatus=='2'">
                                                            删除订单</div>
                                                    </li>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <%--待付款--%>
                        <div class="am-tab-panel am-fade" id="tab2">
                            <%--表单头--%>
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-number">
                                    <td class="td-inner">数量</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">商品操作</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                                <div class="th th-status">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-change">
                                    <td class="td-inner">交易操作</td>
                                </div>
                            </div>
                            <%--所有表单--%>
                            <div class="order-main">
                               <%-- <div class="order-list">
                                    <div class="order-status1">
                                        <div class="order-title">
                                            <div class="dd-num">订单编号：<a href="javascript:;">1601430</a></div>
                                            <span>成交时间：2015-12-20</span>
                                            <!--    <em>店铺：小桔灯</em>-->
                                        </div>
                                        <div class="order-content">
                                            <div class="order-left">
                                                <ul class="item-list">
                                                    <li class="td td-item">
                                                        <div class="item-pic">
                                                            <a href="#" class="J_MakePoint">
                                                                <img src="../images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
                                                            </a>
                                                        </div>
                                                        <div class="item-info">
                                                            <div class="item-basic-info">
                                                                <a href="#">
                                                                    <p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
                                                                    <p class="info-little">颜色：12#川南玛瑙
                                                                        <br/>包装：裸装 </p>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="td td-price">
                                                        <div class="item-price">
                                                            333.00
                                                        </div>
                                                    </li>
                                                    <li class="td td-number">
                                                        <div class="item-number">
                                                            <span>×</span>2
                                                        </div>
                                                    </li>
                                                    <li class="td td-operation">
                                                        <div class="item-operation">

                                                        </div>
                                                    </li>
                                                </ul>

                                                <ul class="item-list">
                                                    <li class="td td-item">
                                                        <div class="item-pic">
                                                            <a href="#" class="J_MakePoint">
                                                                <img src="../images/62988.jpg_80x80.jpg" class="itempic J_ItemImg">
                                                            </a>
                                                        </div>
                                                        <div class="item-info">
                                                            <div class="item-basic-info">
                                                                <a href="#">
                                                                    <p>礼盒袜子女秋冬 纯棉袜加厚 韩国可爱 </p>
                                                                    <p class="info-little">颜色分类：李清照
                                                                        <br/>尺码：均码</p>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="td td-price">
                                                        <div class="item-price">
                                                            333.00
                                                        </div>
                                                    </li>
                                                    <li class="td td-number">
                                                        <div class="item-number">
                                                            <span>×</span>2
                                                        </div>
                                                    </li>
                                                    <li class="td td-operation">
                                                        <div class="item-operation">

                                                        </div>
                                                    </li>
                                                </ul>

                                                <ul class="item-list">
                                                    <li class="td td-item">
                                                        <div class="item-pic">
                                                            <a href="#" class="J_MakePoint">
                                                                <img src="../images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
                                                            </a>
                                                        </div>
                                                        <div class="item-info">
                                                            <div class="item-basic-info">
                                                                <a href="#">
                                                                    <p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
                                                                    <p class="info-little">颜色：12#川南玛瑙
                                                                        <br/>包装：裸装 </p>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="td td-price">
                                                        <div class="item-price">
                                                            333.00
                                                        </div>
                                                    </li>
                                                    <li class="td td-number">
                                                        <div class="item-number">
                                                            <span>×</span>2
                                                        </div>
                                                    </li>
                                                    <li class="td td-operation">
                                                        <div class="item-operation">

                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="order-right">
                                                <li class="td td-amount">
                                                    <div class="item-amount">
                                                        合计：676.00
                                                        <p>含运费：<span>10.00</span></p>
                                                    </div>
                                                </li>
                                                <div class="move-right">
                                                    <li class="td td-status">
                                                        <div class="item-status">
                                                            <p class="Mystatus">等待买家付款</p>
                                                            <p class="order-info"><a href="#">取消订单</a></p>

                                                        </div>
                                                    </li>
                                                    <li class="td td-change">
                                                        <a href="pay.html">
                                                            <div class="am-btn am-btn-danger anniu">
                                                                一键支付</div></a>
                                                    </li>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                        <%--待发货--%>
                        <div class="am-tab-panel am-fade" id="tab3">
                            <%--表单头--%>
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-number">
                                    <td class="td-inner">数量</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">商品操作</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                                <div class="th th-status">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-change">
                                    <td class="td-inner">交易操作</td>
                                </div>
                            </div>
                            <%--所有表单--%>
                            <div class="order-main">
                                <div class="order-list">
                                    <div class="order-status5" ng-repeat="orders in orderslist" ng-if="orders.userorder.orderReceiveStatus=='0'">
                                        <div class="order-title">
                                            <div class="dd-num">订单编号：<a href="javascript:;">{{orders.userorder.orderNumber}}</a></div>
                                            <span>成交时间：{{orders.userorder.orderCreationTime}}</span>
                                        </div>
                                        <div class="order-content">
                                            <div class="order-left">
                                                <ul class="item-list" ng-repeat="order in orders.userorders">
                                                    <li class="td td-item">
                                                        <div class="item-pic">
                                                            <a href="#" class="J_MakePoint">
                                                                <img src="${pageContext.request.contextPath}/fileuploadpath/{{order.oderBookImage1}}" class="itempic J_ItemImg">
                                                            </a>
                                                        </div>
                                                        <div class="item-info">
                                                            <div class="item-basic-info">
                                                                <a href="#">
                                                                    <p>{{order.orderBookName}}</p>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="td td-price">
                                                        <div class="item-price">
                                                            {{order.orderPrice}}
                                                        </div>
                                                    </li>
                                                    <li class="td td-number">
                                                        <div class="item-number">
                                                            <span>×</span>{{order.orderAmount}}
                                                        </div>
                                                    </li>
                                                    <li class="td td-operation">
                                                        <div class="item-operation">
                                                            <a href="refund.html">退款</a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="order-right">
                                                <li class="td td-amount">
                                                    <div class="item-amount">
                                                        合计：{{orders.userorder.orderTotalprice}}
                                                        <p>含运费：<span>0.00</span></p>
                                                    </div>
                                                </li>
                                                <div class="move-right">
                                                    <li class="td td-status">
                                                        <div class="item-status">
                                                            <p class="Mystatus" ng-if="orders.userorder.orderReceiveStatus=='0'">买家已付款</p>
                                                            <p class="Mystatus" ng-if="orders.userorder.orderReceiveStatus=='1'">卖家已发货</p>
                                                            <p class="Mystatus" ng-if="orders.userorder.orderReceiveStatus=='2'">交易成功</p>
                                                            <p class="order-info"><a href="orderinfo.html">订单详情</a></p>
                                                            <p class="order-info" ng-if="orders.userorder.orderReceiveStatus=='1'"><a href="logistics.html">查看物流</a></p>
                                                        </div>
                                                    </li>
                                                    <li class="td td-change">
                                                        <div class="am-btn am-btn-danger anniu" ng-if="orders.userorder.orderReceiveStatus=='0'">
                                                            提醒发货</div>
                                                        <div class="am-btn am-btn-danger anniu" ng-if="orders.userorder.orderReceiveStatus=='1'">
                                                            确认收货</div>
                                                        <div class="am-btn am-btn-danger anniu" ng-if="orders.userorder.orderReceiveStatus=='2'">
                                                            删除订单</div>
                                                    </li>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--待收货--%>
                        <div class="am-tab-panel am-fade" id="tab4">
                            <%--表单头--%>
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-number">
                                    <td class="td-inner">数量</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">商品操作</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                                <div class="th th-status">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-change">
                                    <td class="td-inner">交易操作</td>
                                </div>
                            </div>
                            <%--所有表单--%>
                            <div class="order-main">
                                <div class="order-list">
                                    <div class="order-status5" ng-repeat="orders in orderslist" ng-if="orders.userorder.orderReceiveStatus=='1'">
                                        <div class="order-title">
                                            <div class="dd-num">订单编号：<a href="javascript:;">{{orders.userorder.orderNumber}}</a></div>
                                            <span>成交时间：{{orders.userorder.orderCreationTime}}</span>
                                        </div>
                                        <div class="order-content">
                                            <div class="order-left">
                                                <ul class="item-list" ng-repeat="order in orders.userorders">
                                                    <li class="td td-item">
                                                        <div class="item-pic">
                                                            <a href="#" class="J_MakePoint">
                                                                <img src="${pageContext.request.contextPath}/fileuploadpath/{{order.oderBookImage1}}" class="itempic J_ItemImg">
                                                            </a>
                                                        </div>
                                                        <div class="item-info">
                                                            <div class="item-basic-info">
                                                                <a href="#">
                                                                    <p>{{order.orderBookName}}</p>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="td td-price">
                                                        <div class="item-price">
                                                            {{order.orderPrice}}
                                                        </div>
                                                    </li>
                                                    <li class="td td-number">
                                                        <div class="item-number">
                                                            <span>×</span>{{order.orderAmount}}
                                                        </div>
                                                    </li>
                                                    <li class="td td-operation">
                                                        <div class="item-operation">
                                                            <a href="refund.html">退款/退货</a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="order-right">
                                                <li class="td td-amount">
                                                    <div class="item-amount">
                                                        合计：{{orders.userorder.orderTotalprice}}
                                                        <p>含运费：<span>0.00</span></p>
                                                    </div>
                                                </li>
                                                <div class="move-right">
                                                    <li class="td td-status">
                                                        <div class="item-status">
                                                            <p class="Mystatus" ng-if="orders.userorder.orderReceiveStatus=='0'">买家已付款</p>
                                                            <p class="Mystatus" ng-if="orders.userorder.orderReceiveStatus=='1'">卖家已发货</p>
                                                            <p class="Mystatus" ng-if="orders.userorder.orderReceiveStatus=='2'">交易成功</p>
                                                            <p class="order-info"><a href="orderinfo.html">订单详情</a></p>
                                                            <p class="order-info" ng-if="orders.userorder.orderReceiveStatus=='1'"><a href="logistics.html">查看物流</a></p>
                                                        </div>
                                                    </li>
                                                    <li class="td td-change">
                                                        <div class="am-btn am-btn-danger anniu" ng-if="orders.userorder.orderReceiveStatus=='0'">
                                                            提醒发货</div>
                                                        <div class="am-btn am-btn-danger anniu" ng-if="orders.userorder.orderReceiveStatus=='1'">
                                                            确认收货</div>
                                                        <div class="am-btn am-btn-danger anniu" ng-if="orders.userorder.orderReceiveStatus=='2'">
                                                            删除订单</div>
                                                    </li>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--待评价--%>
                        <div class="am-tab-panel am-fade" id="tab5">
                            <%--表单头--%>
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-number">
                                    <td class="td-inner">数量</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">商品操作</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                                <div class="th th-status">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-change">
                                    <td class="td-inner">交易操作</td>
                                </div>
                            </div>
                            <%--所有表单--%>
                            <div class="order-main">
                                <div class="order-list">
                                    <!--不同状态的订单	-->
                                    <div class="order-status5" ng-repeat="orders in orderslist" ng-if="orders.userorder.orderReceiveStatus=='2'&&orders.userorder.orderEvaluationLevel==null">
                                        <div class="order-title">
                                            <div class="dd-num">订单编号：<a href="javascript:;">{{orders.userorder.orderNumber}}</a></div>
                                            <span>成交时间：{{orders.userorder.orderCreationTime}}</span>
                                        </div>
                                        <div class="order-content">
                                            <div class="order-left">
                                                <ul class="item-list" ng-repeat="order in orders.userorders">
                                                    <li class="td td-item">
                                                        <div class="item-pic">
                                                            <a href="#" class="J_MakePoint">
                                                                <img src="${pageContext.request.contextPath}/fileuploadpath/{{order.oderBookImage1}}" class="itempic J_ItemImg">
                                                            </a>
                                                        </div>
                                                        <div class="item-info">
                                                            <div class="item-basic-info">
                                                                <a href="#">
                                                                    <p>{{order.orderBookName}}</p>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="td td-price">
                                                        <div class="item-price">
                                                            {{order.orderPrice}}
                                                        </div>
                                                    </li>
                                                    <li class="td td-number">
                                                        <div class="item-number">
                                                            <span>×</span>{{order.orderAmount}}
                                                        </div>
                                                    </li>
                                                    <li class="td td-operation">
                                                        <div class="item-operation">
                                                            <a href="refund.html">退款/退货</a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="order-right">
                                                <li class="td td-amount">
                                                    <div class="item-amount">
                                                        合计：{{orders.userorder.orderTotalprice}}
                                                        <p>含运费：<span>0.00</span></p>
                                                    </div>
                                                </li>
                                                <div class="move-right">
                                                    <li class="td td-status">
                                                        <div class="item-status">
                                                            <p class="Mystatus" ng-if="orders.userorder.orderReceiveStatus=='0'">买家已付款</p>
                                                            <p class="Mystatus" ng-if="orders.userorder.orderReceiveStatus=='1'">卖家已发货</p>
                                                            <p class="Mystatus" ng-if="orders.userorder.orderReceiveStatus=='2'">交易成功</p>
                                                            <p class="order-info"><a href="orderinfo.html">订单详情</a></p>
                                                            <p class="order-info" ng-if="orders.userorder.orderReceiveStatus=='1'"><a href="logistics.html">查看物流</a></p>
                                                        </div>
                                                    </li>
                                                    <li class="td td-change">
                                                        <div class="am-btn am-btn-danger anniu" ng-if="orders.userorder.orderReceiveStatus=='0'">
                                                            提醒发货</div>
                                                        <div class="am-btn am-btn-danger anniu" ng-if="orders.userorder.orderReceiveStatus=='1'">
                                                            确认收货</div>
                                                        <div class="am-btn am-btn-danger anniu" ng-if="orders.userorder.orderReceiveStatus=='2'">
                                                            删除订单</div>
                                                    </li>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

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

</body>

</html>