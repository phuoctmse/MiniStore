<%-- 
    Document   : checkout
    Created on : Apr 23, 2024, 7:10:46 PM
    Author     : ADMIN
--%>

<%@page import="product.ProductDTO"%>
<%@page import="product.CartDTO"%>
<%@page import="users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check out</title>
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
        %>
        <div class="page-holder">
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
                                    <!-- Link--><a class="nav-link active" href="shopping.jsp">Shop</a>
                                </li>
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link" href="detail.jsp">Product detail</a>
                                </li>
                                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="pagesDropdown" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
                                    <div class="dropdown-menu mt-3 shadow-sm" aria-labelledby="pagesDropdown"><a class="dropdown-item border-0 transition-link" href="home_logged.jsp">Homepage</a><a class="dropdown-item border-0 transition-link" href="shop.html">Category</a>
                                        <a class="dropdown-item border-0 transition-link" href="detail.jsp">Product detail</a>
                                        <a class="dropdown-item border-0 transition-link" href="MainController?action=View">Shopping cart</a>
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
            <div class="container">
                <!-- HERO SECTION-->
                <section class="py-5 bg-light">
                    <div class="container">
                        <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
                            <div class="col-lg-6">
                                <h1 class="h2 text-uppercase mb-0">Checkout</h1>
                            </div>
                            <div class="col-lg-6 text-lg-end">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb justify-content-lg-end mb-0 px-0 bg-light">
                                        <li class="breadcrumb-item"><a class="text-dark" href="home_logged.jsp">Home</a></li>
                                        <li class="breadcrumb-item"><a class="text-dark" href="MainController?action=View">Cart</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="py-5">
                    <!-- BILLING ADDRESS-->
                    <h2 class="h5 text-uppercase mb-4">Billing details</h2>
                    <div class="row">
                        <div class="col-lg-8">
                            <form action="MainController" method="POST">
                                <div class="row gy-3">
                                    <div class="col-lg-6">
                                        <label class="form-label text-sm text-uppercase" for="firstName">First name </label>
                                        <input class="form-control form-control-lg" type="text" name="firstName" id="firstName" placeholder="Enter your first name">
                                    </div>
                                    <div class="col-lg-6">
                                        <label class="form-label text-sm text-uppercase" for="lastName">Last name </label>
                                        <input class="form-control form-control-lg" type="text" name="lastName" id="lastName" placeholder="Enter your last name">
                                    </div>
                                    <div class="col-lg-6">
                                        <label class="form-label text-sm text-uppercase" for="email">Email address </label>
                                        <input class="form-control form-control-lg" type="email" name="email" id="email" placeholder="e.g. Jason@example.com">
                                    </div>
                                    <div class="col-lg-6">
                                        <label class="form-label text-sm text-uppercase" for="phone">Phone number </label>
                                        <input class="form-control form-control-lg" type="tel" name="phone" id="phone" placeholder="e.g. +02 245354745">
                                    </div>
                                    <div class="col-lg-12">
                                        <label class="form-label text-sm text-uppercase" for="address">Address line </label>
                                        <input class="form-control form-control-lg" type="text" name="address" id="address" placeholder="House number and street name">
                                    </div>

                                    <div class="col-lg-12 form-group">
                                        <button class="btn btn-dark" type="submit" name="action" value="Checkout">Place order</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- ORDER SUMMARY-->
                        <div class="col-lg-4">
                            <%
                                CartDTO cart = (CartDTO) session.getAttribute("CART");

                            %>
                            <div class="card border-0 rounded-0 p-lg-4 bg-light">
                                <div class="card-body">
                                    <h5 class="text-uppercase mb-4">Your order</h5>
                                    <%                                        int total = 0;
                                        for (ProductDTO product : cart.getCart().values()) {
                                            total += product.getPrice() * product.getQuantity();
                                    %>
                                    <ul class="list-unstyled mb-0">

                                        <li class="d-flex align-items-center justify-content-between"><strong class="small fw-bold"><%= product.getMobileName()%></strong><span class="text-muted small">$<%= product.getPrice()%></span></li>
                                        <li class="border-bottom my-2"></li>
                                            <% }%>
                                        <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small fw-bold">Total</strong><span>$<%= total%></span></li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <%@include file="view/home/footer.jsp" %>
                <!-- JavaScript files-->
                <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="vendor/glightbox/js/glightbox.min.js"></script>
                <script src="vendor/nouislider/nouislider.min.js"></script>
                <script src="vendor/swiper/swiper-bundle.min.js"></script>
                <script src="vendor/choices.js/public/assets/scripts/choices.min.js"></script>
                <script src="js/front.js"></script>
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
        </div>
    </body>
</html>
