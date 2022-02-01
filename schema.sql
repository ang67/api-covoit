
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT  PRIMARY KEY,
    Firstname VARCHAR(250) NOT NULL,
    Lastname VARCHAR(250) NOT NULL,
    Mail VARCHAR(250) NOT NULL,
    DateOfBirth DATE,
    Bio VARCHAR(800),
    CarModel VARCHAR(50),
    CarDescription VARCHAR(500),
    PhotoRef VARCHAR(250),
    DocsRef VARCHAR(250),
    IDChecked INT BOOLEAN,
    Password VARCHAR(250) NOT NULL
);

CREATE TABLE Ratings (
    RatingID INT AUTO_INCREMENT  PRIMARY KEY,
    RatedID INT,
    RaterID INT,
    Comment TEXT(500),
    RatingScore DECIMAL(2,1),
    DateRated DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (RatedID) REFERENCES Users(UserID),
    FOREIGN KEY (RaterID) REFERENCES Users(UserID)
);

CREATE TABLE Trips (
    TripID INT AUTO_INCREMENT  PRIMARY KEY,
    UserID INT,
    Departure VARCHAR(250) NOT NULL,
    DepartureAddress VARCHAR(250) NOT NULL,
    DepartureLatitude DECIMAL(15,10) NOT NULL,
    DepartureLongitude DECIMAL(15,10) NOT NULL,
    Destination VARCHAR(250) NOT NULL,
    DestinationAddress VARCHAR(250) NOT NULL,
    DestinationLatitude DECIMAL(15,10) NOT NULL,
    DestinationLongitude DECIMAL(15,10) NOT NULL,
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    Description TEXT(800),
    Price DECIMAL(19,4),
    PassagersNumber INT NOT NULL,
    Max2Back BOOLEAN DEFAULT 1,
    AcceptSmokers BOOLEAN DEFAULT 0,
    AcceptAnimals BOOLEAN DEFAULT 0,
    AirConditioner BOOLEAN DEFAULT 0,
    AutomaticAcceptation BOOLEAN DEFAULT 1,

    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT  PRIMARY KEY,
    UserID INT NOT NULL,
    TripID INT NOT NULL,
    DateOrder DATETIME DEFAULT CURRENT_TIMESTAMP,
    RequestedPlace INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (TripID) REFERENCES Trips(TripID)
);

CREATE TABLE Alerts (
    AlertID INT AUTO_INCREMENT  PRIMARY KEY,
    UserID INT NOT NULL,
    DateAlert DATETIME DEFAULT CURRENT_TIMESTAMP,
    Departure VARCHAR(250) NOT NULL,
    DepartureAddress VARCHAR(250),
    DepartureTime DATETIME NOT NULL,
    Destination VARCHAR(250) NOT NULL,
    DestinationAddress VARCHAR(250),
    RequestedPlace INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
);


INSERT INTO Users (Firstname, Lastname, Mail, Password) VALUES ('Bini', 'Angui', 'Bini@gmail.com', 'azerty')
INSERT INTO Users (Firstname, Lastname, Mail, Password) VALUES ('Eli', 'Muler', 'eli@gmail.com', 'azerty')
INSERT INTO Users (Firstname, Lastname, Mail, Password) VALUES ('Ben', 'Agar', 'ben@gmail.com', 'azerty')
INSERT INTO Users (Firstname, Lastname, Mail, Password) VALUES ('Jean', 'Greot', 'jean@gmail.com', 'azerty')

INSERT INTO `ratings`(`RatedID`, `RaterID`, `Comment`, `RatingScore`, `DateRated`) VALUES (1, 2,"Good driver", 4.5)