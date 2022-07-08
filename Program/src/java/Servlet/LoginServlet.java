/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controller.AccountController;
import Model.AccountModel;
import com.sun.rowset.CachedRowSetImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rafih
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            response.sendRedirect("Home");
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
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            AccountModel model = new AccountModel();
            model.setEmail(email);
            model.setPassword(password);
            
            AccountController ac = new AccountController();
            ResultSet rs = ac.login(model);
            rs.first();
            model.setUsername(rs.getString("Username"));
            model.setEmail(rs.getString("Email"));
            model.setPassword(rs.getString("Password"));
            model.setName(rs.getString("Name"));
            model.setGender(rs.getString("Gender"));
            model.setTitle(rs.getString("Title"));
            model.setDob(rs.getString("DateOfBirth"));
            model.setPhoneNumber(rs.getString("PhoneNumber"));
            ac.setAccount(session, model);
            
//            session.setAttribute("username", model.getUsername());
            
//            while (rs.next()) {
//                model.setUsername(rs.getString("Username"));
//                model.setEmail(rs.getString("Email"));
//                model.setPassword(rs.getString("Password"));
//                model.setName(rs.getString("Name"));
//                model.setGender(rs.getString("Gender"));
//                model.setTitle(rs.getString("Title"));
//                model.setDob(rs.getString("DateOfBirth"));
//                model.setPhoneNumber(rs.getString("PhoneNumber"));
//                
//                session.setAttribute(status, "login");
//                session.setAttribute(username, model.getUsername());
//                session.setAttribute(email, model.getEmail());
//                session.setAttribute(password, model.getPassword());
//                session.setAttribute(name, model.getName());
//                session.setAttribute(gender, model.getGender());
//                session.setAttribute(title, model.getTitle());
//                session.setAttribute(dob, model.getDob());
//                session.setAttribute(phoneNumber, model.getPhoneNumber());
//            }
//            else {
//                session.setAttribute(status, "logout");
//                session.setAttribute(username, null);
//                session.setAttribute(email, null);
//                session.setAttribute(password, null);
//                session.setAttribute(name, null);
//                session.setAttribute(gender, null);
//                session.setAttribute(title, null);
//                session.setAttribute(dob, null);
//                session.setAttribute(phoneNumber, null);
//            }
        }
        catch(Exception e) {
            System.out.println(e.getMessage());
        }
        
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
