/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import order.OrderDAO;
import order.OrderDTO;
import product.CartDTO;
import product.ProductDTO;
import users.UserDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "checkOut.jsp";
    private static final String SUCCESS = "success.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String userID = loginUser.getUserID();
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String fullName = firstName + " " + lastName;
            String phoneNumber = request.getParameter("phone");
            String address = request.getParameter("address");
            String email = request.getParameter("email");

            OrderDAO dao = new OrderDAO();
            int orderId = dao.getOrderId();
            OrderDTO order = new OrderDTO(orderId, userID, fullName, phoneNumber, address, email);
            List<ProductDTO> listCheckQuantity = dao.checkQuantity(cart);
            if (!listCheckQuantity.isEmpty()) {
                boolean checkInserOrder = dao.insertOrder(order);
                if (checkInserOrder) {
                    boolean checkInsertOrderDetail = dao.insertOrderDetails(orderId, cart);
                    if (checkInsertOrderDetail) {
                        boolean updateQuantity = dao.updateProductQuantity(cart);
                        if (updateQuantity) {
                            cart.getCart().clear();
                            session.setAttribute("CART", cart);
                            url = SUCCESS;
                        }
                    }
                }

            }

        } catch (Exception e) {
            log("ERROR at CheckoutController" + e.toString());
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
