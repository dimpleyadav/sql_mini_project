-- Q1) Management wants to see all the users that did not login in the past 5 months. Return: username
select user_name
from users
where user_id not in
	-- select the user_id's where they have logged-in the past 5 months
	(select distinct user_id
	 from logins
	 where login_timestamp > date_sub(curdate(),interval 5 month));
     

-- Q2) For business units' quarter analysis, calculate how many users and how many sessions were at each quarter. Order by quarter from newest to oldest. Return first day of the quarter, user_cnt, session_cnt
-- date_format() is used to get the first date of each quarter. %Y: Year as a numeric, 4-digit value ; %m: Month name as a numeric value (00 to 12)

select date_format(min(login_timestamp), '%Y-%m-01') as first_day_of_quarter, count(distinct user_id) as user_cnt, count(session_id) as session_cnt
from logins
group by quarter(login_timestamp);


-- Q3) Display user IDs of users who logged in January 2024 and did not log in during November 2023. Return : user id
-- The EXTRACT() function extracts a part from a given date.

select distinct user_id
from logins
where extract(year_month from LOGIN_TIMESTAMP) = 202401
and user_id not in 
					( select distinct user_id
					  from logins
					  where extract(year_month from LOGIN_TIMESTAMP) = 202311);


-- Q4) Add to the query from Q2 the percent change in sessions from last year. Return : first day of the quarter, session_cnt, session_cnt_prev, session_percent_change
-- percent change = (new_value - old_value)/old_value * 100

select date_format(min(login_timestamp), '%Y-%m-01') as first_day_of_quarter, count(session_id) as session_cnt, lag(count(session_id)) over() as session_cnt_prev, abs(count(session_id) - lag(count(session_id)) over()) / (lag(count(session_id)) over())*100 as session_percent_change
from logins
group by quarter(login_timestamp)
order by first_day_of_quarter;


-- Q5) Display the user that had the highest session score (max) for each day. Return : date, username, score
select date(login_timestamp)as date_value ,u.user_name, max(session_score) as highest_session_score
from logins l
join users u
on l.USER_ID = u.USER_ID
group by date(login_timestamp)
order by date_value;


-- Q6) To identify our best users - return the users that had a session on every single day since their first login (make assumptions if needed). Return: user_id
-- The DATEDIFF() function returns the number of days between two date values.

with cte as
(select user_id, date(login_timestamp) as date_value, session_id, row_number() over(partition by user_id order by LOGIN_TIMESTAMP) as rn, lag(date(login_timestamp)) over(partition by user_id) lag_value, datediff(lag(date(login_timestamp)) over(partition by user_id), date(LOGIN_TIMESTAMP)) diff
from logins )

select distinct user_id
from cte
where abs(diff) = 1;


-- Q7) On which dates were there no logins at all. Return: login_dates
-- Here,recursive cte is used to generate sequential data values

with recursive date_range as (
    select '2023-07-15' as date_val
   union all
   select date_add(date_val, interval 1 day)
   from date_range
   where date_val < '2024-06-28')
   
select * 
from date_range
where date_val not in (select date(login_timestamp) date_val from logins);
