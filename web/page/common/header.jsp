<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/4/30
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="am-container header">
    <ul class="message-l">
        <div class="topMessage">
            <div class="menu-hd" id="showDate" style="text-align: left;margin-left: -27px; font-weight:bold;color: #b6795f; ">
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
                        var minutes =change(myDate.getMinutes());
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
            <div class="menu-hd MyShangcheng"><a href="/page/person/person.jsp" target="_top" style="color:#b6795f"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
        </div>
        <div class="topMessage mini-cart">
            <div class="menu-hd"><a id="mc-menu-hd" href="${pageContext.request.contextPath}/page/shopcart.jsp" target="_top" style="color:#b6795f"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
        </div>
        <div class="topMessage favorite">
            <div class="menu-hd"><a href="/page/person/collect.jsp" target="_top" style="color:#b6795f"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
        </div>
    </ul>
</div>
<%--<div class="am-container header">
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
</div>--%>
