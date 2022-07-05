<%-- 
    Document   : home
    Created on : Jul 4, 2022, 8:29:22 PM
    Author     : rafih
--%>

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
            <div class="search-group">
                <form action="" onSubmit="event.preventDefault();">
                    <div class="col-2_5 from-to" id="from">
                        <label for="from-city" class="text-gray label-form">From</label><br>
                        <input type="text" id="from-city" name="from-city" placeholder="From City or Airport" onclick="displayListsFrom()" required><br>
                        <div class="container-lists" id="from-city-list">
                            <input type="text" placeholder="City or Airport" disabled>
                            <button class="btn-cities-from">Jakarta, Indonesia</button>
                            <button class="btn-cities-from">Surabaya, Indonesia</button>
                            <button class="btn-cities-from">Medan, Indonesia</button>
                            <button class="btn-cities-from">Makassar, Indonesia</button>
                            <button class="btn-cities-from">Yogyakarta, Indonesia</button>
                            <button class="btn-cities-from">Denpasar-Bali, Indonesia</button>
                            <button class="btn-cities-from">Padang, Indonesia</button>
                            <button class="btn-cities-from">Palembang, Indonesia</button>
                            <button class="btn-cities-from">Banjarmasin, Indonesia</button>
                            <button class="btn-cities-from">Pontianak, Indonesia</button>
                        </div>
                    </div>
                    <div class="col-2_5 from-to">
                        <label for="to-city" class="text-gray label-form">To</label><br>
                        <input type="text" name="to-city" id="to-city" placeholder="To City or Airport" onclick="displayListsTo()" required>
                        <div class="container-lists" id="to-city-list">
                            <input type="text" placeholder="City or Airport" disabled>
                            <button class="btn-cities-to">Jakarta, Indonesia</button>
                            <button class="btn-cities-to">Surabaya, Indonesia</button>
                            <button class="btn-cities-to">Medan, Indonesia</button>
                            <button class="btn-cities-to">Makassar, Indonesia</button>
                            <button class="btn-cities-to">Yogyakarta, Indonesia</button>
                            <button class="btn-cities-to">Denpasar-Bali, Indonesia</button>
                            <button class="btn-cities-to">Padang, Indonesia</button>
                            <button class="btn-cities-to">Palembang, Indonesia</button>
                            <button class="btn-cities-to">Banjarmasin, Indonesia</button>
                            <button class="btn-cities-to">Pontianak, Indonesia</button>
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
                        <input type="text" id="passenger-seat-class" placeholder="1 Passenger, Economy" onclick="displayListsPass()" disabled>
                        <div class="container-lists" id="passenger-list">
                            <input type="text" placeholder="City or Airport" disabled>
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
                                <button class="seat-class-list">Economy</button>
                                <button class="seat-class-list">Premium Economy</button>
                                <button class="seat-class-list">Business</button>
                                <button class="seat-class-list">First Class</button>
                                <div class="col-6 text-center">
                                    <button class="btn-reset" onclick="resetPassSeatClass()">Reset</button>
                                </div>
                                <div class="col-6 text-center">
                                    <button class="btn-done" onclick="submitPassSeatClass()">Done</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="footer">
                <a href="result_remake.html"><button type="submit" class="btn-submit" disabled>Search</button></a>
            </div>
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