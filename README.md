**SQL Mini-Project**

The main goal of this project is to develop a deeper understanding of various MySQL date functions and features. 
The project utilizes two tables, **users** and **logins**, and consists of seven questions designed to explore and apply functions such as CURDATE(), DATE_SUB(), DATE_FORMAT(), QUARTER(), EXTRACT(), and window functions including LEAD(), LAG(), and ROW_NUMBER(), as well as the implementation of recursive Common Table Expressions (CTEs).

select * 
from users;
-- 10 rows

![image](https://github.com/dimpleyadav/sql_projects/assets/50204226/2d6713fa-a556-48f4-a47f-7f3feccf5f94)

 
select * 
from logins;
-- 28 rows

![image](https://github.com/user-attachments/assets/2df7e633-5bd2-4139-b2a5-e68b536aabd5)

![image](https://github.com/user-attachments/assets/b979f99f-b4b2-40f6-8032-647366d6214f)


**Q1)** Management wants to see all the users that did not login in the past 5 months. Return: username

![image](https://github.com/user-attachments/assets/45c0bbd4-458a-4eb8-8827-64d1753b0494)


**Q2)** For business units' quarter analysis, calculate how many users and how many sessions were at each quarter. Order by quarter from newest to oldest. Return first day of the quarter, user_cnt, session_cnt

![image](https://github.com/user-attachments/assets/9f25b545-da10-40de-a61e-65a8e79e4f2b)


**Q3)** Display user IDs of users who logged in January 2024 and did not log in during November 2023. Return : user id

![image](https://github.com/user-attachments/assets/4154b120-4364-46ef-a468-3403e88c8375)


**Q4)** Add to the query from Q2, the percent change in sessions from last year (make assumptions if necessary). Return : first day of the quarter, session_cnt, session_cnt_prev, session_percent_change

![image](https://github.com/user-attachments/assets/192bfd99-73ff-4e59-8cd5-8e73de60d3d4)


**Q5)** Display the user that had the highest session score (max) for each day. Return : date, username, score (26 rows returned)

![image](https://github.com/user-attachments/assets/0a69f933-ade1-4cbb-812f-52a289ee27ac)


**Q6)** To identify our best users - return the users that had a session on every single day since their first login (make assumptions if needed). Return: user_id

![image](https://github.com/user-attachments/assets/d72311ee-02ec-4411-a522-6c25393f62bd)


**Q7)** On which dates were there no logins at all. Return: login_dates (324 rows returned)

![image](https://github.com/user-attachments/assets/58f8c087-08da-4f36-8a75-c61faf692baa)
