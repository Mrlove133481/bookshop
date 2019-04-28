<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/4/19
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>商品页面</title>

    <link href="${pageContext.request.contextPath}/page/common/admin.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>

    <link href="${pageContext.request.contextPath}/page/common/demo.css" rel="stylesheet" type="text/css"/>
    <link type="text/css" href="${pageContext.request.contextPath}/page/common/optstyle.css" rel="stylesheet"/>
    <link type="text/css" href="${pageContext.request.contextPath}/page/common/style.css" rel="stylesheet"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/page/common/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/page/common/quick_links.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/page/common/amazeui.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/page/common/jquery.imagezoom.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/page/common/jquery.flexslider.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/page/common/list.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/angular.min.js"></script>
    <script>
        var app=angular.module('myApp',[]); //定义了一个叫myApp的模块
        //定义控制器
        app.controller('myController',function($scope,$http) {
            $scope.findAll = function () {
                $http.get('/foreground/selectlimit').success(
                    function (response) {
                        $scope.list = response;
                    }
                );
            }
        });
    </script>

</head>

<body ng-app="myApp" ng-controller="myController">


<!--顶部导航条 -->
<div class="am-container header">
    <ul class="message-l">
        <div class="topMessage">
            <div class="menu-hd" style="text-align: left" id="showDate" style="margin-left: -46px;">
                <script type="text/javascript">
                    $(function(){
                        setInterval("getTime();",1000); //每隔一秒运行一次
                    })
                    //取得系统当前时间
                    function getTime(){
                        var myDate = new Date();

                        var date = myDate.toLocaleDateString();
                        var year=myDate.getFullYear();
                        var month=change(myDate.getMonth()+1);
                        var day=change(myDate.getDate());
                        var hours = myDate.getHours();
                        var minutes = myDate.getMinutes();
                        var seconds = myDate.getSeconds();
                        function change(t) {
                            if (t < 10) {
                                return "0" + t;
                            } else {
                                return t;
                            }
                        }
                            $("#showDate").html("现在时间为："+year+"年"+month+"月"+day+"日 "+hours+":"+minutes+":"+seconds); //将值赋给div
                    }
                </script>
            </div>
        </div>
    </ul>
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
    <div class="logoBig" >
        <li style="margin-top:25px"><img src="${pageContext.request.contextPath}/images/logo.png" /></li>
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
<b class="line" style="border-bottom: 2px solid #b6795f;"></b>
<div class="listMain">

    <!--分类-->
    <div class="nav-table">
        <div class="long-title" style="background:#b6795f;"><span class="all-goods">全部分类</span></div>
        <div class="nav-cont">
            <ul>
                <li class="index"><a href="#">首页</a></li>
                <li class="qc"><a href="#">闪购</a></li>
                <li class="qc"><a href="#">限时抢</a></li>
                <li class="qc"><a href="#">团购</a></li>
                <li class="qc last"><a href="#">大包装</a></li>
            </ul>
        </div>
    </div>
    <ol class="am-breadcrumb am-breadcrumb-slash">
        <li><a href="#">首页</a></li>
        <li><a href="#">分类</a></li>
        <li class="am-active">内容</li>
    </ol>
    <script type="text/javascript">
        $(function () {
        });
        $(window).load(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                start: function (slider) {
                    $('body').removeClass('loading');
                }
            });
        });
    </script>
    <div class="scoll">
        <section class="slider">
            <div class="flexslider">
                <ul class="slides">
                    <li>
                        <img src="../images/01.jpg" title="pic"/>
                    </li>
                    <li>
                        <img src="../images/02.jpg"/>
                    </li>
                    <li>
                        <img src="../images/03.jpg"/>
                    </li>
                </ul>
            </div>
        </section>
    </div>

    <!--放大镜-->

    <div class="item-inform">
        <div class="clearfixLeft" id="clearcontent">

            <div class="box">
                <script type="text/javascript">
                    $(document).ready(function () {
                        $(".jqzoom").imagezoom();
                        $("#thumblist li a").click(function () {
                            $(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
                            $(".jqzoom").attr('src', $(this).find("img").attr("mid"));
                            $(".jqzoom").attr('rel', $(this).find("img").attr("big"));
                        });
                    });
                </script>

                <div class="tb-booth tb-pic tb-s310">
                    <a href="${pageContext.request.contextPath}/fileuploadpath/${book.bookImage1}"><img
                            src="${pageContext.request.contextPath}/fileuploadpath/${book.bookImage1}" alt="细节展示放大镜特效"
                            rel="${pageContext.request.contextPath}/fileuploadpath/${book.bookImage1}" class="jqzoom"/></a>
                </div>
                <ul class="tb-thumb" id="thumblist">
                    <li class="tb-selected">
                        <div class="tb-pic tb-s40">
                            <a href="#"><img src="${pageContext.request.contextPath}/fileuploadpath/${book.bookImage1}"
                                             mid="${pageContext.request.contextPath}/fileuploadpath/${book.bookImage1}"
                                             big="${pageContext.request.contextPath}/fileuploadpath/${book.bookImage1}"></a>
                        </div>
                    </li>
                    <li>
                        <div class="tb-pic tb-s40">
                            <a href="#"><img src="${pageContext.request.contextPath}/fileuploadpath/${book.bookImage2}"
                                             mid="${pageContext.request.contextPath}/fileuploadpath/${book.bookImage2}"
                                             big="${pageContext.request.contextPath}/fileuploadpath/${book.bookImage2}"></a>
                        </div>
                    </li>
                    <li>
                        <div class="tb-pic tb-s40">
                            <a href="#"><img src="${pageContext.request.contextPath}/fileuploadpath/${book.bookImage3}"
                                             mid="${pageContext.request.contextPath}/fileuploadpath/${book.bookImage3}"
                                             big="${pageContext.request.contextPath}/fileuploadpath/${book.bookImage3}"></a>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="clear"></div>
        </div>

        <div class="clearfixRight">

            <!--规格属性-->
            <!--名称-->
            <div class="tb-detail-hd">
                <h1>
                    ${book.bookName}
                </h1>
            </div>
            <div class="tb-detail-list">
                <!--价格-->
                <div class="tb-detail-price">
                    <li class="price iteminfo_price">
                        <dt>促销价</dt>
                        <dd><em>¥</em><b class="sys_item_price">${book.bookPromotionPrice}</b></dd>
                    </li>
                    <li class="price iteminfo_mktprice">
                        <dt>原价</dt>
                        <dd><em>¥</em><b class="sys_item_mktprice">${book.bookOriginalPrice}</b></dd>
                    </li>
                    <div class="clear"></div>
                </div>

                <!--销量-->
                <ul class="tm-ind-panel">
                    <li class="tm-ind-item tm-ind-sellCount canClick">
                        <div class="tm-indcon"><span class="tm-label">月销量</span><span
                                class="tm-count">${book.bookMonthlySales}</span></div>
                    </li>
                    <li class="tm-ind-item tm-ind-sumCount canClick">
                        <div class="tm-indcon"><span class="tm-label">累计销量</span><span
                                class="tm-count">${book.bookTotalSales}</span></div>
                    </li>
                    <li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
                        <div class="tm-indcon"><span class="tm-label">累计评价</span><span class="tm-count">640</span></div>
                    </li>
                </ul>
                <div class="clear"></div>

                <!--各种规格-->
                <dl class="iteminfo_parameter sys_item_specpara">
                    <dd>
                        <!--操作页面-->
                        <div class="theme-popover-mask"></div>
                        <div class="theme-popover">
                            <div class="theme-span"></div>
                            <div class="theme-poptit">
                                <a href="javascript:;" title="关闭" class="close">×</a>
                            </div>
                            <div class="theme-popbod dform">
                                <form class="theme-signin" name="loginform" action="" method="post">

                                    <div class="theme-signin-left">

                                        <div class="theme-options">
                                            <div class="cart-title">概述：</div>
                                            <ul id="J_AttrUL1" style="padding: 5px 0px 50px;">
                                                <li title="" style="margin: 5px 20px 0px 0px;">
                                                    作者:&nbsp;${book.bookAuthor}</li>
                                                <li title="" style="margin: 10px 20px 0px 0px;">
                                                    出版社:&nbsp;${book.bookPress}</li>
                                                <li title="" style="margin: 10px 20px 0px 0px;">
                                                    出版年份:&nbsp;${book.bookPublicationYear}</li>
                                            </ul>
                                        </div>
                                        <%--  <div class="theme-options">
                                              <div class="cart-title">出版社</div>
                                              <ul>
                                                  ${book.bookPress}
                                              </ul>
                                          </div>
                                          <div class="theme-options">--%>
                                        <div class="cart-title number">数量</div>
                    <dd style="margin-top: 5px">
                        <input id="min" class="am-btn am-btn-default" name="" type="button" value="-"/>
                        <input id="text_box" name="" type="text" value="1" style="width:30px;"/>
                        <input id="add" class="am-btn am-btn-default" name="" type="button" value="+"/>
                        <span id="Stock" class="tb-hidden">库存<span class="stock">${book.bookInventory}</span>件</span>
                    </dd>

            </div>
            <%--  <div class="clear"></div>

              <div class="btn-op">
                  <div class="btn am-btn am-btn-warning">确认</div>
                  <div class="btn close am-btn am-btn-warning">取消</div>
              </div>
          </div>
          <div class="theme-signin-right">
              <div class="img-info">
                  <img src="../images/songzi.jpg" />
              </div>
              <div class="text-info">
                  <span class="J_Price price-now">¥39.00</span>
                  <span id="Stock1" class="tb-hidden">库存<span class="stock">1000</span>件</span>
              </div>
          </div>--%>

            </form>
        </div>
    </div>

    </dd>
    </dl>
    <div class="clear"></div>
    <!--活动	-->
    <div class="shopPromotion gold">
        <div class="hot">
            <dt class="tb-metatit">店铺优惠</dt>
            <div class="gold-list">
                <p>购物满2件打8折，满3件7折</p>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>

<div class="pay">
    <div class="pay-opt">
        <a href="home.html"><span class="am-icon-home am-icon-fw">首页</span></a>
        <a><span class="am-icon-heart am-icon-fw">收藏</span></a>

    </div>
    <li style="margin-left: 50px">
        <div class="clearfix tb-btn tb-btn-buy theme-login" style="margin-left: 0px;">
            <a id="LikBuy" title="点此按钮到下一步确认购买信息" href="#">立即购买</a>
        </div>
    </li>
    <li style="margin-left: 50px">
        <div class="clearfix tb-btn tb-btn-basket theme-login"  style="margin-left: 0px;">
            <a id="LikBasket" title="加入购物车" href="#"><i></i>加入购物车</a>
        </div>
    </li>
</div>

</div>

<div class="clear"></div>

</div>

<!-- introduce-->

<div class="introduce">
    <div class="browse">
        <div class="mc">
            <ul ng-init="findAll()">
                <div class="mt">
                    <h2>看了又看</h2>
                </div>

                <li ng-repeat="book in list">
                    <div class="p-img">
                        <a href="/foreground/info?bookId={{book.bookId}}"> <img class="" src="${pageContext.request.contextPath}/fileuploadpath/{{book.bookImage1}}"> </a>
                    </div>
                    <div class="p-name"><a href="/foreground/info?bookId={{book.bookId}}">
                        {{book.bookName}}
                    </a>
                    </div>
                    <div class="p-price"><strong>￥{{book.bookPromotionPrice}}</strong></div>
                </li>
            </ul>
        </div>
    </div>
    <div class="introduceMain">
        <div class="am-tabs" data-am-tabs>
            <ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active">
                    <a href="#">
                        <span class="index-needs-dt-txt">宝贝详情</span></a>
                </li>

                <li>
                    <a href="#">
                        <span class="index-needs-dt-txt">全部评价</span></a>
                </li>
            </ul>

            <div class="am-tabs-bd">

                <div class="am-tab-panel am-fade am-in am-active">
                    <div class="J_Brand">
                        <div class="attr-list-hd tm-clear">
                            <h4>内容简介：</h4></div>
                        <div class="clear"></div>
                        <div class="J_TbcRate_ReviewContent tb-tbcr-content " style="text-align: left">
                                <input type="hidden" name="bookPlotSummary" value=" ${book.bookPlotSummary}" id="bookPlotSummary">
                                <script>
                                    document.write($("#bookPlotSummary").val().replace(/\n/g, '<br />'));
                                </script>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="details">
                        <div class="attr-list-hd after-market-hd">
                            <h4>图书特色</h4>
                        </div>
                        <div class="twlistNews">
                            <img src="${pageContext.request.contextPath}/fileuploadpath/${book.bookRemark1}"/>
                        </div>
                    </div>
                    <div class="J_Brand">
                        <div class="attr-list-hd tm-clear">
                            <h4>作者简介：</h4></div>
                        <div class="clear"></div>
                        <div class="J_TbcRate_ReviewContent tb-tbcr-content " style="text-align: left">
                            <input type="hidden" name="bookBiography" value=" ${book.bookBiography}" id="bookBiography">
                            <script>
                                document.write($("#bookBiography").val().replace(/\n/g, '<br />'));
                            </script>

                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="J_Brand">
                        <div class="attr-list-hd tm-clear">
                            <h4>目录：</h4></div>
                        <div class="clear"></div>
                        <div class="J_TbcRate_ReviewContent tb-tbcr-content " style="text-align: left">
                            <input type="hidden" name="bookCatalog" value="${book.bookCatalog}" id="bookCatalog">
                            <script>
                                document.write($("#bookCatalog").val().replace(/\n/g, '<br />'));
                            </script>

                        </div>
                        <div class="clear"></div>
                    </div>

                    <div class="clear"></div>
                </div>

                <div class="am-tab-panel am-fade">

                    <div class="actor-new">
                        <div class="rate">
                            <strong>100<span>%</span></strong><br> <span>好评度</span>
                        </div>
                        <dl>
                            <dt>买家印象</dt>
                            <dd class="p-bfc">
                                <q class="comm-tags"><span>味道不错</span><em>(2177)</em></q>
                                <q class="comm-tags"><span>颗粒饱满</span><em>(1860)</em></q>
                                <q class="comm-tags"><span>口感好</span><em>(1823)</em></q>
                                <q class="comm-tags"><span>商品不错</span><em>(1689)</em></q>
                                <q class="comm-tags"><span>香脆可口</span><em>(1488)</em></q>
                                <q class="comm-tags"><span>个个开口</span><em>(1392)</em></q>
                                <q class="comm-tags"><span>价格便宜</span><em>(1119)</em></q>
                                <q class="comm-tags"><span>特价买的</span><em>(865)</em></q>
                                <q class="comm-tags"><span>皮很薄</span><em>(831)</em></q>
                            </dd>
                        </dl>
                    </div>
                    <div class="clear"></div>
                    <div class="tb-r-filter-bar">
                        <ul class=" tb-taglist am-avg-sm-4">
                            <li class="tb-taglist-li tb-taglist-li-current">
                                <div class="comment-info">
                                    <span>全部评价</span>
                                    <span class="tb-tbcr-num">(32)</span>
                                </div>
                            </li>

                            <li class="tb-taglist-li tb-taglist-li-1">
                                <div class="comment-info">
                                    <span>好评</span>
                                    <span class="tb-tbcr-num">(32)</span>
                                </div>
                            </li>

                            <li class="tb-taglist-li tb-taglist-li-0">
                                <div class="comment-info">
                                    <span>中评</span>
                                    <span class="tb-tbcr-num">(32)</span>
                                </div>
                            </li>

                            <li class="tb-taglist-li tb-taglist-li--1">
                                <div class="comment-info">
                                    <span>差评</span>
                                    <span class="tb-tbcr-num">(32)</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="clear"></div>

                    <ul class="am-comments-list am-comments-list-flip">
                        <li class="am-comment">
                            <!-- 评论容器 -->
                            <a href="">
                                <img class="am-comment-avatar" src="../images/hwbn40x40.jpg"/>
                                <!-- 评论者头像 -->
                            </a>

                            <div class="am-comment-main">
                                <!-- 评论内容容器 -->
                                <header class="am-comment-hd">
                                    <!--<h3 class="am-comment-title">评论标题</h3>-->
                                    <div class="am-comment-meta">
                                        <!-- 评论元数据 -->
                                        <a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
                                        <!-- 评论者 -->
                                        评论于
                                        <time datetime="">2015年11月02日 17:46</time>
                                    </div>
                                </header>

                                <div class="am-comment-bd">
                                    <div class="tb-rev-item " data-id="255776406962">
                                        <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                            摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                        </div>
                                        <div class="tb-r-act-bar">
                                            颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                        </div>
                                    </div>

                                </div>
                                <!-- 评论内容 -->
                            </div>
                        </li>
                        <li class="am-comment">
                            <!-- 评论容器 -->
                            <a href="">
                                <img class="am-comment-avatar" src="../images/hwbn40x40.jpg"/>
                                <!-- 评论者头像 -->
                            </a>

                            <div class="am-comment-main">
                                <!-- 评论内容容器 -->
                                <header class="am-comment-hd">
                                    <!--<h3 class="am-comment-title">评论标题</h3>-->
                                    <div class="am-comment-meta">
                                        <!-- 评论元数据 -->
                                        <a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
                                        <!-- 评论者 -->
                                        评论于
                                        <time datetime="">2015年10月28日 11:33</time>
                                    </div>
                                </header>

                                <div class="am-comment-bd">
                                    <div class="tb-rev-item " data-id="255095758792">
                                        <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                            没有色差，很暖和……美美的
                                        </div>
                                        <div class="tb-r-act-bar">
                                            颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
                                        </div>
                                    </div>

                                </div>
                                <!-- 评论内容 -->
                            </div>
                        </li>
                        <li class="am-comment">
                            <!-- 评论容器 -->
                            <a href="">
                                <img class="am-comment-avatar" src="../images/hwbn40x40.jpg"/>
                                <!-- 评论者头像 -->
                            </a>

                            <div class="am-comment-main">
                                <!-- 评论内容容器 -->
                                <header class="am-comment-hd">
                                    <!--<h3 class="am-comment-title">评论标题</h3>-->
                                    <div class="am-comment-meta">
                                        <!-- 评论元数据 -->
                                        <a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
                                        <!-- 评论者 -->
                                        评论于
                                        <time datetime="">2015年11月02日 17:46</time>
                                    </div>
                                </header>

                                <div class="am-comment-bd">
                                    <div class="tb-rev-item " data-id="255776406962">
                                        <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                            摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                        </div>
                                        <div class="tb-r-act-bar">
                                            颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                        </div>
                                    </div>

                                </div>
                                <!-- 评论内容 -->
                            </div>
                        </li>
                        <li class="am-comment">
                            <!-- 评论容器 -->
                            <a href="">
                                <img class="am-comment-avatar" src="../images/hwbn40x40.jpg"/>
                                <!-- 评论者头像 -->
                            </a>

                            <div class="am-comment-main">
                                <!-- 评论内容容器 -->
                                <header class="am-comment-hd">
                                    <!--<h3 class="am-comment-title">评论标题</h3>-->
                                    <div class="am-comment-meta">
                                        <!-- 评论元数据 -->
                                        <a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
                                        <!-- 评论者 -->
                                        评论于
                                        <time datetime="">2015年11月25日 12:48</time>
                                    </div>
                                </header>

                                <div class="am-comment-bd">
                                    <div class="tb-rev-item " data-id="258040417670">
                                        <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                            式样不错，初冬穿
                                        </div>
                                        <div class="tb-r-act-bar">
                                            颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
                                        </div>
                                    </div>
                                </div>
                                <!-- 评论内容 -->
                            </div>
                        </li>

                        <li class="am-comment">
                            <!-- 评论容器 -->
                            <a href="">
                                <img class="am-comment-avatar" src="../images/hwbn40x40.jpg"/>
                                <!-- 评论者头像 -->
                            </a>

                            <div class="am-comment-main">
                                <!-- 评论内容容器 -->
                                <header class="am-comment-hd">
                                    <!--<h3 class="am-comment-title">评论标题</h3>-->
                                    <div class="am-comment-meta">
                                        <!-- 评论元数据 -->
                                        <a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
                                        <!-- 评论者 -->
                                        评论于
                                        <time datetime="">2015年11月02日 17:46</time>
                                    </div>
                                </header>

                                <div class="am-comment-bd">
                                    <div class="tb-rev-item " data-id="255776406962">
                                        <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                            摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                        </div>
                                        <div class="tb-r-act-bar">
                                            颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                        </div>
                                    </div>

                                </div>
                                <!-- 评论内容 -->
                            </div>
                        </li>
                        <li class="am-comment">
                            <!-- 评论容器 -->
                            <a href="">
                                <img class="am-comment-avatar" src="../images/hwbn40x40.jpg"/>
                                <!-- 评论者头像 -->
                            </a>

                            <div class="am-comment-main">
                                <!-- 评论内容容器 -->
                                <header class="am-comment-hd">
                                    <!--<h3 class="am-comment-title">评论标题</h3>-->
                                    <div class="am-comment-meta">
                                        <!-- 评论元数据 -->
                                        <a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
                                        <!-- 评论者 -->
                                        评论于
                                        <time datetime="">2015年10月28日 11:33</time>
                                    </div>
                                </header>

                                <div class="am-comment-bd">
                                    <div class="tb-rev-item " data-id="255095758792">
                                        <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                            没有色差，很暖和……美美的
                                        </div>
                                        <div class="tb-r-act-bar">
                                            颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
                                        </div>
                                    </div>

                                </div>
                                <!-- 评论内容 -->
                            </div>
                        </li>
                        <li class="am-comment">
                            <!-- 评论容器 -->
                            <a href="">
                                <img class="am-comment-avatar" src="../images/hwbn40x40.jpg"/>
                                <!-- 评论者头像 -->
                            </a>

                            <div class="am-comment-main">
                                <!-- 评论内容容器 -->
                                <header class="am-comment-hd">
                                    <!--<h3 class="am-comment-title">评论标题</h3>-->
                                    <div class="am-comment-meta">
                                        <!-- 评论元数据 -->
                                        <a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
                                        <!-- 评论者 -->
                                        评论于
                                        <time datetime="">2015年11月02日 17:46</time>
                                    </div>
                                </header>

                                <div class="am-comment-bd">
                                    <div class="tb-rev-item " data-id="255776406962">
                                        <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                            摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                        </div>
                                        <div class="tb-r-act-bar">
                                            颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                        </div>
                                    </div>

                                </div>
                                <!-- 评论内容 -->
                            </div>
                        </li>
                        <li class="am-comment">
                            <!-- 评论容器 -->
                            <a href="">
                                <img class="am-comment-avatar" src="../images/hwbn40x40.jpg"/>
                                <!-- 评论者头像 -->
                            </a>

                            <div class="am-comment-main">
                                <!-- 评论内容容器 -->
                                <header class="am-comment-hd">
                                    <!--<h3 class="am-comment-title">评论标题</h3>-->
                                    <div class="am-comment-meta">
                                        <!-- 评论元数据 -->
                                        <a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
                                        <!-- 评论者 -->
                                        评论于
                                        <time datetime="">2015年11月25日 12:48</time>
                                    </div>
                                </header>

                                <div class="am-comment-bd">
                                    <div class="tb-rev-item " data-id="258040417670">
                                        <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                            式样不错，初冬穿
                                        </div>
                                        <div class="tb-r-act-bar">
                                            颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
                                        </div>
                                    </div>
                                </div>
                                <!-- 评论内容 -->
                            </div>
                        </li>
                        <li class="am-comment">
                            <!-- 评论容器 -->
                            <a href="">
                                <img class="am-comment-avatar" src="../images/hwbn40x40.jpg"/>
                                <!-- 评论者头像 -->
                            </a>

                            <div class="am-comment-main">
                                <!-- 评论内容容器 -->
                                <header class="am-comment-hd">
                                    <!--<h3 class="am-comment-title">评论标题</h3>-->
                                    <div class="am-comment-meta">
                                        <!-- 评论元数据 -->
                                        <a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
                                        <!-- 评论者 -->
                                        评论于
                                        <time datetime="">2015年11月02日 17:46</time>
                                    </div>
                                </header>

                                <div class="am-comment-bd">
                                    <div class="tb-rev-item " data-id="255776406962">
                                        <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                            摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                        </div>
                                        <div class="tb-r-act-bar">
                                            颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                        </div>
                                    </div>

                                </div>
                                <!-- 评论内容 -->
                            </div>
                        </li>
                        <li class="am-comment">
                            <!-- 评论容器 -->
                            <a href="">
                                <img class="am-comment-avatar" src="../images/hwbn40x40.jpg"/>
                                <!-- 评论者头像 -->
                            </a>

                            <div class="am-comment-main">
                                <!-- 评论内容容器 -->
                                <header class="am-comment-hd">
                                    <!--<h3 class="am-comment-title">评论标题</h3>-->
                                    <div class="am-comment-meta">
                                        <!-- 评论元数据 -->
                                        <a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
                                        <!-- 评论者 -->
                                        评论于
                                        <time datetime="">2015年10月28日 11:33</time>
                                    </div>
                                </header>

                                <div class="am-comment-bd">
                                    <div class="tb-rev-item " data-id="255095758792">
                                        <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                            没有色差，很暖和……美美的
                                        </div>
                                        <div class="tb-r-act-bar">
                                            颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
                                        </div>
                                    </div>

                                </div>
                                <!-- 评论内容 -->
                            </div>
                        </li>
                        <li class="am-comment">
                            <!-- 评论容器 -->
                            <a href="">
                                <img class="am-comment-avatar" src="../images/hwbn40x40.jpg"/>
                                <!-- 评论者头像 -->
                            </a>

                            <div class="am-comment-main">
                                <!-- 评论内容容器 -->
                                <header class="am-comment-hd">
                                    <!--<h3 class="am-comment-title">评论标题</h3>-->
                                    <div class="am-comment-meta">
                                        <!-- 评论元数据 -->
                                        <a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
                                        <!-- 评论者 -->
                                        评论于
                                        <time datetime="">2015年11月02日 17:46</time>
                                    </div>
                                </header>

                                <div class="am-comment-bd">
                                    <div class="tb-rev-item " data-id="255776406962">
                                        <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                            摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                        </div>
                                        <div class="tb-r-act-bar">
                                            颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                        </div>
                                    </div>

                                </div>
                                <!-- 评论内容 -->
                            </div>
                        </li>
                        <li class="am-comment">
                            <!-- 评论容器 -->
                            <a href="">
                                <img class="am-comment-avatar" src="../images/hwbn40x40.jpg"/>
                                <!-- 评论者头像 -->
                            </a>

                            <div class="am-comment-main">
                                <!-- 评论内容容器 -->
                                <header class="am-comment-hd">
                                    <!--<h3 class="am-comment-title">评论标题</h3>-->
                                    <div class="am-comment-meta">
                                        <!-- 评论元数据 -->
                                        <a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
                                        <!-- 评论者 -->
                                        评论于
                                        <time datetime="">2015年11月25日 12:48</time>
                                    </div>
                                </header>

                                <div class="am-comment-bd">
                                    <div class="tb-rev-item " data-id="258040417670">
                                        <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                            式样不错，初冬穿
                                        </div>
                                        <div class="tb-r-act-bar">
                                            颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
                                        </div>
                                    </div>
                                </div>
                                <!-- 评论内容 -->
                            </div>
                        </li>

                    </ul>

                    <div class="clear"></div>

                    <!--分页 -->
                    <ul class="am-pagination am-pagination-right">
                        <li class="am-disabled"><a href="#">&laquo;</a></li>
                        <li class="am-active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>
                    <div class="clear"></div>

                    <div class="tb-reviewsft">
                        <div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。
                        </div>
                    </div>

                </div>

            </div>

        </div>

        <div class="clear"></div>

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

</div>
</div>

</body>

</html>