<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="tpl-left-nav tpl-left-nav-hover">
    <div class="tpl-left-nav-title">
        Mrlove书城后台管理系统
    </div>
    <div class="tpl-left-nav-list">
        <ul class="tpl-left-nav-menu">
            <li class="tpl-left-nav-item">
                <a href="${pageContext.request.contextPath}/page/backstagepage/hello.jsp" class="nav-link active">
                    <i class="am-icon-home"></i>
                    <span>首页</span>
                </a>
            </li>
            <li class="tpl-left-nav-item">
                <a class="nav-link tpl-left-nav-link-list" href="javascript:;"  >
                    <i class="am-icon-bar-chart"></i>
                    <span>图书管理</span>
                    <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                </a>
                <ul class="tpl-left-nav-sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/page/backstagepage/commodity/productlist.jsp">
                            <i class="am-icon-angle-right"></i>
                            <span>图书列表</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/page/backstagepage/commodity/bookadd.jsp">
                            <i class="am-icon-angle-right"></i>
                            <span>添加图书</span>
                        </a>


                    </li>
                </ul>
            </li>
            <li class="tpl-left-nav-item">
                <a href="${pageContext.request.contextPath}/page/project/project.jsp" class="nav-link tpl-left-nav-link-list">
                    <i class="am-icon-bar-chart"></i>
                    <span>项目库</span>
                </a>
            </li>
            <li class="tpl-left-nav-item">
                <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                    <i class="am-icon-table"></i>
                    <span>教学管理</span>
                    <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                </a>
                <ul class="tpl-left-nav-sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/page/teach/index.jsp">
                            <i class="am-icon-angle-right"></i>
                            <span>教学任务</span>
                        </a>

                        <a href="${pageContext.request.contextPath}/page/teach/index1.jsp">
                            <i class="am-icon-angle-right"></i>
                            <span>教学计划</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="tpl-left-nav-item">
                <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                    <i class="am-icon-table"></i>
                    <span>人员管理</span>
                    <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                </a>
                <ul class="tpl-left-nav-sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/Student/selectAll">
                            <i class="am-icon-angle-right"></i>
                            <span>学生管理</span>
                        </a>

                        <a href="${pageContext.request.contextPath}/Engineer/selectAll">
                            <i class="am-icon-angle-right"></i>
                            <span>工程师管理</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="tpl-left-nav-item">
                <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                    <i class="am-icon-table"></i>
                    <span>班组管理</span>
                    <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                </a>
                <ul class="tpl-left-nav-sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/Clazz/selectAll">
                            <i class="am-icon-angle-right"></i>
                            <span>班级管理</span>
                        </a>

                        <a href="${pageContext.request.contextPath}/Group/selectAll">
                            <i class="am-icon-angle-right"></i>
                            <span>分组管理</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
