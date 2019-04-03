<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/3/20
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="ie6"> <![endif]-->
<!--[if IE 7 ]>    <html class="ie7"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en" class=""><!--<![endif]-->
<head>
    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>关于我</title>
    <jsp:include page="${pageContext.request.contextPath}/page/common/css.jsp"/>
</head>

<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
<div class="main-container">
    <!-- Loader -->
    <div id="site-loader" class="load-complete">
        <div class="loader">
            <div class="loader-inner ball-clip-rotate">
                <div></div>
            </div>
        </div>
    </div><!-- Loader /- -->

    <!-- Header -->
    <header class="header-section header-section-1 container-fluid no-padding">
        <!-- Middel Header -->
        <div class="middel-header">
            <!-- Container -->
            <div class="container">
                <!-- Logo Block -->
                <div class="col-md-4 col-sm-6 col-xs-12 logo-block">
                    <a href="index.html" class="navbar-brand">Mrlove<span>书城</span></a>
                </div><!-- Logo Block /- -->
                <!-- Search Block -->
                <div class="col-md-5 col-sm-6 col-xs-6 search-block">
                    <div class="input-group">
                        <input class="form-control" placeholder="搜索你想要的。。。" type="text">
                        <span class="input-group-btn">
								<button class="btn btn-default" type="button"><i class="icon icon-Search"></i></button>
							</span>
                    </div>
                </div><!-- Search Block /- -->
                <!-- Menu Icon -->
                <div class="col-md-3 col-sm-6 col-xs-6 menu-icon">
                    <%--<ul class="cart">
                        <li>
                            <a aria-expanded="true" aria-haspopup="true" data-toggle="dropdown" id="cart" class="btn dropdown-toggle" title="Add To Cart" href="#"><i class="icon icon-ShoppingCart"></i></a>
                            <ul class="dropdown-menu no-padding">
                                <li class="mini_cart_item">
                                    <a title="Remove this item" class="remove" href="#">&#215;</a>
                                    <a href="#" class="shop-thumbnail">
                                        <img alt="poster_2_up" class="attachment-shop_thumbnail" src="../images/product-wishlist-1.jpg">Flying Ninja
                                    </a>
                                    <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                </li>
                                <li class="mini_cart_item">
                                    <a title="Remove this item" class="remove" href="#">&#215;</a>
                                    <a href="#" class="shop-thumbnail">
                                        <img alt="poster_2_up" class="attachment-shop_thumbnail" src="../images/product-wishlist-2.jpg">Flying Ninja
                                    </a>
                                    <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                </li>
                                <li class="button">
                                    <a href="#" title="View Cart">View Cart</a>
                                    <a href="#" title="Check Out">Check out</a>
                                </li>
                            </ul>
                        </li>
                        <li><a href="#" title="Like"><i class="icon icon-Heart"></i></a></li>
                        <li><a href="#" title="User"><i class="icon icon-User"></i></a></li>
                    </ul>--%>

                    <ul class="cart">
                        <li>
                            <a aria-expanded="true" aria-haspopup="true" data-toggle="dropdown" id="cart" class="btn dropdown-toggle" title="加入购物车" href="#"><i class="icon icon-ShoppingCart"></i></a>
                            <ul class="dropdown-menu no-padding">
                                <li class="mini_cart_item">
                                    <a title="删除这件商品" class="remove" href="#">&#215;</a>
                                    <a href="#" class="shop-thumbnail">
                                        <img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/images/product-wishlist-1.jpg">物品一
                                    </a>
                                    <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                </li>
                                <li class="mini_cart_item">
                                    <a title="删除这件商品" class="remove" href="#">&#215;</a>
                                    <a href="#" class="shop-thumbnail">
                                        <img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/images/product-wishlist-2.jpg">物品2
                                    </a>
                                    <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                </li>
                                <li class="button" style="float:right">
                                    <a href="#" title="查看购物车">查看购物车</a>
                                </li>
                            </ul>
                        </li>

                    </ul>

                    <ul class="cart">
                        <li><a aria-expanded="true" aria-haspopup="true" data-toggle="dropdown" id="like" class="btn dropdown-toggle" href="#" title="收藏"><i class="icon icon-Heart"></i></a>
                            <ul class="dropdown-menu no-padding">
                                <li class="mini_cart_item">
                                    <a title="删除这件商品" class="remove" href="#">&#215;</a>
                                    <a href="#" class="shop-thumbnail">
                                        <img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/images/product-wishlist-1.jpg">物品3
                                    </a>
                                    <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                </li>
                                <li class="mini_cart_item">
                                    <a title="删除这件商品" class="remove" href="#">&#215;</a>
                                    <a href="#" class="shop-thumbnail">
                                        <img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/images/product-wishlist-2.jpg">物品4
                                    </a>
                                    <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                </li>
                                <li class="button" style="float:right">
                                    <a href="#" title="查看购物车">查看购物车</a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="cart">

                        <li><a href="#" title="用户"><i class="icon icon-User"></i></a>
                            <ul class="dropdown-menu no-padding">
                                <li class="mini_cart_item">
                                    <a title="删除这件商品" class="remove" href="#">&#215;</a>
                                    <a href="#" class="shop-thumbnail">
                                        <img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/images/product-wishlist-1.jpg">物品5
                                    </a>
                                    <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                </li>
                                <li class="mini_cart_item">
                                    <a title="删除这件商品" class="remove" href="#">&#215;</a>
                                    <a href="#" class="shop-thumbnail">
                                        <img alt="poster_2_up" class="attachment-shop_thumbnail" src="${pageContext.request.contextPath}/images/product-wishlist-2.jpg">物品6
                                    </a>
                                    <span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
                                </li>
                                <li class="button" style="float:right">
                                    <a href="#" title="查看购物车">查看购物车</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- Menu Icon /- -->
            </div><!-- Container /- -->
        </div><!-- Middel Header /- -->

        <!-- Menu Block -->
        <div class="container-fluid no-padding menu-block">
            <!-- Container -->
            <div class="container">
                <!-- nav -->
                <nav class="navbar navbar-default ow-navigation">
                    <div class="navbar-header">
                        <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a href="index.html" class="navbar-brand">Max <span>shop</span></a>
                    </div>
                    <div class="navbar-collapse collapse" id="navbar">
                        <ul class="nav navbar-nav">
                            <li><a href="index.html">主页</a></li>
                            <li><a href="cart.html">购物车</a></li>
                            <li><a href="checkout.html">结账</a></li>
                            <li><a href="${pageContext.request.contextPath}/page/about.jsp">关于我</a></li>
                            <li><a href="contact-us.html">联系我</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </nav><!-- nav /- -->
            </div><!-- Container /- -->
        </div><!-- Menu Block /- -->
    </header><!-- Header /- -->

    <main>
        <!-- Page Banner -->
        <div class="page-banner container-fluid no-padding">
            <!-- Container -->
            <div class="container">
                <div class="banner-content">
                    <h3>关于我</h3>
                    <p>清风徐来，水波不兴</p>
                    <p>四年光阴，如白驹过隙，这里有不舍，这里也满怀希望</p>
                    <p>毕业季，这份答辩，也许是在母校最好的证明，交上这份答卷，我将前往新的旅程</p>
                    <p>脚步从未停止，未来，还在继续。。。</p>
                </div>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/page/index.jsp" title="Home">主页</a></li>
                    <li class="active">关于我</li>
                </ol>
            </div><!-- Container /- -->
        </div><!-- Page Banner /- -->

        <!-- About Section -->
        <div class="about-section container-fluid no-padding">
            <!-- Container -->
            <div class="container">
                <!-- Section Header -->
                <div class="section-header">
                    <h3>关于我的书城</h3>
                    <p>好的书，有时候需要有人以独特的眼光发现，我的书城正是因此孕育而生</p>
                    <img src="../images/section-seprator.png" alt="section-seprator" />
                </div><!-- Section Header /- -->
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <img src="${pageContext.request.contextPath}/images/aboutme.jpg" alt="about" />
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="about-content">
                        <h5>当你在 <span>Mrlove书城</span>浏览书籍的时候，你会发现每本都是精心甄别上架</h5>
                        <p>不是所有的书城，都会让你感到读书的乐趣，因此我正致力于改变这一点，我希望通过我的精心挑选，让你看到，不一样的书籍，也许你会在这里找到那份久违的感动，亦或是那份让你继续坚持，重拾信心的话语</p>
                        <p>当然，这里的书籍，绝对会以最好的质量与保证，让你满意。质量与服务是我的书城坚持的根本。</p>
                        <ul>
                            <li>这里提供精心挑选的书籍</li>
                            <li>Mrlove书城提供最大的优惠</li>
                            <li>书城供选择的种类丰富</li>
                        </ul>
                    </div>
                </div>
            </div><!-- Container /- -->
        </div><!-- About Section /- -->

        <!-- Team Section -->
      <%--  <div class="team-section container-fluid">
            <!-- Container -->
          &lt;%&ndash;  <div class="container">
                <!-- Section Header -->
                <div class="section-header">
                    <h3>Our Excellent Team</h3>
                    <p>our vision is to be Earth's most customer centric company</p>
                    <img src="../images/section-seprator.png" alt="section-seprator" />
                </div><!-- Section Header /- -->
                <div class="col-md-3 col-sm-4 col-xs-6">
                    <div class="team-detail">
                        <div class="team-box">
                            <img src="../images/team-1.jpg" alt="team" />
                            <h3>james Christ</h3>
                        </div>
                        <div class="team-content">
                            <h5>Web Designer</h5>
                            <p>Believe it or not I'm walking on air.on a wing and a prayer.</p>
                            <ul class="social">
                                <li><a href="#" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#" title="Tumblr"><i class="fa fa-tumblr"></i></a></li>
                                <li><a href="#" title="Vimeo"><i class="fa fa-vimeo"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-4 col-xs-6">
                    <div class="team-detail">
                        <div class="team-box">
                            <img src="../images/team-2.jpg" alt="team" />
                            <h3>jhon smith</h3>
                        </div>
                        <div class="team-content">
                            <h5>Programmer</h5>
                            <p>Believe it or not I'm walking on air.on a wing and a prayer.</p>
                            <ul class="social">
                                <li><a href="#" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#" title="Tumblr"><i class="fa fa-tumblr"></i></a></li>
                                <li><a href="#" title="Vimeo"><i class="fa fa-vimeo"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-4 col-xs-6">
                    <div class="team-detail">
                        <div class="team-box">
                            <img src="../images/team-3.jpg" alt="team" />
                            <h3>jhon doe</h3>
                        </div>
                        <div class="team-content">
                            <h5>Web Developer</h5>
                            <p>Believe it or not I'm walking on air.on a wing and a prayer.</p>
                            <ul class="social">
                                <li><a href="#" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#" title="Tumblr"><i class="fa fa-tumblr"></i></a></li>
                                <li><a href="#" title="Vimeo"><i class="fa fa-vimeo"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-4 col-xs-6">
                    <div class="team-detail">
                        <div class="team-box">
                            <img src="../images/team-4.jpg" alt="team" />
                            <h3>stuart max</h3>
                        </div>
                        <div class="team-content">
                            <h5>Web Designer</h5>
                            <p>Believe it or not I'm walking on air.on a wing and a prayer.</p>
                            <ul class="social">
                                <li><a href="#" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#" title="Tumblr"><i class="fa fa-tumblr"></i></a></li>
                                <li><a href="#" title="Vimeo"><i class="fa fa-vimeo"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>&ndash;%&gt;
            <!-- Container /- -->
        </div>--%>
        <!-- Team Section -->

        <!-- Testimonial Section -->
        <div class="testimonial-section container-fluid">
            <!-- Container -->
            <div class="container">
                <!-- Section Header -->
                <div class="section-header">
                    <h3>用户好评节选</h3>
                    <p>来源于最真实的用户，节选最质朴的声音，你的好评，就是给书城最大的鼓励。</p>
                    <img src="../images/section-seprator.png" alt="section-seprator" />
                </div><!-- Section Header /- -->
                <!-- Main Carousel -->
                <div id="main-carousel1" class="carousel slide carousel-fade" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#main-carousel1" data-slide-to="0" class="active"></li>
                        <li data-target="#main-carousel1" data-slide-to="1"></li>
                        <li data-target="#main-carousel1" data-slide-to="2"></li>
                    </ol>
                    <div role="listbox" class="carousel-inner">
                        <div class="item active">
                            <div class="testimonial-content">
                                <i class="fa fa-quote-left" aria-hidden="true"></i>
                                <p>如果可以，我愿意一直在这家书城买书，这里的书籍正是我真正想要阅读的，它们不仅给了我许多感动，最重要的是让我重拾了生活</p>
                                <img src="../images/testi.jpg" alt="testi" />
                                <span class="star">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-o"></i>
									</span>
                                <h3>王飞宇</h3>
                                <h5>Android开发工程师</h5>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial-content">
                                <i class="fa fa-quote-left" aria-hidden="true"></i>
                                <p>找了好多书城，终于在这里，我找到了，我想要的那个版本，这个书城真的很棒，没想到居然这么用心，书籍包装的很好，希望更多的人可以发现这么好的书城</p>
                                <img src="../images/testi.jpg" alt="testi" />
                                <span class="star">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-o"></i>
									</span>
                                <h3>何明轩</h3>
                                <h5>在校学生</h5>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial-content">
                                <i class="fa fa-quote-left" aria-hidden="true"></i>
                                <p>喜欢这种纯粹的书城，界面很美，让人有读书的感觉，所有我是这里的老顾客了，我很喜欢这里的书，还有这里的服务，客服很热心，我想要什么书，她总能热情的帮助的找到</p>
                                <img src="../images/testi.jpg" alt="testi" />
                                <span class="star">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-o"></i>
									</span>
                                <h3>赵文斌</h3>
                                <h5>读书爱好者</h5>
                            </div>
                        </div>
                    </div>
                </div><!-- Main Carousel /-  -->
            </div><!-- Container /- -->
        </div><!-- Testimonial Section /- -->

        <!-- Clients -->
        <div class="clients container-fluid">
            <!-- Container -->
            <div class="container">
                <div class="clients-carousel">
                    <div class="col-md-12 item"><a href="#" title="client"><img src="../images/client-1.png" alt="client-1"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="../images/client-2.png" alt="client-2"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="../images/client-3.png" alt="client-3"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="../images/client-4.png" alt="client-4"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="../images/client-5.png" alt="client-5"></a></div>

                    <div class="col-md-12 item"><a href="#" title="client"><img src="../images/client-1.png" alt="client-1"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="../images/client-2.png" alt="client-2"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="../images/client-3.png" alt="client-3"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="../images/client-4.png" alt="client-4"></a></div>
                    <div class="col-md-12 item"><a href="#" title="client"><img src="../images/client-5.png" alt="client-5"></a></div>
                </div>
            </div><!-- Container /- -->
        </div><!-- Clients /- -->
    </main>

    <!-- Footer Main 1 -->
    <footer id="footer-main" class="footer-main footer-main-1 services-section container-fluid">
        <!-- Container -->
        <div class="container">
            <div class="services-item">
                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="srv-box">
                        <i class="icon icon-Truck"></i><h5>免费邮寄</h5><i class="icon icon-Dollar"></i>
                        <span class="icon_close"></span>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="srv-box">
                        <i class="icon icon-Goto"></i><h5>极速退款</h5><i class="icon icon-Dollars"></i>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="srv-box">
                        <i class="icon icon-Headset"></i><h5>24/7 电话热线</h5><i class="icon icon-Timer"></i>
                    </div>
                </div>
            </div>
            <!-- Widget About -->
            <aside class="col-md-3 col-sm-6 col-xs-6 ftr-widget widget_about">
                <a href="index.html" title="Max Shop">Mrlove<span>书城</span></a>
                <p>感谢所有的访客，如愿也好，没有找到想要的也罢，希望大家在这个书城得到快乐，试着看看别的风景，也许会有不同的发现</p>
                <ul class="social">
                    <li><a href="#" title="QQ"><i class="fa fa-qq"></i></a></li>
                    <li><a href="#" title="微信"><i class="fa fa-wechat"></i></a></li>
                    <li><a href="#" title="微博"><i class="fa fa-weibo"></i></a></li>
                    <li><a href="#" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#" title="Email"><i class="fa fa-edge"></i></a></li>
                </ul>
            </aside><!-- Widget About /- -->
            <!-- Widget Links -->
            <aside class="col-md-2 col-sm-6 col-xs-6 ftr-widget widget_links">
                <h3 class="widget-title">热门链接</h3>
                <ul>
                    <li><a href="index.html#product-section" title="Popular Products">Popular Products</a></li>
                    <li><a href="index.html#selling" title="Best Selling">Best Selling</a></li>
                    <li><a href="about.html" title="About Us">About Us</a></li>
                    <li><a href="index.html#dealing" title="Deal Of The Day">Deal Of The Day</a></li>
                    <li><a href="index.html#collection" title="Product Collections">Product Collections</a></li>
                    <li><a href="contact-us.html" title="Contact Us">Contact Us</a></li>
                </ul>
            </aside><!-- Widget Links /- -->
            <!-- Widget Account -->
            <aside class="col-md-3 col-sm-6 col-xs-6 ftr-widget widget_links widget_account">
                <h3 class="widget-title">我的账户</h3>
                <ul>
                    <li><a href="#" title="My Order Details">My Order Details</a></li>
                    <li><a href="#" title="My credit Offers">My credit Offers</a></li>
                    <li><a href="#" title="My addresses">My addresses</a></li>
                    <li><a href="#" title="My Personal Details">My Personal Details</a></li>
                    <li><a href="#" title="My Account Details">My Account Details</a></li>
                </ul>
            </aside><!-- Widget Account /- -->
            <!-- Widget Gallery -->
            <aside class="col-md-4 col-sm-6 col-xs-6 ftr-widget widget_gallery">
                <h3 class="widget-title">收藏</h3>
                <ul>
                    <li><a href="#" title=""><img src="../images/ftr-latestpost-1.jpg" alt="ftr-latestpost"></a></li>
                    <li><a href="#" title=""><img src="../images/ftr-latestpost-2.jpg" alt="ftr-latestpost"></a></li>
                    <li><a href="#" title=""><img src="../images/ftr-latestpost-3.jpg" alt="ftr-latestpost"></a></li>
                    <li><a href="#" title=""><img src="../images/ftr-latestpost-4.jpg" alt="ftr-latestpost"></a></li>
                    <li><a href="#" title=""><img src="../images/ftr-latestpost-5.jpg" alt="ftr-latestpost"></a></li>
                    <li><a href="#" title=""><img src="../images/ftr-latestpost-6.jpg" alt="ftr-latestpost"></a></li>
                </ul>
            </aside><!-- Widget Gallery -->
            <div class="copyright-section">
                <div class="coyright-content">
                    <p>Copyright &copy; 2019.Mrlove shop name All rights reserved.</p>
                </div>
                <ul>
                    <li><a href="#" title="Delivery Information">配送信息</a></li>
                    <li><a href="#" title="Privacy Policy">隐私政策</a></li>
                    <li><a href="#" title="Terms & Condition">条款和协议</a></li>
                </ul>
            </div>
        </div><!-- Container /- -->
    </footer><!-- Footer Main 1 -->

</div>
<jsp:include page="${pageContext.request.contextPath}/page/common/js.jsp"/>
</body>
</html>