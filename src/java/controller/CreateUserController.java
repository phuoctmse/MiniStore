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
import users.UserDAO;
import users.UserDTO;
import users.UserError;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CreateUserController", urlPatterns = {"/CreateUserController"})
public class CreateUserController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "ManageUserController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            boolean checkValid = true;
            UserError userError = new UserError();
            UserDTO dto = new UserDTO();
            UserDAO dao = new UserDAO();
            
            String userId = request.getParameter("userId");
            if (userId.length() > 50 || userId == null) {
                userError.setUserID("userId must less than 50 characters");
                checkValid = false;
            } else {
                boolean checkDuplicate = dao.checkDuplicate(userId);
                if(checkDuplicate){
                   userError.setUserID("this userId EXISTS !");
                   checkValid = false;
                } else {
                    dto.setUserID(userId);
                }
            }
            
            String userName = request.getParameter("userName");
            if (userName.length() > 50 || userName == null) {
                userError.setFullName("userName must less than 50 characters");
                checkValid = false;
            } else {
                dto.setFullName(userName);
            }
            
            String roleStr = request.getParameter("role");
            int role = Integer.parseInt(roleStr);
                if(role < 0 || role > 2){
                    userError.setRole(-1);
                    checkValid = false;
                } else {
                    dto.setRole(role);
                }
                
            String password = request.getParameter("password");
            if (password.length() > 50 || password == null) {
                userError.setPassword("password must less than 50 characters");
                checkValid = false;
            } else {
                dto.setPassword(password);
            }
            
            String confirm = request.getParameter("confirm");
            if (!password.equals(confirm)) {
                userError.setConfirm("2 password must be same");
                checkValid = false;
            } 
                
            if(checkValid){
                boolean checkUpdate = dao.insertUser(dto);
                if(checkUpdate){
                    url = SUCCESS;
                } 
            } else {
                    request.setAttribute("USER_ERROR", userError);
                }
        } catch (Exception e) {
            log("ERROR at UpdateUserController " + e.toString());
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
