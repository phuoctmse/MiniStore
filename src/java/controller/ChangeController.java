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
import product.CartDTO;
import product.ProductDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ChangeController", urlPatterns = {"/ChangeController"})
public class ChangeController extends HttpServlet {

    private static final String ERROR = "viewCart.jsp";
    private static final String SUCCESS = "viewCart.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String mobileId = request.getParameter("mobileId");
            String newQuantity = request.getParameter("quantity");
            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            if(cart != null) {
                if(cart.getCart().containsKey(mobileId)){
                    String mobileName = cart.getCart().get(mobileId).getMobileName();
                    float price = cart.getCart().get(mobileId).getPrice();
                    String description = cart.getCart().get(mobileId).getDescription();
                    int yearOfProduction = cart.getCart().get(mobileId).getYearOfProduction();
                    ProductDTO dto = new ProductDTO(mobileId, description, price, mobileName, yearOfProduction, yearOfProduction, false,"","");
                    boolean check = cart.edit(mobileId, dto);
                    if(check){
                        session.setAttribute("CART", cart);
                        url = SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            log("ERROR at ChangeController " + e.toString());
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
