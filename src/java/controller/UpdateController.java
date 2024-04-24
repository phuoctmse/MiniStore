/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import product.ProductDAO;
import product.ProductDTO;
import product.ProductError;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UpdateController", urlPatterns = {"/UpdateController"})
public class UpdateController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "SearchController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            boolean checkValid = true;
            ProductError productError = new ProductError();
            ProductDTO dto = new ProductDTO();
      
            
            String category = request.getParameter("category");
            dto.setCategory(category);
            
            String mobileId = request.getParameter("mobileId");
            dto.setMobileId(mobileId);
            
            String mobileName = request.getParameter("mobileName");
            if (mobileName.length() > 21 || mobileName == null) {
                productError.setMobileName("mobileName must less than 20 characters");
                checkValid = false;
            } else {
                dto.setMobileName(mobileName);
            }
            
            String priceStr = request.getParameter("price");
            float price = -1;
            if (priceStr == null || !priceStr.matches("^[0-9]*\\.?[0-9]+$")) {
                productError.setPrice(price);
                checkValid = false;
            } else {
                price = Float.parseFloat(priceStr);
                if (price < 0) {
                    productError.setPrice(price);
                    checkValid = false;
                } else {
                    dto.setPrice(price);
                }
            }
            String description = request.getParameter("description");
            if (description.length() > 251 || description == null) {
                productError.setDescription("description must less than 250 characters");
                checkValid = false;
            } else {
                dto.setDescription(description);
            }
            
            String quanityStr = request.getParameter("quantity");
            int quantity = Integer.parseInt(quanityStr);
            if (quanityStr == null || !quanityStr.matches("^[0-9]+$")) {
                productError.setQuantity(-1);
                checkValid = false;
            } else {
                quantity = Integer.parseInt(quanityStr);
                if(quantity < 0){
                    productError.setQuantity(-1);
                    checkValid = false;
                } else {
                    dto.setQuantity(quantity);
                }
            }
            
            String yearOfProductionStr = request.getParameter("yearOfProduction");
            int yearOfProduction = Integer.parseInt(yearOfProductionStr);
            if ( yearOfProductionStr == null || !yearOfProductionStr.matches("^[0-9]+$")) {
                productError.setYearOfProduction(-1);
                checkValid = false;
            } else {
                yearOfProduction = Integer.parseInt(yearOfProductionStr);
                if(yearOfProduction < 0){
                    productError.setYearOfProduction(-1);
                    checkValid = false;
                } else {
                    dto.setYearOfProduction(yearOfProduction);
                }
            }
            
            String notSaleStr = request.getParameter("notSale");
            boolean notSale = Boolean.parseBoolean(notSaleStr);
            if (notSaleStr == null || (!notSaleStr.equalsIgnoreCase("true") && !notSaleStr.equalsIgnoreCase("false"))) {
                productError.setNotSale(true);
                checkValid = false;
            } else {
                dto.setNotSale(notSale);
            }
            
            if(checkValid){
            ProductDAO dao = new ProductDAO();
            boolean checkUpdate = dao.update(dto);
                if(checkUpdate) {
                url = SUCCESS;
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }
        } catch (Exception e) {
            log("ERROR at UpdateController " + e.toString());
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
