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

    <style>
        input{
            outline-color:#b6795f;
        }
    </style>


</head>

<body>

<div class="login-boxtitle">
    <a href="home/demo.html"><img alt="" src="" /></a>
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
                        <form method="post">
                            <div class="user-email">
                                <label for="email"><i class="am-icon-envelope-o"></i></label>
                                <input type="email" name="" id="email" placeholder="请输入邮箱账号">
                            </div>
                            <div class="user-pass">
                                <label for="password"><i class="am-icon-lock"></i></label>
                                <input type="password" name="" id="password" placeholder="设置密码">
                            </div>
                            <div class="user-pass">
                                <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
                                <input type="password" name="" id="passwordRepeat" placeholder="确认密码">
                            </div>
                        </form>
                        <div class="login-links">
                            <label for="reader-me">
                                <input id="reader-me" type="checkbox"> 点击表示您同意商城《服务协议》
                            </label>
                        </div>
                        <div class="am-cf">
                            <input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl" style="background-color:#b6795f;
    border-color:#b6795f;outline-color:#b6795f;">
                        </div>
                    </div>
                    <%--手机号注册--%>
                    <div class="am-tab-panel">
                        <form method="post">
                            <div class="user-phone">
                                <label for="phone"><i class="am-icon-mobile-phone am-icon-md"></i></label>
                                <input type="tel" name="" id="phone" placeholder="请输入手机号">
                            </div>
                            <div class="verification">
                                <label for="code"><i class="am-icon-code-fork"></i></label>
                                <input type="tel" name="" id="code" placeholder="请输入验证码">
                                <a class="btn" href="javascript:void(0);" onclick="sendMobileCode();" id="sendMobileCode">
                                    <span id="dyMobileButton">获取</span></a>
                            </div>
                            <div class="user-pass">
                                <label for="password1"><i class="am-icon-lock"></i></label>
                                <input type="password" name="" id="password1" placeholder="设置密码">
                            </div>
                            <div class="user-pass">
                                <label for="passwordRepeat1"><i class="am-icon-lock"></i></label>
                                <input type="password" name="" id="passwordRepeat1" placeholder="确认密码">
                            </div>
                        </form>
                        <div class="login-links">
                            <label for="reader-me1">
                                <input id="reader-me1" type="checkbox"> 点击表示您同意商城《服务协议》
                            </label>
                        </div>
                        <div class="am-cf">
                            <input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl" style="background-color:#b6795f;
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
                <a href="# ">恒望科技</a>
                <b>|</b>
                <a href="# ">商城首页</a>
                <b>|</b>
                <a href="# ">支付宝</a>
                <b>|</b>
                <a href="# ">物流</a>
            </p>
        </div>
        <div class="footer-bd ">
            <p>
                <a href="# ">关于恒望</a>
                <a href="# ">合作伙伴</a>
                <a href="# ">联系我们</a>
                <a href="# ">网站地图</a>
                <em>© 2015-2025 Hengwang.com 版权所有</em>
            </p>
        </div>
    </div>
</div>
</body>

</html>