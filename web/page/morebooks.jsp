<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/4/24
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" class="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>更多商品</title>
    <link href="https://fonts.googleapis.com/css?family=Arizonia|Crimson+Text:400,400i,600,600i,700,700i|Lato:100,100i,300,300i,400,400i,700,700i,900,900i|Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/revolution/css/settings.css">
    <!-- RS5.0 Layers and Navigation Styles -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/revolution/css/navigation.css">
    <!-- Library - Bootstrap v3.3.5 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/common/gailib.css">
    <!-- Custom - Common CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugins.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navigation-menu.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shortcode.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/datatables-master/dist/amazeui.datatables.css">
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/js/html5/respond.min.js"></script>
    <![endif]-->

    <script src="${pageContext.request.contextPath}/page/common/angular.min.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/pagination.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/common/pagination.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <script type="text/javascript" src="${pageContext.request.contextPath}/page/common/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/page/common/amazeui.js"></script>
    <jsp:include page="${pageContext.request.contextPath}/page/common/js.jsp"/>
     <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
   <%-- <script src="${pageContext.request.contextPath}/layer/layer.js"></script>--%>
    <script>
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
        var app=angular.module('myApp',['pagination']); //定义了一个叫myApp的模块
        //定义控制器
        app.controller('myController',function($scope,$http){

        //重新加载列表 数据
            $scope.reloadList=function(){
                //切换页码
                $scope.findPage( $scope.paginationConf.currentPage, $scope.paginationConf.itemsPerPage);
            }
        //分页控件配置
            $scope.paginationConf = {
                currentPage: 1,
                totalItems: 12,
                itemsPerPage: 12,
                perPageOptions: [4, 8, 12, 16, 20],
                onChange: function(){
                    $scope.reloadList();//重新加载
                }
            };
        //分页
            $scope.findPage=function(page,rows){
                $http.get('/foreground/pagingquery?page='+page+'&rows='+rows).success(
                    function(response){
                        $scope.list=response.rows;
                        $scope.paginationConf.totalItems=response.total;//更新总记录数
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
        //添加到收藏夹
        $scope.addcollect = function (bookNumber,userId) {
            $http.get('/collect/addbook?bookNumber='+bookNumber+'&userId='+userId).success(
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
            )
        }





        });
    </script>
</head>

<body data-offset="200" data-spy="scroll" data-target=".ow-navigation" ng-app="myApp" ng-controller="myController">
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
    <header class="header-section header-section-1 container-fluid no-padding">
        <!-- Middel Header -->
        <div class="middel-header">
            <!-- Container -->
            <div class="container">
                <!-- Logo Block -->
                <div class="col-md-4 col-sm-6 col-xs-12 logo-block">
                    <a href="index.html" class="navbar-brand">Mrlove<span>书城</span></a>
                </div><!-- Logo Block /- -->
                <!-- Search Block -->
                <div class="col-md-5 col-sm-6 col-xs-6 search-block">
                    <div class="input-group">
                        <input class="form-control" placeholder="搜索你想要的。。。" type="text">
                        <span class="input-group-btn">
								<button class="btn btn-default" type="button"><i class="icon icon-Search"></i></button>
							</span>
                    </div>
                </div><!-- Search Block /- -->
                <!-- Menu Icon -->
                <div class="col-md-3 col-sm-6 col-xs-6 menu-icon">
                    <ul class="cart">
                        <li>
                            <a aria-expanded="true" aria-haspopup="true" data-toggle="dropdown" id="cart" class="btn dropdown-toggle" title="加入购物车" href="#"><i class="icon icon-ShoppingCart"></i></a>
                            <ul class="dropdown-menu no-padding">
                                <li class="mini_cart_item">
                                    <a title="删除这件商品" class="remove" href="#">&#215;</a>
                                    <a href="#" class="shop-thumbnail">
                                        <img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/images/product-wishlist-1.jpg">物品一
                                    </a>
                                    <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                </li>
                                <li class="mini_cart_item">
                                    <a title="删除这件商品" class="remove" href="#">&#215;</a>
                                    <a href="#" class="shop-thumbnail">
                                        <img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/images/product-wishlist-2.jpg">物品2
                                    </a>
                                    <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                </li>
                                <li class="button" style="float:right">
                                    <a href="#" title="查看购物车">查看购物车</a>
                                </li>
                            </ul>
                        </li>

                    </ul>

                    <ul class="cart">
                        <li><a aria-expanded="true" aria-haspopup="true" data-toggle="dropdown" id="like" class="btn dropdown-toggle" href="#" title="收藏"><i class="icon icon-Heart"></i></a>
                            <ul class="dropdown-menu no-padding">
                                <li class="mini_cart_item">
                                    <a title="删除这件商品" class="remove" href="#">&#215;</a>
                                    <a href="#" class="shop-thumbnail">
                                        <img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/images/product-wishlist-1.jpg">物品3
                                    </a>
                                    <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                </li>
                                <li class="mini_cart_item">
                                    <a title="删除这件商品" class="remove" href="#">&#215;</a>
                                    <a href="#" class="shop-thumbnail">
                                        <img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/images/product-wishlist-2.jpg">物品4
                                    </a>
                                    <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                </li>
                                <li class="button" style="float:right">
                                    <a href="#" title="查看购物车">查看购物车</a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="cart">

                        <li><a href="#" title="用户"><i class="icon icon-User"></i></a>
                            <ul class="dropdown-menu no-padding">
                                <li class="mini_cart_item">
                                    <a title="删除这件商品" class="remove" href="#">&#215;</a>
                                    <a href="#" class="shop-thumbnail">
                                        <img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/images/product-wishlist-1.jpg">物品5
                                    </a>
                                    <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                </li>
                                <li class="mini_cart_item">
                                    <a title="删除这件商品" class="remove" href="#">&#215;</a>
                                    <a href="#" class="shop-thumbnail">
                                        <img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/images/product-wishlist-2.jpg">物品6
                                    </a>
                                    <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                </li>
                                <li class="button" style="float:right">
                                    <a href="#" title="查看购物车">查看购物车</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- Menu Icon /- -->
            </div><!-- Container /- -->
        </div><!-- Middel Header /- -->

        <!-- Menu Block -->
        <div class="container-fluid no-padding menu-block" style="background-color: #eeeeee">
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
                        <a href="index.html" class="navbar-brand">Max <span>shop</span></a>
                    </div>
                    <div class="navbar-collapse collapse" id="navbar">
                        <ul class="nav navbar-nav">
                            <li><a href="/page/index.jsp">主页</a></li>
                            <li><a href="/page/shopcart.jsp">购物车</a></li>
                            <li><a href="checkout.html">结账</a></li>
                            <li><a href="${pageContext.request.contextPath}/page/about.jsp">关于我</a></li>
                            <li><a href="contact-us.html">联系我</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </nav><!-- nav /- -->
            </div><!-- Container /- -->
        </div><!-- Menu Block /- -->
    </header><!-- Header /- -->

    <main>
        <!-- Product Section-->
        <div id="product-section" class="product-section container-fluid no-padding">
            <!-- Container -->
            <div class="container">
                <div class="row">
                    <!-- Section Header -->
                    <div class="section-header" id="first-part">
                        <h3 style="margin-top: 50px;">这里的书籍</h3>
                        <p>森林里有很多棵树，穿梭在森林里的人，你有注意到你面前的这颗树的独特吗</p>
                        <img src="${pageContext.request.contextPath}/images/section-seprator.png" alt="section-seprator" />
                    </div><!-- Section Header /- -->
                    <%--第一部分选择栏--%>

                    <ul class="layui-nav layui-bg-gray " style="margin-bottom:30px">
                        <li class="layui-nav-item ">
                            <a ng-click="paginationConf.onChange()">全部商品</a>
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
                        <ul class="products" >
                            <!-- Product -->
                            <li class="product design" ng-repeat="book in list">
                                <a href="/foreground/info?bookId={{book.bookId}}">
                                    <img src="${pageContext.request.contextPath}/fileuploadpath/{{book.bookImage1}}" alt="Product" id="{{book.bookId}}"/>
                                    <h5>{{book.bookName.substring(0,20)}}</h5>
                                    <span class="price"><del>{{book.bookOriginalPrice}}</del>{{book.bookPromotionPrice}}</span>
                                </a>
                                <div class="wishlist-box">
                                    <%--放大--%>
                                    <%--onclick="show(document.getElementById('{{book.bookId}}'))"--%>
                                    <a ><i class="fa fa-arrows-alt"></i></a>
                                    <%--收藏--%>
                                    <a ng-click="addcollect(book.bookNumber,'${sessionScope.users.userId}')"><i class="fa fa-heart-o"></i></a>
                                    <%--搜索--%>
                                    <a href="#"><i class="fa fa-search"></i></a>
                                </div>
                                <a href="" class="addto-cart" title="添加到购物车" ng-click="addbook(book.bookNumber,'${sessionScope.users.userId}','${sessionScope.users.userShopCart}','1')">添加到购物车</a>
                            </li>
                            <!-- Product /- -->
                        </ul>
                    <!-- Products /- -->
                </div><!-- Row /- -->
                <%--分页地方--%>
                <nav class="ow-pagination">
                    <ul class="pager">
                        <tm-pagination conf="paginationConf"></tm-pagination>
                    </ul>
                </nav>
            </div><!-- Container /- -->
        </div><!-- Product Section /- -->
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





<%--
<!-- .box-body -->
<div class="box-header with-border">
    <h3 class="box-title">品牌管理</h3>
</div>
<div class="box-body">

    <!-- 数据表格 -->
    <div class="table-box">

        <!--工具栏-->
        <div class="pull-left">
            <div class="form-group form-inline">
                <div class="btn-group">
                    <button type="button" class="btn btn-default" title="新建" data-toggle="modal" data-target="#editModal" ng-click="entity={}" ><i class="fa fa-file-o"></i> 新建</button>
                    <button type="button" class="btn btn-default" title="删除" ng-click="dele()"><i class="fa fa-trash-o" ></i> 删除</button>
                    <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                </div>
            </div>
        </div>
        <div class="box-tools pull-right">
            <div class="has-feedback">
                品牌名称:<input ng-model="searchEntity.name"> 品牌首字母:<input ng-model="searchEntity.firstChar">
                <button  class="btn btn-default" ng-click="reloadList()">查询</button>
            </div>
        </div>
        <!--工具栏/-->

        <!--数据列表-->
        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
            <thead>
            <tr>
                <th class="" style="padding-right:0px">
                    <input id="selall" type="checkbox" class="icheckbox_square-blue">
                </th>
                <th class="sorting_asc">品牌ID</th>
                <th class="sorting">品牌名称</th>
                <th class="sorting">品牌首字母</th>
                <th class="text-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat="entity in list">
                <td><input  type="checkbox" ng-click="updateSelection($event, entity.id)" ></td>
                <td>{{entity.id}}</td>
                <td>{{entity.name}}</td>
                <td>{{entity.firstChar}}</td>
                <td class="text-center">
                    <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal" ng-click="findOne(entity.id)" >修改</button>
                </td>
            </tr>

            </tbody>
        </table>
        <!--数据列表/-->
        <tm-pagination conf="paginationConf"></tm-pagination>

    </div>
    <!-- 数据表格 /-->




</div>
<!-- /.box-body -->
<!-- 编辑窗口 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">品牌编辑</h3>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped"  width="800px">
                    <tr>
                        <td>品牌名称</td>
                        <td><input  class="form-control" placeholder="品牌名称" ng-model="entity.name">  </td>
                    </tr>
                    <tr>
                        <td>首字母</td>
                        <td><input  class="form-control" placeholder="首字母" ng-model="entity.firstChar">  </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" ng-click="save()">保存</button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>
--%>




</body>
</html>