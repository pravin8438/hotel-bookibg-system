CREATE TABLE Rooms (
  RoomNo INT PRIMARY KEY,
  RoomType VARCHAR(50),
  PricePerday DECIMAL(10,2),
  Availability ENUM('Available','Booked')
);

CREATE TABLE Customers (
  CustomerID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(100),
  Contact VARCHAR(15),
  Email VARCHAR(100)
);

CREATE TABLE Bookings (
  BookingID INT AUTO_INCREMENT PRIMARY KEY,
  CustomerID INT,
  RoomNo INT,
  CheckInDate DATE,
  CheckOutDate DATE,
  TotalAmount DECIMAL(10,2),
  PaymentStatus ENUM('Paid', 'Pending'),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (RoomNo) REFERENCES Rooms(RoomNo)
);

CREATE TABLE Payments (
  PaymentID INT AUTO_INCREMENT PRIMARY KEY,
  BookingID INT,
  AmountPaid DECIMAL(10,2),
  PaymentMethod VARCHAR(50),
  PaymentDate DATE,
  FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
