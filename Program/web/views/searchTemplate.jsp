<%-- 
    Document   : searchTemplate
    Created on : Jul 10, 2022, 4:09:46 AM
    Author     : rafih
--%>

<%-- 
    Document   : search
    Created on : Jul 4, 2022, 8:29:56 PM
    Author     : rafih
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/views/layouts/head.jsp">
            <jsp:param name="css-file" value="search.css"></jsp:param>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="/views/layouts/navbar.jsp"></jsp:include>
        
        <!-- content -->
        <%
            String fromCity =(String)request.getAttribute("fromCity");
            String toCity =(String)request.getAttribute("toCity");
            String departDate =(String)request.getAttribute("departDate");
            String returnDate =(String)request.getAttribute("returnDate");
            String seatClass =(String)request.getAttribute("seatClass");
            String passCount =(String)request.getAttribute("passCount");
            
            String resultFound = (String)request.getAttribute("resultFound");
            int resultCounter = (Integer)request.getAttribute("resultCounter");
            
            String[] fromApName = new String[resultCounter];
            String[] toApName = new String[resultCounter];
            String[] fromApCode = new String[resultCounter];
            String[] toApCode = new String[resultCounter];
            String[] departTime = new String[resultCounter];
            String[] timeOfFlight = new String[resultCounter];
            String[] arrivalTime = new String[resultCounter];
            String[] airlineName = new String[resultCounter];
            String[] airlineCode = new String[resultCounter];
            String[] routeId = new String[resultCounter];
            
            for (int i = 0; i < resultCounter; i++) {
                fromApName[i] = (String)request.getAttribute("fromApName" + i);
                toApName[i] = (String)request.getAttribute("toApName" + i);
                fromApCode[i] = (String)request.getAttribute("fromApCode" + i);
                toApCode[i] = (String)request.getAttribute("toApCode" + i);
                departTime[i] = (String)request.getAttribute("deparTime" + i);
                timeOfFlight[i] = (String)request.getAttribute("timeOfFlight" + i);
                arrivalTime[i] = (String)request.getAttribute("arrivalTime" + i);
                airlineName[i] = (String)request.getAttribute("airlineName" + i);
                airlineCode[i] = (String)request.getAttribute("airlineCode" + i);
                routeId[i] = (String)request.getAttribute("routeId" + i);
            }
        %>
        <!-- panel - searched -->
        <div class="panel searched shadowed">
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
                        <% if (Integer.parseInt(passCount) == 1) { %>
                        <p><%= departDate%> &nbsp||&nbsp 1 Passenger &nbsp||&nbsp <%= seatClass%></p>
                        <% } %>
                        <% if (Integer.parseInt(passCount) > 1) { %>
                        <p><%= departDate%> &nbsp||&nbsp <%= passCount%> Passengers &nbsp||&nbsp <%= seatClass%></p>
                        <% } %>
                    </div>
                </div>
            </div>
            <div class="col-6 content">
                <button class="btn-panel-searched shadowed">Change Search</button>
            </div>
        </div>

        <% if(resultFound.equals("true")) { %>
            <% for (int i = 0; i < resultCounter; i++) { %>
            <!-- panel - result -->
            <div id="result-1">
                <div class="panel result shadowed" onclick="clickedResult1(), extendResult1()">
                    <div class="col-4">
                        <div class="col-12 content">
                            <h2><img class="result-airline-logo" src="public/frontend/images/garuda_indonesia.png"> <%= airlineName[i]%></h2>
                        </div>
                        <div class="col-12 content">
                            <br>
                        </div>
                        <div class="col-12">
                            <div class="col-6 content text-center">
                                <a href="#result-1" onclick="displayInfo1()">Flight Info</a>
                            </div>
                            <div class="col-6 content text-center">
                                <a href="#result-1" onclick="displayPrice1()">Fare Info</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-8">
                        <div class="col-8">
                            <div class="col-4 content text-center">
                                <p class="result-text-time"><%= departTime[i]%></p>
                                <p><%= fromApCode[i]%></p>
                            </div>
                            <div class="col-4 content text-center">
                                <p class="result-text-time-duration"><%= timeOfFlight[i]%> M</p>
                                <hr>
                                <!-- <div>
                                    <i class='bx bx-chevron-left'></i><hr class="result-text-time-separator"><i class='bx bx-chevron-right' ></i>
                                </div> -->
                            </div>
                            <div class="col-4 content text-center">
                                <p class="result-text-time"><%= arrivalTime[i]%></p>
                                <p><%= toApCode[i]%></p>
                            </div>
                        </div>
                        <div class="col-4 content">
                            <button class="btn-panel-result shadowed">Choose</button>
                        </div>
                    </div>
                </div>
                <!-- panel - result - 1 extension -->
                <div class="panel result-extended" id="info-1">
                    <!-- below is blank  -->
                    <div class="row">
                        <div class="col-12 content"></div>
                    </div>
                    <!-- above is blank -->
                    <div class="row">
                        <div class="col-2 content text-center info-vr" style="padding-top: 0; padding-bottom: 0;">
                            <p class="no-margin-bottom no-margin-top"><%= departTime[i]%></p>
                            <p class="text-gray no-margin-top"><%= departDate%>(need convertion)</p>
                            <br>
                            <br>
                            <br>
                            <p><i class='bx bx-right-arrow-alt'></i> <%= timeOfFlight[i]%> M</p>
                            <br>
                            <br>
                            <br>
                            <p class="no-margin-bottom"><%= arrivalTime[i]%></p>
                            <p class="text-gray no-margin-top no-margin-bottom"><%= departDate%>(need convertion)</p>
                        </div>
                        <div class="col-10 content" style="padding-top: 0; padding-bottom: 0;">
                            <p class="no-margin-bottom no-margin-top"><%= fromCity%> (<%= fromApCode[i]%>)</p>
                            <p class="no-margin-top text-gray"><%= fromApName[i]%></p>
                            <div class="row">
                                <div class="col-10 panel info-panel">
                                    <div class="col-4 content">
                                        <strong><img src="public/frontend/images/garuda_indonesia.png" alt="Logo" class="info-airline-logo"> <%= airlineName[i]%></strong>
                                        <p><%= airlineCode[i]%>-<%= routeId%> - <span class="info-text-seat-class"><%= seatClass%></span></p>
                                    </div>
                                    <div class="col-4 content">
                                        <p class="text-gray no-margin-top">Baggage 20 kg</p>
                                        <p class="text-gray">Cabin Baggage 7 kg</p>
                                    </div>
                                    <div class="col-4 content">
                                        <p class="no-margin-top"><span class="text-bold">Aircraft</span> Boeing 737</p>
                                        <p><span class="text-bold">Seat layout</span> 3-3</p>
                                        <p><span class="text-bold">Seat pitch</span> 29 inches (standard)</p>
                                    </div>
                                </div>
                            </div>
                            <p class="no-margin-bottom"><%= toCity%> (<%= toApCode[i]%>)</p>
                            <p class="no-margin-top text-gray"><%= toApName[i]%></p>
                        </div>
                    </div>
                </div>
                <!-- price -->
                <div class="panel result-extended" id="price-1">
                    <div class="col-6 content">
                        <h3 class="price-text-title">Conditions</h3>
                        <p><img src="public/frontend/images/garuda_indonesia.png" alt="Logo" class="info-airline-logo"> <span class="price-text-title"><%= airlineName[i]%></span></p>
                        <p><%= fromCity%> <i class='bx bx-right-arrow-alt'></i> <%= toCity%></p>
                        <p class="text-gray"><%= seatClass%></p>
                        <hr>
                        <h3 class="price-text-title">Included Benefits</h3>
                        <div class="col-1 text-center">
                            <i class='bx bxs-check-circle' style="color: blue;"></i>
                        </div>
                        <div class="col-11">
                            <p class="price-text-title no-margin-top">Free Protection</p>
                            <p>This free insurance will help cover you in case you get infected with COVID-19 during travel.</p>
                        </div>
                        <hr>
                        <div class="panel price-panel col-12">
                            <h3 class="no-margin-bottom">Baggage Prices</h3>
                            <p>Extra baggage purchase is not available for your flight</p>
                            <div class="col-1">
                                <img src="public/frontend/images/garuda_indonesia.png" alt="Logo" class="price-panel-airline-logo">
                            </div>
                            <div class="col-11">
                                <p class="price-text-title no-margin-top" style="margin-bottom: 0;">&nbsp<%= airlineName[i]%></p>
                                <p>&nbsp<%= fromCity%> &nbsp&nbsp<i class='bx bx-right-arrow-alt' ></i>&nbsp&nbsp <%= toCity%> - <span class="text-bold text-italic"><%= seatClass%></span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 content">
                        <h3 class="price-text-title">Price Details</h3>
                        <div class="col-6 text-left">
                            <p>Adult Basic Fare (x1)</p>
                            <p>Tax</p>
                            <p>Regular Total Price</p>
                            <p class="text-discount">Save</p>
                            <p class="text-discount">Free Protection</p>
                        </div>
                        <div class="col-6 text-right">
                            <p>Rp 1.277.300</p>
                            <p>Included</p>
                            <p>Rp 1.277.300</p>
                            <p class="text-discount">Rp 40.000</p>
                            <p class="text-discount">FREE</p>
                        </div>
                        <hr>
                        <div class="col-6 text-bold text-gray text-left">
                            <p class="no-margin-top">You Pay</p>
                        </div>
                        <div class="col-6 text-bold text-gray text-right">
                            <p class="no-margin-top">Rp 1.237.000</p>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        <% } %>
        
        <% if (resultFound.equals("false")) { %>
            KERJA WOY KERJAAAA!!! JANGAN MAGERAN KATANYA MAU BISA CARI DUIT
        <% } %>
            
        <jsp:include page="/views/layouts/footer.jsp"></jsp:include>
        <jsp:include page="/views/layouts/scripts.jsp">
            <jsp:param name="js-file" value="search.js"></jsp:param>
        </jsp:include>
    </body>
</html>
