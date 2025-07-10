
SELECT
    r.RoomNo,
    r.RoomType,
    COUNT(b.BookingID)          AS TotalBookings,
    SUM(b.TotalAmount)          AS Revenue,
    MAX(b.CheckOutDate)         AS LastCheckout
FROM Rooms r
LEFT JOIN Bookings b ON r.RoomNo = b.RoomNo
GROUP BY r.RoomNo, r.RoomType
ORDER BY r.RoomNo;
