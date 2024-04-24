/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String ERROR = "home.jsp";
    
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    
    private static final String SIGNUP = "Signup";
    private static final String SIGNUP_CONTROLLER = "SignupController";
    
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";
    
    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateController";
    
    private static final String UPDATEINROLE_USER = "UpdateInRoleUser";
    private static final String UPDATEINROLE_USER_CONTROLLER = "UpdateInRoleUserController";
    
    private static final String UPDATEINROLE_ADMIN = "UpdateInRoleAdmin";
    private static final String UPDATEINROLE_ADMIN_CONTROLLER = "UpdateInRoleAdminController";
    
    private static final String CREATE = "Create";
    private static final String CREATE_CONTROLLER = "CreateController";
    
    private static final String SEARCHBYPRICE = "SearchByPrice";
    private static final String SEARCHBYPRICE_CONTROLLER = "SearchByPriceController";
    
    private static final String SEARCHCART = "SearchCart";
    private static final String SEARCHCART_CONTROLLER = "SearchCartController";
    
    private static final String SEARCHBYNAME = "SearchByName";
    private static final String SEARCHBYNAME_CONTROLLER = "SearchByNameController";
    
    private static final String VIEW = "View";
    private static final String VIEWCART_CONTROLLER = "ViewCartController";
     
    private static final String ADD = "Add";
    private static final String ADD_CONTROLLER = "AddToCartController";
    
    private static final String EDIT = "Edit";
    private static final String EDIT_CONTROLLER = "EditController";
    
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveController";
    
    private static final String MANAGEPRODUCT = "manageProduct";
    private static final String MANAGEPRODUCT_CONTROLLER = "ManageProductController";
    
    private static final String MANAGEORDER = "manageOrder";
    private static final String MANAGEORDER_CONTROLLER = "ManageOrderController";
    
    private static final String MANAGEUSER = "manageUser";
    private static final String MANAGEUSER_CONTROLLER = "ManageUserController";
    
    private static final String SEARCHUSER = "SearchUser";
    private static final String SEARCHUSER_CONTROLLER = "SearchUserController";
    
    private static final String SEARCHORDER = "SearchOrder";
    private static final String SEARCHORDER_CONTROLLER = "SearchOrderController";
    
    private static final String DELETEUSER = "DeleteUser";
    private static final String DELETEUSER_CONTROLLER = "DeleteUserController";
    
    private static final String UPDATEUSER = "UpdateUser";
    private static final String UPDATEUSER_CONTROLLER = "UpdateUserController";
    
    private static final String CREATEUSER = "CreateUser";
    private static final String CREATEUSER_CONTROLLER = "CreateUserController";
    
    private static final String SHOWDETAIL = "ShowDetail";
    private static final String SHOWDETAIL_CONTROLLER = "ShowDetailController";
    
    private static final String ADDWISHLIST = "AddWishList";
    private static final String ADDWISHLIST_CONTROLLER = "AddWishListController";
    
    private static final String WISHLIST = "WishList";
    private static final String WISHLIST_CONTROLLER = "WishListController";
    
    private static final String REMOVEWISHLIST = "RemoveWishList";
    private static final String REMOVEWISHLIST_CONTROLLER = "RemoveWishListController";
    
    private static final String CHECKOUT = "Checkout";
    private static final String CHECKOUT_CONTROLLER = "CheckOutController";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if(action.equals(LOGIN)) {
                url = LOGIN_CONTROLLER;
            } else if(action.equals(SEARCH)){
                url = SEARCH_CONTROLLER;
            } else if(action.equals(DELETE)){
                url = DELETE_CONTROLLER;
            } else if(action.equals(UPDATE)){
                url = UPDATE_CONTROLLER;
            } else if(action.equals(CREATE)){
                url = CREATE_CONTROLLER;
            } else if(action.equals(SEARCHBYPRICE)){
                url = SEARCHBYPRICE_CONTROLLER;
            } else if(action.equals(SEARCHCART)){
                url = SEARCHCART_CONTROLLER;
            } else if(action.equals(VIEW)){
                url = VIEWCART_CONTROLLER;
            } else if(action.equals(ADD)){
                url = ADD_CONTROLLER;
            } else if(action.equals(REMOVE)){
                url = REMOVE_CONTROLLER;
            } else if(action.equals(EDIT)){
                url = EDIT_CONTROLLER;
            } else if(action.equals(SEARCHBYNAME)){
                url = SEARCHBYNAME_CONTROLLER;
            } else if(action.equals(MANAGEORDER)){
                url = MANAGEORDER_CONTROLLER;
            } else if(action.equals(MANAGEPRODUCT)){
                url = MANAGEPRODUCT_CONTROLLER;
            } else if(action.equals(MANAGEUSER)){
                url = MANAGEUSER_CONTROLLER;
            } else if(action.equals(SEARCHUSER)){
                url = SEARCHUSER_CONTROLLER;
            } else if(action.equals(DELETEUSER)){
                url = DELETEUSER_CONTROLLER;
            } else if(action.equals(UPDATEUSER)){
                url = UPDATEUSER_CONTROLLER;
            } else if(action.equals(CREATEUSER)){
                url = CREATEUSER_CONTROLLER;
            } else if(action.equals(SIGNUP)){
                url = SIGNUP_CONTROLLER;
            } else if(action.equals(SHOWDETAIL)){
                url = SHOWDETAIL_CONTROLLER;
            } else if(action.equals(WISHLIST)){
                url = WISHLIST_CONTROLLER;
            } else if(action.equals(ADDWISHLIST)){
                url = ADDWISHLIST_CONTROLLER;
            } else if(action.equals(REMOVEWISHLIST)){
                url = REMOVEWISHLIST_CONTROLLER;
            } else if(action.equals(CHECKOUT)){
                url = CHECKOUT_CONTROLLER;
            } else if(action.equals(SEARCHORDER)){
                url = SEARCHORDER_CONTROLLER;
            } else if(action.equals(UPDATEINROLE_USER)){
                url = UPDATEINROLE_USER_CONTROLLER;
            } else if(action.equals(UPDATEINROLE_ADMIN)){
                url = UPDATEINROLE_ADMIN_CONTROLLER;
            }
        } catch (Exception e) {
            log("ERROR at MainController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
