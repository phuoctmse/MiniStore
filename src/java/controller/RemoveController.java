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
import users.UserDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "RemoveController", urlPatterns = {"/RemoveController"})
public class RemoveController extends HttpServlet {

    private static final String ERROR = "viewCart.jsp";
    private static final String SUCCESS = "viewCart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String mobileId = request.getParameter("mobileId");
            HttpSession session = request.getSession();
            if (session != null) {
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                String userId = loginUser.getUserID();
                CartDTO cart = (CartDTO) session.getAttribute("CART");
                if (cart != null) {
                    CartDAO dao = new CartDAO();
                    boolean check = dao.removeCart(userId, mobileId);
                    if (check) {
                        boolean removed = cart.remove(mobileId);
                        if (cart.getCart().size() == 0) {
                            session.setAttribute("CART", null);
                        } else {
                            session.setAttribute("CART", cart);
                        }
                        if (removed) {
                            url = SUCCESS;
                        }
                    }
                }
            }
        } catch (Exception e) {
            log("ERROR at RemoveController" + e.toString());
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
