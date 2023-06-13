/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controller.TicketController;
import Helper.DateHelper;
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

/**
 *
 * @author rafih
 */
public class ReservationServlet extends HttpServlet {

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
//            if (request.getSession().isNew()) {
//                request.setAttribute("status", false);
//            }
//            else {
//                boolean isLoggedIn = LoginServlet.getStatus();
//                if (isLoggedIn) {
//                    ResultSet rs = LoginServlet.getAccountInfo();
//                    request.setAttribute("accountRs", rs);
//                    
//                }
//                request.setAttribute("status", isLoggedIn);
//            }
            
            RequestDispatcher dispatch = request.getRequestDispatcher("/views/reservation-data.jsp");
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
        String flightId = request.getParameter("flightId");
        String accountId = request.getParameter("accountId");
        String passCount = request.getParameter("passengerCount");
        String seatClass = request.getParameter("seatClass");
        
        TicketModel model = new TicketModel();
        model.instantiateName(Integer.parseInt(passCount));
        model.instantiateAge(Integer.parseInt(passCount));
        model.instantiateGender(Integer.parseInt(passCount));
        model.instantiatePhoneNumber(Integer.parseInt(passCount));
        try {
            for (int i = 0; i < Integer.parseInt(passCount); i++) {
                model.setName(i, request.getParameter("name" + i));
                model.setAge(i, DateHelper.parseAgeFromDob(request.getParameter("dob" + i)));
                model.setGender(i, request.getParameter("gender" + i));
                model.setPhoneNumber(i, request.getParameter("phoneNumber" + i));
            }
        }
        catch(ParseException e) {
            System.out.println(e.getCause());
        }
        
        TicketController tc = new TicketController();
        boolean ticketCreated = tc.createReservation(flightId, accountId);
        
        if (ticketCreated) {
            try {
                ResultSet rs = tc.getReservation(flightId, accountId);
                if (rs.isBeforeFirst()) {
                    rs.first();
                    model.setReservationId(rs.getString(1));
                    model.setSeatClass(seatClass);
                    boolean infoCreated = false;

                    for (int i = 0; i < Integer.parseInt(passCount); i++) {
                        infoCreated = tc.createReservationInfo(i, model);
                    }
                    if (infoCreated) {
                        response.sendRedirect("Home");
                    }   
                }
            }
            catch(SQLException e) {
                e.printStackTrace();
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
