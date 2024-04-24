/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import product.ProductDAO;
import product.ProductDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SearchByPriceController", urlPatterns = {"/SearchByPriceController"})
public class SearchByPriceController extends HttpServlet {

    private static final String ERROR = "shopping.jsp";
    private static final String SUCCESS = "shopping.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String fromPriceStr = request.getParameter("fromPrice");
            String toPriceStr = request.getParameter("toPrice");
            
            if (fromPriceStr != null && toPriceStr != null && !fromPriceStr.isEmpty() && !toPriceStr.isEmpty()) {
                float fromPrice = Float.parseFloat(fromPriceStr);
                float toPrice = Float.parseFloat(toPriceStr);

                ProductDAO dao = new ProductDAO();
                List<ProductDTO> listProduct = dao.getListProductByPrice(fromPrice, toPrice);

                if (listProduct.isEmpty()) {
                    request.setAttribute("NO_RESULTS", "No search Results");
                } else {
                    request.setAttribute("LIST_PRODUCT", listProduct);
                }
            }
        } catch (Exception e) {
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
