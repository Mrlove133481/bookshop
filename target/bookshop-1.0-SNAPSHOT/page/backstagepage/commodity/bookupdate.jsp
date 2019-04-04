<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/3/29
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>编辑图书</title>
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
            <li><a href="${pageContext.request.contextPath}/page/backstagepage/commodity/bookadd.jsp">添加图书</a></li>
        </ol>
        <!--在这里添加你的内容-->
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <%--小标题：编辑图书--%>
                <div class="caption font-green bold">
                    <span class="am-icon-book">编辑图书</span>
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
                            <%--书名--%>
                            <div class="am-form-group">
                                <label for="bookname" class="am-u-sm-2 am-form-label">图书名称</label>
                                <div class="am-u-sm-10">
                                    <input type="text" class="tpl-form-input" id="bookname" placeholder="请输入书名" value="${book.bookName}">
                                </div>
                            </div>
                            <%--图片--%>
                           <%-- <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label">图片上传</label>       
                                <div class="am-u-sm-6">
                                    <button type="button" class="layui-btn " id="test1"><i
                                            class="layui-icon">&#xe67c;</i>选择图片（选择3张，单张图片最大为10M）
                                    </button>
                                </div>
                                <div class="am-u-sm-2">
                                    <button type="button" class="layui-btn " id="test9">开始上传</button>
                                </div>
                                <div class="am-u-sm-1 am-u-sm-pull-1">
                                    <button type="button" class="layui-btn " id="cleanImgs">清空预览</button>
                                </div>
                                                    
                            </div>--%>
                            <%--预览图--%>
                            <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label">预览图</label>      
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

                                <label for="originalprice" class="am-u-sm-2 am-form-label">原价</label>
                                <div class="am-u-sm-2">
                                    <input type="number" class="tpl-form-input" id="originalprice" placeholder="元"
                                           onkeyup="clearNoNum(this)" min="0" max="9999999" value="${book.bookOriginalPrice}">
                                </div>

                                <label for="promotionprice" class="am-u-sm-2 am-form-label">促销价</label>
                                <div class="am-u-sm-2">
                                    <input type="number" class="tpl-form-input" id="promotionprice" placeholder="元"
                                           onkeyup="clearNoNum(this)" min="0" max="9999999" value="${book.bookPromotionPrice}">
                                </div>

                                <label for="cost" class="am-u-sm-2 am-form-label">成本</label>
                                <div class="am-u-sm-2">
                                    <input type="number" class="tpl-form-input" id="cost" placeholder="元"
                                           onkeyup="clearNoNum(this)" min="0" max="9999999" value="${book.bookCost}">
                                </div>

                            </div>
                            <%--类别--%>
                            <div class="am-form-group">

                                <label for="clazz" class="am-u-sm-2 am-form-label">类别</label>
                                <div class="am-u-sm-2">
                                    <input type="text" class="tpl-form-input" id="clazz" placeholder="请输入类别" value="${book.bookClazz}">
                                </div>

                                <label for="subclazz" class="am-u-sm-2 am-form-label">子类别</label>
                                <div class="am-u-sm-2 am-u-sm-pull-4">
                                    <input type="text" class="tpl-form-input" id="subclazz" placeholder="请输入子类别" value="${book.bookSubclazz}">
                                </div>

                            </div>
                            <%--作者--%>
                            <div class="am-form-group">
                                <label for="auther" class="am-u-sm-2 am-form-label">作者</label>
                                <div class="am-u-sm-10">
                                    <input type="text" class="tpl-form-input" id="auther" placeholder="请输入作者名" value="${book.bookAuthor}">
                                </div>
                            </div>
                            <%--出版年份--%>
                            <%--<div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label" for="testdate">出版年份</label>
                                <div class="am-u-sm-10">
                                    <input type="text" name="testdate" id="testdate" lay-verify="date"
                                           placeholder="yyyy-MM-dd" autocomplete="off"
                                           class="am-form-field tpl-form-no-bg">
                                </div>
                            </div>--%>
                            <%--出版年份方法二--%>
                            <div class="am-form-group">
                                <label class="am-u-sm-2 am-form-label" for="testdate">出版年份</label>
                                <div class="am-u-sm-2 am-u-sm-pull-8">
                                    <input type="date" name="testdate" id="testdate" class="tpl-form-input" value="${book.bookPublicationYear}"  placeholder="${book.bookPublicationYear}">
                                </div>
                            </div>
                            <%--出版社--%>
                            <div class="am-form-group">
                                <label for="press" class="am-u-sm-2 am-form-label">出版社</label>
                                <div class="am-u-sm-10">
                                    <input type="text" class="tpl-form-input" id="press" placeholder="请输入出版社" value="${book.bookPress}">
                                </div>
                            </div>
                            <%--内容简介--%>
                            <div class="am-form-group">
                                <label for="plotsummary" class="am-u-sm-2 am-form-label">内容简介</label>
                                <div class="am-u-sm-10">
                                    <textarea class="" rows="6" id="plotsummary" placeholder="请输入内容简介">${book.bookPlotSummary}</textarea>
                                </div>
                            </div>
                            <%--作者简介--%>
                            <div class="am-form-group">
                                <label for="biography" class="am-u-sm-2 am-form-label">作者简介</label>
                                <div class="am-u-sm-10">
                                    <textarea class="" rows="6" id="biography" placeholder="请输入作者简介">${book.bookBiography}</textarea>
                                </div>
                            </div>
                            <%--目录--%>
                            <div class="am-form-group">
                                <label for="catalog" class="am-u-sm-2 am-form-label">目录</label>
                                <div class="am-u-sm-10">
                                    <textarea class="" rows="6" id="catalog" placeholder="请输入目录简介">${book.bookCatalog}</textarea>
                                </div>
                            </div>
                            <%--媒体评论--%>
                            <div class="am-form-group">
                                <label for="mediacomments" class="am-u-sm-2 am-form-label">媒体评论</label>
                                <div class="am-u-sm-10">
                                    <textarea class="" rows="6" id="mediacomments" placeholder="请输入媒体评论">${book.bookMediaComments}</textarea>
                                </div>
                            </div>
                            <%--添加数量--%>
                            <div class="am-form-group">
                                <label for="addcount" class="am-u-sm-2 am-form-label">添加数量</label>
                                <div class="am-u-sm-2 am-u-sm-pull-8">
                                    <input type="number" class="tpl-form-input" id="addcount" placeholder="本"
                                           onKeyUp="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');"
                                           min="1" max="999999" value="${book.bookInventory}">
                                </div>
                            </div>
                            <%--确定--%>
                            <div class="am-form-group">
                                <div class="am-u-sm-10 am-u-sm-push-2">
                                    <button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success "
                                            id="btnSubmit">提交
                                    </button>
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

<%--日期js--%>
<%--<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#testdate',
            position: 'fixed'
        });
    });
</script>--%>

<script>
    //JavaScript代码区域
    layui.use(['element', 'form', 'laydate'], function () {
        var element = layui.element;
        var form = layui.form;
    });
</script>

<script>

    /**
     * 图片上传数量及其大小等控制
     * 点击开始上传按钮(test9)，执行上传
     *
     */
    var success = 0;
    var fail = 0;
    var imgurls = "";
    var imgid = "";
    // 在页面任意位置点击而触发此事件
    $(document).click(function (e) {
        imgid = $(e.target).attr("id");       // e.target表示被点击的目标
               });
   /* $(".uploadImgPreView").live("click",function(){
         imgid = $(this).attr("src");
        alert(imgid);
    });*/
    $(function () {
                  layui.use(['upload', 'layer'], function () {

            var upload = layui.upload;
            var layer = layui.layer;
            upload.render({
                elem: '.uploadImgPreView',
                url: '/book/upload',
                multiple: true,
                accept: 'images',
                acceptMime: 'image/*',
                auto: true,
                //上传的单个图片大小
                size: 10240,
                //最多上传的数量
                number: 3,
                //MultipartFile file 对应，layui默认就是file,要改动则相应改动
                field: 'file',
                data: {imgId:imgid},
                before: function (obj) {
                    //预读本地文件示例，不支持ie8
                    obj.preview(function (index, file, result) {
                        document.getElementById(imgid).src = result;
                    });
                },
                done: function (res, index, upload) {
                    //每个图片上传结束的回调，成功的话，就把新图片的名字保存起来，作为数据提交
                    console.log(res.code);
                    if (res.code == "1") {
                        fail++;
                    } else {
                        success++;
                        if (imgurls.indexOf(res.imgId) == -1) {
                            imgurls = imgurls + "" + res.data.src + ",";
                            $('#imgUrls').val(imgurls);
                        } else {
                            var test1 = imgurls.split(",");
                            var test2 = "";
                            for (var i = 0; i < test1.length; i++) {
                                if (test1[i].indexOf(res.imgId) != -1) {
                                    test1[i] = res.data.src;
                                }
                            }
                            for (var i = 0; i < test1.length; i++) {
                                test2 = test2 + test1[i] + ",";
                            }
                            imgurls = test2.substring(0, test2.length() - 1);
                            $('#imgUrls').val(imgurls);
                        }

                    }
                },
                allDone: function (obj) {
                    layer.msg("总共要上传图片总数为：" + (fail + success) + "\n"
                        + "其中上传成功图片数为：" + success + "\n"
                        + "其中上传失败图片数为：" + fail
                    )
                }
            });


        });
        //清空预览图片
        cleanImgsPreview();
        //保存商品
        goodsSave();
    });

    /**
     * 清空预览的图片及其对应的成功失败数
     * 原因：如果已经存在预览的图片的话，再次点击上选择图片时，预览图片会不断累加
     * 表面上做上传成功的个数清0，实际后台已经上传成功保存了的，只是没有使用，以最终商品添加的提交的为准
      */
    function cleanImgsPreview() {
        $("#cleanImgs").click(function () {
            success = 0;
            fail = 0;
            $('#demo2').html("");
            $('#imgUrls').val("");
        });
    }

    /**
     * 保存商品
     */
    function goodsSave() {
        $('#btnSubmit').click(function () {
            var bookname1 = $("#bookname").val();
            var originalprice1 = $("#originalprice").val();
            var promotionprice1 = $("#promotionprice").val();
            var cost1 = $("#cost").val();
            var clazz1 = $("#clazz").val();
            var subclazz1 = $("#subclazz").val();
            var auther1 = $("#auther").val();
            var press1 = $("#press").val();
            var testdate1 = $("#testdate").val();
            var plotsummary1 = $("#plotsummary").val();
            var biography1 = $("#biography").val();
            var catalog1 = $("#catalog").val();
            var mediacomments1 = $("#mediacomments").val();
            var addcount1 = $("#addcount").val();
            var ius = $("#imgUrls").val();
            var bookId1 = $("#bookId").val();

            $.ajax({
                type: "POST",
                url: "/book/updateGoods",
                data: {
                    bookname: bookname1,
                    originalprice: originalprice1,
                    promotionprice: promotionprice1,
                    cost: cost1,
                    clazz: clazz1,
                    subclazz: subclazz1,
                    auther: auther1,
                    press: press1,
                    testdate: testdate1,
                    plotsummary: plotsummary1,
                    biography: biography1,
                    catalog: catalog1,
                    mediacomments: mediacomments1,
                    addcount: addcount1,
                    imgUrls: ius,
                    bookId:bookId1
                },
                success: function (msg) {
                    if (msg == "1") {
                        alert("保存成功");
                    } else {
                        alert("保存失败");
                    }
                }
            });
        });
    }
</script>

<script>
    //控制只能输入小数点后2位
    function clearNoNum(obj) {
        obj.value = obj.value.replace(/[^\d.]/g, "");  //清除“数字”和“.”以外的字符
        obj.value = obj.value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的
        obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
        obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3');//只能输入两个小数
        if (obj.value.indexOf(".") < 0 && obj.value != "") {//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额
            obj.value = parseFloat(obj.value);
        }
    }
</script>
</body>
</html>
</html>
