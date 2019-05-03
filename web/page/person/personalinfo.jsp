<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/5/3
  Time: 0:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>个人资料</title>

    <link href="${pageContext.request.contextPath}/page/common/admin.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/page/common/personal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/page/common/infstyle.css" rel="stylesheet" type="text/css">
    <%--<script src="${pageContext.request.contextPath}/page/common/jquery-1.7.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/page/common/amazeui.js"></script>

    <script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.1.min.js" type="text/javascript"
            charset="utf-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
   <%-- <script src="${pageContext.request.contextPath}/layer/layer.js"></script>--%>
    <script src="${pageContext.request.contextPath}/page/common/angular.min.js"></script>

    <script>
        var app=angular.module('myApp',[]); //定义了一个叫myApp的模块
        //定义控制器
        app.controller('myController',function($scope,$http) {
            //查找用户信息
            $scope.finduser = function (userId) {
                $http.get('/user/finduser?userId='+userId).success(
                    function (response) {
                        $scope.userinfo = response;

                        if(response.userSex=='0'){
                            $("#female").attr("checked","checked");
                        }
                        if(response.userSex=='1'){
                            $("#male").attr("checked","checked");
                        }
                        if(response.userSex=='2'){
                            $("#secret").attr("checked","checked");
                        }

                    }
                )
            }
            //上传事件
            $(function () {
                layui.use(['upload', 'layer'], function () {

                    var upload = layui.upload;
                    var layer = layui.layer;

                    var success1 = 0;
                    var fail1 = 0;
                    var imgurl = "";

                    upload.render({
                        elem: '#userImage',
                        url: '/user/upload',
                        multiple: true,
                        accept: 'images',
                        acceptMime: 'image/*',
                        auto: true,
                        //上传的单个图片大小
                        size: 10240,
                        //最多上传的数量
                        number: 1,
                        //MultipartFile file 对应，layui默认就是file,要改动则相应改动
                        field: 'file',
                        bindAction: '#startup',
                        before: function (obj) {
                            //预读本地文件示例，不支持ie8
                            obj.preview(function (index, file, result) {
                                document.getElementById("userImage").src = result;
                            });
                        },
                        done: function (res, index, upload) {
                            //每个图片上传结束的回调，成功的话，就把新图片的名字保存起来，作为数据提交
                            if (res.code == "1") {
                                fail1++;
                            } else {
                                success1++;
                                imgurl = res.data.src;
                                $('#imgUrl').val(imgurl);
                            }
                        },
                        allDone: function (obj) {
                            layer.msg("总共要上传图片总数为：" + (fail1 + success1) + "\n"
                                + "其中上传成功图片数为：" + success1 + "\n"
                                + "其中上传失败图片数为：" + fail1
                            )
                        }
                    });

                });
                //保存商品
                goodsSave();
                cleanImgsPreview1();
            });
            //保存事件
            $scope.updateinfo = function (userId) {

                var userNickName = $("#userNickName").val();
                var userRemark1 = $("#userRemark1").val();
                var userBirthday = $("#userBirthday").val();
                var userSex = $('input:radio:checked').val();
                var userTelnum = $("#userTelnum").val();
                var userEmail = $("#userEmail").val();
                var oldimage = $("#oldimage").val();
                var newimage = $("#imgUrl").val();
                var userId = userId;
                if(userTelnum ==""){
                    $.ajax({
                        type: "POST",
                        url: "/user/updateinfo",
                        data: {

                            userNickName: userNickName,
                            userRemark1: userRemark1,
                            userBirthday: userBirthday,
                            userSex: userSex,
                            userTelnum: userTelnum,
                            userEmail: userEmail,
                            oldimage: oldimage,
                            newimage: newimage,
                            userId:userId
                        },
                        success: function (response) {
                            if (response.success) {
                                layer.msg("保存成功！",{time:700},{offset: 'rt'},function () {
                                    layer.close(index);
                                })
                            } else {
                                layer.msg("保存失败！",{time:700},{offset: 'rt'},function () {
                                    layer.close(index);
                                })
                            }
                        }
                    });
                }else if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(userTelnum))){
                    layer.msg("手机号码格式不正确！",{time:700},function () {
                        layer.close(index);
                    })
                    $("#addressTelnum1").focus();
                }else {
                    $.ajax({
                        type: "POST",
                        url: "/user/updateinfo",
                        data: {

                            userNickName: userNickName,
                            userRemark1: userRemark1,
                            userBirthday: userBirthday,
                            userSex: userSex,
                            userTelnum: userTelnum,
                            userEmail: userEmail,
                            oldimage: oldimage,
                            newimage: newimage,
                            userId:userId
                        },
                        success: function (response) {
                            if (response.success) {
                                layer.msg("保存成功！",{time:700},{offset: 'rt'},function () {
                                    layer.close(index);
                                })
                            } else {
                                layer.msg("保存失败！",{time:700},{offset: 'rt'},function () {
                                    layer.close(index);
                                })
                            }
                        }
                    });
                }

            }


        });






    </script>

</head>

<body ng-app="myApp" ng-controller="myController" ng-init="finduser('${sessionScope.users.userId}')">
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

            <div class="user-info">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
                </div>
                <hr/>

                <!--头像 -->
                <div class="user-infoPic">

                    <div class="filePic">
                        <input type="hidden" name="oldimage" value="{{userinfo.userImage}}" id="oldimage">
                        <input type="text" id="imgUrl" name="imgUrl" style="display: none;" class="layui-input">
                       <%-- <input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">--%>
                        <img  id="userImage" title="单击图片进行修改" class="am-circle am-img-thumbnail" src="${pageContext.request.contextPath}/fileuploadpath/useravatar/${sessionScope.userimgs}"  />
                    </div>

                    <p class="am-form-help">头像</p>

                    <div class="info-m">
                        <div><b>用户名：<i>{{userinfo.userName}}</i></b></div>
                        <div class="vip">
                            <span></span><a href="#">会员专享</a>
                        </div>
                    </div>
                </div>

                <!--个人信息 -->
                <div class="info-main">
                    <form class="am-form am-form-horizontal">

                        <div class="am-form-group">
                            <label for="userNickName" class="am-form-label">昵称</label>
                            <div class="am-form-content">
                                <input type="text" id="userNickName" placeholder="nickname" value="{{userinfo.userNickName}}">
                                <small>昵称长度不能超过40个汉字</small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="userRemark1" class="am-form-label">姓名</label>
                            <div class="am-form-content">
                                <input type="text" id="userRemark1" placeholder="name" value="{{userinfo.userRemark1}}">
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-form-label">性别</label>
                            <div class="am-form-content sex">
                                <label class="am-radio-inline">
                                    <input type="radio" name="radio10" value="1" data-am-ucheck id="male"> 男
                                </label>
                                <label class="am-radio-inline">
                                    <input type="radio" name="radio10" value="0" data-am-ucheck id="female"> 女
                                </label>
                                <label class="am-radio-inline">
                                    <input type="radio" name="radio10" value="2" data-am-ucheck id="secret"> 保密
                                </label>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="userBirthday" class="am-form-label">生日</label>
                            <div class="am-form-content">
                                <input id="userBirthday" placeholder="userBirthday" type="date" value="{{userinfo.userBirthday}}">
                            </div>

                        </div>
                        <div class="am-form-group">
                            <label for="userTelnum" class="am-form-label">电话</label>
                            <div class="am-form-content">
                                <input id="userTelnum" placeholder="telephonenumber" type="tel" value="{{userinfo.userTelnum}}">

                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="userEmail" class="am-form-label">电子邮件</label>
                            <div class="am-form-content">
                                <input id="userEmail" placeholder="Email" type="email" value="{{userinfo.userEmail}}">

                            </div>
                        </div>
                        <div class="info-btn">
                            <div class="am-btn am-btn-danger" ng-click="updateinfo('${sessionScope.users.userId}')">保存修改</div>
                        </div>
                    </form>
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