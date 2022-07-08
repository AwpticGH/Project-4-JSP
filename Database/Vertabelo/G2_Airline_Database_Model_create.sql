-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-07-02 08:51:26.86

-- tables
-- Table: Airline
CREATE TABLE `Airline` (
    `Code` varchar(2) NOT NULL,
    `Name` varchar(64) NOT NULL,
    CONSTRAINT `Airline_pk` PRIMARY KEY (`Code`)
);

-- Table: Airplane
CREATE TABLE `Airplane` (
    `ID` int auto_increment NOT NULL AUTO_INCREMENT,
    `Type` varchar(64) NOT NULL,
    `TotalSeats` int NULL,
    `EconomySeats` int NOT NULL,
    `PreEconomySeats` int NOT NULL,
    `BusinessSeats` int NOT NULL,
    `FirstClassSeats` int NOT NULL,
    `Airline_Code` varchar(2) NOT NULL,
    CONSTRAINT `Airplane_pk` PRIMARY KEY (`ID`)
);

-- Table: Airport
CREATE TABLE `Airport` (
    `Code` varchar(3) NOT NULL,
    `Name` varchar(256) NOT NULL,
    `Province` varchar(256) NOT NULL,
    `City` varchar(256) NOT NULL,
    CONSTRAINT `Airport_pk` PRIMARY KEY (`Code`)
);

-- Table: BusinessSeats
CREATE TABLE `BusinessSeats` (
    `ID` int auto_increment NOT NULL AUTO_INCREMENT,
    `Row` int NOT NULL,
    `Number` int NOT NULL,
    `Airplane_ID` int NOT NULL,
    CONSTRAINT `BusinessSeats_pk` PRIMARY KEY (`ID`)
);

-- Table: EconomySeats
CREATE TABLE `EconomySeats` (
    `ID` int auto_increment NOT NULL AUTO_INCREMENT,
    `Row` int NOT NULL,
    `Number` int NOT NULL,
    `Airplane_ID` int NOT NULL,
    CONSTRAINT `EconomySeats_pk` PRIMARY KEY (`ID`)
);

-- Table: FirstClassSeats
CREATE TABLE `FirstClassSeats` (
    `ID` int auto_increment NOT NULL AUTO_INCREMENT,
    `Row` int NOT NULL,
    `Number` int NOT NULL,
    `Airplane_ID` int NOT NULL,
    CONSTRAINT `FirstClassSeats_pk` PRIMARY KEY (`ID`)
);

-- Table: Flight
CREATE TABLE `Flight` (
    `ID` int auto_increment NOT NULL AUTO_INCREMENT,
    `Airplane_ID` int NOT NULL,
    `FlightRoute_ID` int NOT NULL,
    `TimeOfDeparture` datetime NOT NULL,
    UNIQUE INDEX `Projection_ak_1` (`TimeOfDeparture`),
    CONSTRAINT `Flight_pk` PRIMARY KEY (`ID`)
);

-- Table: FlightRoute
CREATE TABLE `FlightRoute` (
    `ID` int NOT NULL AUTO_INCREMENT,
    `Departure` varchar(3) NOT NULL,
    `Destination` varchar(3) NOT NULL,
    `TimeOfFlight` int NOT NULL,
    CONSTRAINT `FlightRoute_pk` PRIMARY KEY (`ID`)
) COMMENT 'seats_no is redundancy (it could be computed by counting Seat.id_seat related to specific room)';

-- Table: PreEconomySeats
CREATE TABLE `PreEconomySeats` (
    `ID` int auto_increment NOT NULL AUTO_INCREMENT,
    `Row` int NOT NULL,
    `Number` int NOT NULL,
    `Airplane_ID` int NOT NULL,
    CONSTRAINT `PreEconomySeats_pk` PRIMARY KEY (`ID`)
);

-- Table: RegisteredPassenger
CREATE TABLE `RegisteredPassenger` (
    `ID` int auto_increment NOT NULL AUTO_INCREMENT COMMENT 'identity',
    `Name` varchar(50) NOT NULL,
    `DateOfBirth` date NOT NULL,
    `Title` varchar(5) NOT NULL,
    `PhoneNumber` bigint NULL,
    `UserID` int NOT NULL,
    CONSTRAINT `RegisteredPassenger_pk` PRIMARY KEY (`ID`)
) COMMENT 'User''''s List of Passenger';

-- Table: Reservation
CREATE TABLE `Reservation` (
    `ID` int auto_increment NOT NULL AUTO_INCREMENT,
    `FlightID` int NOT NULL,
    `UserID` int NOT NULL,
    `Reserved` tinyint NOT NULL,
    `Active` tinyint NOT NULL,
    CONSTRAINT `Reservation_pk` PRIMARY KEY (`ID`)
);

-- Table: ReservedBusinessSeats
CREATE TABLE `ReservedBusinessSeats` (
    `ID` int auto_increment NOT NULL AUTO_INCREMENT,
    `SeatID` int NOT NULL,
    `ReservationID` int NOT NULL,
    `FlightID` int NOT NULL,
    CONSTRAINT `ReservedBusinessSeats_pk` PRIMARY KEY (`ID`)
);

-- Table: ReservedBusinessSeatsInfo
CREATE TABLE `ReservedBusinessSeatsInfo` (
    `ID` int auto_increment NOT NULL,
    `Name` varchar(50) NOT NULL,
    `Age` int NOT NULL,
    `Gender` varchar(6) NOT NULL,
    `PhoneNumber` bigint NOT NULL,
    `ReservedBusinessSeatsID` int NOT NULL,
    CONSTRAINT `ReservedBusinessSeatsInfo_pk` PRIMARY KEY (`ID`)
);

-- Table: ReservedEconomySeats
CREATE TABLE `ReservedEconomySeats` (
    `ID` int auto_increment NOT NULL AUTO_INCREMENT,
    `SeatID` int NOT NULL,
    `ReservationID` int NOT NULL,
    `FlightID` int NOT NULL,
    CONSTRAINT `ReservedEconomySeats_pk` PRIMARY KEY (`ID`)
);

-- Table: ReservedEconomySeatsInfo
CREATE TABLE `ReservedEconomySeatsInfo` (
    `ID` int auto_increment NOT NULL,
    `Name` varchar(50) NOT NULL,
    `Age` int NOT NULL,
    `Gender` varchar(6) NOT NULL,
    `PhoneNumber` bigint NOT NULL,
    `ReservedEconomySeatsID` int NOT NULL,
    CONSTRAINT `ReservedEconomySeatsInfo_pk` PRIMARY KEY (`ID`)
);

-- Table: ReservedFirstClassSeats
CREATE TABLE `ReservedFirstClassSeats` (
    `ID` int auto_increment NOT NULL AUTO_INCREMENT,
    `SeatID` int NOT NULL,
    `ReservationID` int NOT NULL,
    `FlightID` int NOT NULL,
    CONSTRAINT `ReservedFirstClassSeats_pk` PRIMARY KEY (`ID`)
);

-- Table: ReservedFirstClassSeatsInfo
CREATE TABLE `ReservedFirstClassSeatsInfo` (
    `ID` int auto_increment NOT NULL,
    `Name` varchar(50) NOT NULL,
    `Age` int NOT NULL,
    `Gender` varchar(6) NOT NULL,
    `PhoneNumber` bigint NOT NULL,
    `ReservedFirstClassSeatsID` int NOT NULL,
    CONSTRAINT `ReservedFirstClassSeatsInfo_pk` PRIMARY KEY (`ID`)
);

-- Table: ReservedPreEconomySeats
CREATE TABLE `ReservedPreEconomySeats` (
    `ID` int auto_increment NOT NULL AUTO_INCREMENT,
    `SeatID` int NOT NULL,
    `Reservation_ID` int NOT NULL,
    `FlightID` int NOT NULL,
    CONSTRAINT `ReservedPreEconomySeats_pk` PRIMARY KEY (`ID`)
);

-- Table: ReservedPreEconomySeatsInfo
CREATE TABLE `ReservedPreEconomySeatsInfo` (
    `ID` int auto_increment NOT NULL,
    `Name` varchar(50) NOT NULL,
    `Age` int NOT NULL,
    `Gender` varchar(6) NOT NULL,
    `PhoneNumber` bigint NOT NULL,
    `ReservedPreEconomySeatsID` int NOT NULL,
    CONSTRAINT `ReservedPreEconomySeatsInfo_pk` PRIMARY KEY (`ID`)
);

-- Table: User
CREATE TABLE `User` (
    `ID` int auto_increment NOT NULL AUTO_INCREMENT COMMENT 'identity',
    `Email` varchar(50) NOT NULL,
    `Password` varchar(16) NOT NULL,
    `Name` varchar(50) NOT NULL,
    `DateOfBirth` date NOT NULL,
    `Gender` varchar(6) NOT NULL,
    `Title` varchar(5) NOT NULL,
    `PhoneNumber` bigint NOT NULL,
    CONSTRAINT `User_pk` PRIMARY KEY (`ID`)
) COMMENT 'Users of application';

-- foreign keys
-- Reference: Airplane_Airline (table: Airplane)
ALTER TABLE `Airplane` ADD CONSTRAINT `Airplane_Airline` FOREIGN KEY `Airplane_Airline` (`Airline_Code`)
    REFERENCES `Airline` (`Code`);

-- Reference: BusinessSeats_Airplane (table: BusinessSeats)
ALTER TABLE `BusinessSeats` ADD CONSTRAINT `BusinessSeats_Airplane` FOREIGN KEY `BusinessSeats_Airplane` (`Airplane_ID`)
    REFERENCES `Airplane` (`ID`);

-- Reference: EconomySeats_Airplane (table: EconomySeats)
ALTER TABLE `EconomySeats` ADD CONSTRAINT `EconomySeats_Airplane` FOREIGN KEY `EconomySeats_Airplane` (`Airplane_ID`)
    REFERENCES `Airplane` (`ID`);

-- Reference: FirstClassSeats_Airplane (table: FirstClassSeats)
ALTER TABLE `FirstClassSeats` ADD CONSTRAINT `FirstClassSeats_Airplane` FOREIGN KEY `FirstClassSeats_Airplane` (`Airplane_ID`)
    REFERENCES `Airplane` (`ID`);

-- Reference: FlightRoute_Airport_Departure (table: FlightRoute)
ALTER TABLE `FlightRoute` ADD CONSTRAINT `FlightRoute_Airport_Departure` FOREIGN KEY `FlightRoute_Airport_Departure` (`Departure`)
    REFERENCES `Airport` (`Code`);

-- Reference: FlightRoute_Airport_Destination (table: FlightRoute)
ALTER TABLE `FlightRoute` ADD CONSTRAINT `FlightRoute_Airport_Destination` FOREIGN KEY `FlightRoute_Airport_Destination` (`Destination`)
    REFERENCES `Airport` (`Code`);

-- Reference: Flight_Airplane (table: Flight)
ALTER TABLE `Flight` ADD CONSTRAINT `Flight_Airplane` FOREIGN KEY `Flight_Airplane` (`Airplane_ID`)
    REFERENCES `Airplane` (`ID`);

-- Reference: Flight_FlightRoute (table: Flight)
ALTER TABLE `Flight` ADD CONSTRAINT `Flight_FlightRoute` FOREIGN KEY `Flight_FlightRoute` (`FlightRoute_ID`)
    REFERENCES `FlightRoute` (`ID`);

-- Reference: PreEconomySeats_Airplane (table: PreEconomySeats)
ALTER TABLE `PreEconomySeats` ADD CONSTRAINT `PreEconomySeats_Airplane` FOREIGN KEY `PreEconomySeats_Airplane` (`Airplane_ID`)
    REFERENCES `Airplane` (`ID`);

-- Reference: RegisteredPassenger_User (table: RegisteredPassenger)
ALTER TABLE `RegisteredPassenger` ADD CONSTRAINT `RegisteredPassenger_User` FOREIGN KEY `RegisteredPassenger_User` (`UserID`)
    REFERENCES `User` (`ID`);

-- Reference: Reservation_Projection (table: Reservation)
ALTER TABLE `Reservation` ADD CONSTRAINT `Reservation_Projection` FOREIGN KEY `Reservation_Projection` (`FlightID`)
    REFERENCES `Flight` (`ID`);

-- Reference: Reservation_reserving_employee (table: Reservation)
ALTER TABLE `Reservation` ADD CONSTRAINT `Reservation_reserving_employee` FOREIGN KEY `Reservation_reserving_employee` (`UserID`)
    REFERENCES `User` (`ID`);

-- Reference: ReservedBusinessSeatsInfo_ReservedBusinessSeats (table: ReservedBusinessSeatsInfo)
ALTER TABLE `ReservedBusinessSeatsInfo` ADD CONSTRAINT `ReservedBusinessSeatsInfo_ReservedBusinessSeats` FOREIGN KEY `ReservedBusinessSeatsInfo_ReservedBusinessSeats` (`ReservedBusinessSeatsID`)
    REFERENCES `ReservedBusinessSeats` (`ID`);

-- Reference: ReservedBusinessSeats_BusinessSeats (table: ReservedBusinessSeats)
ALTER TABLE `ReservedBusinessSeats` ADD CONSTRAINT `ReservedBusinessSeats_BusinessSeats` FOREIGN KEY `ReservedBusinessSeats_BusinessSeats` (`SeatID`)
    REFERENCES `BusinessSeats` (`ID`);

-- Reference: ReservedBusinessSeats_Flight (table: ReservedBusinessSeats)
ALTER TABLE `ReservedBusinessSeats` ADD CONSTRAINT `ReservedBusinessSeats_Flight` FOREIGN KEY `ReservedBusinessSeats_Flight` (`FlightID`)
    REFERENCES `Flight` (`ID`);

-- Reference: ReservedBusinessSeats_Reservation (table: ReservedBusinessSeats)
ALTER TABLE `ReservedBusinessSeats` ADD CONSTRAINT `ReservedBusinessSeats_Reservation` FOREIGN KEY `ReservedBusinessSeats_Reservation` (`ReservationID`)
    REFERENCES `Reservation` (`ID`);

-- Reference: ReservedEconomySeatsInfo_ReservedEconomySeats (table: ReservedEconomySeatsInfo)
ALTER TABLE `ReservedEconomySeatsInfo` ADD CONSTRAINT `ReservedEconomySeatsInfo_ReservedEconomySeats` FOREIGN KEY `ReservedEconomySeatsInfo_ReservedEconomySeats` (`ReservedEconomySeatsID`)
    REFERENCES `ReservedEconomySeats` (`ID`);

-- Reference: ReservedFirstClassSeatsInfo_ReservedFirstClassSeats (table: ReservedFirstClassSeatsInfo)
ALTER TABLE `ReservedFirstClassSeatsInfo` ADD CONSTRAINT `ReservedFirstClassSeatsInfo_ReservedFirstClassSeats` FOREIGN KEY `ReservedFirstClassSeatsInfo_ReservedFirstClassSeats` (`ReservedFirstClassSeatsID`)
    REFERENCES `ReservedFirstClassSeats` (`ID`);

-- Reference: ReservedFirstClassSeats_FirstClassSeats (table: ReservedFirstClassSeats)
ALTER TABLE `ReservedFirstClassSeats` ADD CONSTRAINT `ReservedFirstClassSeats_FirstClassSeats` FOREIGN KEY `ReservedFirstClassSeats_FirstClassSeats` (`SeatID`)
    REFERENCES `FirstClassSeats` (`ID`);

-- Reference: ReservedFirstClassSeats_Flight (table: ReservedFirstClassSeats)
ALTER TABLE `ReservedFirstClassSeats` ADD CONSTRAINT `ReservedFirstClassSeats_Flight` FOREIGN KEY `ReservedFirstClassSeats_Flight` (`FlightID`)
    REFERENCES `Flight` (`ID`);

-- Reference: ReservedFirstClassSeats_Reservation (table: ReservedFirstClassSeats)
ALTER TABLE `ReservedFirstClassSeats` ADD CONSTRAINT `ReservedFirstClassSeats_Reservation` FOREIGN KEY `ReservedFirstClassSeats_Reservation` (`ReservationID`)
    REFERENCES `Reservation` (`ID`);

-- Reference: ReservedPreEconomySeatsInfo_ReservedPreEconomySeats (table: ReservedPreEconomySeatsInfo)
ALTER TABLE `ReservedPreEconomySeatsInfo` ADD CONSTRAINT `ReservedPreEconomySeatsInfo_ReservedPreEconomySeats` FOREIGN KEY `ReservedPreEconomySeatsInfo_ReservedPreEconomySeats` (`ReservedPreEconomySeatsID`)
    REFERENCES `ReservedPreEconomySeats` (`ID`);

-- Reference: ReservedPreEconomySeats_Flight (table: ReservedPreEconomySeats)
ALTER TABLE `ReservedPreEconomySeats` ADD CONSTRAINT `ReservedPreEconomySeats_Flight` FOREIGN KEY `ReservedPreEconomySeats_Flight` (`FlightID`)
    REFERENCES `Flight` (`ID`);

-- Reference: ReservedPreEconomySeats_PreEconomySeats (table: ReservedPreEconomySeats)
ALTER TABLE `ReservedPreEconomySeats` ADD CONSTRAINT `ReservedPreEconomySeats_PreEconomySeats` FOREIGN KEY `ReservedPreEconomySeats_PreEconomySeats` (`SeatID`)
    REFERENCES `PreEconomySeats` (`ID`);

-- Reference: ReservedPreEconomySeats_Reservation (table: ReservedPreEconomySeats)
ALTER TABLE `ReservedPreEconomySeats` ADD CONSTRAINT `ReservedPreEconomySeats_Reservation` FOREIGN KEY `ReservedPreEconomySeats_Reservation` (`Reservation_ID`)
    REFERENCES `Reservation` (`ID`);

-- Reference: Seat_reserved_Reservation_projection (table: ReservedEconomySeats)
ALTER TABLE `ReservedEconomySeats` ADD CONSTRAINT `Seat_reserved_Reservation_projection` FOREIGN KEY `Seat_reserved_Reservation_projection` (`FlightID`)
    REFERENCES `Flight` (`ID`);

-- Reference: Seat_reserved_Reservation_reservation (table: ReservedEconomySeats)
ALTER TABLE `ReservedEconomySeats` ADD CONSTRAINT `Seat_reserved_Reservation_reservation` FOREIGN KEY `Seat_reserved_Reservation_reservation` (`ReservationID`)
    REFERENCES `Reservation` (`ID`);

-- Reference: Seat_reserved_Seat (table: ReservedEconomySeats)
ALTER TABLE `ReservedEconomySeats` ADD CONSTRAINT `Seat_reserved_Seat` FOREIGN KEY `Seat_reserved_Seat` (`SeatID`)
    REFERENCES `EconomySeats` (`ID`);

-- End of file.

