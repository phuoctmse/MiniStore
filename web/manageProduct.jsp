<%-- 
    Document   : viewProduct
    Created on : Apr 17, 2024, 5:47:25 PM
    Author     : ADMIN
--%>

<%@page import="product.ProductError"%>
<%@page import="java.util.List"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDTO"%>
<%@page import="users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Manage Product</title>
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
        <link rel="stylesheet" href="view/admin/admin.css">

    </head>
    <body>
        <%
            String noResults = (String) request.getAttribute("NO_RESULTS");

            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || loginUser.getRole() != 2) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }

            ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
            if (productError == null) {
                productError = new ProductError();
            }
            List<ProductDTO> listProduct = (List) request.getAttribute("LIST_PRODUCT");

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
                                    <!-- Link--><a class="nav-link" href="staff.jsp">Home</a>
                                </li>
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link active" href="MainController?action=manageProduct">Product</a>
                                </li>
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link" href="MainController?action=manageOrder">Order</a>
                                </li>
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link" href="MainController?action=manageUser">User</a>
                                </li>
                            </ul>
                            <ul class="navbar-nav ms-auto">    
                                <li class="nav-item"><a class="nav-link" href="staff.jsp"> <i class="fas fa-user me-1 text-gray fw-normal"></i><%= loginUser.getFullName()%></a></li>
                                <li class="nav-item"><a class="nav-link" href="MainController?action=Logout"> <i class="fas fa-sign-out-alt me-1 text-gray"></i>Logout<small class="text-gray fw-normal"></small></a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </header>
                                
                                <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Product <b>Details</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <div class="search-box">
                                    <form action="MainController" method="POST">
                                        <div class="input-group">	
                                            <input type="text"  name="search" value= "<%= search%>"  id="search" class="form-control" placeholder="Search by Name">
                                            <input type="submit" name="action" value="Search">
                                        </div>
                                    </form>
                                </div>
                                <div class="col-sm-6">
                                    <a href="#addMobileModal" class="btn btn-info" data-toggle="modal"><i class="fas fa-plus"></i> <span>Add</span></a>
                                </div>
                            </div>
                        </div>
                    </div>

            <% if (noResults != null) {%>
            <p><%= noResults%></p>
            <% } else if (listProduct != null) {
                if (listProduct.size() > 0) {
            %>

            <section class="py-5">
                <div class="container px-4 px-lg-5 mt-5">
                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                        <%
                            for (ProductDTO product : listProduct) {
                        %>
                        <form action="MainController" method="POST">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image-->
                                <img class="card-img-top" src="<%= product.getImage()%>" alt="..." />
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        ID: <input type="text" name="mobileId" value="<%= product.getMobileId()%>" readonly=""/>
                                        Category <input type="text" name="category" value="<%= product.getCategory()%>" required="" >
                                        Name: <input type="text" name="mobileName" value="<%= product.getMobileName()%>" required="" >
                                        Description: <input type="text" name="description" value="<%= product.getDescription()%>" required="" >
                                        Price <input type="text" name="price" value="<%= product.getPrice()%>" required=""/>
                                        Year Product: <input type="number" name="yearOfProduction" value="<%= product.getYearOfProduction()%>" required=""/>
                                        Quantity: <input type="number" name="quantity" value="<%= product.getQuantity()%>" required=""/>
                                        NotSale: <input type="text" name="notSale" value="<%= product.isNotSale()%>" required=""/>
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <a href="MainController?mobileId=<%= product.getMobileId()%>&action=Delete&search=<%= search%>">Delete</a>
                                    <input type="submit" name="action" value="Update"/>
                                    <input type="hidden" name="search" value="<%= search%>"/>
                                </div>
                            </div>
                        </div>
                        </form>
                        <% } %>
                    </div>
                </div>
            </section>
            <% } %>
            <% }%>

            <div id="addMobileModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="MainController" method="POST">
                            <div class="modal-header">
                                <h4 class="modal-title">Add Mobile</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Image Link</label>
                                    <input type="text" name="image" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <input type="text" name="category" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Mobile ID</label>
                                    <input type="text" name="mobileId" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Mobile Name</label>
                                    <input type="text" name="mobileName" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" required></textarea>
                                </div>

                                <div class="form-group">
                                    <label>Price</label>
                                    <input type="text" name="price" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Year of Production</label>
                                    <input type="number" name="yearOfProduction" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input type="number" name="quantity" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Not Sale</label>
                                    <input type="text" name="notSale" class="form-control" required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" name="action" class="btn btn-success" value="Create">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        
        <script src="view/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="view/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="view/vendor/nouislider/nouislider.min.js"></script>
        <script src="view/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="view/vendor/choices.js/public/assets/scripts/choices.min.js"></script>
        <script src="view/js/front.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

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
