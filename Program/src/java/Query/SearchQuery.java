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
    public String searchFlights = "SELECT ap1.name as FromAirportName, ap1.city as FromCity, ap1.code as FromAirportCode, ap2.name as ToAirportName, ap2.city as ToCity, ap2.code as ToAirportCode, cast(flights.time_of_departure as TIME) as TimeOfDeparture, routes.time_of_flight as TimeOfFlight, airlines.name as AirlineName, airlines.code as AirlineCode, routes.id as RouteID, flights.id as FlightID FROM flights INNER JOIN routes ON flights.route_id = routes.id INNER JOIN airports ap1 ON routes.departure_id = ap1.id INNER JOIN airports ap2 ON routes.destination_id = ap2.id INNER JOIN airplanes ON flights.airplane_id = airplanes.id INNER JOIN airlines ON airplanes.airline_id = airlines.id WHERE ap1.city = ? AND ap2.city = ? AND cast(flights.time_of_departure as DATE) = ?";
}

