

---what is the total orders and amount spent for each member before they become a gold member?
select userid,count(created_date) order_prchsd,sum(price) tot_amt_spent from 
(select c.*,d.price from
(select a.userid,a.created_date,a.product_id,b.gold_signup_date 
from sales a inner join
goldusers_signup b on a.userid=b.userid and created_date<=gold_signup_date)c inner join product d on c.product_id=d.product_id)e
group by userid

--if buying each product generates points as follows for each 5usd=1 points in p1,10usd=5 points in p2 and 5usd=1 point for p3,
--calculate points collected for each customer and for which product ha most points till now?
select userid,sum(total_points) from  
(select e.*,amt/points total_points from
(select d.*,case when product_id=1 then 5 when product_id=2 then 2 when product_id=3 then 5 else 0 end as points from 
(select c.userid,c.product_id,sum(price) amt from 
(select a.*,b.price from sales a inner join product b on a.product_id=b.product_id)c
group by userid,product_id)d)e)f group by userid
select * from
(select *,rank() over(order by tot_pts_earned desc)rnk from 
(select product_id,sum(total_points) tot_pts_earned from  
(select e.*,amt/points total_points from
(select d.*,case when product_id=1 then 5 when product_id=2 then 2 when product_id=3 then 5 else 0 end as points from 
(select c.userid,c.product_id,sum(price) amt from 
(select a.*,b.price from sales a inner join product b on a.product_id=b.product_id)c
group by userid,product_id)d)e)f group by product_id)f)g where rnk=1

---in the first one year afte a customer joins the gold program(including their join date) irrespective of what the customer purchased they earn 5 points.
---they earn 5 points for every 10 usd spent,who earned more between 1 and 3 and what were the point earnings for their first yr?
--1 point=2 usd
--0.5 point = 1 usd
select c.*,d.price*0.5 tot_points_earned from
(select a.userid,a.created_date,a.product_id,b.gold_signup_date from sales a inner join
goldusers_signup b on a.userid=b.userid and created_date>=gold_signup_date and created_date<=DATEADD(year,1,gold_signup_date))c
inner join product d on c.product_id=d.product_id

--rank all transactions of the customers
select *,rank() over (partition by userid order by created_date ) rnk from sales  

--rank all the transactions for each member when they are in gold membership and for every non gold member run N/A
select e.*,case when rnk=0 then 'na' else rnk end as rnkk from
(select c.*,cast((case when gold_signup_date is null then 0 else rank() over (partition by userid order by created_date desc)end)as varchar) as rnk from
(select a.userid,a.created_date,a.product_id,b.gold_signup_date from sales a left join
goldusers_signup b on a.userid=b.userid and created_date>=gold_signup_date)c)e;

