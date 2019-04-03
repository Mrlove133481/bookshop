<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>项目与事务管理系统</title>
    <jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/css_1.jsp"></jsp:include>
</head>
<body data-type="index">
<!--引入头文件-->
<jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/header.jsp"></jsp:include>

<div class="tpl-page-container tpl-page-header-fixed">
    <jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/menu.jsp"></jsp:include>
    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
         首页
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">首页</a></li>
        </ol>
        <!--在这里添加你的内容-->
        <div class="tpl-portlet-components">
               <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                   <div class="dashboard-stat green">
                       <div class="visual">
                           <i class="am-icon-apple"></i>
                       </div>
                       <div class="details">
                           <div class="number"> 项目 </div>
                           <div class="desc">project </div>
                       </div>
                       <a class="more" href="#"> 查看更多
                           <i class="m-icon-swapright m-icon-white"></i>
                       </a>
                   </div>
               </div>
               <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                   <div class="dashboard-stat green">
                       <div class="visual">
                           <i class="am-icon-apple"></i>
                       </div>
                       <div class="details">
                           <div class="number"> 教学计划 </div>
                           <div class="desc"> teaching program </div>
                       </div>
                       <a class="more" href="#"> 查看更多
                           <i class="m-icon-swapright m-icon-white"></i>
                       </a>
                   </div>
               </div>
               <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                   <div class="dashboard-stat green">
                       <div class="visual">
                           <i class="am-icon-apple"></i>
                       </div>
                       <div class="details">
                           <div class="number"> 班级 </div>
                           <div class="desc"> class </div>
                       </div>
                       <a class="more" href="#"> 查看更多
                           <i class="m-icon-swapright m-icon-white"></i>
                       </a>
                   </div>
               </div>
               <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                   <div class="dashboard-stat green">
                       <div class="visual">
                           <i class="am-icon-apple"></i>
                       </div>
                       <div class="details">
                           <div class="number"> 教学任务 </div>
                           <div class="desc"> teaching task </div>
                       </div>
                       <a class="more" href="#"> 查看更多
                           <i class="m-icon-swapright m-icon-white"></i>
                       </a>
                   </div>
               </div>
        </div>
    </div>
</div>
<jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/footer.jsp"></jsp:include>
</body>
<jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/js_1.jsp"></jsp:include>
</html>