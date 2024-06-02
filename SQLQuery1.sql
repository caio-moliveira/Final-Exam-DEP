with cte as (
SELECT * from bike_share_yr_0
union 
SELECT * from bike_share_yr_1)

select  dteday, season, cte.yr, weekday, hr, rider_type, riders, price, COGS,
riders*price as revenue,
riders*price - COGS as profit
from cte 
left join cost_table cost
on cte.yr = cost.yr




