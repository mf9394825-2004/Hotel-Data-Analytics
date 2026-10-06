
use hotel
go

-- =====================================================
-- 1: duplicate guest IDs
-- =====================================================

select guest_id, count(*) as duplicate_count
from guests
group by guest_id
having count(*) > 1;


-- =====================================================
-- 2: NULL values in bookings
-- =====================================================

select
sum(case when booking_id is null then 1 else 0 end) as null_booking_id,
sum(case when guest_id is null then 1 else 0 end) as null_guest_id,
sum(case when room_id is null then 1 else 0 end) as null_room_id,
sum(case when booking_date is null then 1 else 0 end) as null_booking_date,
sum(case when check_in_date is null then 1 else 0 end) as null_check_in_date,
sum(case when check_out_date is null then 1 else 0 end) as null_check_out_date,
sum(case when num_nights is null then 1 else 0 end) as null_num_nights,
sum(case when num_guests is null then 1 else 0 end) as null_num_guests,
sum(case when booking_channel is null then 1 else 0 end) as null_booking_channel,
sum(case when status is null then 1 else 0 end) as null_status,
sum(case when total_amount is null then 1 else 0 end) as null_total_amount
from bookings;


-- =====================================================
-- 3: invalid booking dates
-- =====================================================

select booking_id, check_in_date, check_out_date
from bookings
where check_out_date <= check_in_date;


-- =====================================================
-- 4: num_nights validation
-- =====================================================

select booking_id, check_in_date, check_out_date, num_nights,
       datediff(day, check_in_date, check_out_date) as calculated_nights
from bookings
where num_nights <> datediff(day, check_in_date, check_out_date);


-- =====================================================
-- 5: invalid booking date
-- =====================================================

select booking_id, booking_date, check_in_date
from bookings
where booking_date > check_in_date;


-- =====================================================
-- 6: invalid ratings
-- =====================================================

select review_id, booking_id, rating
from reviews
where rating < 1 or rating > 5;


-- =====================================================
-- 7: guests exceed room capacity
-- =====================================================

select b.booking_id, b.room_id, b.num_guests, r.max_occupancy
from bookings b
join rooms r on b.room_id = r.room_id
where b.num_guests > r.max_occupancy;

select count(*) as invalid_bookings
from bookings b
join rooms r on b.room_id = r.room_id
where b.num_guests > r.max_occupancy;

select r.room_type, r.max_occupancy, b.num_guests, count(*) as booking_count
from bookings b
join rooms r on b.room_id = r.room_id
where b.num_guests > r.max_occupancy
group by r.room_type, r.max_occupancy, b.num_guests
order by booking_count desc; 


-- =====================================================
-- 8: orphan guest_id
-- =====================================================

select b.booking_id, b.guest_id
from bookings b
left join guests g on b.guest_id = g.guest_id
where g.guest_id is null;


-- =====================================================
-- 9: orphan room_id
-- =====================================================

select b.booking_id, b.room_id
from bookings b
left join rooms r on b.room_id = r.room_id
where r.room_id is null;


-- =====================================================
-- 10: orphan payment booking_id
-- =====================================================

select p.payment_id, p.booking_id
from payments p
left join bookings b on p.booking_id = b.booking_id
where b.booking_id is null;


-- =====================================================
-- 11: orphan review booking_id
-- =====================================================

select r.review_id, r.booking_id
from reviews r
left join bookings b on r.booking_id = b.booking_id
where b.booking_id is null;
