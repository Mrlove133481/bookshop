<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/4/28
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
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

</head>

<body ng-app="myApp" ng-controller="cartController" ng-init="findCartList('${sessionScope.users.userShopCart}')">

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
<div class="concent">
    <!--地址 -->
    <div class="paycont">
        <div class="address">
            <h3>确认收货地址 </h3>
            <div class="control">
                <div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
            </div>
            <div class="clear"></div>
            <ul>
                <div class="per-border"></div>
                <li class="user-addresslist defaultAddr">

                    <div class="address-left">
                        <div class="user DefaultAddr">
                            <span class="buy-address-detail">
                                <span class="buy-user">艾迪 </span>
                                <span class="buy-phone">15888888888</span>
                            </span>
                        </div>
                        <div class="default-address DefaultAddr">
                            <span class="buy-line-title buy-line-title-type">收货地址：</span>
                            <span class="buy--address-detail">
                                <span class="province">湖北</span>省
                                <span class="city">武汉</span>市
                                <span class="dist">洪山</span>区
                                <span class="street">雄楚大道666号(中南财经政法大学)</span>
                            </span>
                        </span>
                        </div>
                        <ins class="deftip">默认地址</ins>
                    </div>
                    <div class="address-right">
                        <a href="../person/address.html">
                            <span class="am-icon-angle-right am-icon-lg"></span></a>
                    </div>
                    <div class="clear"></div>

                    <div class="new-addr-btn">
                        <a href="#" class="hidden">设为默认</a>
                        <span class="new-addr-bar hidden">|</span>
                        <a href="#">编辑</a>
                        <span class="new-addr-bar">|</span>
                        <a href="javascript:void(0);" onclick="delClick(this);">删除</a>
                    </div>
                </li>

                <div class="per-border"></div>
                <li class="user-addresslist">
                    <div class="address-left">
                        <div class="user DefaultAddr">

										<span class="buy-address-detail">
                   <span class="buy-user">艾迪 </span>
										<span class="buy-phone">15877777777</span>
										</span>
                        </div>
                        <div class="default-address DefaultAddr">
                            <span class="buy-line-title buy-line-title-type">收货地址：</span>
                            <span class="buy--address-detail">
								   <span class="province">湖北</span>省
										<span class="city">武汉</span>市
										<span class="dist">武昌</span>区
										<span class="street">东湖路75号众环大厦9栋9层999</span>
										</span>

                            </span>
                        </div>
                        <ins class="deftip hidden">默认地址</ins>
                    </div>
                    <div class="address-right">
                        <span class="am-icon-angle-right am-icon-lg"></span>
                    </div>
                    <div class="clear"></div>

                    <div class="new-addr-btn">
                        <a href="#">设为默认</a>
                        <span class="new-addr-bar">|</span>
                        <a href="#">编辑</a>
                        <span class="new-addr-bar">|</span>
                        <a href="javascript:void(0);" onclick="delClick(this);">删除</a>
                    </div>

                </li>
            </ul>

            <div class="clear"></div>
        </div>
        <!--物流 -->
        <%--  <div class="logistics">
              <h3>选择物流方式</h3>
              <ul class="op_express_delivery_hot">
                  <li data-value="yuantong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -468px"></i>圆通<span></span></li>
                  <li data-value="shentong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -1008px"></i>申通<span></span></li>
                  <li data-value="yunda" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -576px"></i>韵达<span></span></li>
                  <li data-value="zhongtong" class="OP_LOG_BTN op_express_delivery_hot_last "><i class="c-gap-right" style="background-position:0px -324px"></i>中通<span></span></li>
                  <li data-value="shunfeng" class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i class="c-gap-right" style="background-position:0px -180px"></i>顺丰<span></span></li>
              </ul>
          </div>--%>
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
                            <ul class="item-content clearfix" ng-repeat="book in cartList">
                                <div class="pay-phone">
                                    <li class="td td-item">
                                        <div class="item-pic">
                                            <a href="/foreground/info?bookId={{book.bookss.bookId}}"
                                               class="J_MakePoint">
                                                <img src="${pageContext.request.contextPath}/fileuploadpath/{{book.bookss.bookImage1}}"
                                                     class="itempic J_ItemImg" width="80px" height="80px"></a>
                                        </div>
                                        <div class="item-info">
                                            <div class="item-basic-info">
                                                <a href="/foreground/info?bookId={{book.bookss.bookId}}"
                                                   class="item-title J_MakePoint">{{book.bookss.bookName}}</a>
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
                                                <em class="J_Price price-now">￥{{book.bookss.bookPromotionPrice}}</em>
                                            </div>
                                        </div>
                                    </li>
                                </div>
                                <li class="td td-amount">
                                    <div class="amount-wrapper ">
                                        <div class="item-amount ">
                                            <span class="phone-title">购买数量</span>
                                            <div class="sl">
                                                <input class="min am-btn" name="" type="button" value="-"
                                                       ng-click="down(book.bookss.bookNumber,book.shopcartId,book.shopcartCount,'${sessionScope.users.userShopCart}')"/>
                                                <input class="text_box" type="text" autocomplete="off"
                                                       style="width:30px;" id="{{book.bookss.bookNumber}}1"
                                                       ng-model="book.shopcartCount"/>
                                                <input class="add am-btn" name="" type="button" value="+"
                                                       ng-click="up(book.bookss.bookNumber,book.shopcartId,book.shopcartCount,'${sessionScope.users.userShopCart}')"/>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="td td-sum">
                                    <div class="td-inner">
                                        <em tabindex="0" class="J_ItemSum number">{{book.bookss.bookPromotionPrice*book.shopcartCount}}</em>
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
                               class="memo-input J_MakePoint c2c-text-default memo-close">
                        <div class="msg hidden J-msg">
                            <p class="error">最多输入500个字符</p>
                        </div>
                    </div>
                </div>

            </div>
            <!--优惠券 -->
            <%-- <div class="buy-agio">
                 <li class="td td-coupon">

                     <span class="coupon-title">优惠券</span>
                     <select data-am-selected>
                         <option value="a">
                             <div class="c-price">
                                 <strong>￥8</strong>
                             </div>
                             <div class="c-limit">
                                 【消费满95元可用】
                             </div>
                         </option>
                         <option value="b" selected>
                             <div class="c-price">
                                 <strong>￥3</strong>
                             </div>
                             <div class="c-limit">
                                 【无使用门槛】
                             </div>
                         </option>
                     </select>
                 </li>

                 <li class="td td-bonus">

                     <span class="bonus-title">红包</span>
                     <select data-am-selected>
                         <option value="a">
                             <div class="item-info">
                                 ¥50.00<span>元</span>
                             </div>
                             <div class="item-remainderprice">
                                 <span>还剩</span>10.40<span>元</span>
                             </div>
                         </option>
                         <option value="b" selected>
                             <div class="item-info">
                                 ¥50.00<span>元</span>
                             </div>
                             <div class="item-remainderprice">
                                 <span>还剩</span>50.00<span>元</span>
                             </div>
                         </option>
                     </select>

                 </li>

             </div>--%>
            <div class="clear"></div>
        </div>
        <!--含运费小计 -->
        <div class="buy-point-discharge ">
            <p class="price g_price ">
                合计（含运费） <span>¥</span><em class="pay-sum">{{totalValue.totalMoney}}</em>
            </p>
        </div>

        <!--信息 -->
        <div class="order-go clearfix">
            <div class="pay-confirm clearfix">
                <div class="box">
                    <div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
                        <span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">{{totalValue.totalMoney}}</em>
											</span>
                    </div>

                    <div id="holyshit268" class="pay-address">

                        <p class="buy-footer-address">
                            <span class="buy-line-title buy-line-title-type">寄送至：</span>
                            <span class="buy--address-detail">
								   <span class="province">湖北</span>省
												<span class="city">武汉</span>市
												<span class="dist">洪山</span>区
												<span class="street">雄楚大道666号(中南财经政法大学)</span>
												</span>
                            </span>
                        </p>
                        <p class="buy-footer-address">
                            <span class="buy-line-title">收货人：</span>
                            <span class="buy-address-detail">
                                         <span class="buy-user">艾迪 </span>
												<span class="buy-phone">15871145629</span>
												</span>
                        </p>
                    </div>
                </div>

                <div id="holyshit269" class="submitOrder">
                    <div class="go-btn-wrap">
                        <a id="J_Go" href="success.html" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
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

<%--<script>
    $(function () {
        $("#btn_submit").click(function () {
            var addressReceiver = $("#addressReceiver").val();
            var addressTelnum = $("#addressTelnum").val();
            var addressProvince = $("#addressProvince option:selected").val();
            var addressCity = $("#addressCity option:selected").val();
            var addressTown = $("#addressTown option:selected").val();
            var addressLocation = $("#addressLocation").val();
            var userId = $("#userId").val();
             if(addressTelnum ==""){
                layer.msg("请输入手机号码！",{time:700},function () {
                    layer.close(index);
                })
            }else {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/address/addaddress",
                    data:{
                        addressReceiver:addressReceiver,
                        addressTelnum:addressTelnum,
                        addressProvince:addressProvince,
                        addressCity:addressCity,
                        addressTown:addressTown,
                        addressLocation:addressLocation,
                        userId:userId
                    },
                    success: function(msg){
                        if(msg.success){
                            $(document.body).css("overflow","visible");
                            $('.theme-login').removeClass("selected");
                            $('.item-props-can').removeClass("selected");
                            $('.theme-popover-mask').hide();
                            $('.theme-popover').slideUp(200);
                        }else {
                            $(document.body).css("overflow","visible");
                            $('.theme-login').removeClass("selected");
                            $('.item-props-can').removeClass("selected");
                            $('.theme-popover-mask').hide();
                            $('.theme-popover').slideUp(200);
                            layer.msg("保存失败！", {time: 400}, function () {
                                layer.close(index);
                            })
                        }
                    },

                    dataType:'json'
                });
            }

        });
    });
</script>--%>
</html>