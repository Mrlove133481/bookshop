<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/css_1.jsp"></jsp:include>
</head>

<body data-type="login">

<div class="am-g myapp-login">
    <div class="myapp-login-logo-block  tpl-login-max">
        <div class="myapp-login-logo-text">
            <div class="myapp-login-logo-text">
                Secondproject<span> Login</span> <i class="am-icon-skyatlas"></i>
            </div>
        </div>
        <div class="login-font" style="height:100px;">
        </div>
        <div class="am-u-sm-10 login-am-center">
            <form class="am-form" id="loginform1" action="/login/user" method="post">
                <fieldset>
                    <div class="am-form-group">
                        <input type="text" class="" id="username" maxlength="10"  placeholder="输入用户名" name="username">
                    </div>
                    <div class="am-form-group">
                        <input type="password" class="" id="pwd" maxlength="10"  placeholder="输入登录密码" name="pwd">
                    </div>
                    <p><button type="submit" class="am-btn am-btn-default">登录</button></p>
                </fieldset>
            </form>
        </div>
    </div>
</div>

<jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/js_1.jsp"/>

</body>
<script>
    var nums = ${nums};
    if(nums ==1){
        layer.msg("请输入用户名！",{time:700},function () {
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
