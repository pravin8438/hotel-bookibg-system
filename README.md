🏨 Hotel Booking Dashboard
An interactive dashboard using MySQL to manage hotel room bookings, customer data, and payment tracking. This project is part of a practical internship assignment designed to build real-world database management skills.

📌 Project Features
✅ Manage room availability, prices, and types
✅ Handle customer registration and contact details
✅ Enable date-specific room bookings
✅ Prevent double bookings with availability checks
✅ Store and track payments and invoices
✅ Automatically update room status using triggers
✅ Generate reports using SQL queries and views
✅ Optimized performance with stored procedures

🗂️ Folder Structure
Hotel-Booking-Dashboard/ │ ├── data/ │ └── schema.sql -- All table creation scripts │ └── sample_data.sql -- Insert sample data (rooms, customers, etc.) │ ├── scripts/ │ └── procedures_triggers.sql -- Triggers and stored procedures │ ├── dashboard.xlsx -- Excel file (optional) for visualizations │ ├── README.md -- Project overview and usage

markdown Copy Edit

You can also keep all .sql files in root if you prefer a flat structure.

🧱 Database Structure
🛏️ Rooms Table
RoomNo (Primary Key)
RoomType
PricePerday
Availability (Available, Booked)
👤 Customers Table
CustomerID (Auto Increment, Primary Key)
Name
Contact
Email
📅 Bookings Table
BookingID (Auto Increment, Primary Key)
CustomerID (FK)
RoomNo (FK)
CheckInDate / CheckOutDate
TotalAmount
PaymentStatus (Paid, Pending)
💳 Payments Table
PaymentID (Auto Increment, Primary Key)
BookingID (FK)
AmountPaid
PaymentMethod
PaymentDate
⚙️ Automation Used
AFTER INSERT trigger to update room availability to Booked
AFTER DELETE trigger to update room availability to Available
Stored procedure MakeBooking() that:
Prevents double booking
Calculates total price based on dates
Inserts booking record
📁 Files Included
File	Description
schema.sql	Table definitions
sample_data.sql	Sample data for Rooms, Customers, etc.
procedures_triggers.sql	All triggers and stored procedures
dashboard.xlsx (optional)	Excel-based visual report for bookings
🧪 How to Run
Import schema.sql and sample_data.sql into your MySQL server (e.g., XAMPP / DB-Fiddle)
Run procedures_triggers.sql to enable triggers and stored procedures
Use queries or call stored procedure:
CALL MakeBooking(3, 104, '2025-04-20', '2025-04-23');
Visualize reports in Excel using dashboard.xlsx (optional) 👨‍💻 Developed by praveen p 💼 Internship Project – July 2025
