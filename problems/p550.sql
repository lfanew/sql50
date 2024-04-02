-- Solution 1
with cte1 as (
    select
        a1.player_id as pid,
        a1.event_date as d1,
        a2.event_date as d2
    from activity a1
    left join activity a2 ON a2.player_id = a1.player_id and a2.event_date = (a1.event_date + INTERVAL '1 day')
    group by a1.player_id, d1, d2
), cte2 as (
    select
        pid,
        min(d1) as d1
    from cte1
    group by pid
), cte3 as (
    select
        cte2.pid,
        cte2.d1,
        cte1.d2
    from cte2
    inner join cte1 on cte1.d1 = cte2.d1 and cte1.pid = cte2.pid
)

select round(avg(case when d2 is not null then 1 else 0 end), 2) as fraction from cte3

-- Solution 2
with cte1 as (
    select
        a1.player_id as pid,
        a1.event_date as d1,
        a2.event_date as d2
    from activity a1
    left join activity a2 ON a2.player_id = a1.player_id and a2.event_date = (a1.event_date + INTERVAL '1 day')
    group by a1.player_id, d1, d2
), cte2 as (
    select
        pid,
        min(d1) as d1
    from cte1
    group by pid
)

select
    round(avg(case when cte1.d2 is not null then 1 else 0 end), 2) as fraction
from cte2
inner join cte1 on cte1.d1 = cte2.d1 and cte1.pid = cte2.pid
