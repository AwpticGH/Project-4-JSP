<%-- 
    Document   : passenger-detail
    Created on : Jul 4, 2022, 8:30:23 PM
    Author     : rafih
--%>

<%@page import="Helper.TimeHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Helper.DateHelper"%>
<%@page import="Model.AccountModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/views/layouts/head.jsp">
            <jsp:param name="css-file" value="ticket.css"></jsp:param>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="/views/layouts/navbar.jsp"></jsp:include>
        
        <!-- content -->
        <!-- if has ticket -->
        <%
            boolean isLoggedIn = (Boolean)request.getAttribute("status");
            ResultSet accountRs = (ResultSet)request.getAttribute("accountRs");
            ResultSet ticketRs = (ResultSet)request.getAttribute("ticketRs");
            
            accountRs.first();
            String accountId = accountRs.getString("id");
            
            if (ticketRs.isBeforeFirst()) {
                ticketRs.last();
                int resultCounter = ticketRs.getRow();
                int loopCounter = 0;
                String fromCity = null;
                String fromApCode = null;
                String fromApName = null;
                String toCity = null;
                String toApCode = null;
                String toApName = null;
                String dateOfDeparture = null;
                String timeOfDeparture = null;
                String timeOfFlight = null;
                String routeId = null;
                String flightId = null;
                String airlineName = null;
                String airlineCode = null;
                String reservationId = null;
                String seatClass = null;
                String[] passName = new String[resultCounter];
                String[] passAge = new String[resultCounter];
                String[] passGender = new String[resultCounter];
                String[] passPhone = new String[resultCounter];

                ticketRs.beforeFirst();
                while (ticketRs.next()) {
                    if (ticketRs.isLast()) {
                        fromCity = ticketRs.getString(1);
                        fromApCode = ticketRs.getString(2);
                        fromApName = ticketRs.getString(3);
                        toCity = ticketRs.getString(4);
                        toApCode = ticketRs.getString(5);
                        toApName = ticketRs.getString(6);
                        dateOfDeparture = ticketRs.getString(7);
                        timeOfDeparture = TimeHelper.removeSecondsFromTime(ticketRs.getString(8));
                        timeOfFlight = ticketRs.getString(9);
                        routeId = ticketRs.getString(10);
                        flightId = ticketRs.getString(11);
                        airlineName = ticketRs.getString(12);
                        airlineCode = ticketRs.getString(13);
                        reservationId = ticketRs.getString(14);
                        seatClass = ticketRs.getString(15);
                    }
                    passName[loopCounter] = ticketRs.getString(16);
                    passAge[loopCounter] = ticketRs.getString(17);
                    passGender[loopCounter] = ticketRs.getString(18);
                    passPhone[loopCounter] = ticketRs.getString(19);

                    loopCounter++;
                }
            
        %>        
        <%= accountId%>
            <div class="content">
                <div class="panel shadowed">
                    <div class="flight-detail">
                        <div class="col-6">
                            <div class="row content">
                                <div class="col-4 content">
                                    <h1><%= fromCity%></h1>
                                </div>
                                <div class="col-4 content text-center">
                                    <h1><i class='bx bx-right-arrow-alt'></i></h1>
                                </div>
                                <div class="col-4 content text-center">
                                    <h1><%= toCity%></h1>
                                </div>
                            </div>
                            <div class="row content">
                                <div class="col-12 content">
                                    <h3><%= airlineName%></h3>
                                </div>
                            </div>
                            <div class="row content">
                                <div class="col-12 content footer">
                                    <% if (resultCounter == 1) { %>
                                    <p><%= DateHelper.dateFormat("dd MMM yy", dateOfDeparture)%> &nbsp||&nbsp 1 Passenger &nbsp||&nbsp <%= seatClass%></p>
                                    <% } %>
                                    <% if (resultCounter > 1) { %>
                                    <p><%= DateHelper.dateFormat("dd MMM yy", dateOfDeparture)%> &nbsp||&nbsp <%= resultCounter%> Passengers &nbsp||&nbsp <%= seatClass%></p>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="header">
                                <strong><%= airlineCode%>-<%= routeId%></strong>
                                <hr>
                            </div>
                            <div class="from-to-time-airport">
                                <div class="col-4">
                                    <div class="text from-to text-center">
                                        <p><%= timeOfDeparture%></p>
                                        <p><%= fromApCode%></p>
                                        <p><%= fromApName%></p>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="text time-of-flight text-center">
                                        <p><%= timeOfFlight%> M</p>
                                        <hr>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="text from-to text-center">
                                        <p><%= TimeHelper.addTime(timeOfDeparture, timeOfFlight)%></p>
                                        <p><%= toApCode%></p>
                                        <p><%= toApName%></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="passenger-detail">
                        <div class="col-12">
                            <br>
                            <table>
                                <tr>
                                    <th class="number">No</th>
                                    <th class="name">Name</th>
                                    <th>Age</th>
                                    <th>Gender</th>
                                    <th class="phone">Phone Number</th>
                                </tr>
                                <% 
                                    int passSelector;
                                    for (int i = 0; i < resultCounter; i++) {
                                        passSelector = i+1;  
                                %>
                                <tr>
                                    <td><%= passSelector%>.</td>
                                    <td><%= (passGender[i].equals("Male") 
                                            ? "Mr" 
                                            : "Mrs") %>
<!--//                                            (Integer.parseInt(passAge[i]) > 18) 
//                                            ? "Mrs" 
//                                            : "Miss" %>-->
                                            . <%= passName[i]%></td>
                                    <td><%= passAge[i]%></td>
                                    <td><%= passGender[i]%></td>
                                    <td>+62 <%= passPhone[i]%></td>
                                </tr>
                                <% } %>
                            </table>
                        </div>  
                    </div>
                    <div class="text-center">
                        <form action="Ticket" method="POST">
                            <input type="hidden" name="flightId" value="<%= flightId%>">
                            <input type="hidden" name="accountId" value="<%= accountId%>">
                            <input type="hidden" name="reservationId" value="<%= reservationId%>">
                            <button type="submit" onclick="return confirm('Are You Sure?')">Cancel Flight</button>
                        </form>
                    </div>                    
                </div>
            </div>
        <%  } %>
        <!-- if unlogged -->
        <%  if (!ticketRs.isAfterLast()) { %>
            <div class="content">
                <h1 class="text-bold">CIEEEE BELOM ORDER YA, KETINGGALAN JAMAN BANGET SIH KAMU MA</h1>
            </div>
        <%  } %>
        <!-- end of content -->
        
        
        
        <jsp:include page="/views/layouts/footer.jsp"></jsp:include>
        <jsp:include page="/views/layouts/scripts.jsp">
            <jsp:param name="js-file" value=""></jsp:param>
        </jsp:include>
    </body>
</html>
