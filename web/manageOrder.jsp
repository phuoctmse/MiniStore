<%-- 
    Document   : manageOrder
    Created on : Apr 24, 2024, 12:19:59 AM
    Author     : ADMIN
--%>

<%@page import="order.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Order</title>
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
        <% String noResults = (String) request.getAttribute("NO_RESULTS");

            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || loginUser.getRole() != 2) {
                response.sendRedirect("login.jsp");
                return;
            }
            String searchOrder = request.getParameter("searchOrder");
            if (searchOrder == null) {
                searchOrder = "";
            }
            List<OrderDTO> listOrder = (List) request.getAttribute("LIST_ORDER");
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
                                    <!-- Link--><a class="nav-link" href="MainController?action=manageProduct">Product</a>
                                </li>
                                <li class="nav-item">
                                    <!-- Link--><a class="nav-link active" href="MainController?action=manageOrder">Order</a>
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
            <div class="table-responsive-lg">

                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Product <b>Details</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <div class="search-box">
                                <form action="MainController" method="POST">
                                    <div class="input-group">	
                                        <input type="text"  name="searchOrder" value= "<%= searchOrder%>"  id="search" class="form-control" placeholder="Search by ID">
                                        <input type="submit" name="action" value="SearchOrder">
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
                <% if (noResults != null) {%>
                <p><%= noResults%></p>
                <% } else if (listOrder != null) {
                    if (listOrder.size() > 0) {
                %>
                <table class="table table-striped">
                    <thead>

                        <tr>
                            <th class="col-1">OrderId</th>
                            <th class="col-2">UserID</th>
                            <th class="col-2">FullName</th>
                            <th class="col-2">PhoneNumber</th>
                            <th class="col-2">Address</th>
                            <th class="col-3">Email</th>

                        </tr>
                    </thead>
                    <%
                        for (OrderDTO order : listOrder) {
                    %>
                    <tbody>
                    <form action="MainController" method="POST">
                        <tr>
                            <td><%= order.getOrderID()%></td>
                            <td>
                                <%= order.getUserID()%>
                            </td>
                            <td>
                                <%= order.getFullName()%>
                            </td>
                            <td>
                                <%= order.getPhoneNumber()%>
                            </td>
                            <td>
                                <%= order.getAddress()%>
                            </td>
                            <td>
                                <%= order.getEmail()%>
                            </td>
                        </tr>
                    </form>

                    <%
                        }
                    %>
                    </tbody>
                </table>
                <%
                    String error = (String) request.getAttribute("ERROR");
                    if (error == null) {
                        error = "";
                    }
                %>
                <%= error%>

                <%
                        }
                    }
                %>

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
