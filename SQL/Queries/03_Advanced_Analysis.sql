
-- =====================================================
-- 9: high-value guests
-- =====================================================

with high_value_guests as (
select
g.guest_id,
g.full_name,
sum(b.total_amount) as total_spending
from guests g
join bookings b on g.guest_id = b.guest_id
group by g.guest_id, g.full_name
)
select *
from high_value_guests 
where total_spending > (
select avg(total_spending)
from high_value_guests 
);

-- =====================================================
-- 10: Monthly Revenue Growth Using LAG()
-- =====================================================

-- Step 1: Calculate total revenue for each month
with monthly_revenue as (
    select
        year(b.booking_date) as booking_year,
        month(b.booking_date) as booking_month,
        sum(b.total_amount) as total_revenue
    from bookings b
    group by year(b.booking_date), month(b.booking_date)
),

-- Step 2: Get the previous month's revenue using LAG()
revenue_with_previous as (
    select
        booking_year,
        booking_month,
        total_revenue,

        -- LAG() returns the revenue of the previous month
        lag(total_revenue) over (
            order by booking_year, booking_month
        ) as previous_month_revenue

    from monthly_revenue
)

-- Step 3: Calculate the monthly revenue growth rate
select
    booking_year,
    booking_month,
    total_revenue,
    previous_month_revenue,

    -- Growth Rate = (Current Revenue - Previous Revenue)
    --               / Previous Revenue × 100
    (
        total_revenue - previous_month_revenue
    ) * 100.0 / NULLIF(previous_month_revenue, 0) as growth_rate

from revenue_with_previous

-- Sort the results chronologically
order by booking_year, booking_month;
