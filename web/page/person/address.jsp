<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/4/30
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>地址管理</title>

    <link href="${pageContext.request.contextPath}/page/common/admin.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="${pageContext.request.contextPath}/page/common/personal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/page/common/addstyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/page/common/jquery-1.7.min.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/amazeui.js"></script>
    <%--  <script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>--%>

    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/page/common/angular.min.js"></script>
    <script>
        var app=angular.module('myApp',[]); //定义了一个叫myApp的模块
        //定义控制器
        app.controller('myController',function($scope,$http) {
            //查询地址
            $scope.findaddress= function (userId) {
                $http.get('/address/findaddress?userId='+userId).success(
                    function (response) {
                        $scope.addresses =response;
                        for(var i =0;i<response.length;i++){
                            if(response[i].addressDefault=='1'){
                                $scope.address = response[i];
                                break;
                            }
                        }
                    }
                )
            }
            //添加地址
            $scope.addaddress = function () {
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
                }else if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(addressTelnum))){
                    layer.msg("格式不正确！",{time:700},function () {
                        layer.close(index);
                        $("#addressTelnum").focus();
                    })
                }else {
                    $.ajax({
                        type: "POST",
                        url: "/address/addaddress",
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
                                //刷新地址列表
                                $scope.findaddress(userId);
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
            }
            //选择地址
            $scope.selectedaddress= function (address) {
                $scope.address = address;
            }
            //判断地址对象是否是当前地址
            $scope.isselectedaddress = function (address) {
                if(address==$scope.address){
                    return true;
                }else {
                    return false
                }
            }
            //设置某个地址为默认地址
            $scope.setdefaultaddress = function (addressId,userId) {
                $http.get('/address/setdefaultaddress?addressId='+addressId+'&userId='+userId).success(
                    function(response){
                        if(response.success){//如果成功
                            //刷新地址列表
                            $scope.findaddress(userId);
                        }else{
                            alert(response.message);
                        }
                    }
                )
            }
            //删除地址
            $scope.deleteaddress = function (addressId,userId) {
                $http.get('/address/deleteaddress?addressId='+addressId).success(
                    function(response){
                        if(response.success){//如果成功
                            //刷新地址列表
                            $scope.findaddress(userId);
                        }else{
                            alert(response.message);
                        }
                    }
                )
            }
        });
    </script>


</head>

<body ng-app="myApp" ng-controller="cartController" ng-init="findaddress('${sessionScope.userId}')">
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

            <div class="user-address">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
                </div>
                <hr/>
                <ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
                    <li   ng-repeat="address in addresses"  class="user-addresslist {{isselectedaddress(address)?'defaultAddr':''}}" ng-click="selectedaddress(address)">

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
                </ul>
                <div class="clear"></div>
                <a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
                <!--例子-->
                <div class="am-modal am-modal-no-btn" id="doc-modal-1">

                    <div class="add-dress">

                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
                        </div>
                        <hr/>

                        <div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
                            <form class="am-form am-form-horizontal">

                                <div class="am-form-group">
                                    <label for="user-name" class="am-form-label">收货人</label>
                                    <div class="am-form-content">
                                        <input type="text" id="user-name" placeholder="收货人">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-phone" class="am-form-label">手机号码</label>
                                    <div class="am-form-content">
                                        <input id="user-phone" placeholder="手机号必填" type="email">
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label  class="am-form-label">所在地</label>
                                    <div class="am-form-content address">
                                        <select data-am-selected>
                                            <option value="a">浙江省</option>
                                            <option value="b" selected>湖北省</option>
                                        </select>
                                        <select data-am-selected>
                                            <option value="a">温州市</option>
                                            <option value="b" selected>武汉市</option>
                                        </select>
                                        <select data-am-selected>
                                            <option value="a">瑞安区</option>
                                            <option value="b" selected>洪山区</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-intro" class="am-form-label">详细地址</label>
                                    <div class="am-form-content">
                                        <textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
                                        <small>100字以内写出你的详细地址...</small>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <a class="am-btn am-btn-danger">保存</a>
                                        <a href="javascript: void(0)" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>

            </div>

            <script type="text/javascript">
                $(document).ready(function() {
                    $(".new-option-r").click(function() {
                        $(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
                    });

                    var $ww = $(window).width();
                    if($ww>640) {
                        $("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
                    }

                })
            </script>

            <div class="clear"></div>

        </div>
        <!--底部-->
        <jsp:include page="${pageContext.request.contextPath}/page/common/footer.jsp"/>
    </div>

    <%--menu--%>
    <jsp:include page="${pageContext.request.contextPath}/page/common/person_menu.jsp"/>

</div>

</body>

</html>
