---total amount each customer spent on the foodapp
select a.userid,sum(b.price) tot_amt
from sales a
inner join product b
on a.product_id=b.product_id
group by a.userid

---how many days each customer visited the foodapp
select userid,COUNT(distinct created_date)
from sales
group by userid

---first product purchased by each customer
select *,rank() over (partition by userid order by created_date) rnk
from sales 

select * from
(select *,rank() over (partition by userid order by created_date) rnk from sales ) a where rnk=1

---what is the most purchased item on the menu and how many times it was purchased by all customers
select product_id,COUNT(product_id) 
from sales
group by product_id
order by COUNT(product_id) desc

select top 1 product_id,COUNT(product_id) 
from sales
group by product_id
order by COUNT(product_id) desc


select userid,count(product_id) cnt from sales where product_id=
(select top 1 product_id from sales group by product_id order by COUNT(product_id) desc)
group by userid

---which item most popular for each customer
select *,RANK() over (partition by userid order by cnt desc) rnk from
(select userid,product_id,count(product_id) cnt from sales group by userid)