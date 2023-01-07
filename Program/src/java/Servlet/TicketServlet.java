/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controller.AccountController;
import Controller.TicketController;
import Helper.DateHelper;
import Model.AccountModel;
import Model.TicketModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rafih
 */
public class TicketServlet extends HttpServlet {

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
            if (request.getSession().isNew()) {
                request.setAttribute("status", false);
            }
            else {
                boolean isLoggedIn = LoginServlet.getStatus();
                if (isLoggedIn) {
                    ResultSet rs = LoginServlet.getAccountInfo();
                    request.setAttribute("accountRs", rs);
                    
                }
                request.setAttribute("status", isLoggedIn);
            }
            
            RequestDispatcher dispatch = request.getRequestDispatcher("/views/ticket.jsp");
            dispatch.forward(request, response);
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
            
        String id = request.getParameter("accountId");
        TicketController tc = new TicketController();
        ResultSet rs = tc.getTicket(id);
        request.setAttribute("ticketRs", rs);
        
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
        
        String accountId = request.getParameter("accountId");
        String flightId = request.getParameter("flightId");
        String reservationId = request.getParameter("reservationId");
        
        TicketController tc = new TicketController();
        boolean cancelled = tc.cancelTicket(flightId, accountId);
        
        if (cancelled) {
            boolean deleted = tc.deleteReservationInfo(reservationId);
            if (deleted) {
                response.sendRedirect("Home");
            }
        }
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
