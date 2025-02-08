use db;
select * from sales;
select * from products;
 
 # Q  Retrieve the product name and total sales revenue for each product.
select p.product_name , sum(s.total_price)  from sales  as s
join products as p  on p.product_id = s.product_id  
group by  p.product_name;

#Q  Retrieve the product name and total sales revenue for each product.
select sale_id ,product_name  from sales 
join products on products.product_id =sales.product_id;

#Q  Retrieve the product name and total sales revenue for each product.
SELECT p.category, 
       SUM(s.total_price) AS category_revenue,
       (SUM(s.total_price) / (SELECT SUM(total_price) FROM Sales)) * 100 AS revenue_percentage
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue_percentage DESC
LIMIT 3;


#Q  Rank products based on total sales revenue.

select p.product_name , (unit_price * quantity_sold) as total_reveneu  
from sales   as s join  products  as p on p.product_id = s.product_id order by total_reveneu   desc  ;

#Calculate the running total revenue for each product category
SELECT p.category, p.product_name, s.sale_date, 
       SUM(s.total_price) OVER (PARTITION BY p.category ORDER BY s.sale_date) AS running_total_revenue
FROM Sales s
JOIN Products p ON s.product_id = p.product_id;

#Q Categorize sales as "High", "Medium", or "Low" based on total price (e.g., > $200 is High, $100-$200 is Medium, < $100 is Low).

select sale_id , 
Case 
    when total_price > 200 then 'High Price'
    when total_price between 100 and 200  then 'Meduium '
    else 'Low'
    end as sales_category
 from sales;
 
 #Q Identify sales where the quantity sold is greater than the average quantity sold
 select sale_id , sale_date from sales 
 where  quantity_sold > (select avg(quantity_sold) from sales )
;

# Q . Extract the month and year from the sale date and count the number of sales for each month.

select date_format(sale_date , '%M %Y')  as months  , count(quantity_sold) from sales 
group by months ;

#Q Calculate the number of days between the current date and the sale date for each sale.
select datediff(now() ,sale_date )
 from sales ;
 
 #Q Identify sales made during weekdays versus weekends.
 Select  sale_id,
       CASE 
           WHEN DAYOFWEEK(sale_date) IN (1, 7) THEN 'Weekend'
           ELSE 'Weekday'
       END AS day_type
From  Sales;