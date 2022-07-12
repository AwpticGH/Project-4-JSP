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
    
    public String getTicket = "SELECT ap1.City as FromCity, ap1.Code as FromApCode, ap1.Name as FromApName, ap2.City as ToCity, ap2.Code as ToApCode, ap2.Name as ToApName, cast(flight.TimeOfDeparture as DATE) as DateOfDeparture, cast(flight.TimeOfDeparture as TIME) as TimeOfDeparture, flightroute.TimeOfFlight as TimeOfFlight, flightroute.ID as RouteID, flight.ID as FlightID, airline.Name as AirlineName, airline.Code as AirlineCode, reservation.ID as ReservationID, reservationinfo.SeatClass as SeatClass, reservationinfo.Name as PassengerName, reservationinfo.Age as PassengerAge, reservationinfo.Gender as PassengerGender, reservationinfo.PhoneNumber as PassengerPhone FROM reservation INNER JOIN flight ON reservation.FlightID = flight.ID INNER JOIN flightroute ON flight.FlightRoute_ID = flightroute.ID INNER JOIN airport ap1 ON flightroute.Departure = ap1.Code INNER JOIN airport ap2 ON flightroute.Destination = ap2.Code INNER JOIN airplane ON flight.Airplane_ID = airplane.ID INNER JOIN airline ON airplane.Airline_Code = airline.Code INNER JOIN reservationinfo ON reservationinfo.ReservationID = reservation.ID WHERE reservation.UserID = ? AND reservation.Active = 1";
    public String getReservation = "SELECT * FROM reservation WHERE FlightID = ? AND UserID = ? AND Active = '1'";
    public String cancel = "UPDATE reservation SET Active = '0' WHERE FlightID = ? AND UserID = ?";
    public String delete = "DELETE FROM reservationinfo WHERE ReservationID = ?";
    public String createReservation = "INSERT INTO reservation (FlightID, UserID, Paid, Active) VALUES (?, ?, '1', '1');";
    public String createReservationInfo = "INSERT INTO reservationinfo (ReservationID, SeatClass, Name, Age, Gender, PhoneNumber) VALUES (?, ?, ?, ?, ?, ?)";
}