/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controller.SearchController;
import Helper.StringHelper;
import Helper.TimeHelper;
import Model.SearchModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rafih
 */
public class SearchServlet extends HttpServlet {

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
            
            RequestDispatcher dispatch = request.getRequestDispatcher("/views/search.jsp");
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
        
        String fromCity = request.getParameter("from-city");
        String toCity = request.getParameter("to-city");
        String departDate = request.getParameter("departure-date");
        String fromApName = null;
        String toApName = null;
        String fromApCode = null;
        String toApCode = null;
        String departTime = null;
        String timeOfFlight = null;
        String arrivalTime = null;
        String airlineName = null;
        String airlineCode = null;
        String routeId = null;
        String flightId = null;
        
        SearchModel model = new SearchModel();
        model.setFromCity(fromCity);
        model.setToCity(toCity);
        model.setDepartDate(departDate);
        
        try {
            SearchController sc = new SearchController();
            ResultSet rs = sc.search(model);
            boolean resultFound = false;
            int resultCounter = 0;
            
            if (rs.isBeforeFirst()) {
                resultFound = true;
                
                
                while (rs.next()) {
                    fromApName = rs.getString(1);
                    fromCity = rs.getString(2);
                    fromApCode = rs.getString(3);
                    toApName = rs.getString(4);
                    toCity = rs.getString(5);
                    toApCode = rs.getString(6);
                    departTime = TimeHelper.removeSecondsFromTime(rs.getString(7));
                    timeOfFlight = rs.getString(8);
                    arrivalTime = TimeHelper.addTime(departTime, timeOfFlight);
                    airlineName = rs.getString(9);
                    airlineCode = rs.getString(10);
                    routeId = rs.getString(11);
                    flightId = rs.getString(12);
                    
                    request.setAttribute("fromCity", fromCity);
                    request.setAttribute("toCity", toCity);
                    request.setAttribute("fromApName" + resultCounter, fromApName);
                    request.setAttribute("toApName" + resultCounter, toApName);
                    request.setAttribute("fromApCode" + resultCounter, fromApCode);
                    request.setAttribute("toApCode" + resultCounter, toApCode);
                    request.setAttribute("departTime" + resultCounter, departTime);
                    request.setAttribute("timeOfFlight" + resultCounter, timeOfFlight);
                    request.setAttribute("arrivalTime" + resultCounter, arrivalTime);
                    request.setAttribute("airlineName" + resultCounter, airlineName);
                    request.setAttribute("airlineCode" + resultCounter, airlineCode);
                    request.setAttribute("routeId" + resultCounter, routeId);
                    request.setAttribute("flightId" + resultCounter, flightId);
                    
                    resultCounter++;
                }
                request.setAttribute("resultCounter", resultCounter);
            }
            else {
                resultFound = false;
            }
            request.setAttribute("resultFound", resultFound);
            processRequest(request, response);
        }
        catch (SQLException e) {
            System.out.println(e.getMessage());
        }
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