<%-- 
    Document   : admin
    Created on : Apr 8, 2024, 8:48:51 AM
    Author     : ADMIN
--%>
<%@page import="product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="users.UserDTO"%>
<%@page import="users.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Page</title>
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
        <% UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || loginUser.getRole()!= 2) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
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
                                    <!-- Link--><a class="nav-link active" href="staff.jsp">Home</a>
                                </li>
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link" href="manageProduct.jsp">Product</a>
                                </li>
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link" href="manageOrder.jsp">Order</a>
                                </li>
                                 <li class="nav-item">
                                    <!-- Link--><a class="nav-link" href="manageUser.jsp">User</a>
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

        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="card-box bg-blue">
                        <div class="inner">
                            <p> Products </p>
                        </div>
                        <div class="icon">
                            <i class="	fas fa-stream" aria-hidden="true"></i>
                        </div>
                        <a href="MainController?action=manageProduct" class="card-box-footer">View More <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>

                <div class="col-lg-3 col-sm-6">
                    <div class="card-box bg-green">
                        <div class="inner">
                            <p> Orders </p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-briefcase" aria-hidden="true"></i>
                        </div>
                        <a href="MainController?action=manageOrder" class="card-box-footer">View More <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card-box bg-orange">
                        <div class="inner">
                            <p> Users </p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-user-plus" aria-hidden="true"></i>
                        </div>
                        <a href="MainController?action=manageUser" class="card-box-footer">View More <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            
        </div>

                                Welcome:<h1> <%= loginUser.getFullName()%> </h1>
                                <form action="MainController" method="POST">
                <div class="p-3 p-lg-5 border">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label for="userID" class="text-black">User ID</label>
                            <input type="text" class="form-control" id="userID" name="userId" value="<%= loginUser.getUserID()%>" readonly>
                        </div>
                        <div class="col-md-6">
                            <label for="fullName" class="text-black">Full Name</label>
                            <input type="text" class="form-control" id="fullName" name="userName" value="<%= loginUser.getFullName()%>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-12">
                            <label for="password" class="text-black">Password</label>
                            <input type="password" class="form-control" id="password" name="password" value="<%= loginUser.getPassword()%>">
                        </div>
                    </div>
                        <div class="form-group row">
                            <div class="col-lg-12">
                                <input type="submit" class="btn btn-primary btn-lg btn-block" name="action" value="UpdateInRoleAdmin">
                            </div>
                        </div>
                </div>
            </form>
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
