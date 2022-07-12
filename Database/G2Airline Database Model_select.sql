-- GETTING THE FlightID TO FIND ReservationID AND/OR RESERVEDSEATS ID(FOR COLORING BUTTONS)
-- AirplaneID FOR CALCULATING SEATS
-- AirlineName FOR DISPLAYING AIRLINE NAME
SELECT	Flight.ID as FlightID, Airplane.ID as AirplaneID, Airline.Name as AirlineName, cast(Flight.TimeOfDeparture as DATE) as DateOfDeparture,	convert(char(5), Flight.TimeOfDeparture, 108) as TimeofDeparture, CONVERT(CHAR(5), DATEADD(MINUTE, FlightRoute.TimeOfFlight, Flight.TimeOfDeparture), 108) as TimeOfArrival FROM Flight FULL JOIN FlightRoute on Flight.FlightRouteID = FlightRoute.ID FULL JOIN Airplane ON Flight.AirplaneID = Airplane.ID FULL JOIN Airline ON Airplane.AirlineCode = Airline.Code WHERE datediff(day, Flight.TimeOfDeparture, '2022-05-20') = 0 AND FlightRoute.Departure = 'CGK' AND FlightRoute.Destination = 'KNO';

------------

SELECT DATEADD(MINUTE, FlightRoute.TimeOfFlight, cast(Flight.TimeOfDeparture AS TIME)) as TimeOfArrival, Flight.TimeOfDeparture as TimeOfDeparture, FlightRoute.TimeOfFlight as TimeOfFlight
FROM Flight
FULL JOIN FlightRoute on Flight.FlightRouteID = FlightRoute.ID;

--------------

SELECT CONVERT(CHAR(5), DATEADD(MINUTE, FlightRoute.TimeOfFlight, Flight.TimeOfDeparture), 108) as TimeOfArrival, Flight.TimeOfDeparture as TimeOfDeparture, FlightRoute.TimeOfFlight as TimeOfFlight
FROM Flight
FULL JOIN FlightRoute on Flight.FlightRouteID = FlightRoute.ID;

-----------------------

--SELECTING USER'S NAME AND ADDITIONAL PASSENGER TO JOIN TABLES TO GET RESERVED SEAT NAME
SELECT ReservedEconomySeatsInfo.Name as Name, ReservedEconomySeatsInfo.Age as Age, ReservedEconomySeatsInfo.Gender as Gender, ReservedEconomySeatsInfo.PhoneNumber as PhoneNumber, Reservation.ID as ReservationID FROM ReservedEconomySeatsInfo FULL JOIN ReservedEconomySeats on ReservedEconomySeatsInfo.ReservedEconomySeatsID = ReservedEconomySeats.ID FULL JOIN Reservation on ReservedEconomySeats.ReservationID = Reservation.ID FULL JOIN "User" on Reservation.UserID = "User".ID WHERE "User".ID = '1' AND Reservation.Active = '1';


--SELECTTING RESERVATION ID WHERE UserID = ?
SELECT Reservation.ID FROM Reservation FULL JOIN "User" on Reservation.UserID = "User".ID WHERE UserID = 1 AND Reservation.Active = 1;

--SELECTING EVERYTHING NEEDED FOR BOOKING INFO WHERE ReservationID = ?;
SELECT FlightRoute.ID as FlightRouteID, cast(Flight.TimeOfDeparture as DATE) as DateOfDeparture, convert(char(5), Flight.TimeOfDeparture, 108) as TimeofDeparture, CONVERT(CHAR(5), DATEADD(MINUTE, FlightRoute.TimeOfFlight, Flight.TimeOfDeparture), 108) as TimeOfArrival, Airline.Code as AirlineCode, Airline.Name as AirlineName FROM Reservation FULL JOIN Flight on Reservation.FlightID = Flight.ID FULL JOIN FlightRoute on Flight.FlightRouteID = FlightRoute.ID FULL JOIN Airport on FlightRoute.Departure = Airport.Code FULL JOIN Airplane on Flight.AirplaneID = Airplane.ID FULL JOIN Airline on Airplane.AirlineCode = Airline.Code WHERE Reservation.ID = '1';

---FROM AIRPORT
SELECT Airport.Code as AirportCode, Airport.Name as AirportName, Airport.Province as AirportProvince, Airport.City as AirportCity FROM Reservation FULL JOIN Flight on Reservation.FlightID = Flight.ID FULL JOIN FlightRoute on Flight.FlightRouteID = FlightRoute.ID FULL JOIN Airport on FlightRoute.Departure = Airport.Code WHERE Reservation.ID = '1';

---TO AIRPORT
SELECT Airport.Code as AirportCode, Airport.Name as AirportName, Airport.Province as AirportProvince, Airport.City as AirportCity FROM Reservation FULL JOIN Flight on Reservation.FlightID = Flight.ID FULL JOIN FlightRoute on Flight.FlightRouteID = FlightRoute.ID FULL JOIN Airport on FlightRoute.Destination = Airport.Code WHERE Reservation.ID = '1';

---SELECTING FOR SearchResultPanel.java
SELECT cast(Flight.TimeOfDeparture as DATE) as DateOfDeparture, convert(char(5), Flight.TimeOfDeparture, 108) as TimeofDeparture, CONVERT(CHAR(5), DATEADD(MINUTE, FlightRoute.TimeOfFlight, Flight.TimeOfDeparture), 108) as TimeOfArrival, FlightRoute.TimeOfFlight as TimeOfFlight FROM Flight FULL JOIN FlightRoute on Flight.FlightRouteID = FlightRoute.ID WHERE FlightRoute.Departure = ? AND FlightRoute.Destination = ?;

--------



SELECT	Airport.Code as FromAirportCode,
		Airport.Name as FromAirportName,
		Airport.Province as FromAirportProvince,
		Airport.City as FromAirportCity
FROM Airport
FULL JOIN FlightRoute on Airport.Code = FlightRoute.Departure
WHERE FlightRoute.ID = '118';


SELECT	Airport.Code as ToAirportCode,
		Airport.Name as ToAirportName,
		Airport.Province as ToAirportProvince,
		Airport.City as ToAirportCity
FROM Airport
FULL JOIN FlightRoute on Airport.Code = FlightRoute.Destination
WHERE FlightRoute.ID = '118';


SELECT ap1.Code as FromAirportCode, ap1.Name as FromAirportName, ap1.Province as FromAirportProvince, ap1.City as FromAirportCity,
		ap2.Code as ToAirportCode, ap2.Name as ToAirportName, ap2.Province as ToAirportProvince, ap2.City as ToAirportCity
FROM Airport ap1
INNER JOIN FlightRoute on ap1.Code = FlightRoute.Departure
INNER JOIN Airport ap2 ON ap2.Code = FlightRoute.Destination
WHERE FlightRoute.ID = '118';

-- search query
SELECT ap1.Name as FromAirportName, ap1.Code as FromAirportCode, ap2.Name as ToAirportName, ap2.Code as ToAirpotCode, cast(flight.TimeOfDeparture as TIME) as TimeofDeparture, flightroute.TimeOfFlight as TimeOfFlight, airline.Name as AirlineName, airline.Code as AirlineCode, flightroute.ID as RouteID, flight.ID as FlightID FROM flight INNER JOIN flightroute ON flight.flightRoute_ID = flightroute.ID INNER JOIN airport ap1 ON flightroute.Departure = ap1.Code INNER JOIN airport ap2 ON flightroute.Destination = ap2.Code INNER JOIN airplane ON flight.Airplane_ID = airplane.ID INNER JOIN airline ON airplane.Airline_Code = airline.Code WHERE ap1.City = "Tanggerang" AND ap2.City = "Padang" AND cast(flight.TimeOfDeparture as DATE) = "2022-07-10" AND airplane.EconomySeats != "0";

-- ticket query
-- SELECTING RESERVATION AND RESERVATIONINFO WHERE USERID = ?
SELECT ap1.City as FromCity, ap1.Code as FromApCode, ap1.Name as FromApName, ap2.City as ToCity, ap2.Code as ToApCode, ap2.Name as ToApName, cast(flight.TimeOfDeparture as DATE) as DateOfDeparture, cast(flight.TimeOfDeparture as TIME) as TimeOfDeparture, flightroute.TimeOfFlight as TimeOfFlight, flightroute.ID as RouteID, flight.ID as FlightID, airline.Name as AirlineName, airline.Code as AirlineCode, reservationinfo.SeatClass as SeatClass, reservationinfo.Name as PassengerName, reservationinfo.Age as PassengerAge, reservationinfo.Gender as PassengerGender, reservationinfo.PhoneNumber as PassengerPhone FROM reservation INNER JOIN flight ON reservation.FlightID = flight.ID INNER JOIN flightroute ON flight.FlightRoute_ID = flightroute.ID INNER JOIN airport ap1 ON flightroute.Departure = ap1.Code INNER JOIN airport ap2 ON flightroute.Destination = ap2.Code INNER JOIN airplane ON flight.Airplane_ID = airplane.ID INNER JOIN airline ON airplane.Airline_Code = airline.Code INNER JOIN reservationinfo ON reservationinfo.ReservationID = reservation.ID WHERE reservation.UserID = "4" AND reservation.Active = true;

// indexes
// FromCity = 1
// FromApCode = 2
// FromApName = 3
// ToCity = 4
// ToApCode = 5
// ToApName = 6
// DateOfDeparture = 7
// TimeOfDeparture = 8
// TimeOfFlight = 9
// RouteID = 10
// FlightID = 11
// AirlineName = 12
// AirlineCode = 13
// ReservationID = 14
// SeatClass = 15
// PassengerName = 16
// PassengerAge = 17
// PassengerGender = 18
// PassengerPhone = 19

-- UPDATE RESERVATION SET ACTIVE = 0 WHERE FLIGHTID = ? AND USERID = ?
UPDATE reservation SET Active = ? WHERE FlightID = ? AND UserID = ?

-- reserve query
-- CREATE RESERVATION BY USER ID AND PASSENGER INFORMATION
INSERT INTO reservation (FlightID, UserID, Paid, Active) VALUES (?, ?, "1", "1");


INSERT INTO reservationinfo (ReservationID, SeatClass, Name, Age, Gender, PhoneNumber) VALUES (?, ?, ?, ?, ?, ?)
