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
import product.ProductDAO;
import product.ProductDTO;
import product.ProductError;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "ManageProductController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductDAO dao = new ProductDAO();
        ProductError productError = new ProductError();
        try {
            boolean checkValid = true;

            String mobileId = request.getParameter("mobileId");
            if (mobileId.length() > 11 || mobileId == null) {
                productError.setMobileId("mobileId must less than 10 characters");
                checkValid = false;
            } else {
                boolean checkDuplicate = dao.checkDuplicate(mobileId);
                if(checkDuplicate){
                   productError.setMobileId("this mobileId EXISTS !");
                   checkValid = false;
                }
            }

            String mobileName = request.getParameter("mobileName");
            if (mobileName.length() > 21 || mobileName == null) {
                productError.setMobileName("mobileName must less than 20 characters");
                checkValid = false;
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
                }
            }

            String description = request.getParameter("description");
            if (description.length() > 251 || description == null) {
                productError.setDescription("description must less than 250 characters");
                checkValid = false;
            }

            String quanityStr = request.getParameter("quantity");
            int quantity = -1;
            if (quanityStr == null || !quanityStr.matches("^[0-9]+$")) {
                productError.setQuantity(-1);
                checkValid = false;
            } else {
                quantity = Integer.parseInt(quanityStr);
                if(quantity < 0){
                    productError.setQuantity(quantity);
                    checkValid = false;
                }
            }

            String yearOfProductionStr = request.getParameter("yearOfProduction");
            int yearOfProduction = -1;
            if ( yearOfProductionStr == null || !yearOfProductionStr.matches("^[0-9]+$")) {
                productError.setYearOfProduction(-1);
                checkValid = false;
            } else {
                yearOfProduction = Integer.parseInt(yearOfProductionStr);
                if(yearOfProduction < 0){
                    productError.setYearOfProduction(yearOfProduction);
                    checkValid = false;
                }
            }
            String notSaleStr = request.getParameter("notSale");
            boolean notSale = Boolean.parseBoolean(notSaleStr);
            if (notSaleStr == null || (!notSaleStr.equalsIgnoreCase("true") && !notSaleStr.equalsIgnoreCase("false"))) {
                productError.setNotSale(true);
                checkValid = false;
            }
            String image = request.getParameter("image");
            String category = request.getParameter("category");

            if (checkValid) {
                ProductDTO dto = new ProductDTO(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale, image, category);
                boolean checkInsert = dao.insert(dto);
                if (checkInsert) {
                    url = SUCCESS;
                } 
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }
        } catch (Exception e) {
            log("ERROR at CreateController " + e.toString());
            
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
