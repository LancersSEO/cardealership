DROP DATABASE IF EXISTS carDealership;

CREATE DATABASE carDealership;

use carDealership;

CREATE TABLE `special` (
    `specID` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(50) NOT NULL,
    `description` VARCHAR(255) NOT NULL
);

CREATE TABLE `contact` (
    `entryID` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    `message` VARCHAR(255) NOT NULL,
    `email` VARCHAR(30),
    `phone` VARCHAR(10)
);

CREATE TABLE `make` (
    `name` VARCHAR(30) PRIMARY KEY NOT NULL,
    `user` VARCHAR(50) NOT NULL,
    `dateAdded` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `model` (
    `name` VARCHAR(30) PRIMARY KEY NOT NULL,
    `make` VARCHAR(30) NOT NULL,
    `user` VARCHAR(50) NOT NULL,
    `dateAdded` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`make`)
        REFERENCES make (`name`)
);

CREATE TABLE `vehicle` (
    `vehicleID` INT PRIMARY KEY AUTO_INCREMENT,
    `bodyStyle` VARCHAR(30) NOT NULL,
    `trans` VARCHAR(30) NOT NULL,
    `color` VARCHAR(30) NOT NULL,
    `interior` VARCHAR(30) NOT NULL,
    `mileage` INT NOT NULL DEFAULT 0,
    `vin` INT NOT NULL,
    `salePrice` INT NOT NULL,
    `msrpPrice` INT NOT NULL,
    `year` INT NOT NULL,
    `make` VARCHAR(30) NOT NULL,
    `model` VARCHAR(30) NOT NULL,
    `type` VARCHAR(30) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `available` BOOLEAN NOT NULL DEFAULT TRUE,
    `featured` BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (`make`)
        REFERENCES `make` (`name`),
    FOREIGN KEY (`model`)
        REFERENCES `model` (`name`)
);

CREATE TABLE `role` (
    `role` VARCHAR(20) PRIMARY KEY
);

CREATE TABLE `user` (
    `userID` INT PRIMARY KEY AUTO_INCREMENT,
    `firstName` VARCHAR(30) NOT NULL,
    `lastName` VARCHAR(30) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `role` VARCHAR(20) NOT NULL,
    FOREIGN KEY (`role`)
        REFERENCES `role` (`role`)
);

CREATE TABLE `state` (
    `state` VARCHAR(2) PRIMARY KEY NOT NULL,
    `stateName` VARCHAR(20) NOT NULL
);

CREATE TABLE `sale` (
    `saleID` INT PRIMARY KEY AUTO_INCREMENT,
    `vehicleID` INT NOT NULL,
    `name` VARCHAR(30) NOT NULL,
    `phone` VARCHAR(10) NOT NULL,
    `email` VARCHAR(30) NOT NULL,
    `street1` VARCHAR(30) NOT NULL,
    `street2` VARCHAR(30) NOT NULL,
    `city` VARCHAR(30) NOT NULL,
    `state` VARCHAR(2) NOT NULL,
    `zipcode` INT(5) NOT NULL,
    `purchasePrice` INT NOT NULL,
    `purchaseType` VARCHAR(30) NOT NULL,
    FOREIGN KEY (`vehicleID`)
        REFERENCES `vehicle` (`vehicleID`),
    FOREIGN KEY (`state`)
        REFERENCES `state` (`state`)
);

INSERT into `state` values 
('AL', 'Alabama'),
('AK', 'Alaska'),
('AZ', 'Arizona'),
('AR', 'Arkansas'),
('CA', 'California'),
('CO', 'Colorado'),
('CT', 'Connecticut'),
('DE', 'Delaware'),
('DC', 'District of Columbia'),
('FL', 'Florida'),
('GA', 'Georgia'),
('HI', 'Hawaii'),
('ID', 'Idaho'),
('IL', 'Illinois'),
('IN', 'Indiana'),
('IA', 'Iowa'),
('KS', 'Kansas'),
('KY', 'Kentucky'),
('LA', 'Louisiana'),
('ME', 'Maine'),
('MD', 'Maryland'),
('MA', 'Massachusetts'),
('MI', 'Michigan'),
('MN', 'Minnesota'),
('MS', 'Mississippi'),
('MO', 'Missouri'),
('MT', 'Montana'),
('NE', 'Nebraska'),
('NV', 'Nevada'),
('NH', 'New Hampshire'),
('NJ', 'New Jersey'),
('NM', 'New Mexico'),
('NY', 'New York'),
('NC', 'North Carolina'),
('ND', 'North Dakota'),
('OH', 'Ohio'),
('OK', 'Oklahoma'),
('OR', 'Oregon'),
('PA', 'Pennsylvania'),
('PR', 'Puerto Rico'),
('RI', 'Rhode Island'),
('SC', 'South Carolina'),
('SD', 'South Dakota'),
('TN', 'Tennessee'),
('TX', 'Texas'),
('UT', 'Utah'),
('VT', 'Vermont'),
('VA', 'Virginia'),
('WA', 'Washington'),
('WV', 'West Virginia'),
('WI', 'Wisconsin'),
('WY', 'Wyoming');

INSERT into `role` values
('Admin'),
('Sales'),
('Disabled');

INSERT into `make` (`name`, `user`) values
('Audi', 'stephonfonrose@gmail.com'),
('Ford', 'stephonfonrose@gmail.com'),
('Honda', 'stephonfonrose@gmail.com'),
('Tesla', 'stephonfonrose@gmail.com'),
('Mercedes-Benz', 'stephonfonrose@gmail.com');

INSERT into `model` (`name`, `make`, `user`) values
('A5', 'Audi', 'stephonfonrose@gmail.com'),
('Q7', 'Audi', 'stephonfonrose@gmail.com'),
('A7', 'Audi', 'stephonfonrose@gmail.com'),
('Mustang', 'Ford', 'stephonfonrose@gmail.com'),
('F-150', 'Ford', 'stephonfonrose@gmail.com'),
('Fiesta', 'Ford', 'stephonfonrose@gmail.com'),
('Accord', 'Honda', 'stephonfonrose@gmail.com'),
('Civic', 'Honda', 'stephonfonrose@gmail.com'),
('Odyssey', 'Honda', 'stephonfonrose@gmail.com'),
('Model S', 'Tesla', 'stephonfonrose@gmail.com'),
('Model 3', 'Tesla', 'stephonfonrose@gmail.com'),
('Model Y', 'Tesla', 'stephonfonrose@gmail.com'),
('E 350', 'Mercedes-Benz', 'stephonfonrose@gmail.com'),
('GLA 250', 'Mercedes-Benz', 'stephonfonrose@gmail.com'),
('GLE 350', 'Mercedes-Benz', 'stephonfonrose@gmail.com');