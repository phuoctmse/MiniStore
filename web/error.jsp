<%-- 
    Document   : create
    Created on : Apr 10, 2024, 9:50:13 PM
    Author     : ADMIN
--%>

<%@page import="users.UserError"%>
<%@page import="product.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Mobile</title>
    </head>
    <body>
        <%
            ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            UserError signupError = (UserError) request.getAttribute("SIGNUP_ERROR");
            if (productError == null) {
                productError = new ProductError();
            }
            else {
        %>

        <h1> Error At Manage Mobile </h1>

        <% if (productError.getMobileId() != null) {%>
        <h3>Error at MobileID: <%= productError.getMobileId()%></h3>
        <% } %>
        
         <% if (productError.getMobileName() != null) {%>
        <h3>Error at MobileName: <%= productError.getMobileName()%></h3>
        <% } %>

        <% if (productError.getDescription() != null) {%>
        <h3>Error at Description: <%= productError.getDescription()%></h3>
        <% } %>

        <% if (productError.getPrice() == -1) {%>
        <h3>Error at Price: Price must be number and > 0</h3>
        <% } %>

        <% if (productError.getYearOfProduction() == -1) {%>
        <h3>Error at Year Of Production: Year Of Production must be a number and > 0</h3>
        <% } %>

        <% if (productError.getQuantity() == -1) {%>
        <h3>Error at Quantity: Quantity must be number and > 0</h3>
        <% } %>

        <% if (productError.isNotSale()) {%>
        <h3>Error at Not Sale: Status Not Sale must be a boolean (true or false) </h3>
        <% }%>

        <a href="ManageProductController" > Click here to get back</a>
        <% } %>
        
        <% 
        if(userError == null) {
            userError = new UserError();
        } else {
        %>
        <h1> Error At Manage User </h1>

        <% if (userError.getUserID()!= null) {%>
        <h3>Error at UserId: <%= userError.getUserID()%></h3>
        <% } %>
        
         <% if (userError.getFullName() != null) {%>
        <h3>Error at FullName: <%= userError.getFullName()%></h3>
        <% } %>

        <% if (userError.getPassword() != null) {%>
        <h3>Error at Password: <%= userError.getPassword()%></h3>
        <% } %>
        
        <% if (userError.getConfirm()!= null) {%>
        <h3>Error at Password: <%= userError.getConfirm()%></h3>
        <% } %>

        <% if (userError.getRole() == -1) {%>
        <h3>Error at Role: Role must be 0 or 2</h3>
        <% } %>
        
        <a href="ManageUserController" > Click here to get back</a>
        <% } %>
        
        <% 
        if(signupError == null) {
            signupError = new UserError();
        } else {
        %>
        <h1> Error At Sign Up </h1>
        
        <% if (signupError.getUserID()!= null) {%>
        <h3>Error at UserId: <%= signupError.getUserID()%></h3>
        <% } %>
        
         <% if (signupError.getFullName() != null) {%>
        <h3>Error at FullName: <%= signupError.getFullName()%></h3>
        <% } %>

        <% if (signupError.getPassword() != null) {%>
        <h3>Error at Password: <%= signupError.getPassword()%></h3>
        <% } %>
        
        <% if (signupError.getConfirm()!= null) {%>
        <h3>Error at Password: <%= signupError.getConfirm()%></h3>
        <% } %>
        
        <a href="login.jsp" > Click here to get back</a>
         <% } %>
    </body>
</html>
