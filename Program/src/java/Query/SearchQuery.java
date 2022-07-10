/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Query;

/**
 *
 * @author rafih
 */
public class SearchQuery {
    public String searchFlights = "SELECT ap1.Name as FromAirportName, ap1.City as FromCity, ap1.Code as FromAirportCode, ap2.Name as ToAirportName, ap2.City as ToCity, ap2.Code as ToAirportCode, cast(flight.TimeOfDeparture as TIME) as TimeOfDeparture, flightroute.TimeOfFlight as TimeOfFlight, airline.Name as AirlineName, airline.Code as AirlineCode, flightroute.ID as RouteID, flight.ID as FlightID FROM flight INNER JOIN flightroute ON flight.flightRoute_ID = flightroute.ID INNER JOIN airport ap1 ON flightroute.Departure = ap1.Code INNER JOIN airport ap2 ON flightroute.Destination = ap2.Code INNER JOIN airplane ON flight.Airplane_ID = airplane.ID INNER JOIN airline ON airplane.Airline_Code = airline.Code WHERE ap1.City = ? AND ap2.City = ? AND cast(flight.TimeOfDeparture as DATE) = ?";
}

