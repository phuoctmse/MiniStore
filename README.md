<a name="br1"></a> 

Mini Store Management

REPORT

TÊN: TRƯƠNG MINH PHƯỚC

MSSV: SE184067

LỚP: PRJ301\_3W\_03



<a name="br2"></a> 

– HCM, APR 2024 –

**Table of Contents**

**I. Overview**

1\. Introduction

2\. Database

3\. System Functions

**II. Functional Requirements**



<a name="br3"></a> 

**I. Overview**

**1. Introduction**

**My project is a website that sells mobile phone, shoes, clothes and watches(product**

**lists). There are 2 roles: Admin and User. When Login as a User, you can view the**

**product lists, you can put it in the shopping cart and buy. When you buy, you will leave**

**some information so that the cake can be delivered. When logging in with the Admin**

**role, you can view orders (can search by userId ), can manage users (search, delete,**

**edit, add), can manage product (search, add, delete, edit).**

**2. Database**

\-

Database Name: workshop1

\+ tbl\_Product



<a name="br4"></a> 

\+ tbl\_User

\+ tbl\_Order



<a name="br5"></a> 

\+ tbl\_OrderDetail

\+ tbl\_Cart



<a name="br6"></a> 

\+ tbl\_Wishlist

**3. Database**

Model: The model represents data structures.This includes

classes like UserDTO, OrderDTO, ProductDTO, CartDTO, and WishListDTO, which

seem to map to database tables. The model also includes Data

Access Objects (DAOs) like UserDAO and OrderDAO, which

handle database operations.

• View: The view is responsible for rendering the user interface. In

the application, this includes JSP files like user.jsp and

checkOut.jsp. These files display data from the model to the user

and capture user input.

• Controller: The controller handles user input and updates the

model accordingly. In your application, this includes servlets like

SearchUserController and DeleteController. These servlets

receive HTTP requests, perform operations using the DAOs, and

forward the request to the appropriate JSP for rendering the

response



<a name="br7"></a> 



<a name="br8"></a> 

**II. Functional Requirements**

**1. Login**



<a name="br9"></a> 

**2. Register**

**3. Home**



<a name="br10"></a> 

**4. Shopping Page**



<a name="br11"></a> 

**5. Account update and information**



<a name="br12"></a> 

**6. Cart**

**7. Check out**



<a name="br13"></a> 

**8. Thank you**

**9. Admin**

**10. Manage Product**



<a name="br14"></a> 

**11. Add new product**

**12. Manage User**



<a name="br15"></a> 

**13. Add new User**

**14. Manage Order**



<a name="br16"></a> 



<a name="br17"></a> 



<a name="br18"></a> 


