use db;
 # Q Count Sales Per Day from the Sales table
select count(*)  , sale_date from 
 sales group by sale_date ;
 
 # Retrieve product_name and unit_price from the Products table with the Highest Unit Price
  select product_name , unit_price  from products order by unit_price desc limit 1;
  
  
 #Q Retrieve the sale_id, product_id, and total_price from the Sales table for sales with a quantity_sold greater than 4.
 
 select sale_id , product_id , total_price  from sales
 where quantity_sold > 4;
 
 #Q . Retrieve the product_name and unit_price from the Products table, ordering the results by unit_price in descending order.
 select product_name , unit_price from products order by unit_price desc;
 
 # Q Retrieve the total_price of all sales, rounding the values to two decimal places.
 
 select round(sum(total_price),2)  as total_sales from sales; 
 
 
 #Q Calculate the average total_price of sales in the Sales table.
 select Avg(total_price) as average_sales from sales ;
 
 #Q  Retrieve the sale_id and sale_date from the Sales table, formatting the sale_date as 'YYYY-MM-DD'.
 
 select sale_id,date_format(sale_date, '%Y-%M-%D')
 as formated_Date
 from sales ;
 
 #Q Calculate the total revenue generated from sales of products in the 'Electronics' category.
 select sum(s.total_price) as total_revenue 
 from sales as s  join products  as p on s.product_id = p.product_id 
where p.category="Electronics"; 

 select sum(s.total_price) as total_revenue 
 from sales as s  join products  as p on s.product_id = p.product_id 
where p.category="Electronics"; 

 
 #Q  Retrieve the product_name and unit_price from the Products table, filtering the unit_price to show only values between $20 and $600.
 select product_name , unit_price From products
 where unit_price between 20 and 600;
 
 #Q Retrieve the product_name and category from the Products table, ordering the results by category in ascending order.
 SELECT product_name, category 
FROM Products 
ORDER BY category ASC;
 
 