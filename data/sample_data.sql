INSERT INTO Rooms VALUES
  (101, 'Deluxe', 5000, 'Available'),
  (102, 'Standard', 3000, 'Booked'),
  (103, 'Suite', 8000, 'Available'),
  (104, 'Standard', 3000, 'Available');

INSERT INTO Customers (Name, Contact, Email) VALUES
('Arun Kumar', '9876543210', 'arun@example.com'),
('Mohanlal', '9012345678', 'mohan@example.com'),
('Jayalakshmi', '9123456780', 'jaya@example.com'),
('Thiyagarajan', '9345678123', 'thiagu@example.com'),
('Keerthana', '9988776655', 'keerthi@example.com');

INSERT INTO Bookings (CustomerID, RoomNo, CheckInDate, CheckOutDate, TotalAmount, PaymentStatus) VALUES
(1, 102, '2025-04-01', '2025-04-05', 12000, 'Paid'),
(2, 103, '2025-04-10', '2025-04-15', 40000, 'Pending');

INSERT INTO Payments (BookingID, AmountPaid, PaymentMethod, PaymentDate) VALUES
(1, 12000, 'Credit Card', '2025-03-30'),
(2, 20000, 'UPI', '2025-04-08');
