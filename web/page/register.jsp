<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/4/9
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>注册</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <jsp:include page="${pageContext.request.contextPath}/page/common/css.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
    <link href="${pageContext.request.contextPath}/page/common/dlstyle.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <style>
        input{
            outline-color:#b6795f;
        }
    </style>


</head>

<body>

<div class="login-boxtitle">
    <a href="${pageContext.request.contextPath}/page/index.jsp"><img alt="" src="${pageContext.request.contextPath}/images/logo.png" /></a>
</div>
<div class="res-banner" style="background: url('${pageContext.request.contextPath}/images/big1.jpg')">
    <div class="res-main">
        <div class="login-banner-bg"><span></span><img src="" /></div>
        <div class="login-box">
            <div class="am-tabs" id="doc-my-tabs">
                <ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
                    <li class="am-active"><a href="">邮箱注册</a></li>
                    <li><a href="">手机号注册</a></li>
                </ul>
                <div class="am-tabs-bd">
                    <%--邮箱注册--%>
                    <div class="am-tab-panel am-active">
                        <form method="post" id="emailform" action="/login/register">
                            <div class="user-email">
                                <label for="email"><i class="am-icon-envelope-o"></i></label>
                                <input type="email" name="email" maxlength="50" id="email" placeholder="请输入邮箱账号">
                            </div>
                            <div class="user-name">
                                <label for="name"><i class="am-icon-user"></i></label>
                                <input type="txt" name="name" maxlength="15" id="name" placeholder="设置用户名">
                            </div>
                            <div class="user-pass">
                                <label for="password"><i class="am-icon-lock"></i></label>
                                <input type="password" name="password" maxlength="20" id="password" placeholder="设置密码">
                            </div>
                            <div class="user-pass">
                                <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
                                <input type="password" name="passwordRepeat" maxlength="20" id="passwordRepeat" placeholder="确认密码">
                            </div>
                        </form>
                        <div class="login-links">
                            <label for="reader-me">
                                <input id="reader-me" type="checkbox"> 点击表示您同意商城《服务协议》
                            </label>
                        </div>
                        <div class="am-cf">
                            <input type="submit" name="" onclick="emailzhuce();" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl" style="background-color:#b6795f;
    border-color:#b6795f;outline-color:#b6795f;">
                        </div>
                    </div>
                    <%--手机号注册--%>
                    <div class="am-tab-panel">
                        <form method="post" id="telform" action="/login/register">
                            <div class="user-phone">
                                <label for="phone"><i class="am-icon-mobile-phone am-icon-md"></i></label>
                                <input type="tel" name="phone" maxlength="16" id="phone" placeholder="请输入手机号">
                            </div>
                            <div class="user-name">
                                <label for="name1"><i class="am-icon-user"></i></label>
                                <input type="txt" name="name1" maxlength="15" id="name1" placeholder="设置用户名">
                            </div>
                            <div class="verification">
                                <label for="code"><i class="am-icon-code-fork"></i></label>
                                <input type="tel" name="code" id="code" placeholder="请输入验证码">
                                <a class="btn" href="javascript:void(0);" onclick="sendMobileCode();" id="sendMobileCode">
                                    <span id="dyMobileButton">获取</span></a>
                            </div>
                            <div class="user-pass">
                                <label for="password1"><i class="am-icon-lock"></i></label>
                                <input type="password" name="password1" maxlength="20" id="password1" placeholder="设置密码">
                            </div>
                            <div class="user-pass">
                                <label for="passwordRepeat1"><i class="am-icon-lock"></i></label>
                                <input type="password" name="passwordRepeat1" maxlength="20" id="passwordRepeat1" placeholder="确认密码">
                            </div>
                        </form>
                        <div class="login-links">
                            <label for="reader-me1">
                                <input id="reader-me1" type="checkbox"> 点击表示您同意商城《服务协议》
                            </label>
                        </div>
                        <div class="am-cf">
                            <input type="submit" name="" onclick="telzhuce();" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl" style="background-color:#b6795f;
    border-color:#b6795f;outline-color:#b6795f;">
                        </div>
                        <hr>
                    </div>
                    <script>
                        $(function() {
                            $('#doc-my-tabs').tabs();
                        })
                    </script>
                </div>
            </div>
        </div>
    </div>

    <div class="footer ">
        <div class="footer-hd ">
            <p>
                <a href="${pageContext.request.contextPath}/page/index.jsp">商城首页</a>
                <b>|</b>
                <a href="${pageContext.request.contextPath}/page/login.jsp">登录</a>
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
</body>

<script>
    function emailzhuce() {
        var check = $("#reader-me").prop("checked");
        var email = $("#email").val();
        var name = $("#name").val();
        var password = $("#password").val();
        var passwordRepeat = $("#passwordRepeat").val();
        var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //邮箱验证正则表达式
        if(email == ""){
            layer.msg("注册邮箱不能为空！",{time:700},{offset: 'rt'},function () {
                layer.close(index);
            })
        }else if(!reg.test(email)){
            layer.msg("注册邮箱格式不对！",{time:700},{offset: 'rt'},function () {
                layer.close(index);
            })
        } else if(name ==""){
            layer.msg("用户名不能为空！",{time:700},{offset: 'rt'},function () {
                layer.close(index);
            })
        }else if(password == ""){
            layer.msg("密码不能为空！",{time:700},{offset: 'rt'},function () {
                layer.close(index);
            })
        }else if(check == false){
            layer.msg("抱歉未同意协议，暂不能提供注册！",{time:1000},{offset: 'rt'},function () {
                layer.close(index);
            })
        }else if(password==passwordRepeat){
            document.getElementById("emailform").submit();
        } else {
            layer.msg("密码不一致！",{time:700},{offset: 'rt'},function () {
                layer.close(index);
            })
        }

    };
    function telzhuce() {
        var check = $("#reader-me1").prop("checked");
        var phone = $("#phone").val();
        var name1 = $("#name1").val();
        var password1 = $("#password1").val();
        var passwordRepeat1 = $("#passwordRepeat1").val();
        if(phone == ""){
            layer.msg("注册手机不能为空！",{time:700},{offset: 'rt'},function () {
                layer.close(index);
            })
        }else if(name1 ==""){
            layer.msg("用户名不能为空！",{time:700},{offset: 'rt'},function () {
                layer.close(index);
            })
        }else if(password1 == ""){
            layer.msg("密码不能为空！",{time:700},{offset: 'rt'},function () {
                layer.close(index);
            })
        }else if(check == false){
            layer.msg("抱歉未同意协议，暂不能提供注册！",{time:1000},{offset: 'rt'},function () {
                layer.close(index);
            })
        }else if(password1==passwordRepeat1){
            document.getElementById("telform").submit();
        } else {
            layer.msg("密码不一致！",{time:700},{offset: 'rt'},function () {
                layer.close(index);
            })
        }
    }
</script>
<script>
    var num = ${num}
    if(num == 1){
        layer.msg("用户名已存在，请重新输入！",{time:1000},{offset: 'rt'},function () {
            layer.close(index);
        })
    }
    if(num == 2){
        layer.msg("电子邮箱已注册，请重新输入！",{time:1000},{offset: 'rt'},function () {
            layer.close(index);
        })
    }
    if(num == 3){
        layer.msg("电话号码已注册，请重新输入！",{time:1000},{offset: 'rt'},function () {
            layer.close(index);
        })
    }
</script>
</html>