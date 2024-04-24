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
import javax.servlet.http.HttpSession;
import users.UserDAO;
import users.UserDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UpdateInRoleUserController", urlPatterns = {"/UpdateInRoleUserController"})
public class UpdateInRoleUserController extends HttpServlet {

     private static final String ERROR = "user.jsp";
    private static final String SUCCESS = "user.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            boolean checkValid = true;
            String userId = request.getParameter("userId");
             String userName = request.getParameter("userName");
            if (userName.length() > 50 || userName == null) {
                checkValid = false;
            }
            
            String password = request.getParameter("password");
            if (password.length() > 50 || password == null) {
                checkValid = false;
            } 
            if(checkValid){
                UserDTO dto = new UserDTO(userId, userName, 0, password);
                UserDAO dao = new UserDAO();
                boolean check = dao.updateUser(dto);
                if(check){
                    url = SUCCESS;
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_USER", dto);
                }
            } else {
                request.setAttribute("MESSAGE", "ERROR at Update user information");
            }
        } catch (Exception e) {
            log("ERROR at UpdateInRoleUserController " + e.toString());
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
