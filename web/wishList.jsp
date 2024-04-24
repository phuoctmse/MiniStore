<%-- 
    Document   : wishList
    Created on : Apr 23, 2024, 10:47:35 AM
    Author     : ADMIN
--%>

<%@page import="product.ProductDTO"%>
<%@page import="product.WishListDTO"%>
<%@page import="users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wish List</title>
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

            String noResults = (String) request.getAttribute("NO_RESULTS");
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
                                    <!-- Link--><a class="nav-link" href="shopping.jsp">Shop</a>
                                </li>
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link" href="detail.jsp">Product detail</a>
                                </li>
                                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="pagesDropdown" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
                                    <div class="dropdown-menu mt-3 shadow-sm" aria-labelledby="pagesDropdown"><a class="dropdown-item border-0 transition-link" href="home_logged.jsp">Homepage</a><a class="dropdown-item border-0 transition-link" href="shop.html">Category</a>
                                        <a class="dropdown-item border-0 transition-link" href="detail.jsp">Product detail</a>
                                        <a class="dropdown-item border-0 transition-link" href="viewCart.jsp">Shopping cart</a>
                                </li>
                            </ul>
                            <ul class="navbar-nav ms-auto">   
                                <li class="nav-item"><a class="nav-link" href="MainController?action=View"> <i class="fas fa-dolly-flatbed me-1 text-gray"></i>Cart<small class="text-gray fw-normal"></small></a></li>
                                <li class="nav-item"><a class="nav-link active" href="MainController?action=WishList"> <i class="far fa-heart me-1"></i><small class="text-gray fw-normal"></small></a></li>
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
                                <h1 class="h2 text-uppercase mb-0">Cart</h1>
                            </div>
                            <div class="col-lg-6 text-lg-end">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb justify-content-lg-end mb-0 px-0 bg-light">
                                        <li class="breadcrumb-item"><a class="text-dark" href="home_logged.jsp">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">WishList</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="py-5">
                    <h2 class="h5 text-uppercase mb-4">Wish List</h2>

                    <%
                        WishListDTO wishList = (WishListDTO) session.getAttribute("WISHLIST");
                        if (wishList == null || wishList.getWishList()== null || wishList.getWishList().isEmpty()) {
                    %>
                    <%= noResults%>
                    <a href="shopping.jsp">Click here to go back</a>
                    <%
                    } else {
                    %>
                    <div class="row">
                        <div class="col-lg-8 mb-4 mb-lg-0">
                            <!-- CART TABLE-->
                            <div class="table-responsive mb-4">
                                <table class="table text-nowrap">
                                    <thead class="bg-light">
                                        <tr>
                                            <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase">Product</strong></th>
                                            <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase">Add</strong></th>
                                            <th class="border-0 p-3" scope="col"> <strong class="text-sm text-uppercase">Remove</strong></th>
                                        </tr>
                                    </thead>

                                    <tbody class="border-0">
                                        <%
                                            int total = 0;
                                            for (ProductDTO product : wishList.getWishList().values()) {
                                        %>
                                    <form action="MainController" method="POST">
                                        <tr>
                                            <th class="ps-0 py-3 border-light" scope="row">
                                                <div class="d-flex align-items-center"><a class="reset-anchor d-block animsition-link" href="ShowDetailController?mobileId=<%= product.getMobileId()%>">
                                                        <img src="<%= product.getImage()%>" alt="..." width="70"/></a>
                                                    <div class="ms-3"><strong class="h6"><a class="reset-anchor animsition-link" href="ShowDetailController?mobileId=<%= product.getMobileId()%>"><%= product.getMobileName()%></a></strong></div>
                                                </div>
                                            </th>
                                            <td class="p-3 align-middle border-light">
                                                <a class="btn btn-sm btn-dark" href="AddToCartController?mobileId=<%= product.getMobileId()%>
                                                                                                &quantityLoss=1
                                                                                                &mobileName=<%= product.getMobileName()%>
                                                                                                &description=<%= product.getDescription()%>
                                                                                                &price=<%= product.getPrice()%>
                                                                                                &yearOfProduction=<%= product.getYearOfProduction()%>
                                                                                                &notSale=<%= product.isNotSale()%>
                                                                                                &image=<%= product.getImage()%>
                                                                                                &category=<%= product.getCategory()%>
                                                                                                ">Add to cart</a>
                                            </td>
                                            <td class="p-3 align-middle border-light">
                                                
                                                <a class="reset-anchor" href="MainController?action=RemoveWishList&mobileId=<%= product.getMobileId()%>">
                                                    <i class="fas fa-trash-alt small text-muted"></i>
                                                </a>
                                            </td>
                                        </tr>

                                    </form>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                            <!-- WISH LIST NAV-->
                            <div class="bg-light px-4 py-3">
                                <div class="row align-items-center text-center">
                                    <div class="col-md-6 mb-3 mb-md-0 text-md-start"><a class="btn btn-link p-0 text-dark btn-sm" href="shopping.jsp"><i class="fas fa-long-arrow-alt-left me-2"> </i>Continue shopping</a></div>
                                    <div class="col-md-6 text-md-end"><a class="btn btn-outline-dark btn-sm" href="MainController?action=View">Procceed to Cart<i class="fas fa-long-arrow-alt-right ms-2"></i></a></div>
                                </div>
                            </div>
                        </div>
                        <!-- ORDER TOTAL-->
                        <div class="col-lg-4">
                            <div class="card border-0 rounded-0 p-lg-4 bg-light">
                                <div class="card-body">
                                    <h5 class="text-uppercase mb-4">Cart total</h5>
                                    <ul class="list-unstyled mb-0">
                                        <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small font-weight-bold">Subtotal</strong><span class="text-muted small">$<%= total%></span></li>
                                        <li class="border-bottom my-2"></li>
                                        <li class="d-flex align-items-center justify-content-between mb-4"><strong class="text-uppercase small font-weight-bold">Total</strong><span>$<%= total%></span></li>
                                        <li>
                                            <form action="#">
                                                <div class="input-group mb-0">
                                                    <input class="form-control" type="text" placeholder="Enter your coupon">
                                                    <button class="btn btn-dark btn-sm w-100" type="submit"> <i class="fas fa-gift me-2"></i>Apply coupon</button>
                                                </div>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                    <% }%>
                </section>

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
