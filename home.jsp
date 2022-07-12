<%-- 
    Document   : home
    Created on : Jul 4, 2022, 8:29:22 PM
    Author     : rafih
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Controller.AccountController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/views/layouts/head.jsp">
            <jsp:param name="css-file" value="home.css"/>
        </jsp:include>
    </head>
    <body>
        <!-- Ini Navbar yaaa bang ganteng -->
        <jsp:include page="/views/layouts/navbar.jsp"></jsp:include>
        
        <!-- Ini content nya ya mas -->
        <!-- Slideshow -->
        <div class="slideshow-background">
            <div class="container slideshow">
                <img src="public/frontend/images/Airline_ads(1).jpg" alt="Airline Ad(1)" class="slideshow-img" id="img-1">
                <img src="public/frontend/images/Airline_ads(2).jpg" alt="Airline Ad(2)" class="slideshow-img" id="img-2">
                <img src="public/frontend/images/Airline_ads(3).jpg" alt="Airline Ad(3)" class="slideshow-img" id="img-3">
            </div>
        </div>

        <!-- Search Box -->
        <div class="container search-box focusable" id="search-box" style="z-index: unset !important;">
            <div class="header">
                <h2 class="text">Hello there!</h2>
                <h1 class="text">Are you looking to travel somewhere?</h1>
            </div>
            <div class="promo-group">
                <div class="row">
                    <div class="col-1">
                        <h1 class="text"><i class='bx bxs-plane-alt' style="color: blue;"></i></h1>
                    </div>
                    <div class="col-11">
                        <h2 class="text">Look for promos & cheap ticket prices <a href="">here</a>!!!</h2>
                    </div>
                </div>
                <br>
                <div class="row">
                    <label for="trip-choice">
                            <input type="radio" id="trip-choice"  name="trip-choice" checked> Single-Trip
                        </label>
                </div>
            </div>
            <form action="Search" method="GET">
                <div class="search-group">
                    <div class="col-2_5 from-to" id="from">
                        <div class="select-box">
            <div class="options-container">
                <div class="option">
                    <input type="radio" class="radio" id="Tanggerang" name="category" />
                    <label for="Tanggerang">Tanggerang, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Surabaya" name="category" />
                    <label for="Surabaya">Surabaya, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Medan" name="category" />
                    <label for="Medan">Medan, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Makassar" name="category" />
                    <label for="Makassar">Makassar, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Yogyakarta" name="category" />
                    <label for="Yogyakarta">Yogyakarta, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Denpasar-Bali" name="category" />
                    <label for="Denpasar-Bali">Denpasar-Bali, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Padang" name="category" />
                    <label for="Padang">Padang, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Palembang" name="category" />
                    <label for="Palembang">Palembang, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Banjarmasin" name="category" />
                    <label for="Banjarmasin">Banjarmasin, Indonesia</label>
                </div>
            </div>

            <div class="selected">
                Select City From
            </div>
        </div>
                    </div>
                    <div class="col-2_5 from-to">
                        <div class="select-box">
            <div class="options-container">
                <div class="option">
                    <input type="radio" class="radio" id="Tanggerang" name="category" />
                    <label for="Tanggerang">Tanggerang, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Surabaya" name="category" />
                    <label for="Surabaya">Surabaya, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Medan" name="category" />
                    <label for="Medan">Medan, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Makassar" name="category" />
                    <label for="Makassar">Makassar, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Yogyakarta" name="category" />
                    <label for="Yogyakarta">Yogyakarta, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Denpasar-Bali" name="category" />
                    <label for="Denpasar-Bali">Denpasar-Bali, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Padang" name="category" />
                    <label for="Padang">Padang, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Palembang" name="category" />
                    <label for="Palembang">Palembang, Indonesia</label>
                </div>

                <div class="option">
                    <input type="radio" class="radio" id="Banjarmasin" name="category" />
                    <label for="Banjarmasin">Banjarmasin, Indonesia</label>
                </div>
            </div>
            <div class="selected">
                Select City To
            </div>
        </div>
                    </div>
                    <div class="col-2_25 departure-arrival">
                        <label for="departure-date" class="text-gray label-form">Depart Date</label><br>
                        <input type="date" name="departure-date" id="departure-date">
                    </div>
                    <div class="col-2_25 departure-arrival">
                        <input type="checkbox" id="return-date-check" name="return-date-check" class="checkbox" onclick="returnFlight()">
                        <label for="return-date-check" class="text-gray label-form"> Return Date</label><br>
                        <input type="date" name="return-date" id="return-date" disabled>
                    </div>
                    <div class="col-2_5 passenger-class" onclick="displayListsPass()">
                        <label for="passenger-seat-class" class="text-gray label-form">Passenger, Seat Class</label><br>
                        <input type="text" name="passenger-seat-class" id="passenger-seat-class" placeholder="1 Passenger, Economy" onclick="displayListsPass()">
                        <div class="container-lists" id="passenger-list">
                            <input type="text" placeholder="Passenger and Seat Class" disabled>
                            <div class="col-6" id="passenger-count">
                                <div class="row">
                                    <div class="col-2 text-center">
                                        <button class="btn-decrease">-</button>
                                    </div>
                                    <div class="col-8 text-center">
                                        <p>Adult</p>
                                    </div>
                                    <div class="col-2 text-center">
                                        <button class="btn-increase">+</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-2 text-center">
                                        <button class="btn-decrease">-</button>
                                    </div>
                                    <div class="col-8 text-center">
                                        <p>Child</p>
                                    </div>
                                    <div class="col-2 text-center">
                                        <button class="btn-increase">+</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-2 text-center">
                                        <button class="btn-decrease">-</button>
                                    </div>
                                    <div class="col-8 text-center">
                                        <p>Infant</p>
                                    </div>
                                    <div class="col-2 text-center">
                                        <button class="btn-increase">+</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6" id="seat-class">
                                <button type="button" class="seat-class-list">Economy</button>
                                <button type="button" class="seat-class-list">Premium Economy</button>
                                <button type="button" class="seat-class-list">Business</button>
                                <button type="button" class="seat-class-list">First Class</button>
                                <div class="col-6 text-center">
                                    <button type="button" class="btn-reset" onclick="resetPassSeatClass()">Reset</button>
                                </div>
                                <div class="col-6 text-center">
                                    <button type="button" class="btn-done" onclick="submitPassSeatClass()">Done</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer">
                    <button type="submit" class="btn-submit">Search</button>
                </div>
            </form>
        </div>

        <!-- Main Background -->
        <div class="main-background"></div>
        
        <!-- Kalo ini footer nya ka -->
        <jsp:include page="/views/layouts/footer.jsp"></jsp:include>
        <!-- Nah kalo ini baru script nya >_< -->
        <jsp:include page="/views/layouts/scripts.jsp">
            <jsp:param name="js-file" value="home.js"/>
        </jsp:include>
    </body>
</html>