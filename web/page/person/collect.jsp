<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/5/2
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>我的收藏</title>
    <link href="${pageContext.request.contextPath}/page/common/admin.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/page/common/personal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/page/common/colstyle.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/page/common/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/page/common/amazeui.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>

    <script src="${pageContext.request.contextPath}/page/common/angular.min.js"></script>

    <script>
        var app=angular.module('myApp',[]); //定义了一个叫myApp的模块
        //定义控制器
        app.controller('myController',function($scope,$http) {
          //添加到购物车
          $scope.addbook = function (bookNumber,userId,shopcartId,bookCount) {
         // console.log(bookNumber+" "+userId+" "+shopcartId+" "+bookCount);
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
          //查找图书
          $scope.findcollect = function (userId) {
          $http.get('/collect/findbook?userId='+userId).success(
          function (response) {
          $scope.collects = response;
          }
          )
          }
          //取消收藏
            $scope.deletecollect = function (bookNumber,userId) {
                $http.get('/collect/deletecollect?bookNumber='+bookNumber+'&userId='+userId).success(
                    function (response) {
                        if(response.success){
                            layer.msg("取消成功！",{time:700},{offset: 'rt'},function () {
                                layer.close(index);
                            })
                            $scope.findcollect(userId);
                        }else {
                            layer.msg("取消失败！",{time:700},{offset: 'rt'},function () {
                                layer.close(index);
                            })
                        }
                    }
                )
            }

        });
    </script>


</head>
<body ng-app="myApp" ng-controller="myController" ng-init="findcollect('${sessionScope.users.userId}')">
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

            <div class="user-collection">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的收藏</strong> / <small>My&nbsp;Collection</small></div>
                </div>
                <hr/>

                <div class="you-like">
                    <div class="s-bar">
                        我的收藏
                    </div>
                    <div class="s-content">
                        <div class="s-item-wrap" ng-repeat="collect in collects">
                            <div class="s-item">

                                <div class="s-pic">
                                    <a href="/foreground/info?bookId={{collect.books.bookId}}" class="s-pic-link">
                                        <img src="${pageContext.request.contextPath}/fileuploadpath/{{collect.books.bookImage1}}" alt="" title="{{collect.books.bookName}}" class="s-pic-img s-guess-item-img">
                                    </a>
                                </div>
                                <div class="s-info">
                                    <div class="s-title"><a href="/foreground/info?bookId={{collect.books.bookId}}" title="{{collect.books.bookName}}">{{collect.books.bookName}}</a></div>
                                    <div class="s-price-box">
                                        <span class="s-price"><em class="s-price-sign">¥</em><em class="s-value">{{collect.books.bookPromotionPrice}}</em></span>
                                        <span class="s-history-price"><em class="s-price-sign">¥</em><em class="s-value">{{collect.books.bookOriginalPrice}}</em></span>
                                    </div>
                                    <div class="s-extra-box">
                                        <span class="s-comment">月销: {{collect.books.bookMonthlySales+0}}</span>
                                        <span class="s-sales">总销:{{collect.books.bookTotalSales+0}}</span>
                                    </div>
                                </div>
                                <div class="s-tp">
                                    <span class="ui-btn-loading-before" ng-click="deletecollect(collect.books.bookNumber,'${sessionScope.users.userId}')">取消收藏</span>
                                    <i class="am-icon-shopping-cart"></i>
                                    <span class="ui-btn-loading-before buy" ng-click="addbook(collect.books.bookNumber,'${sessionScope.users.userId}','${sessionScope.users.userShopCart}','1')">加入购物车</span>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="s-more-btn i-load-more-item" data-screen="0"><i class="am-icon-refresh am-icon-fw"></i>更多</div>

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
