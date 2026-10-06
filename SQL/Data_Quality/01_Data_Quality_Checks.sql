
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
