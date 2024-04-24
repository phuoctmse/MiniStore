<%-- 
    Document   : detail.jsp
    Created on : Apr 21, 2024, 10:45:42 PM
    Author     : ADMIN
--%>

<%@page import="product.ProductDAO"%>
<%@page import="users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details</title>
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

            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || loginUser.getRole() != 0) {
                response.sendRedirect("login.jsp");
                return;
            }

            ProductDAO dao = new ProductDAO();
            ProductDTO product = new ProductDTO();
            if (request.getAttribute("PRODUCT_DETAIL") != null) {
                product = (ProductDTO) request.getAttribute("PRODUCT_DETAIL");
            } else {
                product = dao.getSample();
            }

        %>
        <div class="page-holder bg-light">
            <!-- navbar-->
            <header class="header bg-white">
                <div class="container px-lg-3">
                    <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0"><a class="navbar-brand" href="home_logged.jsp"><span class="fw-bold text-uppercase text-dark">MiniStore</span></a>
                        <button class="navbar-toggler navbar-toggler-end" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto">
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link" href="home_logged.jsp">Home</a>
                                </li>
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link" href="shopping.jsp">Shop</a>
                                </li>
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link active" href="detail.jsp">Product detail</a>
                                </li>
                                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="pagesDropdown" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
                                    <div class="dropdown-menu mt-3 shadow-sm" aria-labelledby="pagesDropdown"><a class="dropdown-item border-0 transition-link" href="home_logged.jsp">Homepage</a><a class="dropdown-item border-0 transition-link" href="shop.html">Category</a>
                                        <a class="dropdown-item border-0 transition-link" href="detail.jsp">Product detail</a>
                                        <a class="dropdown-item border-0 transition-link" href="viewCart.jsp">Shopping cart</a>
                                </li>
                            </ul>
                            <ul class="navbar-nav ms-auto">   
                                <li class="nav-item"><a class="nav-link" href="MainController?action=View"> <i class="fas fa-dolly-flatbed me-1 text-gray"></i>Cart<small class="text-gray fw-normal"></small></a></li>
                                <li class="nav-item"><a class="nav-link" href="MainController?action=WishList"> <i class="far fa-heart me-1"></i><small class="text-gray fw-normal"></small></a></li>
                                <li class="nav-item"><a class="nav-link" href="user.jsp"> <i class="fas fa-user me-1 text-gray fw-normal"></i><%= loginUser.getFullName()%></a></li>
                                <li class="nav-item"><a class="nav-link" href="MainController?action=Logout"> <i class="fas fa-sign-out-alt me-1 text-gray"></i>Logout<small class="text-gray fw-normal"></small></a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </header>
            <%
                String message = (String) request.getAttribute("MESSAGE");
                if (message == null) {
                    message = "";
                }
            %>
            <%= message%>
            <section class="py-5">
                <div class="container">
                    <div class="row mb-5">
                        <div class="col-lg-6">
                            <!-- PRODUCT SLIDER-->
                            <div class="row m-sm-0">
                                <div class="col-sm-2 p-sm-0 order-2 order-sm-1 mt-2 mt-sm-0 px-xl-2">
                                    <div class="swiper product-slider-thumbs">
                                        <div class="swiper-wrapper">
                                            <div class="swiper-slide h-auto swiper-thumb-item mb-3"><img class="w-100" src="<%= product.getImage()%>" alt="..."></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-10 order-1 order-sm-2">
                                    <div class="swiper product-slider">
                                        <div class="swiper-wrapper">
                                            <div class="swiper-slide h-auto"><a class="glightbox product-view" href="<%= product.getImage()%>" data-gallery="gallery2" data-glightbox="Product item 1"><img class="img-fluid" src="<%= product.getImage()%>" alt="..."></a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- PRODUCT DETAILS-->
                        <div class="col-lg-6">
                            <ul class="list-inline mb-2 text-sm">
                                <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
                                <li class="list-inline-item m-0 1"><i class="fas fa-star small text-warning"></i></li>
                                <li class="list-inline-item m-0 2"><i class="fas fa-star small text-warning"></i></li>
                                <li class="list-inline-item m-0 3"><i class="fas fa-star small text-warning"></i></li>
                                <li class="list-inline-item m-0 4"><i class="fas fa-star small text-warning"></i></li>
                            </ul>
                            <h1><%= product.getMobileName()%></h1>
                            <p class="text-muted lead">$<%= product.getPrice()%></p>
                            <p class="text-sm mb-4"><%= product.getDescription()%></p>
                            <div class="row align-items-stretch mb-4">
                                <div class="col-sm-5 pr-sm-0">
                                    <a class="btn btn-dark btn-sm btn-block h-100 d-flex align-items-center justify-content-center px-0" href="AddToCartController?mobileId=<%= product.getMobileId()%>
                                       &quantityLoss=1
                                       &mobileName=<%= product.getMobileName()%>
                                       &description=<%= product.getDescription()%>
                                       &price=<%= product.getPrice()%>
                                       &yearOfProduction=<%= product.getYearOfProduction()%>
                                       &notSale=<%= product.isNotSale()%>
                                       &image=<%= product.getImage()%>
                                       &category=<%= product.getCategory()%>
                                       ">Add to cart</a>
                                </div>

                            </div><a class="text-dark p-0 mb-4 d-inline-block" href="MainController?action=AddWishList&mobileId=<%= product.getMobileId()%>"><i class="far fa-heart me-2"></i>Add to wish list</a><br>
                            <ul class="list-unstyled small d-inline-block">
                                <li class="px-3 py-2 mb-1 bg-white"><strong class="text-uppercase">SKU:</strong><span class="ms-2 text-muted"><%= product.getMobileId()%></span></li>
                                <li class="px-3 py-2 mb-1 bg-white text-muted"><strong class="text-uppercase text-dark">Category:</strong>
                                    <a class="reset-anchor ms-2" href="SearchCategoryController?category=<%= product.getCategory()%>"> <%= product.getCategory()%> </a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- DETAILS TABS-->
                    <ul class="nav nav-tabs border-0" id="myTab" role="tablist">
                        <li class="nav-item"><a class="nav-link text-uppercase active" id="description-tab" data-bs-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">Description</a></li>
                        <li class="nav-item"><a class="nav-link text-uppercase" id="reviews-tab" data-bs-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Reviews</a></li>
                    </ul>
                    <div class="tab-content mb-5" id="myTabContent">
                        <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                            <div class="p-4 p-lg-5 bg-white">
                                <h6 class="text-uppercase">Product description </h6>
                                <p class="text-muted text-sm mb-0"><%= product.getDescription()%></p>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                            <div class="p-4 p-lg-5 bg-white">
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="d-flex mb-3">
                                            <div class="flex-shrink-0"><img class="rounded-circle" src="view/img/customer-1.png" alt="" width="50"/></div>
                                            <div class="ms-3 flex-shrink-1">
                                                <h6 class="mb-0 text-uppercase">Jason Doe</h6>
                                                <p class="small text-muted mb-0 text-uppercase">20 May 2020</p>
                                                <ul class="list-inline mb-1 text-xs">
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star-half-alt text-warning"></i></li>
                                                </ul>
                                                <p class="text-sm mb-0 text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                            </div>
                                        </div>
                                        <div class="d-flex">
                                            <div class="flex-shrink-0"><img class="rounded-circle" src="view/img/customer-2.png" alt="" width="50"/></div>
                                            <div class="ms-3 flex-shrink-1">
                                                <h6 class="mb-0 text-uppercase">Jane Doe</h6>
                                                <p class="small text-muted mb-0 text-uppercase">20 May 2020</p>
                                                <ul class="list-inline mb-1 text-xs">
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                                    <li class="list-inline-item m-0"><i class="fas fa-star-half-alt text-warning"></i></li>
                                                </ul>
                                                <p class="text-sm mb-0 text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- BACK TO SHOPPING-->
                    <a class="reset-anchor ms-2" href="shopping.jsp"> back to shopping</a>
                </div>
            </section>

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
