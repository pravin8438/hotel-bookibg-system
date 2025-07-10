
DELIMITER $$

CREATE TRIGGER trg_bookings_after_insert
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Rooms
    SET Availability = 'Booked'
    WHERE RoomNo = NEW.RoomNo;
END$$

CREATE TRIGGER trg_bookings_after_delete
AFTER DELETE ON Bookings
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Bookings
        WHERE RoomNo = OLD.RoomNo
          AND CheckOutDate >= CURDATE()
    ) THEN
        UPDATE Rooms
        SET Availability = 'Available'
        WHERE RoomNo = OLD.RoomNo;
    END IF;
END$$

CREATE PROCEDURE MakeBooking (
    IN  p_customer   INT,
    IN  p_room       INT,
    IN  p_checkin    DATE,
    IN  p_checkout   DATE
)
BEGIN
    DECLARE v_price NUMERIC(10,2);
    DECLARE v_days  INT;
    DECLARE v_total NUMERIC(10,2);

    IF EXISTS (
        SELECT 1 FROM Bookings
        WHERE RoomNo = p_room
          AND p_checkin  <  CheckOutDate
          AND p_checkout >  CheckInDate
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Room is already booked for those dates.';
    END IF;

    SELECT PricePerday INTO v_price
    FROM Rooms
    WHERE RoomNo = p_room;

    SET v_days  = DATEDIFF(p_checkout, p_checkin);
    SET v_total = v_price * v_days;

    INSERT INTO Bookings
          (CustomerID, RoomNo, CheckInDate, CheckOutDate, TotalAmount, PaymentStatus)
    VALUES (p_customer, p_room, p_checkin,  p_checkout,  v_total,    'Pending');

    SELECT LAST_INSERT_ID() AS NewBookingID, v_total AS TotalAmount;
END$$

DELIMITER ;
