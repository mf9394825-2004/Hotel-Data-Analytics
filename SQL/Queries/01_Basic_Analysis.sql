use hotel
go

-- =====================================================
-- 1: total booking value, total bookings, average booking value
-- =====================================================

select sum(total_amount) as total_booking_value
from bookings;

select count(b.booking_id) as total_bookings
from bookings b;

select avg(b.total_amount) AS average_booking_value
from bookings b;

-- =====================================================
-- 2: monthly revenue trend
-- =====================================================

select
year(b.booking_date) AS booking_year,
month(b.booking_date) as booking_month,
count(b.booking_id) as total_booking,
sum(b.total_amount) as total_amount
from bookings b
group by year(b.booking_date), month(b.booking_date)
order by booking_year, booking_month ;

-- =====================================================
-- 3: top 5 room types by revenue
-- =====================================================

select top 5
r.room_type,
sum(b.total_amount) as total_booking_value
from rooms r
join bookings b on b.room_id = r.room_id
group by r.room_type
order by total_booking_value desc;
