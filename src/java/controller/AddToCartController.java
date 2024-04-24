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
import product.CartDAO;
import product.CartDTO;
import product.ProductDTO;
import users.UserDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    private static final String ERROR = "shopping.jsp";
    private static final String SUCCESS = "shopping.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String mobileId = request.getParameter("mobileId").trim();
            String mobileName = request.getParameter("mobileName").trim();
            String image = request.getParameter("image").trim();
            String category = request.getParameter("category").trim();
            float price = Float.parseFloat(request.getParameter("price").trim());
            String description = request.getParameter("description").trim();
            int quantityLoss = Integer.parseInt(request.getParameter("quantityLoss").trim());

            int yearOfProduction = Integer.parseInt(request.getParameter("yearOfProduction").trim());

            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String userId = loginUser.getUserID();
            CartDAO cartDao = new CartDAO();
            CartDTO cartList = cartDao.getUserCart(userId);
            if (cartList == null) {
                cartList = new CartDTO();
            }

            ProductDTO dto = new ProductDTO(mobileId, description, price, mobileName, yearOfProduction, quantityLoss, false, image, category);
            String MobileIdExist = dto.getMobileId();
            int cartId = cartDao.getCartId(MobileIdExist);

            boolean checkAdd = cartDao.addToCart(userId, dto, cartId);
            if (checkAdd) {
                request.setAttribute("MESSAGE", "You added " + mobileName + " quantity: " + quantityLoss);
                url = SUCCESS;
            } else {
                request.setAttribute("MESSAGE", "The item has already in the cart, please change quantity in cart!");
            }

        } catch (Exception e) {
            log("ERROR at AddToCartController " + e.toString());
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
