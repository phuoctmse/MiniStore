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
import javax.servlet.http.HttpSession;
import product.ProductDAO;
import product.ProductDTO;
import product.WishListDAO;
import product.WishListDTO;
import users.UserDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AddWishListController", urlPatterns = {"/AddWishListController"})
public class AddWishListController extends HttpServlet {

    private static final String ERROR = "shopping.jsp";
    private static final String SUCCESS = "shopping.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String mobileId = request.getParameter("mobileId");
            HttpSession session= request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String userId = loginUser.getUserID();
            WishListDAO dao = new WishListDAO();
            WishListDTO wishList = dao.getUserWishlist(userId);
            if(wishList == null){
                wishList = new WishListDTO();
            }
            ProductDAO productDao = new ProductDAO();
            ProductDTO productDto = productDao.getProductId(mobileId);
            int wishlistId = dao.getWishlistId(mobileId);
            boolean check = dao.addToWishlist(userId, productDto, wishlistId);
            if(check){
                request.setAttribute("MESSAGE", "You added " + productDto.getMobileName() + " to WishList ");
                url = SUCCESS;
            } else {
                request.setAttribute("MESSAGE", "The item has already in the wishlist!");
            }
        } catch (Exception e) {
            log("ERROR at AddWishListController " + e.toString());
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
