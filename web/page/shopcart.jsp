<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/4/12
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>购物车页面</title>

    <link href="${pageContext.request.contextPath}/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/page/common/demo.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/page/common/cartstyle.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/page/common/optstyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/angular.min.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/cart/base.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/cart/cartController.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/cart/cartService.js"></script>

</head>

<body ng-app="myApp" ng-controller="cartController">

<!--顶部导航条 -->
<div class="am-container header">
    <ul class="message-r">
        <div class="topMessage home">
            <div class="menu-hd"><a href="${pageContext.request.contextPath}/page/index.jsp" target="_top" class="h" style="color:#b6795f">书城首页</a></div>
        </div>
        <div class="topMessage my-shangcheng">
            <div class="menu-hd MyShangcheng"><a href="#" target="_top" style="color:#b6795f"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
        </div>
        <div class="topMessage mini-cart">
            <div class="menu-hd"><a id="mc-menu-hd" href="${pageContext.request.contextPath}/page/shopcart.jsp" target="_top" style="color:#b6795f"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
        </div>
        <div class="topMessage favorite">
            <div class="menu-hd"><a href="#" target="_top" style="color:#b6795f"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
        </div>
    </ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
    <div class="logo"><img src="../images/logo.png" /></div>
    <div class="logoBig">
        <li style="margin-top: 20px;"><img src="${pageContext.request.contextPath}/images/logo.png" /></li>
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

<!--购物车 -->
<div class="concent"   ng-init="findCartList('${sessionScope.users.userShopCart}')">
    <div id="cartTable">

        <div class="cart-table-th">
            <div class="wp">
                <div class="th th-chk">
                    <div id="J_SelectAll1" class="select-all J_SelectAll">

                    </div>
                </div>
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
                <div class="th th-op">
                    <div class="td-inner">操作</div>
                </div>
            </div>
        </div>
        <div class="clear"></div>

        <tr class="item-list">
            <div class="bundle  bundle-last" >
                <div class="bundle-hd">
                    <div class="bd-promos">
                        <div class="bd-has-promo">已享优惠:<span class="bd-has-promo-content">省￥{{totalValue.totalDiscounts}}</span>&nbsp;&nbsp;</div>
                        <span class="list-change theme-login">编辑</span>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="bundle-main"  >
                    <ul class="item-content clearfix" ng-repeat="book in cartList">
                        <li class="td td-chk">
                            <div class="cart-checkbox ">
                                <label for="{{book.bookss.bookNumber}}"></label>
                                <input class="check "  ng-click="selectedbook(book.shopcartRemark1,book.bookss.bookNumber,book.shopcartId)" id="{{book.bookss.bookNumber}}" name="checkbox" value="{{book.bookss.bookNumber}}" type="checkbox" checked>
                            </div>
                        </li>
                        <li class="td td-item">
                            <div class="item-pic">
                                <a href="/foreground/info?bookId={{book.bookss.bookId}}" target="_blank" class="J_MakePoint" data-point="tbcart.8.12">
                                    <img src=" ${pageContext.request.contextPath}/fileuploadpath/{{book.bookss.bookImage1}}" class="itempic J_ItemImg" width="80px" height="80px"></a>
                            </div>
                            <div class="item-info">
                                <div class="item-basic-info">
                                    <a href="/foreground/info?bookId={{book.bookss.bookId}}" target="_blank" title="{{book.bookss.bookName}}" class="item-title J_MakePoint" data-point="tbcart.8.11">{{book.bookss.bookName}}</a>
                                </div>
                            </div>
                        </li>
                        <li class="td td-info">
                            <div class="item-props item-props-can">
                            </div>
                        </li>
                        <li class="td td-price">
                            <div class="item-price price-promo-promo">
                                <div class="price-content">
                                    <div class="price-line">
                                        <em class="price-original">{{book.bookss.bookOriginalPrice}}</em>
                                    </div>
                                    <div class="price-line">
                                        <em class="J_Price price-now" tabindex="0">{{book.bookss.bookPromotionPrice}}</em>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="td td-amount">
                            <div class="amount-wrapper ">
                                <div class="item-amount ">
                                    <div class="sl">
                                        <input class="min am-btn" name="" type="button" value="-"  ng-click="down(book.bookss.bookNumber,book.shopcartId,book.shopcartCount,'${sessionScope.users.userShopCart}')" />
                                        <input class="text_box" type="text" autocomplete="off" style="width:30px;" id="{{book.bookss.bookNumber}}1" ng-model="book.shopcartCount" />
                                        <input class="add am-btn" name="" type="button" value="+"  ng-click="up(book.bookss.bookNumber,book.shopcartId,book.shopcartCount,'${sessionScope.users.userShopCart}')"  />
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="td td-sum">
                            <div class="td-inner" >
                                <em tabindex="0" class="J_ItemSum number"  id="{{book.bookss.bookNumber}}2">{{book.bookss.bookPromotionPrice*book.shopcartCount}}</em>
                            </div>
                        </li>
                        <li class="td td-op">
                            <div class="td-inner">
                                <a title="移入收藏夹" class="btn-fav" href="#">
                                    移入收藏夹</a>
                                <a class="delete" ng-click="deletecartbook(book.bookss.bookNumber,book.shopcartId,'0','${sessionScope.users.userShopCart}')">
                                    删除</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </tr>
    </div>
    <div class="clear"></div>

    <div class="float-bar-wrapper">
        <div id="J_SelectAll2" class="select-all J_SelectAll">
            <div class="cart-checkbox">
                <input class="check-all check" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox">
                <label for="J_SelectAllCbx2"></label>
            </div>
            <span>全选</span>
        </div>
        <div class="operations">
            <a href="#" hidefocus="true" class="deleteAll">删除</a>
            <a href="#" hidefocus="true" class="J_BatchFav">移入收藏夹</a>
        </div>
        <div class="float-bar-right">
            <div class="amount-sum">
                <span class="txt">已选商品</span>
                <em id="J_SelectedItemsCount">{{totalValue.totalNum}}</em><span class="txt">件</span>
                <div class="arrow-box">
                    <span class="selected-items-arrow"></span>
                    <span class="arrow"></span>
                </div>
            </div>
            <div class="price-sum">
                <span class="txt">合计:</span>
                <strong class="price">¥<em id="J_Total">{{totalValue.totalMoney}}</em></strong>
            </div>
            <div class="btn-area">
                <a href="/page/pay.jsp" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
                    <span>结&nbsp;算</span></a>
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

</div>

<!--操作页面-->

<%--<div class="theme-popover-mask"></div>

<div class="theme-popover">
    <div class="theme-span"></div>
    <div class="theme-poptit h-title">
        <a href="javascript:;" title="关闭" class="close">×</a>
    </div>
    <div class="theme-popbod dform">
        <form class="theme-signin" name="loginform" action="" method="post">

            <div class="theme-signin-left">

                <li class="theme-options">
                    <div class="cart-title">颜色：</div>
                    <ul>
                        <li class="sku-line selected">12#川南玛瑙<i></i></li>
                        <li class="sku-line">10#蜜橘色+17#樱花粉<i></i></li>
                    </ul>
                </li>
                <li class="theme-options">
                    <div class="cart-title">包装：</div>
                    <ul>
                        <li class="sku-line selected">包装：裸装<i></i></li>
                        <li class="sku-line">两支手袋装（送彩带）<i></i></li>
                    </ul>
                </li>
                <div class="theme-options">
                    <div class="cart-title number">数量</div>
                    <dd>
                        <input class="min am-btn am-btn-default" name="" type="button" value="-" />
                        <input class="text_box" name="" type="text" value="1" style="width:30px;" />
                        <input class="add am-btn am-btn-default" name="" type="button" value="+" />
                        <span  class="tb-hidden">库存<span class="stock">1000</span>件</span>
                    </dd>

                </div>
                <div class="clear"></div>
                <div class="btn-op">
                    <div class="btn am-btn am-btn-warning">确认</div>
                    <div class="btn close am-btn am-btn-warning">取消</div>
                </div>

            </div>
            <div class="theme-signin-right">
                <div class="img-info">
                    <img src="../images/kouhong.jpg_80x80.jpg" />
                </div>
                <div class="text-info">
                    <span class="J_Price price-now">¥39.00</span>
                    <span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
                </div>
            </div>

        </form>
    </div>
</div>
<!--引导 -->
<div class="navCir">
    <li><a href="home2.html"><i class="am-icon-home "></i>首页</a></li>
    <li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
    <li class="active"><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>
    <li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>
</div>--%>
</body>

</html>






<%--<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/common/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">

    <link href="${pageContext.request.contextPath}/page/common/demo.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/page/common/cartstyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/angular.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

    <script>
        var app=angular.module('myApp',[]); //定义了一个叫myApp的模块
        //定义控制器
        app.controller('myController',function($scope,$http){
            $scope.findAll=function(){
                $http.get('/shopcart/findcart').success(
                    function(response){
                        $scope.list=response;
                    }
                );
            }
        });
    </script>




</head>
<body>

<div class="site-nav-bg">
    <div class="site-nav w1200">
        <p class="sn-back-home">
            <i class="layui-icon layui-icon-home"></i>
            <a href="#">首页</a>
        </p>
        <div class="sn-quick-menu">
            <div class="login"><a href="login.html">登录</a></div>
            <div class="sp-cart"><a href="shopcart.html">购物车</a><span>2</span></div>
        </div>
    </div>
</div>



<div class="header">
    <div class="headerLayout w1200">
        <div class="headerCon">
            <h1 class="mallLogo">
                <a href="#" title="母婴商城">
                    <img src="../res/static/img/logo.png">
                </a>
            </h1>
            <div class="mallSearch">
                <form action="" class="layui-form" novalidate>
                    <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" name="" value="">
                </form>
            </div>
        </div>
    </div>
</div>


<div class="content content-nav-base shopcart-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2">
                    <a href="commodity.html" class="active">所有商品</a>
                    <a href="buytoday.html">今日团购</a>
                    <a href="information.html">母婴资讯</a>
                    <a href="about.html">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="banner-bg w1200">
        <h3>夏季清仓</h3>
        <p>宝宝被子、宝宝衣服3折起</p>
    </div>
    <div class="cart w1200">
        <div class="cart-table-th">
            <div class="th th-chk">
                <div class="select-all">
                    <div class="cart-checkbox">
                        <input class="check-all check" id="allCheckked" type="checkbox" value="true">
                    </div>
                    <label>&nbsp;&nbsp;全选</label>
                </div>
            </div>
            <div class="th th-item">
                <div class="th-inner">
                    商品
                </div>
            </div>
            <div class="th th-price">
                <div class="th-inner">
                    单价
                </div>
            </div>
            <div class="th th-amount">
                <div class="th-inner">
                    数量
                </div>
            </div>
            <div class="th th-sum">
                <div class="th-inner">
                    小计
                </div>
            </div>
            <div class="th th-op">
                <div class="th-inner">
                    操作
                </div>
            </div>
        </div>
        <div class="OrderList">
            <div class="order-content" id="list-cont" ng-app="myApp" ng-controller="myController" ng-init="findAll()" >
                <ul class="item-content layui-clear" ng-repeat="book in list">
                    <li class="th th-chk">
                        <div class="select-all">
                            <div class="cart-checkbox">
                                <input class="CheckBoxShop check" id="{{book.books.bookId}}" type="checkbox" num="all" name="select-all" value="true">
                            </div>
                        </div>
                    </li>
                    <li class="th th-item">
                        <div class="item-cont">
                            <a href="javascript:;"><img src="${pageContext.request.contextPath}/fileuploadpath/{{book.books.bookImage1}}" alt=""></a>
                            <div class="text">

                                <div class="title">{{book.books.bookName}}</div>
                            </div>
                        </div>
                    </li>
                    <li class="th th-price">
                        <span class="th-su">{{book.books.bookPromotionPrice}}</span>
                    </li>
                    <li class="th th-amount">
                        <div class="box-btn layui-clear">
                            <div class="less layui-btn">-</div>
                            <input class="Quantity-input" type="" name="" value="1" disabled="disabled">
                            <div class="add layui-btn">+</div>
                        </div>
                    </li>
                    <li class="th th-sum">
                        <span class="sum">189.00</span>
                    </li>
                    <li class="th th-op">
                        <span class="dele-btn">删除</span>
                    </li>
                </ul>



               &lt;%&ndash; <ul class="item-content layui-clear">
                    <li class="th th-chk">
                        <div class="select-all">
                            <div class="cart-checkbox">
                                <input class="CheckBoxShop check" id="" type="checkbox" num="all" name="select-all" value="true">
                            </div>
                        </div>
                    </li>
                    <li class="th th-item">
                        <div class="item-cont">
                            <a href="javascript:;"><img src="../res/static/img/paging_img2.jpg" alt=""></a>
                            <div class="text">
                                <div class="title">宝宝T恤棉质小衫</div>
                                <p><span>粉色</span>  <span>130</span>cm</p>
                            </div>
                        </div>
                    </li>
                    <li class="th th-price">
                        <span class="th-su">189.00</span>
                    </li>
                    <li class="th th-amount">
                        <div class="box-btn layui-clear">
                            <div class="less layui-btn">-</div>
                            <input class="Quantity-input" type="" name="" value="1" disabled="disabled">
                            <div class="add layui-btn">+</div>
                        </div>
                    </li>
                    <li class="th th-sum">
                        <span class="sum">189.00</span>
                    </li>
                    <li class="th th-op">
                        <span class="dele-btn">删除</span>
                    </li>
                </ul>
                <ul class="item-content layui-clear">
                    <li class="th th-chk">
                        <div class="select-all">
                            <div class="cart-checkbox">
                                <input class="CheckBoxShop check" id="" type="checkbox" num="all" name="select-all" value="true">
                            </div>
                        </div>
                    </li>
                    <li class="th th-item">
                        <div class="item-cont">
                            <a href="javascript:;"><img src="../res/static/img/paging_img3.jpg" alt=""></a>
                            <div class="text">
                                <div class="title">宝宝T恤棉质小衫</div>
                                <p><span>粉色</span>  <span>130</span>cm</p>
                            </div>
                        </div>
                    </li>
                    <li class="th th-price">
                        <span class="th-su">189.00</span>
                    </li>
                    <li class="th th-amount">
                        <div class="box-btn layui-clear">
                            <div class="less layui-btn">-</div>
                            <input class="Quantity-input" type="" name="" value="1" disabled="disabled">
                            <div class="add layui-btn">+</div>
                        </div>
                    </li>
                    <li class="th th-sum">
                        <span class="sum">189.00</span>
                    </li>
                    <li class="th th-op">
                        <span class="dele-btn">删除</span>
                    </li>
                </ul>&ndash;%&gt;
            </div>
        </div>


        <!-- 模版导入数据 -->
        <!-- <script type="text/html" id="demo">
          {{# layui.each(d.infoList,function(index,item){}}
            <ul class="item-content layui-clear">
              <li class="th th-chk">
                <div class="select-all">
                  <div class="cart-checkbox">
                    <input class="CheckBoxShop check" id="" type="checkbox" num="all" name="select-all" value="true">
                  </div>
                </div>
              </li>
              <li class="th th-item">
                <div class="item-cont">
                  <a href="javascript:;"><img src="../res/static/img/paging_img1.jpg" alt=""></a>
                  <div class="text">
                    <div class="title">宝宝T恤棉质小衫</div>
                    <p><span>粉色</span>  <span>130</span>cm</p>
                  </div>
                </div>
              </li>
              <li class="th th-price">
                <span class="th-su">189.00</span>
              </li>
              <li class="th th-amount">
                <div class="box-btn layui-clear">
                  <div class="less layui-btn">-</div>
                  <input class="Quantity-input" type="" name="" value="1" disabled="disabled">
                  <div class="add layui-btn">+</div>
                </div>
              </li>
              <li class="th th-sum">
                <span class="sum">189.00</span>
              </li>
              <li class="th th-op">
                <span class="dele-btn">删除</span>
              </li>
            </ul>
          {{# });}}
        </script> -->


        <div class="FloatBarHolder layui-clear">
            <div class="th th-chk">
                <div class="select-all">
                    <div class="cart-checkbox">
                        <input class="check-all check" id="" name="select-all" type="checkbox"  value="true">
                    </div>
                    <label>&nbsp;&nbsp;已选<span class="Selected-pieces">0</span>件</label>
                </div>
            </div>
            <div class="th batch-deletion">
                <span class="batch-dele-btn">批量删除</span>
            </div>
            <div class="th Settlement">
                <button class="layui-btn">结算</button>
            </div>
            <div class="th total">
                <p>应付：<span class="pieces-total">0</span></p>
            </div>
        </div>
    </div>



</div>

<div class="footer">
    <div class="footer-hd">
        <p>
            <a href="#">恒望科技</a>
            <b>|</b>
            <a href="#">商城首页</a>
            <b>|</b>
            <a href="#">支付宝</a>
            <b>|</b>
            <a href="#">物流</a>
        </p>
    </div>
    <div class="footer-bd">
        <p>
            <a href="#">关于恒望</a>
            <a href="#">合作伙伴</a>
            <a href="#">联系我们</a>
            <a href="#">网站地图</a>
            <em>© 2015-2025 Hengwang.com 版权所有</em>
        </p>
    </div>
</div>

<script>
    layui.config({
        base: 'page/common/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm','jquery','element','car'],function(){
        var mm = layui.mm,$ = layui.$,element = layui.element,car = layui.car;
        // 模版导入数据
        // var html = demo.innerHTML,
        // listCont = document.getElementById('list-cont');
        // mm.request({
        //   url: '../json/shopcart.json',
        //   success : function(res){
        //     listCont.innerHTML = mm.renderHtml(html,res)
        //     element.render();
        //     car.init()
        //   },
        //   error: function(res){
        //     console.log(res);
        //   }
        // })
        //
        car.init()
    });
</script>
</body>
</html>--%>
