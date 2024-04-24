<%-- 
    Document   : shopping
    Created on : Apr 12, 2024, 7:23:21 AM
    Author     : ADMIN
--%>

<%@page import="users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Page</title>
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

            if (request.getAttribute("LIST_PRODUCT") != null) {
                listProduct = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
            } else {
                listProduct = dao.getAllProducts();
            }

            String searchByName = request.getParameter("searchByName");
            if (searchByName == null) {
                searchByName = "";
            }

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
                    <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0"><a class="navbar-brand" href="home.jsp"><span class="fw-bold text-uppercase text-dark">MiniStore</span></a>
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
                                <h1 class="h2 text-uppercase mb-0">Shop</h1>
                            </div>
                            <div class="col-lg-6 text-lg-end">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb justify-content-lg-end mb-0 px-0 bg-light">
                                        <li class="breadcrumb-item"><a class="text-dark" href="home.jsp">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Shop</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </section>
                <%
                    String message = (String) request.getAttribute("MESSAGE");
                    if (message == null) {
                        message = "";
                    }
                %>
                <%= message%>
                <section class="py-5">
                    <div class="container p-0">
                        <div class="row">
                            <!-- SHOP SIDEBAR-->
                            <div class="col-lg-3 order-2 order-lg-1">
                                <h5 class="text-uppercase mb-4">Categories</h5>
                                <div class="py-2 px-4 bg-dark text-white mb-3"><strong class="small text-uppercase fw-bold">Fashion &amp; Acc</strong></div>
                                <ul class="list-unstyled small text-muted ps-lg-4 font-weight-normal">
                                    <li class="mb-2"><a class="reset-anchor" href="SearchCategoryController?category=Mobiles">Mobiles</a></li>
                                    <li class="mb-2"><a class="reset-anchor" href="SearchCategoryController?category=Shoes">Shoes</a></li>
                                    <li class="mb-2"><a class="reset-anchor" href="SearchCategoryController?category=Clothes">Clothes</a></li>
                                    <li class="mb-2"><a class="reset-anchor" href="SearchCategoryController?category=Watches">Watches</a></li>
                                </ul>

                                <h6 class="text-uppercase mb-4">Price range</h6>
                                <div class="price-range pt-4 mb-5">
                                    <div id="range"></div>
                                    <form action="MainController" method="POST">
                                        <div class="row pt-2">
                                            <div class="col-6">
                                                <label for="fromPrice" class="small fw-bold text-uppercase">From</label>
                                                <input type="text" id="fromPrice" name="fromPrice" class="form-control" />
                                            </div>
                                            <div class="col-6 text-end">
                                                <label for="toPrice" class="small fw-bold text-uppercase">To</label>
                                                <input type="text" id="toPrice" name="toPrice" class="form-control" />
                                            </div>
                                        </div>
                                        <input type="submit" name="action" value="SearchByPrice"/>
                                    </form>
                                </div>

                                <h6 class="text-uppercase mb-4">Search Name</h6>
                                <div class="price-range pt-4 mb-5">
                                    <div id="range"></div>
                                    <form action="MainController" method="POST">
                                        <div class="row pt-2"> 
                                            <input type="text" name="searchByName" value="<%= searchByName%>"/>
                                        </div>
                                        <input type="submit" name="action" value="SearchByName"/>
                                    </form>
                                </div>
                            </div>
                            <!-- SHOP LISTING-->
                            <div class="col-lg-9 order-1 order-lg-2 mb-5 mb-lg-0">
                                <div class="row mb-3 align-items-center">
                                    <div class="col-lg-6 mb-2 mb-lg-0">
                                        <p class="text-sm text-muted mb-0">Showing <%= listProduct.size()%></p>
                                    </div>
                                    <div class="col-lg-6">
                                        <ul class="list-inline d-flex align-items-center justify-content-lg-end mb-0">

                                            <li class="list-inline-item">
                                                <select class="selectpicker" data-customclass="form-control form-control-sm">
                                                    <option value>Sort By </option>
                                                    <option value="default">Default sorting </option>
                                                    <option value="low-high">Price: Low to High </option>
                                                    <option value="high-low">Price: High to Low </option>
                                                </select>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <% if (noResults != null) {%>
                                    <p><%= noResults%></p>
                                    <% } else if (listProduct != null && !listProduct.isEmpty()) { %>
                                    <%
                                        for (ProductDTO product : listProduct) {
                                    %>
                                    <!-- PRODUCT-->
                                    <div class="col-lg-4 col-sm-6">
                                        <div class="product text-center">
                                            <div class="mb-3 position-relative">
                                                <div class="badge text-white bg-"></div><a class="d-block" href="ShowDetailController?mobileId=<%= product.getMobileId()%>"><img class="img-fluid w-100" src="<%= product.getImage()%>" alt="..."></a>
                                                <div class="product-overlay">
                                                    <ul class="mb-0 list-inline">
                                                        <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-outline-dark" href="MainController?action=AddWishList&mobileId=<%= product.getMobileId()%>"><i class="far fa-heart"></i></a></li>
                                                        <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href="AddToCartController?mobileId=<%= product.getMobileId()%>
                                                                                                &quantityLoss=1
                                                                                                &mobileName=<%= product.getMobileName()%>
                                                                                                &description=<%= product.getDescription()%>
                                                                                                &price=<%= product.getPrice()%>
                                                                                                &yearOfProduction=<%= product.getYearOfProduction()%>
                                                                                                &notSale=<%= product.isNotSale()%>
                                                                                                &image=<%= product.getImage()%>
                                                                                                &category=<%= product.getCategory()%>
                                                                                                ">Add to cart</a></li>

                                                    </ul>
                                                </div>
                                            </div> 
                                            <h6> <a class="reset-anchor" href="ShowDetailController?mobileId=<%= product.getMobileId()%>"> <%= product.getMobileName()%> </a></h6>
                                            <p class="small text-muted">$<%= product.getPrice()%></p>
                                        </div>
                                    </div>
                                    <% } %>
                                    <% }%>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <%@include file="view/home/footer.jsp" %>

            <!-- JavaScript files-->
            <script src="view/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="view/vendor/glightbox/js/glightbox.min.js"></script>
            <script src="view/vendor/nouislider/nouislider.min.js"></script>
            <script src="view/vendor/swiper/swiper-bundle.min.js"></script>
            <script src="view/vendor/choices.js/public/assets/scripts/choices.min.js"></script>
            <script src="view/js/front.js"></script>
            <!-- Nouislider Config-->

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
