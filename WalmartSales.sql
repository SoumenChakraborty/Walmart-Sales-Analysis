-- database Creation
Create database walmart_sales;
use walmart_sales;


-- data table import using csv

select * from sales;

-- data processing    
-- Adding new column   time of the day
set sql_safe_updates =0;
alter table sales add column time_of_day varchar(20);
update sales 
set time_of_day = 
case
    when time between '00:00:00' and '12:00:00' then 'Morning'
    when time between '00:01:00' and '16:00:00' then 'AfterNoon'
    else 'Evening'
    end;
    

    
-- adding new column dayname
alter table sales add column day_name varchar(20);
update sales
set day_name = dayname(date);


-- adding new column monthname
alter table sales add column month_name varchar(20);
update sales
set month_name = monthname(date);


-- KPI
-- total quantity Sales
select sum(quantity) from sales;

-- total income
select round(sum(total),2) from sales;

-- total records
select count(id) from sales;

-- Total revenue
-- Total customers


-- business questions
-- total number of cities
select count(distinct city) from sales;

-- number of brunches in each city
select city, count(branch)
from sales
group by city;

-- analysis of the product lines
-- total quanity sales
select product_line, sum(quantity)
from sales
group by product_line
order by sum(quantity);

-- total revenue
select product_line, round(sum(total),2)
from sales
group by product_line
order by sum(total) desc;

-- total profit
select product_line, round(sum(total),2)
from sales
group by product_line
order by sum(total) desc;

-- rating of the products
select product_line, round(avg(rating),2)
from sales
group by product_line
order by avg(rating) desc;

-- sale day
select day_name, sum(quantity)
from sales
group by day_name
order by sum(quantity) desc;

-- sale time
select time_of_day, sum(quantity)
from sales
group by time_of_day
order by sum(quantity) desc;

-- payment method
select payment, count(payment)
from sales
group by payment
order by count(payment) desc;



