<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/4/9
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.css" />
    <link href="${pageContext.request.contextPath}/page/common/dlstyle.css" rel="stylesheet" type="text/css">
    <style>
       #submit:hover
        {
            background-color:yellow;
        }
    </style>


</head>

<body>

<div class="login-boxtitle">
    <a href="${pageContext.request.contextPath}/page/index.jsp"><img alt="logo"  src="${pageContext.request.contextPath}/images/logo.png" /></a>
</div>

<div class="login-banner" style="background: url('${pageContext.request.contextPath}/images/big1.jpg')">
    <div class="login-main" >
        <div class="login-banner-bg"><span></span><img src="" /></div>
        <div class="login-box">

            <h3 class="title">登录Mrlove书城</h3>

            <div class="clear"></div>

            <div class="login-form">
                <form id="loginform" method="post" action="/login">
                    <div class="user-name">
                        <label for="user"><i class="am-icon-user"></i></label>
                        <input type="text" name="username" id="user" placeholder="邮箱/手机/用户名" style="outline-color:#b6795f">
                    </div>
                    <div class="user-pass">
                        <label for="password"><i class="am-icon-lock"></i></label>
                        <input type="password" name="password" id="password" placeholder="请输入密码" style="outline-color:#b6795f">
                    </div>
                </form>
            </div>

            <div class="login-links">
                <label for="remember-me"><input id="remember-me" type="checkbox">记住密码</label>
                <a href="#" class="am-fr">忘记密码</a>
                <a href="${pageContext.request.contextPath}/page/register.jsp" class="zcnext am-fr am-btn-default">注册</a>
                <br />
            </div>
            <div class="am-cf">
                <input type="submit"   id="submit" name="submit" onclick="tijiao();" value="登 录" class="am-btn am-btn-primary am-btn-sm" style="background-color:#b6795f;
    border-color:#b6795f;outline-color:#b6795f;">
            </div>
            <div class="partner">
                <h3>合作账号</h3>
                <div class="am-btn-group">
                    <li><a href="#"><i class="am-icon-qq am-icon-sm" style="color: #b6795f"></i><span>QQ登录</span></a></li>
                    <li><a href="#"><i class="am-icon-weibo am-icon-sm" style="color: #b6795f"></i><span>微博登录</span> </a></li>
                    <li><a href="#"><i class="am-icon-weixin am-icon-sm" style="color: #b6795f"></i><span>微信登录</span> </a></li>
                </div>
            </div>

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
</body>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/layer/layer.js"></script>

<script>
    function tijiao() {
        document.getElementById("loginform").submit();//表单提交
    }
</script>
<script>
    var nums = ${nums};
    if(nums ==1){
        layer.msg("请输入用户名！",{time:700},{offset: 'rt'},function () {
            layer.close(index);
        })
    }
    if(nums ==2){
        layer.msg("请输入密码！",{time:700},function () {
            layer.close(index);
        })
    }
    if(nums ==3){
        layer.msg("密码错误！",{time:700},function () {
            layer.close(index);
        })
    }
    if(nums ==4){
        layer.msg("用户不存在！",{time:700},function () {
            layer.close(index);
        })
    }
</script>
</html>