/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Query;

/**
 *
 * @author rafih
 */
public class TicketQuery {
    
    public String getTicket = "SELECT ap1.city as FromCity, ap1.code as FromApCode, ap1.name as FromApName, ap2.city as ToCity, ap2.code as ToApCode, ap2.name as ToApName, cast(flights.time_of_departure as DATE) as DateOfDeparture, cast(flights.time_of_departure as TIME) as TimeOfDeparture, routes.time_of_flight as TimeOfFlight, routes.id as RouteID, flights.id as FlightID, airlines.name as AirlineName, airlines.code as AirlineCode, reservations.id as ReservationID, reservations_info.seat_class as SeatClass, reservations_info.name as PassengerName, reservations_info.age as PassengerAge, reservations_info.gender as PassengerGender, reservations_info.phone_number as PassengerPhone FROM reservations INNER JOIN flights ON reservations.flight_id = flights.id INNER JOIN routes ON flights.route_id = routes.id INNER JOIN airports ap1 ON routes.departure_id = ap1.id INNER JOIN airports ap2 ON routes.destination_id = ap2.id INNER JOIN airplanes ON flights.airplane_id = airplanes.id INNER JOIN airlines ON airplanes.airline_id = airlines.id INNER JOIN reservations_info ON reservations_info.reservation_id = reservations.id WHERE reservations.user_id = ? AND reservations.active = 1";
    public String getReservation = "SELECT * FROM reservations WHERE flight_id = ? AND user_id = ? AND active = '1'";
    public String cancel = "UPDATE reservations SET active = '0' WHERE flight_id = ? AND user_id = ?";
    public String delete = "DELETE FROM reservations_info WHERE reservation_id = ?";
    public String createReservation = "INSERT INTO reservations (flight_id, user_id, paid, active) VALUES (?, ?, '1', '1');";
    public String createReservationInfo = "INSERT INTO reservations_info (reservation_id, seat_class, name, age, gender, phone_number) VALUES (?, ?, ?, ?, ?, ?)";
}