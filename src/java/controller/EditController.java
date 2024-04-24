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
import product.ProductDAO;
import product.ProductDTO;
import users.UserDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "EditController", urlPatterns = {"/EditController"})
public class EditController extends HttpServlet {

    private static final String ERROR = "viewCart.jsp";
    private static final String SUCCESS = "viewCart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String mobileId = request.getParameter("mobileId");
            String quantityStr = request.getParameter("quantity");
            if (mobileId != null && quantityStr != null) {
                int quantity = Integer.parseInt(quantityStr);
                HttpSession session = request.getSession();
                if (session != null) {
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    String userId = loginUser.getUserID();
                    CartDTO cart = (CartDTO) session.getAttribute("CART");
                    if (cart != null) {
                        ProductDAO productDao = new ProductDAO();
                        ProductDTO product = new ProductDTO();
                        product = productDao.getProductId(mobileId);
                        if (product.getQuantity() > quantity) {
                            CartDAO dao = new CartDAO();
                            boolean check = dao.editCart(userId, mobileId, quantity);
                            if (check) {
                                product = cart.getCart().get(mobileId);
                                if (product != null) {
                                    product.setQuantity(quantity);
                                    cart.edit(mobileId, product);
                                    session.setAttribute("CART", cart);
                                    url = SUCCESS;
                                }
                            }
                        } else {
                        request.setAttribute("MESSAGE",product.getMobileName() + " exceeds quantity, please try again");
                    }
                    }
                }
            }
        } catch (Exception e) {
            log("ERROR at EditController" + e.toString());
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
