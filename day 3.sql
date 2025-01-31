# Q Identify the Most Frequently Sold Product from Sales table

select * from Sales;
select * from Products;

select product_name , sum(quantity_sold) as sale_count from sales 
join products on sales.product_id = products.product_id 
group by product_name order by sale_count desc limit 1;


#Q Find the Products Not Sold from Products table

select product_id from products 
where product_id not in (select  product_id from sales );

#Q Calculate the total revenue generated from sales for each product category.

select products.category , sum(total_price) from sales 
join products on products.product_id =sales.product_id
group by products.category;

#Q Find the product category with the highest average unit price.

select category ,avg(unit_price) as avg_price from products 
group by category  order by avg_price desc limit 1;

#Q  Identify products with total sales exceeding 30.
select product_name  from sales as s
inner join products as p on  p.product_id = s.product_id
group by  product_name having sum( s.total_price) >30;

#Q Count the number of sales made in each month.
SELECT DATE_FORMAT(s.sale_date, '%Y-%m') AS month, 
count(quantity_sold) AS sales_count
FROM Sales s
GROUP BY month;

#Q Retrieve Sales Details for Products with 'Smart' in Their Name

select p.product_name from  products as p
 join sales as s  on p.product_id =s.product_id 
 where p.product_name like '%Smart%' ;
 
 #Q   Determine the average quantity sold for products with a unit price greater than $100.
 select avg(s.quantity_sold)   
 from sales as s

 join products as p on p.product_id =s.product_id
 
where p.unit_price > 100;
 