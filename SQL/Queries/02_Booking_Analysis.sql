
-- =====================================================
-- 4: revenue, bookings & average booking value by booking channel
-- =====================================================

select
b.booking_channel,
count(b.booking_id) as total_booking,
sum(b.total_amount) as total_booking_value,
avg(b.total_amount) as avg_amount
from bookings b
group by b.booking_channel
order by total_booking_value desc

-- =====================================================
-- 5: cancellation rate by booking channel
-- =====================================================

select
b.booking_channel,
count(b.booking_id) as total_booking,
sum(
case
when b.status = 'Cancelled' then 1
else 0
end
) as cancelled_bookings,
cast(
sum(
case
when b.status = 'Cancelled' then 1
else 0
end
) * 100.0 / count(b.booking_id)
as decimal(5,2)
) as cancellation_rate
from bookings b
group by b.booking_channel;

-- =====================================================
-- 6: top 10 guests by total spending
-- =====================================================

select top 10
g.guest_id,
g.full_name,
sum(b.total_amount) as total_spending
from guests g
join bookings b on b.guest_id = g.guest_id
group by g.guest_id, g.full_name
order by total_spending desc;

-- =====================================================
-- 7: revenue & average booking value by room type
-- =====================================================

select
r.room_type,
sum(b.total_amount) as total_booking_value,
avg(b.total_amount) as average_booking_value
from rooms r
join bookings b on b.room_id = r.room_id
group by r.room_type
order by total_booking_value desc;

-- =====================================================
-- 8: top 10 countries by number of guests
-- =====================================================

select top 10
count(g.guest_id) as total_guests,
g.country
from guests g
group by g.country
order by total_guests desc;
