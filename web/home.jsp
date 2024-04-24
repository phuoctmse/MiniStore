<%-- 
    Document   : home
    Created on : Apr 20, 2024, 8:24:40 PM
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>MiniStore</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="all,follow">
        <!-- gLightbox gallery-->
        <link rel="stylesheet" href="view/vendor/glightbox/css/glightbox.min.css">
        <!-- Range slider-->
        <link rel="stylesheet" href="view/vendor/nouislider/nouislider.min.css">
        <!-- Choices CSS-->
        <link rel="stylesheet" href="view/vendor/choices.js/public/assets/styles/choices.min.css">
        <!-- Swiper slider-->
        <link rel="stylesheet" href="view/vendor/swiper/swiper-bundle.min.css">
        <!-- Google fonts-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300;400;700&amp;display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Martel+Sans:wght@300;400;800&amp;display=swap">
        <!-- theme stylesheet-->
        <link rel="stylesheet" href="view/css/style.default.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="view/css/custom.css">
        <!-- Favicon-->
        <link rel="shortcut icon" href="view/img/favicon.png">
    </head>
    <body>
        <%
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> listProduct = null;
            String noResults = (String) request.getAttribute("NO_RESULTS");

                listProduct = dao.getTop8Products();
            

        %>
        <div class="page-holder">
            <!-- navbar-->
            <header class="header bg-white">
                <div class="container px-lg-3">
                    <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0"><a class="navbar-brand" href="home.jsp"><span class="fw-bold text-uppercase text-dark">MiniStore</span></a>
                        <button class="navbar-toggler navbar-toggler-end" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto">
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link active" href="home.jsp">Home</a>
                                </li>
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link" href="shopping.jsp">Shop</a>
                                </li>
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link" href="detail.jsp">Product detail</a>
                                </li>
                                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="pagesDropdown" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
                                    <div class="dropdown-menu mt-3 shadow-sm" aria-labelledby="pagesDropdown"><a class="dropdown-item border-0 transition-link" href="home.jsp">Homepage</a><a class="dropdown-item border-0 transition-link" href="shop.html">Category</a>
                                        <a class="dropdown-item border-0 transition-link" href="detail.jsp">Product detail</a>
                                        <a class="dropdown-item border-0 transition-link" href="viewCart.jsp">Shopping cart</a>
                                </li>
                            </ul>
                            <ul class="navbar-nav ms-auto">               
                                <li class="nav-item"><a class="nav-link" href="viewCart.jsp"> <i class="fas fa-dolly-flatbed me-1 text-gray"></i>Cart<small class="text-gray fw-normal"></small></a></li>
                                <li class="nav-item"><a class="nav-link" href="wishlist.jsp"> <i class="far fa-heart me-1"></i><small class="text-gray fw-normal"></small></a></li>
                                <li class="nav-item"><a class="nav-link" href="login.jsp"> <i class="fas fa-user me-1 text-gray fw-normal"></i>Login</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </header>
            <!--  Modal -->
            <div class="modal fade" id="productView" tabindex="-1">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content overflow-hidden border-0">
                        <button class="btn-close p-4 position-absolute top-0 end-0 z-index-20 shadow-0" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                        <div class="modal-body p-0">
                            <div class="row align-items-stretch">
                                <div class="col-lg-6 p-lg-0"><a class="glightbox product-view d-block h-100 bg-cover bg-center" style="background: url(view/img/product-5.jpg)" href="view/img/product-5.jpg" data-gallery="gallery1" data-glightbox="Red digital smartwatch"></a>
                                    <a class="glightbox d-none" href="view/img/product-5-alt-1.jpg" data-gallery="gallery1" data-glightbox="Red digital smartwatch">

                                    </a><a class="glightbox d-none" href="view/img/product-5-alt-2.jpg" data-gallery="gallery1" data-glightbox="Red digital smartwatch"></a></div>
                                <div class="col-lg-6">
                                    <div class="p-4 my-md-4">
                                        <ul class="list-inline mb-2">
                                            <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
                                            <li class="list-inline-item m-0 1"><i class="fas fa-star small text-warning"></i></li>
                                            <li class="list-inline-item m-0 2"><i class="fas fa-star small text-warning"></i></li>
                                            <li class="list-inline-item m-0 3"><i class="fas fa-star small text-warning"></i></li>
                                            <li class="list-inline-item m-0 4"><i class="fas fa-star small text-warning"></i></li>
                                        </ul>
                                        <h2 class="h4">Red digital smartwatch</h2>
                                        <p class="text-muted">$250</p>
                                        <p class="text-sm mb-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ut ullamcorper leo, eget euismod orci. Cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus. Vestibulum ultricies aliquam convallis.</p>
                                        <div class="row align-items-stretch mb-4 gx-0">
                                            <div class="col-sm-7">
                                                <div class="border d-flex align-items-center justify-content-between py-1 px-3"><span class="small text-uppercase text-gray mr-4 no-select">Quantity</span>
                                                    <div class="quantity">
                                                        <button class="dec-btn p-0"><i class="fas fa-caret-left"></i></button>
                                                        <input class="form-control border-0 shadow-0 p-0" type="text" value="1">
                                                        <button class="inc-btn p-0"><i class="fas fa-caret-right"></i></button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-5"><a class="btn btn-dark btn-sm w-100 h-100 d-flex align-items-center justify-content-center px-0" href="cart.html">Add to cart</a></div>
                                        </div><a class="btn btn-link text-dark text-decoration-none p-0" href="#!"><i class="far fa-heart me-2"></i>Add to wish list</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- HERO SECTION-->
            <div class="container">
                <%@include file="view/home/banner.jsp" %>
                <!-- CATEGORIES SECTION-->
                <%@include file="view/home/categories.jsp" %>
                <!-- TRENDING PRODUCTS-->
                <section class="py-5">
                    <header>
                        <p class="small text-muted small text-uppercase mb-1">Made the hard way</p>
                        <h2 class="h5 text-uppercase mb-4">Top trending products</h2>
                    </header>
                    <div class="row">
                        <% if (noResults != null) {%>
                                    <p><%= noResults%></p>
                                    <% } else if (listProduct != null && !listProduct.isEmpty()) { %>
                                    <%
                                        for (ProductDTO product : listProduct) {
                                    %>
                        <!-- PRODUCT-->
                        <div class="col-xl-3 col-lg-4 col-sm-6">
                            <div class="product text-center">
                                <div class="position-relative mb-3">
                                    <div class="badge text-white bg-"></div><a class="d-block" href="detail.html"><img class="img-fluid w-100" src="<%= product.getImage()%>" alt="..."></a>
                                    <div class="product-overlay">
                                        <ul class="mb-0 list-inline">
                                            <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-outline-dark" href="#!"><i class="far fa-heart"></i></a></li>
                                            <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href="cart.html">Add to cart</a></li>
                                            <li class="list-inline-item me-0"><a class="btn btn-sm btn-outline-dark" href="#productView" data-bs-toggle="modal"><i class="fas fa-expand"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <h6> <a class="reset-anchor" href="detail.html"><%= product.getMobileName()%></a></h6>
                                <p class="small text-muted">$<%= product.getPrice()%></p>
                            </div>
                        </div>
                        <% } %>
                                    <% } %>
                    </div>
                </section>
                <!-- SERVICES-->
                <%@include file="view/home/service.jsp" %>
                <!-- NEWSLETTER-->
                <%@include file="view/home/newsletter.jsp" %>
            </div>
            <!-- FOOTER-->
            <%@include file="view/home/footer.jsp" %>
            <!-- JavaScript files-->
            <script src="view/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="view/vendor/glightbox/js/glightbox.min.js"></script>
            <script src="view/vendor/nouislider/nouislider.min.js"></script>
            <script src="view/vendor/swiper/swiper-bundle.min.js"></script>
            <script src="view/vendor/choices.js/public/assets/scripts/choices.min.js"></script>
            <script src="view/js/front.js"></script>
            <script>
                // ------------------------------------------------------- //
                //   Inject SVG Sprite - 
                //   see more here 
                //   https://css-tricks.com/ajaxing-svg-sprite/
                // ------------------------------------------------------ //
                function injectSvgSprite(path) {

                    var ajax = new XMLHttpRequest();
                    ajax.open("GET", path, true);
                    ajax.send();
                    ajax.onload = function (e) {
                        var div = document.createElement("div");
                        div.className = 'd-none';
                        div.innerHTML = ajax.responseText;
                        document.body.insertBefore(div, document.body.childNodes[0]);
                    }
                }
                // this is set to BootstrapTemple website as you cannot 
                // inject local SVG sprite (using only 'icons/orion-svg-sprite.svg' path)
                // while using file:// protocol
                // pls don't forget to change to your domain :)
                injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg');

            </script>
            <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        </div>
    </body>
</html>
