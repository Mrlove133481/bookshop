<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/3/18
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="ie6"> <![endif]-->
<!--[if IE 7 ]>    <html class="ie7"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en" class=""><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Mrlove书城主页</title>
    <jsp:include page="${pageContext.request.contextPath}/page/common/css.jsp"/>
    <script src="${pageContext.request.contextPath}/page/common/angular.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <style type="text/css">
        div#gray{
        //背景颜色
        background : black;
        //设置透明度
        opacity : 0.55;
            filter : alpha(opacity=55);
            position : absolute;
            top : 0px;
            left : 0px;
        }
    </style>

    <script>
        var app=angular.module('myApp',[]); //定义了一个叫myApp的模块
        //定义控制器
        app.controller('myController',function($scope,$http) {
            //查找图书
            $scope.findAll = function () {
                $http.get('/foreground/selectlimit').success(
                    function (response) {
                        $scope.list = response;
                    }
                );
            };
            //添加到购物车
            $scope.addbook = function (bookNumber,userId,shopcartId,bookCount) {
                console.log(bookNumber+" "+userId+" "+shopcartId+" "+bookCount);
                $http.get('/shopcart/addbook?bookNumber='+bookNumber+'&userId='+userId+'&shopcartId='+shopcartId+'&bookCount='+bookCount).success(
                    function (response) {
                        if(response.success){
                            layer.msg("添加成功！",{time:700},{offset: 'rt'},function () {
                                layer.close(index);
                            })
                        }else {
                            layer.msg("添加失败！",{time:700},{offset: 'rt'},function () {
                                layer.close(index);
                            })
                        }
                    }
                );
            };
        });
    </script>

</head>

<body data-offset="200" data-spy="scroll" data-target=".ow-navigation" ng-app="myApp" ng-controller="myController" >
<div class="main-container">
    <!-- Loader -->
    <div id="site-loader" class="load-complete">
        <div class="loader">
            <div class="loader-inner ball-clip-rotate">
                <div></div>
            </div>
        </div>
    </div><!-- Loader /- -->
    <!-- Header -->
    <header class="header-section container-fluid no-padding">
        <!-- Menu Block -->
        <div class="container-fluid no-padding menu-block">
            <!-- Container -->
            <div class="container">
                <!-- nav -->
                <nav class="navbar navbar-default ow-navigation">
                    <div class="navbar-header">
                        <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a href="${pageContext.request.contextPath}/page/index.jsp" class="navbar-brand">Mrlove <span>书城</span></a>
                    </div>
                    <!-- Menu Icon -->
                       <div class="menu-icon">
                           <div class="search" style="margin-top: 15px;">
                               <a href="#" id="search" title="搜索"><i class="icon icon-Search"></i></a>
                            </div>
                           <%--登录后显示--%>
                           <ul id="after-ul" style="display: none"  class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list" >
                               <li class="am-dropdown" data-am-dropdown="" data-am-dropdown-toggle="">
                                       <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                                           <span class="tpl-header-list-user-nick">${user.userName}</span><span class="tpl-header-list-user-ico"> <img src="${pageContext.request.contextPath}/fileuploadpath/useravatar/${sessionScope.userimgs}"></span>
                                       </a>
                                       <ul class="am-dropdown-content">
                                           <li><a href="#"><span class="am-icon-bell-o"></span>个人中心</a></li>
                                           <li><a href="/logout"><span class="am-icon-power-off"></span> 退出</a></li>
                                       </ul>
                               </li>
                           </ul>
                            <%--登录前显示--%>
                           <ul   id="before-ul" class="am-topbar-nav am-topbar-right" >
                               <li class="am-dropdown" data-am-dropdown="" data-am-dropdown-toggle="">
                                   <text style="font-size:15px">请</text>
                                   <a href="${pageContext.request.contextPath}/page/login.jsp" style="padding-right:0px">登录</a>
                                   <text style="font-size:15px">,或者</text>
                                   <a href="${pageContext.request.contextPath}/page/register.jsp" style="padding-right:0px">注册</a>
                               </li>
                           </ul>
                        </div>
                    <!-- Menu Icon /- -->
                    <div class="navbar-collapse collapse navbar-right" id="navbar">
                        <ul class="nav navbar-nav">
                            <li><a href="${pageContext.request.contextPath}/page/index.jsp">主页</a></li>
                            <li><a href="/page/shopcart.jsp">购物车</a></li>
                            <li><a href="checkout.html">结账</a></li>
                            <li><a href="${pageContext.request.contextPath}/page/about.jsp">关于我</a></li>
                            <li><a href="contact-us.html">联系我</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </nav>
                <!-- nav /- -->
                <!-- Search Box -->
                <div class="search-box">
                    <span><i class="icon_close"></i></span>
                    <form><input type="text" class="form-control" placeholder="输入关键字并按Enter" /></form>
                </div>
                <!-- Search Box /- -->
            </div><!-- Container /- -->
        </div>
        <!-- Menu Block /- -->
    </header>
    <%--<jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/header.jsp"/>--%>
    <!-- Header /- -->
    <main>
        <!-- Slider Section 1 -->
        <div id="home-revslider" class="slider-section container-fluid no-padding">
            <!-- START REVOLUTION SLIDER 5.0 -->
            <div class="rev_slider_wrapper">
                <div id="home-slider1" class="rev_slider" data-version="5.0">
                    <ul>
                        <li data-transition="zoomout" data-slotamount="default"  data-easein="easeInOut" data-easeout="easeInOut" data-masterspeed="2000" data-rotate="0"  data-fstransition="fade" data-fsmasterspeed="1500" data-fsslotamount="7">
                            <img src="${pageContext.request.contextPath}/images/mrlove_index_fengmian1.jpg" alt="slider" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                            <div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-1"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-200','-130','-110','-80']"
                                 data-fontsize="['38','30','25','16']"
                                 data-lineheight="['24','24','24','24']"
                                 data-width="none"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_in="y:-50px;opacity:0;s:1000;e:Power4.easeOut;"
                                 data-transform_out="opacity:0;s:3000;e:Power4.easeIn;s:3000;e:Power4.easeIn;"
                                 data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                                 data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                                 data-start="1000"
                                 data-splitin="chars"
                                 data-splitout="none"
                                 data-responsive_offset="on"
                                 data-elementdelay="0.05"
                                 style="z-index: 5; white-space: nowrap; letter-spacing: 3.04px; color:#333; font-weight: 700; font-family: 'Montserrat', sans-serif; text-transform: uppercase;">这里是你心灵的栖息之所
                            </div>
                            <div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-2"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-135','-80','-60','-50']"
                                 data-fontsize="['18','18','18','14']"
                                 data-lineheight="['26','26','26','26']"
                                 data-width="['750','750','738','450']"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;"
                                 data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                                 data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                                 data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                                 data-start="1000"
                                 data-splitin="chars"
                                 data-splitout="none"
                                 data-responsive_offset="on"
                                 data-elementdelay="0.05"
                                 style="z-index: 5; white-space: nowrap; letter-spacing: 1.5px; color:#777; font-weight: normal; font-family: 'Lato', sans-serif;">如果米饭可以保证你健康的身体，那么书籍将是你做好的精神粮食，补充你的知识
                            </div>
                            <div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-3"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-110','-50','-35','-30']"
                                 data-fontsize="['18','18','18','14']"
                                 data-lineheight="['26','26','26','26']"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;"
                                 data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                                 data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                                 data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                                 data-start="1000"
                                 data-splitin="chars"
                                 data-splitout="none"
                                 data-responsive_offset="on"
                                 data-elementdelay="0.05"
                                 style="z-index: 5; white-space: nowrap; letter-spacing: 1.5px; color:#777; font-weight: normal; font-family: 'Lato', sans-serif;">永远不要忘记学习的乐趣，这里有诗和远方
                            </div>
                            <div class="tp-caption NotGeneric-Button rev-btn  rs-parallaxlevel-0" id="slide-layer-4"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-30','20','40','30']"
                                 data-fontsize="['14','14','14','12']"
                                 data-lineheight="['24','24','24','24']"
                                 data-width="none"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_hover="o:1;rX:0;rY:0;rZ:0;z:0;s:100;e:Power1.easeInOut;"
                                 data-style_hover="c:rgb(255, 255, 255);bg:rgba(182, 121, 95);"
                                 data-transform_in="x:[-100%];z:0;rX:0deg;rY:0deg;rZ:0deg;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2500;e:Power3.easeInOut;"
                                 data-transform_out="auto:auto;s:1000;e:Power2.easeInOut;"
                                 data-start="2000"
                                 data-splitin="none"
                                 data-splitout="none"
                                 data-actions='[{"event":"click","action":"scrollbelow","offset":"0px"}]'
                                 data-responsive_offset="on"
                                 data-responsive="off"
                                 style="z-index: 10; padding:8px 38px; letter-spacing:0.56px; color: #b6795f; border-color: #b6795f; font-family: 'Montserrat', sans-serif; text-transform:uppercase; background-color:transparent; white-space: nowrap;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;">漫步在书的海洋吧
                            </div>
                        </li>
                        <li data-transition="zoomout" data-slotamount="default"  data-easein="easeInOut" data-easeout="easeInOut" data-masterspeed="2000" data-rotate="0"  data-fstransition="fade" data-fsmasterspeed="1500" data-fsslotamount="7">
                            <img src="${pageContext.request.contextPath}/images/mrlove_index_fengmian2.jpg" alt="slider" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                            <div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-5"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-200','-130','-110','-80']"
                                 data-fontsize="['38','30','25','16']"
                                 data-lineheight="['24','24','24','24']"
                                 data-width="none"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_in="y:-50px;opacity:0;s:1000;e:Power4.easeOut;"
                                 data-transform_out="opacity:0;s:3000;e:Power4.easeIn;s:3000;e:Power4.easeIn;"
                                 data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                                 data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                                 data-start="1000"
                                 data-splitin="chars"
                                 data-splitout="none"
                                 data-responsive_offset="on"
                                 data-elementdelay="0.05"
                                 style="z-index: 5; white-space: nowrap; letter-spacing: 3.04px; color:#333; font-weight: 700; font-family: 'Montserrat', sans-serif; text-transform: uppercase;">最美的书籍在这等你
                            </div>
                            <div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-6"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-135','-80','-60','-50']"
                                 data-fontsize="['18','18','18','14']"
                                 data-lineheight="['26','26','26','26']"
                                 data-width="['750','750','738','450']"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;"
                                 data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                                 data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                                 data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                                 data-start="1000"
                                 data-splitin="chars"
                                 data-splitout="none"
                                 data-responsive_offset="on"
                                 data-elementdelay="0.05"
                                 style="z-index: 5; white-space: nowrap; letter-spacing: 1.5px; color:#777; font-weight: normal; font-family: 'Lato', sans-serif;">每本书带给你的都是一份改变，阅读丰富的不只是你的知识，也许充实的是你的整个人生
                            </div>
                            <div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0" id="slide-layer-7"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-110','-50','-35','-30']"
                                 data-fontsize="['18','18','18','14']"
                                 data-lineheight="['26','26','26','26']"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;"
                                 data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                                 data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                                 data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                                 data-start="1000"
                                 data-splitin="chars"
                                 data-splitout="none"
                                 data-responsive_offset="on"
                                 data-elementdelay="0.05"
                                 style="z-index: 5; white-space: nowrap; letter-spacing: 1.5px; color:#777; font-weight: normal; font-family: 'Lato', sans-serif;">快乐其实很简单，惊喜永远在下一秒
                            </div>
                            <div class="tp-caption NotGeneric-Button rev-btn  rs-parallaxlevel-0" id="slide-layer-8"
                                 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                                 data-y="['middle','middle','middle','middle']" data-voffset="['-30','20','40','30']"
                                 data-fontsize="['14','14','14','12']"
                                 data-lineheight="['24','24','24','24']"
                                 data-width="none"
                                 data-height="none"
                                 data-whitespace="nowrap"
                                 data-transform_idle="o:1;"
                                 data-transform_hover="o:1;rX:0;rY:0;rZ:0;z:0;s:100;e:Power1.easeInOut;"
                                 data-style_hover="c:rgb(255, 255, 255);bg:rgba(182, 121, 95);"
                                 data-transform_in="x:[-100%];z:0;rX:0deg;rY:0deg;rZ:0deg;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2500;e:Power3.easeInOut;"
                                 data-transform_out="auto:auto;s:1000;e:Power2.easeInOut;"
                                 data-start="2000"
                                 data-splitin="none"
                                 data-splitout="none"
                                 data-actions='[{"event":"click","action":"scrollbelow","offset":"0px"}]'
                                 data-responsive_offset="on"
                                 data-responsive="off"
                                 style="z-index: 10; padding:8px 38px; letter-spacing:0.56px; color: #b6795f; border-color: #b6795f; font-family: 'Montserrat', sans-serif; text-transform:uppercase; background-color:transparent; white-space: nowrap;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;">开启潘多拉魔盒
                            </div>
                        </li>
                    </ul>
                </div><!-- END REVOLUTION SLIDER -->
            </div><!-- END OF SLIDER WRAPPER -->
            <div class="goto-next"><a href="#category-section"><i class="icon icon-Mouse bounce"></i></a></div>
        </div><!-- Slider Section 1 /- -->

        <!-- Services Section -->
        <div class="services-section container-fluid">
            <!-- Container -->
            <div class="container">
                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="srv-box">
                        <i class="icon icon-Truck"></i><h5>免费邮寄</h5><i class="icon icon-Dollar"></i>
                        <span class="icon_close"></span>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="srv-box">
                        <i class="icon icon-Goto"></i><h5>极速退款</h5><i class="icon icon-Dollars"></i>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="srv-box">
                        <i class="icon icon-Headset"></i><h5>24/7 电话热线</h5><i class="icon icon-Timer"></i>
                    </div>
                </div>
            </div><!-- Container /- -->
        </div><!-- Services Section /- -->

        <!-- Category Section -->
        <div id="category-section" class="category-section container-fluid no-padding">
            <div class="category-carousel">
                <div class="col-md-12 col-sm-12 col-xs-12 no-padding">
                    <div class="category-box layout-3">
                        <img src="${pageContext.request.contextPath}/images/mrlove_index_quanbu.jpg" alt="category" />
                        <div class="category-content">
                            <p>第一部分</p>
                            <h5>全部</h5>
                            <a href="#product-section" title="前往">前往</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12 no-padding">
                    <div class="category-box layout-3">
                        <img src="${pageContext.request.contextPath}/images/mrlove_index_aiqin.jpg" alt="category" />
                        <div class="category-content">
                            <p>第二部分</p>
                            <h5>爱情</h5>
                            <a href="#dealing" title="前往">前往</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12 no-padding">
                    <div class="category-box layout-3">
                        <img src="${pageContext.request.contextPath}/images/mrlove_index_lishi.jpg" alt="category" />
                        <div class="category-content">
                            <p>第三部分</p>
                            <h5>历史</h5>
                            <a href="#three-part" title="前往">前往</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12 no-padding">
                    <div class="category-box layout-3">
                        <img src="${pageContext.request.contextPath}/images/mrlove_index_jiaoyu.jpg" alt="category" />
                        <div class="category-content">
                            <p>第四部分</p>
                            <h5>教育</h5>
                            <a href="#four-part" title="前往">前往</a>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- Category Section /- -->

        <!-- Product Section -->
        <div id="product-section" class="product-section container-fluid no-padding">
            <!-- Container -->
            <div class="container">
                <div class="row">
                    <!-- Section Header -->
                    <div class="section-header" id="first-part">
                        <h3 >这里的书籍</h3>
                        <p>森林里有很多棵树，穿梭在森林里的人，你有注意到你面前的这颗树的独特吗</p>
                        <img src="${pageContext.request.contextPath}/images/section-seprator.png" alt="section-seprator" />
                    </div><!-- Section Header /- -->
                    <%--第一部分选择栏--%>

                      <ul class="layui-nav layui-bg-gray " style="margin-bottom:30px">
                          <li class="layui-nav-item ">
                              <a ng-click="findAll()">全部商品</a>
                          </li>
                          <li class="layui-nav-item ">
                              <a href="javascript:;">文学</a>
                              <dl class="layui-nav-child">
                                  <dd><a href="">爱情</a></dd>
                                  <dd><a href="">文集</a></dd>
                                  <dd><a href="">校园</a></dd>
                              </dl>
                          </li>
                          <li class="layui-nav-item">
                              <a href="javascript:;">历史</a>
                              <dl class="layui-nav-child">
                                  <dd><a href="">中国史</a></dd>
                                  <dd><a href="">世界史</a></dd>
                                  <dd><a href="">历史地理</a></dd>
                              </dl>
                          </li>
                          <li class="layui-nav-item">
                              <a href="javascript:;">教育</a>
                              <dl class="layui-nav-child">
                                  <dd><a href="">计算机</a></dd>
                                  <dd><a href="">工业技术</a></dd>
                                  <dd><a href="">化学工业</a></dd>
                              </dl>
                          </li>
                      </ul>
                    <%--搜索栏--%>
                    <div class="input-group" style="margin-top: -80px;">
                        <div style="margin-right: 10px">
                            <input class="form-control" placeholder="搜你所搜，找你所想" type="text">
                            <span class="input-group-btn" style="margin-top: 7px;">
								<button class="btn btn-search" title="Search" type="button"><i class="icon icon-Search"></i></button>
							</span>
                        </div>

                    </div>

                    <!-- Products -->
                    <ul class="products"  ng-init="findAll()">
                        <!-- Product -->
                <%--        <c:forEach items="${limitBooks}" var="book">
                        <li class="product design">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/fileuploadpath/${book.bookImage1}" alt="Product" id="${book.bookId}"/>
                                <h5>${book.bookName}</h5>
                                <span class="price"><del>${book.bookOriginalPrice}</del>${book.bookPromotionPrice}</span>
                            </a>
                            <div class="wishlist-box">
                                &lt;%&ndash;放大&ndash;%&gt;
                                <a onclick="show(document.getElementById('${book.bookId}'))"><i class="fa fa-arrows-alt"></i></a>
                                &lt;%&ndash;收藏&ndash;%&gt;
                                <a href="#"><i class="fa fa-heart-o"></i></a>
                                &lt;%&ndash;搜索&ndash;%&gt;
                                <a href="#"><i class="fa fa-search"></i></a>
                            </div>
                            <a href="#" class="addto-cart" title="添加到购物车">添加到购物车</a>
                        </li><!-- Product /- -->
                        </c:forEach>--%>
                            <li class="product design" ng-repeat="book in list">
                                <a href="/foreground/info?bookId={{book.bookId}}">
                                    <img src="${pageContext.request.contextPath}/fileuploadpath/{{book.bookImage1}}" alt="Product" id="{{book.bookNumber}}"/>
                                    <h5>{{book.bookName.substring(0,20)}}</h5>
                                    <span class="price"><del>{{book.bookOriginalPrice}}</del>{{book.bookPromotionPrice}}</span>
                                </a>
                                <div class="wishlist-box">
                                        <%--放大--%>
                                    <a><i class="fa fa-arrows-alt"></i></a>
                                        <%--收藏--%>
                                    <a href="#"><i class="fa fa-heart-o"></i></a>
                                        <%--搜索--%>
                                    <a href="${sessionScope.userId}"><i class="fa fa-search"></i></a>
                                </div>
                                <%--addBook({{book.bookNumber}},${sessionScope.users.userId},${sessionScope.users.userShopCart},'1')--%>
                                <a class="addto-cart" title="添加到购物车" ng-click="addbook(book.bookNumber,'${sessionScope.users.userId}','${sessionScope.users.userShopCart}','1')">添加到购物车</a>
                            </li><!-- Product /- -->
                    </ul><!-- Products /- -->
                </div><!-- Row /- -->
                <%--分页地方--%>
                <nav class="ow-pagination">
                    <ul class="pager">
                       <%-- <li class="number"><a href="#">4</a></li>--%>
                        <li class="load-more"><a href="${pageContext.request.contextPath}/page/morebooks.jsp">Load More</a></li>
                       <%-- <li class="previous"><a href="#"><i class="fa fa-angle-right"></i></a></li>
                        <li class="next"><a href="#"><i class="fa fa-angle-left"></i></a></li>--%>
                    </ul>
                </nav>
            </div><!-- Container /- -->
        </div><!-- Product Section /- -->

        <!-- Collection Section1 -->
        <div id="collection" class="collection-section collection-section1 container-fluid no-padding">
            <div class="collection-carousel">
                <div class="col-md-12 col-sm-12 col-xs-12 no-padding">
                    <div class="collection-box layout1">
                        <img src="${pageContext.request.contextPath}/images/collection-3.jpg" alt="collection" />
                        <div class="collection-content">
                            <h5>mens collectios</h5>
                            <p>new looks arrivad</p>
                            <a href="#" title="Shop Now">shop Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12 no-padding">
                    <div class="collection-box layout1 layout2">
                        <img src="${pageContext.request.contextPath}/images/collection-4.jpg" alt="collection" />
                        <div class="collection-content">
                            <h5>accessories</h5>
                            <p>new brands arrivad</p>
                            <a href="#" title="Shop Now">shop Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12 no-padding">
                    <div class="collection-box layout1 layout3">
                        <img src="${pageContext.request.contextPath}/images/collection-5.jpg" alt="collection" />
                        <div class="collection-content">
                            <h5>kids collections</h5>
                            <p>new looks arrivad</p>
                            <a href="#" title="Shop Now">shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- Collection Section1 -->
        <div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>

        <!-- Dealing Section2 -->
        <div id="dealing" class="dealing-section2 shop-single dealing-section container-fluid no-padding">
            <!-- Container -->
            <div class="container">
                <!-- Section Header -->
                <div class="section-header">
                    <h3>Deals Of The Day</h3>
                    <p>our vision is to be Earth's most customer centric company</p>
                    <img src="${pageContext.request.contextPath}/images/section-seprator.png" alt="section-seprator" />
                </div><!-- Section Header /- -->
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <div class="accessories-block">
                        <h5>mens accessories</h5>
                        <p>The weather started getting rough the tossed. If not for the courage of the fearless crew the Minnow would be lost. would be lost.</p>
                        <ul>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/images/deal-3.jpg" alt="deal"></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/images/deal-4.jpg" alt="deal"></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/images/deal-5.jpg" alt="deal"></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/images/deal-6.jpg" alt="deal"></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/images/deal-7.jpg" alt="deal"></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/images/deal-8.jpg" alt="deal"></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 col-xs-12 saleup-img">
                    <div class="carousel-item">
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/images/deal-9.jpg" alt="deal" />
                            <a href="#" class="product-del">
                                <h5>mens casual shoes</h5>
                                <span class="price"><del>$850</del>$550</span>
                            </a>
                        </div>

                        <div class="item">
                            <img src="${pageContext.request.contextPath}/images/deal-9.jpg" alt="deal" />
                            <a href="#" class="product-del">
                                <h5>mens casual shoes</h5>
                                <span class="price"><del>$850</del>$550</span>
                            </a>
                        </div>

                        <div class="item">
                            <img src="${pageContext.request.contextPath}/images/deal-9.jpg" alt="deal" />
                            <a href="#" class="product-del">
                                <h5>mens casual shoes</h5>
                                <span class="price"><del>$850</del>$550</span>
                            </a>
                        </div>
                    </div>
                    <div data-date="2017/04/04" id="clock-2" class="clock"></div>
                </div>
            </div><!-- Container /- -->
        </div><!-- Dealing Section2 -->

        <!-- Testimonial Section -->
        <div class="testimonial-section testimonial-section1 container-fluid">
            <!-- Container -->
            <div class="container">
                <!-- Section Header -->
                <div class="section-header">
                    <h3>Clients Testimonials</h3>
                    <p>our vision is to be Earth's most customer centric company</p>
                    <img src="${pageContext.request.contextPath}/images/section-seprator.png" alt="section-seprator" />
                </div><!-- Section Header /- -->
                <!-- Main Carousel -->
                <div id="main-carousel1" class="carousel slide carousel-fade" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#main-carousel1" data-slide-to="0" class="active"></li>
                        <li data-target="#main-carousel1" data-slide-to="1"></li>
                        <li data-target="#main-carousel1" data-slide-to="2"></li>
                    </ol>
                    <div role="listbox" class="carousel-inner">
                        <div class="item active">
                            <div class="testimonial-content">
                                <img src="${pageContext.request.contextPath}/images/testi-1.png" alt="testi" />
                                <i class="fa fa-quote-left" aria-hidden="true"></i>
                                <p>The final frontier. These are the voyages of the Starship Enterprise? As long as we live its you and me baby. There ain't nothin'  Beats all you've ever saw been in trouble with the law since the day. </p>
                                <span class="star">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-o"></i>
									</span>
                                <h3>Strahow stuart</h3>
                                <h5>Web Designer</h5>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial-content">
                                <img src="${pageContext.request.contextPath}/images/testi-1.png" alt="testi" />
                                <i class="fa fa-quote-left" aria-hidden="true"></i>
                                <p>The final frontier. These are the voyages of the Starship Enterprise? As long as we live its you and me baby. There ain't nothin'  Beats all you've ever saw been in trouble with the law since the day. </p>
                                <span class="star">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-o"></i>
									</span>
                                <h3>Strahow stuart</h3>
                                <h5>Web Designer</h5>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial-content">
                                <img src="${pageContext.request.contextPath}/images/testi-1.png" alt="testi" />
                                <i class="fa fa-quote-left" aria-hidden="true"></i>
                                <p>The final frontier. These are the voyages of the Starship Enterprise? As long as we live its you and me baby. There ain't nothin'  Beats all you've ever saw been in trouble with the law since the day. </p>
                                <span class="star">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-o"></i>
									</span>
                                <h3>Strahow stuart</h3>
                                <h5>Web Designer</h5>
                            </div>
                        </div>
                    </div>
                </div><!-- Main Carousel /-  -->
            </div><!-- Container /- -->
        </div><!-- Testimonial Section /- -->

        <!-- Latest Blog -->
        <div class="blog-section latest-blog container-fluid" id="three-part">
            <!-- Container -->
            <div class="container">
                <!-- Section Header -->
                <div class="section-header">
                    <h3>Latest News</h3>
                    <p>our vision is to be Earth's most customer centric company</p>
                    <img src="${pageContext.request.contextPath}/images/section-seprator.png" alt="section-seprator" />
                </div><!-- Section Header /- -->
                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="type-post">
                        <div class="entry-cover">
                            <a href="#"><img src="${pageContext.request.contextPath}/images/blog-1.jpg" alt="blog"></a>
                            <span class="post-date"><a href="#"><i class="fa fa-calendar-o"></i>July 20</a></span>
                        </div>
                        <div class="blog-content">
                            <h3 class="entry-title"><a href="#" title="new Collectios are imported In Our shop.">new Collectios are<span>imported</span> In Our shop.</a></h3>
                            <div class="entry-meta">
                                <span class="post-like"><a href="#" title="224 Likes"><i class="fa fa-heart-o"></i>224 Likes</a></span>
                                <span class="post-admin"><i class="fa fa-user"></i>Posted By <a href="#" title="Max">Max</a></span>
                            </div>
                            <div class="entry-content">
                                <p>The weather started getting rough - the tiny ship was tossed. If not for the courage of the fearless crew the Minnow would be lost.</p>
                                <a href="#" title="Read More" class="read-more">Read More<i class="fa fa-long-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="type-post">
                        <div class="entry-cover">
                            <a href="#"><img src="${pageContext.request.contextPath}/images/blog-3.jpg" alt="blog"></a>
                            <span class="post-date"><a href="#"><i class="fa fa-calendar-o"></i>march 14</a></span>
                        </div>
                        <div class="blog-content">
                            <h3 class="entry-title"><a href="#" title="buyers are saying it's good shop">buyers are saying it's <span>good shop</span></a></h3>
                            <div class="entry-meta">
                                <span class="post-like"><a href="#" title="150 Likes"><i class="fa fa-heart-o"></i>150 Likes</a></span>
                                <span class="post-admin"><i class="fa fa-user"></i>Posted By <a href="#" title="Max">Max</a></span>
                            </div>
                            <div class="entry-content">
                                <p>The weather started getting rough - the tiny ship was tossed. If not for the courage of the fearless crew the Minnow would be lost.</p>
                                <a href="#" title="Read More" class="read-more">Read More<i class="fa fa-long-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="type-post">
                        <div class="entry-cover">
                            <a href="#"><img src="${pageContext.request.contextPath}/images/blog-2.jpg" alt="blog"></a>
                            <span class="post-date"><a href="#"><i class="fa fa-calendar-o"></i>june 26</a></span>
                        </div>
                        <div class="blog-content">
                            <h3 class="entry-title"><a title="Best Solds in the this year was watches" href="#">Best Solds in the this year was <span>watches</span></a></h3>
                            <div class="entry-meta">
                                <span class="post-like"><a href="#" title="85 Likes"><i class="fa fa-heart-o"></i>85 Likes</a></span>
                                <span class="post-admin"><i class="fa fa-user"></i>Posted By <a href="#" title="Max">Max</a></span>
                            </div>
                            <div class="entry-content">
                                <p>The weather started getting rough - the tiny ship was tossed. If not for the courage of the fearless crew the Minnow would be lost.</p>
                                <a href="#" title="Read More" class="read-more">Read More<i class="fa fa-long-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- Container /- -->
        </div><!-- Latest Blog /- -->

        <!-- Selling -->
        <div id="selling" class="container-fluid no-left-padding no-right-padding woocommerce-selling">
            <!-- Container -->
            <div class="container" id="four-part">
                <!-- Section Header -->
                <div class="section-header">
                    <h3>Best Selling</h3>
                    <p> our vision is to be Earth's most customer centric company</p>
                    <img src="${pageContext.request.contextPath}/images/section-seprator.png" alt="section-seprator" />
                </div><!-- Section Header /- -->
                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div  class="selling-box">
                        <img src="${pageContext.request.contextPath}/images/selling-1.jpg" alt="selling" />
                        <div class="selling-content">
                            <h6><a href="#">mens casual belts</a></h6>
                            <span class="price"><del>$75</del> $49</span>
                            <div class="star-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                        </div>
                        <div class="icon-list">
                            <a href="#"><i class="fa fa-arrows-alt"></i></a>
                            <a href="#"><i class="fa fa-heart-o"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div  class="selling-box">
                        <img src="${pageContext.request.contextPath}/images/selling-2.jpg" alt="selling" />
                        <div class="selling-content">
                            <h6><a href="#">attractive chains</a></h6>
                            <span class="price"><del>$220</del> $149</span>
                            <div class="star-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                        </div>
                        <div class="icon-list">
                            <a href="#"><i class="fa fa-arrows-alt"></i></a>
                            <a href="#"><i class="fa fa-heart-o"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div  class="selling-box">
                        <img src="${pageContext.request.contextPath}/images/selling-3.jpg" alt="selling" />
                        <div class="selling-content">
                            <h6><a href="#">ladies bags</a></h6>
                            <span class="price"><del>$325</del> $249</span>
                            <div class="star-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                        </div>
                        <div class="icon-list">
                            <a href="#"><i class="fa fa-arrows-alt"></i></a>
                            <a href="#"><i class="fa fa-heart-o"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div  class="selling-box">
                        <img src="${pageContext.request.contextPath}/images/selling-4.jpg" alt="selling" />
                        <div class="selling-content">
                            <h6><a href="#">casual shirts</a></h6>
                            <span class="price"><del>$240</del> $179</span>
                            <div class="star-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                        </div>
                        <div class="icon-list">
                            <a href="#"><i class="fa fa-arrows-alt"></i></a>
                            <a href="#"><i class="fa fa-heart-o"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div  class="selling-box">
                        <img src="${pageContext.request.contextPath}/images/selling-5.jpg" alt="selling" />
                        <div class="selling-content">
                            <h6><a href="#">ladies wallets</a></h6>
                            <span class="price"><del>$120</del> $79</span>
                            <div class="star-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                        </div>
                        <div class="icon-list">
                            <a href="#"><i class="fa fa-arrows-alt"></i></a>
                            <a href="#"><i class="fa fa-heart-o"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div  class="selling-box">
                        <img src="${pageContext.request.contextPath}/images/selling-6.jpg" alt="selling" />
                        <div class="selling-content">
                            <h6><a href="#">huvai chappals</a></h6>
                            <span class="price"><del>$850</del> $550</span>
                            <div class="star-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                        </div>
                        <div class="icon-list">
                            <a href="#"><i class="fa fa-arrows-alt"></i></a>
                            <a href="#"><i class="fa fa-heart-o"></i></a>
                        </div>
                    </div>
                </div>
            </div><!-- Container /- -->
        </div><!-- Selling /- -->

        <!-- Clients -->
        <div class="clients container-fluid">
            <!-- Container -->
            <div class="container">
                <div class="clients-carousel">
                    <div class="col-md-12 item"><a href="#" title="client"><img src="${pageContext.request.contextPath}/images/client-1.png" alt="client-1"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="${pageContext.request.contextPath}/images/client-2.png" alt="client-2"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="${pageContext.request.contextPath}/images/client-3.png" alt="client-3"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="${pageContext.request.contextPath}/images/client-4.png" alt="client-4"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="${pageContext.request.contextPath}/images/client-5.png" alt="client-5"></a></div>

                    <div class="col-md-12 item"><a href="#" title="client"><img src="${pageContext.request.contextPath}/images/client-1.png" alt="client-1"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="${pageContext.request.contextPath}/images/client-2.png" alt="client-2"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="${pageContext.request.contextPath}/images/client-3.png" alt="client-3"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="${pageContext.request.contextPath}/images/client-4.png" alt="client-4"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="${pageContext.request.contextPath}/images/client-5.png" alt="client-5"></a></div>
                </div>
            </div><!-- Container /- -->
        </div><!-- Clients /- -->
    </main>

    <!-- Footer Main -->
    <footer id="footer-main" class="footer-main container-fluid">
        <!-- Container -->
        <div class="container">
            <div class="row">
                <!-- Widget About -->
                <aside class="col-md-3 col-sm-6 col-xs-6 ftr-widget widget_about">
                    <a href="index.html" title="Max Shop">Max <span>Shop</span></a>
                    <div class="info">
                        <p><i class="icon icon-Pointer"></i>Max Shop, 65 Huge Street Melbourne, 2850 Australia.</p>
                        <p><i class="icon icon-Phone2"></i><a href="tel:(11)1234567890" title="Phone" class="phone">(11) 123 456 7890</a></p>
                        <p><i class="icon icon-Imbox"></i><a href="mailto:info@maxshop.com" title="info@maxshop.com">info@maxshop.com</a></p>
                    </div>
                </aside><!-- Widget About /- -->
                <!-- Widget Links -->
                <aside class="col-md-3 col-sm-6 col-xs-6 ftr-widget widget_links">
                    <h3 class="widget-title">Popular Links</h3>
                    <ul>
                        <li><a href="#product-section" title="Popular Products">Popular Products</a></li>
                        <li><a href="#selling" title="Best Selling">Best Selling</a></li>
                        <li><a href="about.html" title="About Us">About Us</a></li>
                        <li><a href="#dealing" title="Deal Of The Day">Deal Of The Day</a></li>
                        <li><a href="#collection" title="Product Collections">Product Collections</a></li>
                        <li><a href="contact-us.html" title="Contact Us">Contact Us</a></li>
                    </ul>
                </aside><!-- Widget Links /- -->
                <!-- Widget Account -->
                <aside class="col-md-3 col-sm-6 col-xs-6 ftr-widget widget_links widget_account">
                    <h3 class="widget-title">my account</h3>
                    <ul>
                        <li><a href="#" title="My Order Details">My Order Details</a></li>
                        <li><a href="#" title="My credit Offers">My credit Offers</a></li>
                        <li><a href="#" title="My addresses">My addresses</a></li>
                        <li><a href="#" title="My Personal Details">My Personal Details</a></li>
                        <li><a href="#" title="My Account Details">My Account Details</a></li>
                    </ul>
                </aside><!-- Widget Account /- -->
                <!-- Widget Newsletter -->
                <aside class="col-md-3 col-sm-6 col-xs-6 ftr-widget widget_newsletter">
                    <h3 class="widget-title">newsletter</h3>
                    <div class="input-group">
                        <input class="form-control" placeholder="email address" type="text">
                        <span class="input-group-btn">
								<button class="btn btn-default" type="button"><i class="fa fa-paper-plane-o"></i></button>
							</span>
                    </div>
                    <h5>Get New Updates From Our Collections</h5>
                    <h3 class="widget-title widget-title-1">Follow Us</h3>
                    <ul class="social">
                        <li><a href="#" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#" title="Tumblr"><i class="fa fa-tumblr"></i></a></li>
                        <li><a href="#" title="Vimeo"><i class="fa fa-vimeo"></i></a></li>
                    </ul>
                </aside><!-- Widget Newsletter /- -->
            </div>
            <div class="copyright-section">
                <div class="coyright-content">
                    <p>Copyright &copy; 2017.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
                </div>
                <ul>
                    <li><a href="#" title="Delivery Information">Delivery Information</a></li>
                    <li><a href="#" title="Privacy Policy">Privacy Policy</a></li>
                    <li><a href="#" title="Terms & Condition">Terms & Condition</a></li>
                </ul>
            </div>
        </div><!-- Container /- -->
    </footer><!-- Footer Main /- -->


</div>

<jsp:include page="${pageContext.request.contextPath}/page/common/js.jsp"/>

<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script>
    //alert(${sessionScope.userimgs});
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>

<script>
    var status =0;
    status = ${status};
    if(status==1){
        document.getElementById("after-ul").style.display = "";
        document.getElementById("before-ul").style.display = "none";
    }else {
        document.getElementById("after-ul").style.display = "none";
        document.getElementById("before-ul").style.display = "";
    }
</script>

<script type="text/javascript">//javaScript标签，这里面的是javaScript语言编写的的动态的效果，

        function show(pic){
            //获取图片的宽和高
            iw = pic.width;
            ih = pic.height;
            //获取屏幕的宽和高
            sw = document.documentElement.clientWidth;
            sh = document.documentElement.clientHeight;
            //动态的创建一个灰色的背景div，就是那个我们带点击后，大图后面的那个灰色的那个背景，当然灰色是可以自由设置的
            gdiv = document.createElement('div');
            gdiv.id = 'gray';
            gdiv.style.height = sh+'px';
            gdiv.style.width = sw+'px';
            document.body.appendChild(gdiv);
            //删除动态的图片和对象，就是我们点击放大后，再次点击的时候，放大的图片会被删除，并且后面的那个背景也会随之删除，这个方法就是为了完成这个效果
            gdiv.onclick = function(){
                document.body.removeChild(this);
                document.body.removeChild(oimg);
            }
            //创建动态的图片对象，将该对象的src赋值为原图的src,这就是来创建我们放大后看大的那个图片
            oimg = document.createElement('img');
            oimg.src = pic.src;
            oimg.width=400;
            oimg.height=400;
            oimg.style.position = 'absolute';
            oimg.style.top = (sh-ih)/2+'px';
            oimg.style.left= (sw-ih)/2+'px';
            document.body.appendChild(oimg);
        }
    //设置图片的位置来适应窗口的大小
    window.onresize=function(){
        sh = document.documentElement.clientHeight;
        sw = document.documentElement.clientWidth;
        gdiv.style.width = sw + 'px';
        gdiv.style.height = sh + 'px';
        //更改图片的位置
        oimg.style.top = (sh-ih)/2 + 'px';
        oimg.style.left = (sw-iw)/2 + 'px';
    }
</script>

</body>
</html>

