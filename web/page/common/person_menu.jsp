<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/4/30
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="menu">
    <ul>
        <li class="person active" style="border-bottom: 3px solid #ac471b;">
            <a href="person.jsp" style="color: #b6795f;"><i class="am-icon-user"></i>个人中心</a>
        </li>
        <li class="person">
            <p><i class="am-icon-newspaper-o"></i>个人资料</p>
            <ul>
                <li> <a href="/page/person/personalinfo.jsp">个人信息</a></li>
                <li> <a href="safety.html">安全设置</a></li>
                <li> <a href="/page/person/address.jsp">地址管理</a></li>
            </ul>
        </li>
        <li class="person">
            <p><i class="am-icon-balance-scale"></i>我的交易</p>
            <ul>
                <li><a href="/page/person/order.jsp">订单管理</a></li>
                <li> <a href="change.html">退款售后</a></li>
                <li> <a href="comment.html">评价商品</a></li>
            </ul>
        </li>
      <%--  <li class="person">
            <p><i class="am-icon-dollar"></i>我的资产</p>
            <ul>
                <li> <a href="points.html">我的积分</a></li>
                <li> <a href="coupon.html">优惠券 </a></li>
                <li> <a href="bonus.html">红包</a></li>
                <li> <a href="walletlist.html">账户余额</a></li>
                <li> <a href="bill.html">账单明细</a></li>
            </ul>
        </li>--%>

        <li class="person">
            <p><i class="am-icon-tags"></i>我的收藏</p>
            <ul>
                <li> <a href="/page/person/collect.jsp">收藏</a></li>
            </ul>
        </li>

        <li class="person">
            <p><i class="am-icon-qq"></i>在线客服</p>
            <ul>
                <li> <a href="consultation.html">商品咨询</a></li>
                <li> <a href="suggest.html">意见反馈</a></li>

                <li> <a href="news.html">我的消息</a></li>
            </ul>
        </li>
    </ul>
</aside>