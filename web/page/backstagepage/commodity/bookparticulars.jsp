<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/4/4
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>图书详情</title>
        <jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/css_1.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
</head>
<body data-type="index">

<!--引入头文件-->
<jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/header.jsp"/>

<div class="tpl-page-container tpl-page-header-fixed">
    <jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/menu.jsp"/>
    <div class="tpl-content-wrapper">
        <%--导航目录栏--%>
        <ol class="am-breadcrumb">
            <li><a href="${pageContext.request.contextPath}/page/backstagepage/hello.jsp" class="am-icon-home">首页</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/page/backstagepage/commodity/bookadd.jsp">图书详情</a></li>
        </ol>
        <!--在这里添加你的内容-->
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <%--小标题：图书详情--%>
                <div class="caption font-green bold">
                    <span class="am-icon-book">图书详情</span>
                </div>
                <%--搜索--%>
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
                    <div class="tpl-form-body tpl-form-line">
                        <form id="bookform" name="bookname" method="post" class="am-form tpl-form-line-form"
                              enctype="multipart/form-data">
                            <input type="hidden" name="bookId" value="${book.bookId}" id="bookId">
                            <%--编辑--%>
                            <div class="am-form-group">
                                <div class="am-u-sm-2 am-u-sm-push-10">
                                    <a type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success "
                                            href="/book/beforeUpdatebook?bookId=${book.bookId}">编辑
                                    </a>
                                </div>
                            </div>
                            <%--书编号--%>
                            <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label">图书编号：</label>
                                <div class="am-u-sm-10">
                                    <label class=" am-form-label">${book.bookNumber}</label>
                                </div>
                            </div>
                            <%--书名--%>
                            <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label">图书名称：</label>
                                <div class="am-u-sm-10">
                                    <label class=" am-form-label">${book.bookName}</label>
                                </div>
                            </div>
                            <%--预览图--%>
                            <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label">预览图：</label>      
                                <div class="layui-upload-list am-u-sm-10 " id="demo2">
                                    <img src="${pageContext.request.contextPath}/fileuploadpath/${image1}" id="img1"
                                         alt="2" height="150px" width="150px" class="layui-upload-img uploadImgPreView">
                                    <img src="${pageContext.request.contextPath}/fileuploadpath/${image2}" id="img2"
                                         alt="2" height="150px" width="150px" class="layui-upload-img uploadImgPreView">
                                    <img src="${pageContext.request.contextPath}/fileuploadpath/${image3}" id="img3"
                                         alt="2" height="150px" width="150px" class="layui-upload-img uploadImgPreView">
                                </div>      
                            </div>
                            <input type="text" id="imgUrls" name="imgUrls" style="display: none;" class="layui-input">
                            <%--价格--%>
                            <div class="am-form-group">

                                <label class="am-u-sm-2 am-form-label">原价：</label>
                                <div class="am-u-sm-2">
                                    <label class="am-form-label">${book.bookOriginalPrice}</label>
                                </div>

                                <label class="am-u-sm-2 am-form-label">促销价：</label>
                                <div class="am-u-sm-2">
                                    <label class="am-form-label">${book.bookPromotionPrice}</label>
                                </div>

                                <label class="am-u-sm-2 am-form-label">成本：</label>
                                <div class="am-u-sm-2">
                                    <label class="am-form-label">${book.bookCost}</label>
                                </div>
                            </div>
                            <%--类别--%>
                            <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label">类别：</label>
                                <div class="am-u-sm-2">
                                    <label class="am-form-label">${book.bookClazz}</label>
                                </div>

                                <label class="am-u-sm-2 am-form-label">子类别：</label>
                                <div class="am-u-sm-2 am-u-sm-pull-4">
                                    <label class="am-form-label">${book.bookSubclazz}</label>
                                </div>

                            </div>
                            <%--作者--%>
                            <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label">作者：</label>
                                <div class="am-u-sm-10">
                                    <label class="am-form-label">${book.bookAuthor}</label>
                                </div>
                            </div>
                            <%--出版年份方法二--%>
                            <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label" >出版年份：</label>
                                <div class="am-u-sm-2 am-u-sm-pull-8">
                                    <label class="am-form-label">${book.bookPublicationYear}</label>
                                </div>
                            </div>
                            <%--出版社--%>
                            <div class="am-form-group">
                                <label  class="am-u-sm-2 am-form-label">出版社：</label>
                                <div class="am-u-sm-10">
                                    <label class="am-form-label">${book.bookPress}</label>
                                </div>
                            </div>
                            <%--内容简介--%>
                            <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label">内容简介：</label>
                                <div class="am-u-sm-10">
                                    <textarea rows="6" id="plotsummary" style="background-color:white;" readonly="readonly"
                                              placeholder="请输入内容简介">${book.bookPlotSummary}</textarea>
                                </div>
                            </div>
                            <%--作者简介--%>
                            <div class="am-form-group">
                                <label for="biography" class="am-u-sm-2 am-form-label">作者简介：</label>
                                <div class="am-u-sm-10">
                                    <textarea  style="background-color:white;" rows="6" id="biography" readonly="readonly"
                                              placeholder="请输入作者简介">${book.bookBiography}</textarea>
                                </div>
                            </div>
                            <%--目录--%>
                            <div class="am-form-group">
                                <label for="catalog" class="am-u-sm-2 am-form-label">目录：</label>
                                <div class="am-u-sm-10">
                                    <textarea class="" rows="6" id="catalog" style="background-color:white;" readonly="readonly"
                                              placeholder="请输入目录简介">${book.bookCatalog}</textarea>
                                </div>
                            </div>
                            <%--媒体评论--%>
                            <div class="am-form-group">
                                <label for="mediacomments" class="am-u-sm-2 am-form-label">媒体评论：</label>
                                <div class="am-u-sm-10">
                                    <textarea class="" rows="6" id="mediacomments" style="background-color:white;" readonly="readonly"
                                              placeholder="请输入媒体评论">${book.bookMediaComments}</textarea>
                                </div>
                            </div>
                            <%--数量--%>
                            <div class="am-form-group">
                                <label  class="am-u-sm-2 am-form-label">数量：</label>
                                <div class="am-u-sm-2 am-u-sm-pull-8">
                                    <label  class="am-form-label">${book.bookInventory}</label>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/js_1.jsp"/>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.1.min.js" type="text/javascript"
        charset="utf-8"></script>

<script>
</script>
</body>
</html>
</html>
