<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/3/22
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Mrlove书城后台管理系统</title>
    <jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/css_1.jsp"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/webuploader-0.1.5/webuploader.css">
</head>
<body data-type="index">
<!--引入头文件-->
<jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/header.jsp"/>

<div class="tpl-page-container tpl-page-header-fixed">
    <jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/menu.jsp"/>
    <div class="tpl-content-wrapper">
        <ol class="am-breadcrumb">
            <li><a href="${pageContext.request.contextPath}/page/hello.jsp" class="am-icon-home">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/page/document/document.jsp">文档库</a></li>
        </ol>
        <!--在这里添加你的内容-->
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-code">文档列表</span>
                </div>
                <div class="tpl-portlet-input tpl-fz-ml">
                    <div class="portlet-input input-small input-inline">
                        <div class="input-icon right">
                            <i class="am-icon-search"></i>
                            <input type="text" class="form-control form-control-solid" placeholder="搜索..."></div>
                    </div>
                </div>


            </div>
            <div class="tpl-block">
                <div class="am-g">
                    <div class="am-u-sm-12 am-u-md-6">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <a type="button" class="am-btn am-btn-default am-btn-secondary" href="/documents/selectAll"><span
                                        class="am-icon-search"></span> 查询
                                </a>

                                <button type="button" class="am-btn am-btn-default am-btn-success" id="btn_addDocument"><span
                                        class="am-icon-plus"></span> 新增
                                </button>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="am-g" id="div2">
                    <div class="am-u-sm-12">
                        <form class="am-form">
                            <table id="clazzTable" class="am-table am-table-striped am-table-hover table-main" >
                                <thead>
                                <tr>
                                    <input type="text" style="display:none">
                                    <th >图书编号</th>
                                    <th >图片1</th>
                                    <th >图片2</th>
                                    <th >图片2</th>
                                    <th >原价</th>
                                    <th >促销价</th>
                                    <th >月销量</th>
                                    <th>累计销量</th>
                                    <th >作者</th>
                                    <th >出版社</th>
                                    <th >出版年份</th>
                                    <th >内容简介</th>
                                    <th >作者简介</th>
                                    <th >目录</th>
                                    <th >媒体评论</th>
                                    <th>用户评价</th>
                                    <th >库存</th>
                                    <th>状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${allDocument}" var="document">
                                    <tr id="${document.documentId}">
                                        <td>${document.documentName}</td>
                                        <td>${document.documentPath}</td>
                                        <td>${document.documentGroupnum}</td>
                                        <td >${document.documentScore}
                                            <c:if test="${document.documentScore==null}">
                                                <a class="btn btn-link btn_showStudentMsg btn-documentScore">添加</a>
                                            </c:if>
                                        </td>
                                        <td>${document.documentType}</td>
                                        <td>${document.documentUploadtime}</td>
                                        <td>${document.documentSize}</td>
                                        <td>
                                            <div class="am-btn-toolbar">
                                                <div class="am-btn-group am-btn-group-xs">
                                                    <a class="am-btn am-btn-default am-btn-xs am-text-secondary btn-downloadDocument"><span
                                                            class="am-icon-pencil-square-o"></span> 下载
                                                    </a>
                                                    <a class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only btn-deleteDocument">
                                                        <span class="am-icon-trash-o"></span> 删除
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>

                </div>
            </div>
            <div class="tpl-alert"></div>
        </div>
    </div>
</div>

<jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/js_1.jsp"/>
<script src="${pageContext.request.contextPath}/webuploader-0.1.5/webuploader.js"></script>
<script>
    $("#btn_addDocument").click(function () {
        layer.open({
            title:'添加组号，与文件上传',
            type: 2,
            maxmin:false,
            area:['400px','650px'],
            content:"${pageContext.request.contextPath}/documents/addDoc"
        });
    });
    $(".am-g").delegate(".btn-deleteDocument","click",function () {
        var $tr= $(this).parents("tr");
        var idValue = $tr.attr("id");
        layer.confirm('确定删除:'+  $tr.find("td:eq(0)").html()+' 吗?', {icon: 3, title:'提示'}, function(index){
            //do something
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/documents/deleteDocument",
                data: {"id":idValue},
                success: function(data){
                    if(data["success"]){
                        layer.msg("操作成功！",{time:700},function () {
                            layer.close(index);
                            //parent.window.location.reload();
                            window.location.reload();
                        });
                    }

                },
                dataType:"json"
            });
        });
    });
    $(".am-g").delegate(".btn-downloadDocument","click",function () {
        var $tr= $(this).parents("tr");
        var idValue = $tr.attr("id");
        layer.open({
            type: 2,
            title:"确认下列文件进行下载",
            content: ["${pageContext.request.contextPath}/documents/downloadDocument?id="+idValue,"no"],
            area: ['400px', '220px']
        });
    });

    $(".am-g").delegate(".btn-documentScore","click",function () {
        var $tr= $(this).parents("tr");
        var idValue = $tr.attr("id");
        layer.open({
            type: 2,
            title:"确认添加分数",
            content: ["${pageContext.request.contextPath}/documents/addScore?id="+idValue,"no"],
            area: ['300px', '200px']
        });
    });
</script>
</body>
</html>
</html>
