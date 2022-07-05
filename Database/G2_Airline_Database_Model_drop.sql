-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-07-02 08:51:26.86

-- foreign keys
ALTER TABLE `Airplane`
    DROP FOREIGN KEY `Airplane_Airline`;

ALTER TABLE `BusinessSeats`
    DROP FOREIGN KEY `BusinessSeats_Airplane`;

ALTER TABLE `EconomySeats`
    DROP FOREIGN KEY `EconomySeats_Airplane`;

ALTER TABLE `FirstClassSeats`
    DROP FOREIGN KEY `FirstClassSeats_Airplane`;

ALTER TABLE `FlightRoute`
    DROP FOREIGN KEY `FlightRoute_Airport_Departure`;

ALTER TABLE `FlightRoute`
    DROP FOREIGN KEY `FlightRoute_Airport_Destination`;

ALTER TABLE `Flight`
    DROP FOREIGN KEY `Flight_Airplane`;

ALTER TABLE `Flight`
    DROP FOREIGN KEY `Flight_FlightRoute`;

ALTER TABLE `PreEconomySeats`
    DROP FOREIGN KEY `PreEconomySeats_Airplane`;

ALTER TABLE `RegisteredPassenger`
    DROP FOREIGN KEY `RegisteredPassenger_User`;

ALTER TABLE `Reservation`
    DROP FOREIGN KEY `Reservation_Projection`;

ALTER TABLE `Reservation`
    DROP FOREIGN KEY `Reservation_reserving_employee`;

ALTER TABLE `ReservedBusinessSeatsInfo`
    DROP FOREIGN KEY `ReservedBusinessSeatsInfo_ReservedBusinessSeats`;

ALTER TABLE `ReservedBusinessSeats`
    DROP FOREIGN KEY `ReservedBusinessSeats_BusinessSeats`;

ALTER TABLE `ReservedBusinessSeats`
    DROP FOREIGN KEY `ReservedBusinessSeats_Flight`;

ALTER TABLE `ReservedBusinessSeats`
    DROP FOREIGN KEY `ReservedBusinessSeats_Reservation`;

ALTER TABLE `ReservedEconomySeatsInfo`
    DROP FOREIGN KEY `ReservedEconomySeatsInfo_ReservedEconomySeats`;

ALTER TABLE `ReservedFirstClassSeatsInfo`
    DROP FOREIGN KEY `ReservedFirstClassSeatsInfo_ReservedFirstClassSeats`;

ALTER TABLE `ReservedFirstClassSeats`
    DROP FOREIGN KEY `ReservedFirstClassSeats_FirstClassSeats`;

ALTER TABLE `ReservedFirstClassSeats`
    DROP FOREIGN KEY `ReservedFirstClassSeats_Flight`;

ALTER TABLE `ReservedFirstClassSeats`
    DROP FOREIGN KEY `ReservedFirstClassSeats_Reservation`;

ALTER TABLE `ReservedPreEconomySeatsInfo`
    DROP FOREIGN KEY `ReservedPreEconomySeatsInfo_ReservedPreEconomySeats`;

ALTER TABLE `ReservedPreEconomySeats`
    DROP FOREIGN KEY `ReservedPreEconomySeats_Flight`;

ALTER TABLE `ReservedPreEconomySeats`
    DROP FOREIGN KEY `ReservedPreEconomySeats_PreEconomySeats`;

ALTER TABLE `ReservedPreEconomySeats`
    DROP FOREIGN KEY `ReservedPreEconomySeats_Reservation`;

ALTER TABLE `ReservedEconomySeats`
    DROP FOREIGN KEY `Seat_reserved_Reservation_projection`;

ALTER TABLE `ReservedEconomySeats`
    DROP FOREIGN KEY `Seat_reserved_Reservation_reservation`;

ALTER TABLE `ReservedEconomySeats`
    DROP FOREIGN KEY `Seat_reserved_Seat`;

-- tables
DROP TABLE `Airline`;

DROP TABLE `Airplane`;

DROP TABLE `Airport`;

DROP TABLE `BusinessSeats`;

DROP TABLE `EconomySeats`;

DROP TABLE `FirstClassSeats`;

DROP TABLE `Flight`;

DROP TABLE `FlightRoute`;

DROP TABLE `PreEconomySeats`;

DROP TABLE `RegisteredPassenger`;

DROP TABLE `Reservation`;

DROP TABLE `ReservedBusinessSeats`;

DROP TABLE `ReservedBusinessSeatsInfo`;

DROP TABLE `ReservedEconomySeats`;

DROP TABLE `ReservedEconomySeatsInfo`;

DROP TABLE `ReservedFirstClassSeats`;

DROP TABLE `ReservedFirstClassSeatsInfo`;

DROP TABLE `ReservedPreEconomySeats`;

DROP TABLE `ReservedPreEconomySeatsInfo`;

DROP TABLE `User`;

-- End of file.

