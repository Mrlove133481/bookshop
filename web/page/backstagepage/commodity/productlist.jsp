<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/3/25
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>图书列表</title>
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
            <li><a href="${pageContext.request.contextPath}/page/backstagepage/hello.jsp" class="am-icon-home">首页</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/page/backstagepage/commodity/productlist.jsp">图书列表</a></li>
        </ol>
        <!--在这里添加你的内容-->
        <div class="tpl-portlet-components">
              <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-book">图书列表</span>
                    </div>
                  <%--搜索--%>
                    <%--<div class="tpl-portlet-input tpl-fz-ml">
                        <div class="portlet-input input-small input-inline">
                            <div class="input-icon right" id="bookTable_filter">
                                <i class="am-icon-search"></i>
                                <input type="search" class="form-control form-control-solid" placeholder="搜索..." id="search" aria-controls="bookTable"></div>
                        </div>
                    </div>--%>
                </div>
            <div class="tpl-block">
            <div class="am-g">
                    <div class="am-u-sm-12 am-u-md-6">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <a type="button" class="am-btn am-btn-default am-btn-secondary"
                                   href="/book/selectAll"><span
                                        class="am-icon-search"></span> 查询
                                </a>
                                <button type="button" class="am-btn am-btn-default am-btn-success"
                                        onclick="window.location='${pageContext.request.contextPath}/page/backstagepage/commodity/bookadd.jsp'"><span
                                        class="am-icon-plus"></span> 新增
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="am-g">
                    <div class="am-u-sm-12">
                        <form class="am-form">
                            <table id="bookTable" class="am-table am-table-striped am-table-hover table-main">
                                <thead>
                                <tr>
                                    <input type="text" style="display:none">
                                    <th data-options="formatter:formatCellTooltip">图书编号</th>
                                    <th>书名</th>
                                    <th>类别</th>
                                    <th>子类别</th>
                                    <th>用户评价</th>
                                    <th>价格</th>
                                    <th>成本</th>
                                    <th>销量</th>
                                    <th>库存</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${allBooks}" var="allBooks">
                                    <tr id="${allBooks.bookId}">
                                        <td title="点击查看详情">${allBooks.bookNumber}</td>
                                        <td>${allBooks.bookName}</td>
                                        <td>${allBooks.bookClazz}</td>
                                        <td>${allBooks.bookSubclazz}</td>
                                        <td>
                                            <a class="btn btn-link"
                                               href="${pageContext.request.contextPath}/Clazz/toClazzGroup?clazzName=${clazz.clazzName}">
                                                    ${allBooks.bookUserComments}
                                            </a>
                                        </td>
                                        <td>${allBooks.bookPromotionPrice}</td>
                                        <td>${allBooks.bookCost}</td>
                                        <td>${allBooks.bookTotalSales}</td>
                                        <td>${allBooks.bookInventory}</td>
                                        <td>
                                            <c:if test="${allBooks.bookStatus==1}">
                                                <a class="btn btn-link btn-onbooks">上架</a>
                                            </c:if>
                                            <c:if test="${allBooks.bookStatus==2}">
                                                <a class="btn btn-link btn-offbooks">下架</a>
                                            </c:if>
                                        </td>
                                        <td>
                                            <div class="am-btn-toolbar">
                                                <div class="am-btn-group am-btn-group-xs">
                                                    <a class="am-btn am-btn-default am-btn-xs am-text-secondary btn-updatebook" href="/book/beforeUpdatebook?bookId=${allBooks.bookId}" ><span
                                                            class="am-icon-pencil-square-o"></span> 编辑
                                                    </a>
                                                    <a class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only btn-deleteBook">
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
        </div>
    </div>
</div>

<jsp:include page="${pageContext.request.contextPath}/page/backstagecommon/js_1.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>

<%--<script>
    $("#btn_addDocument").click(function () {
        layer.open({
            title: '添加组号，与文件上传',
            type: 2,
            maxmin: false,
            area: ['400px', '650px'],
            content: "${pageContext.request.contextPath}/documents/addDoc"
        });
    });
    $(".am-g").delegate(".btn-deleteDocument", "click", function () {
        var $tr = $(this).parents("tr");
        var idValue = $tr.attr("id");
        layer.confirm('确定删除:' + $tr.find("td:eq(0)").html() + ' 吗?', {icon: 3, title: '提示'}, function (index) {
            //do something
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/documents/deleteDocument",
                data: {"id": idValue},
                success: function (data) {
                    if (data["success"]) {
                        layer.msg("操作成功！", {time: 700}, function () {
                            layer.close(index);
                            //parent.window.location.reload();
                            window.location.reload();
                        });
                    }

                },
                dataType: "json"
            });
        });
    });

    $(".am-g").delegate(".btn-downloadDocument", "click", function () {
        var $tr = $(this).parents("tr");
        var idValue = $tr.attr("id");
        layer.open({
            type: 2,
            title: "确认下列文件进行下载",
            content: ["${pageContext.request.contextPath}/documents/downloadDocument?id=" + idValue, "no"],
            area: ['400px', '220px']
        });
    });

    $(".am-g").delegate(".btn-documentScore", "click", function () {
        var $tr = $(this).parents("tr");
        var idValue = $tr.attr("id");
        layer.open({
            type: 2,
            title: "确认添加分数",
            content: ["${pageContext.request.contextPath}/documents/addScore?id=" + idValue, "no"],
            area: ['300px', '200px']
        });
    });
</script>--%>

<script>

    var table =  $('#bookTable').DataTable({
            'paging': true,
            'lengthChange':false,
            'searching': true,
            'ordering': true,
            'info': true,
            'autoWidth': false,
            'language': {
                "paginate": {
                    "next": "下一页",
                    "previous": "上一页"
                },
                "sZeroRecords": "没有找到",
                "search": '搜索:',
                "emptyTable": "无可用数据",
                "lengthMenu": "_MENU_项/页",
                "info": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项"
            }
        });
    $(".am-g").delegate(".btn-onbooks", "click", function () {
        var $tr = $(this).parents("tr");
        var idValue = $tr.attr("id");
        $.ajax({
            type: "POST",
            url: "/book/offbook",
            data: {bookId: idValue},
            success: function (data) {
                if (data["success"]) {
                    layer.msg("操作成功！", {time: 700}, function () {
                        window.location.reload();
                    });
                }
                else {
                    layer.msg("操作失败！", {time: 700}, function () {
                        //parent.window.location.reload();
                        window.location.reload();
                    });
                }
            }
        });
    });
    //下架按钮点击事件
    $(".am-g").delegate(".btn-offbooks", "click", function () {
        var $tr = $(this).parents("tr");
        var idValue = $tr.attr("id");
        $.ajax({
            type: "POST",
            url: "/book/onbook",
            data: {bookId: idValue},
            success: function (data) {
                if (data["success"]) {
                    layer.msg("操作成功！", {time: 700}, function () {
                        //parent.window.location.reload();
                        window.location.reload();
                    });
                }
                else {
                    layer.msg("操作失败！", {time: 700}, function () {
                        //parent.window.location.reload();
                        window.location.reload();
                    });
                }
            }
        });
    });
    //删除图书
    $(".am-g").delegate(".btn-deleteBook", "click", function () {
        var $tr = $(this).parents("tr");
        var idValue = $tr.attr("id");
        layer.confirm('确定删除:' + $tr.find("td:eq(0)").html() + ' 吗?', {icon: 3, title: '提示'}, function (index) {
            //do something
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/book/deleteBook",
                data: {bookId: idValue},
                success: function (data) {
                    if (data["success"]) {
                        layer.msg("操作成功！", {time: 700}, function () {
                            layer.close(index);
                            window.location.reload();
                        });
                    } else {
                        layer.msg("操作失败！", {time: 700}, function () {
                            layer.close(index);
                            window.location.reload();
                        });
                    }
                },
                dataType: "json"
            });
        });
    });

    //格式化单元格提示信息
    function formatCellTooltip(value){
        return "<span title='" + value + "'>" + value + "</span>";
    }
</script>

</body>
</html>
</html>
