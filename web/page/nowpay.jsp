<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/4/30
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>结算页面</title>

    <link href="${pageContext.request.contextPath}/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/page/common/demo.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/page/common/cartstyle.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/page/common/jsstyle.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/page/common/address.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/angular.min.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/cart/base.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/cart/cartController.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/cart/cartService.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>

    <script src="${pageContext.request.contextPath}/page/common/cart/base.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/cart/cartController.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/cart/cartService.js"></script>

    <style type="text/css">
        a:hover, a:focus {
            color: #b6795f;
        }
    </style>
</head>

<body ng-app="myApp" ng-controller="cartController" ng-init="findaddress('${sessionScope.userId}');findprice('${book.bookPromotionPrice}')">

<!--顶部导航条 -->
<jsp:include page="${pageContext.request.contextPath}/page/common/header.jsp"/>

<!--悬浮搜索框-->

<jsp:include page="${pageContext.request.contextPath}/page/common/search.jsp"/>

<div class="clear"></div>
<div class="concent">
    <!--地址 -->
    <div class="paycont">
        <div class="address">
            <h3>确认收货地址 </h3>
            <div class="control">
                <div class="tc-btn createAddr theme-login am-btn am-btn-danger" style="background-color: #b6795f;
    border-color: #eaac91;">使用新地址</div>
            </div>
            <div class="clear"></div>
            <ul>
                <div ng-repeat="address in addresses">

                    <div class="per-border"></div>
                    <li class="user-addresslist {{isselectedaddress(address)?'defaultAddr':''}}" ng-click="selectedaddress(address)">

                        <div class="address-left">
                            <div class="user DefaultAddr">
                            <span class="buy-address-detail">
                                <span class="buy-user">{{address.addressReceiver}} </span>
                                <span class="buy-phone">{{address.addressTelnum}}</span>
                            </span>
                            </div>
                            <div class="default-address DefaultAddr">
                                <span class="buy-line-title buy-line-title-type">收货地址：</span>
                                <span class="buy--address-detail">
                                <span class="province">{{address.addressProvince}}</span>
                                <span class="city">{{address.addressCity}}</span>
                                <span class="dist">{{address.addressTown}}</span>
                                <span class="street">{{address.addressLocation}}</span>
                            </span>
                                </span>
                            </div>
                            <ins class="deftip" ng-if="address.addressDefault=='1'" >默认地址</ins>
                        </div>
                        <div class="address-right">
                            <a href="../person/address.html">
                                <span class="am-icon-angle-right am-icon-lg"></span></a>
                        </div>
                        <div class="clear"></div>

                        <div class="new-addr-btn">
                            <a ng-click="setdefaultaddress(address.addressId,'${sessionScope.userId}')" ng-if="address.addressDefault=='0'">设为默认</a>
                            <span class="new-addr-bar hidden">|</span>
                            <a href="#">编辑</a>
                            <span class="new-addr-bar">|</span>
                            <a ng-click="deleteaddress(address.addressId,'${sessionScope.userId}')">删除</a>
                        </div>
                    </li>
                </div>
            </ul>

            <div class="clear"></div>
        </div>
        <!--物流 -->
        <div class="clear"></div>
        <!--支付方式-->
        <div class="logistics">
            <h3>选择支付方式</h3>
            <ul class="pay-list">
                <li class="pay card"><img src="../images/wangyin.jpg"/>银联<span></span></li>
                <li class="pay qq"><img src="../images/weizhifu.jpg"/>微信<span></span></li>
                <li class="pay taobao"><img src="../images/zhifubao.jpg"/>支付宝<span></span></li>
            </ul>
        </div>
        <div class="clear"></div>

        <!--订单 -->
        <div class="concent">
            <div id="payTable">
                <h3>确认订单信息</h3>
                <div class="cart-table-th">
                    <div class="wp">
                        <div class="th th-item">
                            <div class="td-inner">商品信息</div>
                        </div>
                        <div class="th th-price">
                            <div class="td-inner">单价</div>
                        </div>
                        <div class="th th-amount">
                            <div class="td-inner">数量</div>
                        </div>
                        <div class="th th-sum">
                            <div class="td-inner">金额</div>
                        </div>
                        <div class="th th-oplist">
                            <div class="td-inner">配送方式</div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <tr class="item-list">
                    <div class="bundle  bundle-last">
                        <div class="bundle-main">
                            <ul class="item-content clearfix">
                                <div class="pay-phone">
                                    <li class="td td-item">
                                        <div class="item-pic">
                                            <a href="/foreground/info?bookId=${book.bookId}"
                                               class="J_MakePoint">
                                                <img src="${pageContext.request.contextPath}/fileuploadpath/${book.bookImage1}"
                                                     class="itempic J_ItemImg" width="80px" height="80px"></a>
                                        </div>
                                        <div class="item-info">
                                            <div class="item-basic-info">
                                                <a href="/foreground/info?bookId=${book.bookId}"
                                                   class="item-title J_MakePoint" >${book.bookName}</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="td td-info">
                                        <div class="item-props">
                                        </div>
                                    </li>
                                    <li class="td td-price">
                                        <div class="item-price price-promo-promo">
                                            <div class="price-content">
                                                <em class="J_Price price-now">￥${book.bookPromotionPrice}</em>
                                            </div>
                                        </div>
                                    </li>
                                </div>
                                <li class="td td-amount">
                                    <div class="amount-wrapper ">
                                        <div class="item-amount ">
                                            <span class="phone-title">购买数量</span>
                                            <div class="sl">
                                                <input style="border: 1px solid transparent;"  name="" type="button" value="-"
                                                       ng-click="nowpaydown('${book.bookPromotionPrice}')"/>
                                                <input  type="text" autocomplete="off"
                                                       style="width:30px; border: 1px solid #ddd;" id="paynumber" ng-model="inputnumber"/>
                                                <input style="border: 1px solid transparent;" name="" type="button" value="+"
                                                       ng-click="nowpayup('${book.bookPromotionPrice}')"/>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="td td-sum">
                                    <div class="td-inner">
                                        <em tabindex="0" class="J_ItemSum number">${bookbookPromotionPrice}</em>
                                    </div>
                                </li>
                                <li class="td td-oplist">
                                    <div class="td-inner">
                                        <span class="phone-title">配送方式</span>
                                        <div class="pay-logis">
                                            包邮
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <div class="clear"></div>
                        </div>
                    </div>
                </tr>
                <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
        <div class="pay-total">
            <!--留言-->
            <div class="order-extra">
                <div class="order-user-info">
                    <div id="holyshit257" class="memo">
                        <label>买家留言：</label>
                        <input type="text" title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）" placeholder="选填,建议填写和卖家达成一致的说明"
                               class="memo-input J_MakePoint c2c-text-default memo-close" id="liuyan">
                        <div class="msg hidden J-msg">
                            <p class="error">最多输入500个字符</p>
                        </div>
                    </div>
                </div>

            </div>
            <!--优惠券 -->
            <div class="clear"></div>
        </div>
        <!--含运费小计 -->
        <div class="buy-point-discharge ">
            <p class="price g_price ">
                合计（含运费） <span>¥</span><em class="pay-sum" style="color: #b6795f;">{{tatolmony.toFixed(2)}}</em>
            </p>
        </div>

        <!--信息 -->
        <div class="order-go clearfix">
            <div class="pay-confirm clearfix">
                <div class="box" style="border: 2px solid #b6795f;">
                    <div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
                        <span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee" style="color: #b6795f;">{{tatolmony.toFixed(2)}}</em>
											</span>
                    </div>

                    <div id="holyshit268" class="pay-address">

                        <p class="buy-footer-address">
                            <span class="buy-line-title buy-line-title-type">寄送至：</span>
                            <span class="buy--address-detail">
                                <span class="province">{{address.addressProvince}}</span>
                                <span class="city">{{address.addressCity}}</span>
                                <span class="dist">{{address.addressTown}}</span>
                                <span class="street">{{address.addressLocation}}</span>
                            </span>
                        </p>
                        <p class="buy-footer-address">
                            <span class="buy-line-title">收货人：</span>
                            <span class="buy-address-detail">
                                         <span class="buy-user">{{address.addressReceiver}} </span>
												<span class="buy-phone">{{address.addressTelnum}}   </span>
												</span>
                        </p>
                    </div>
                </div>

                <div id="holyshit269" class="submitOrder">
                    <div class="go-btn-wrap">
                        <a id="J_Go" ng-click="nowpaysubmitOrder('${sessionScope.userId}','${book.bookId}')" class="btn-go" tabindex="0" title="点击此按钮，提交订单" style="background-color: #b6795f;">提交订单</a>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>

    <div class="clear"></div>
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
</div>
<div class="theme-popover-mask"></div>
<div class="theme-popover">

    <!--标题 -->
    <div class="am-cf am-padding">
        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> /
            <small>Add address</small>
        </div>
    </div>
    <hr/>

    <div class="am-u-md-12">
        <form class="am-form am-form-horizontal">

            <div class="am-form-group">
                <label for="addressReceiver" class="am-form-label">收货人</label>
                <div class="am-form-content">
                    <input type="text" id="addressReceiver" placeholder="收货人">
                </div>
            </div>

            <div class="am-form-group">
                <label for="addressTelnum" class="am-form-label">手机号码</label>
                <div class="am-form-content">
                    <input id="addressTelnum" placeholder="手机号必填" type="tel" maxlength="11" >
                </div>
            </div>

            <div class="am-form-group">
                <label  class="am-form-label">所在地</label>
                <div class="am-form-content address">
                    <select data-am-selected id="addressProvince">
                        <option value="浙江省">浙江省</option>
                        <option value="湖北省">湖北省</option>
                    </select>
                    <select data-am-selected id="addressCity">
                        <option value="温州市">温州市</option>
                        <option value="武汉市">武汉市</option>
                    </select>
                    <select data-am-selected id="addressTown">
                        <option value="瑞安区">瑞安区</option>
                        <option value="洪山区">洪山区</option>
                    </select>
                </div>
            </div>

            <div class="am-form-group">
                <label for="addressLocation" class="am-form-label">详细地址</label>
                <div class="am-form-content">
                    <textarea class="" rows="3" id="addressLocation" placeholder="输入详细地址" maxlength="100"></textarea>
                    <small>100字以内写出你的详细地址...</small>
                </div>
            </div>
            <input type="hidden" name="userId" value="${sessionScope.userId}" id="userId">
            <div class="am-form-group theme-poptit">
                <div class="am-u-sm-9 am-u-sm-push-3">
                    <div class="am-btn am-btn-danger" id="btn_submit" ng-click="addaddress()">保存</div>
                    <div class="am-btn am-btn-danger close">取消</div>
                </div>
            </div>
        </form>
    </div>

</div>

<div class="clear"></div>
</body>
</html>
