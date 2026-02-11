select * from sales_data_700;
alter table sales_data_700
add Amount Float ;

alter table sales_data_700
alter column Units_Sold float;

alter table sales_data_700
alter column Unit_Price float;
update sales_data_700
set Amount = Units_Sold*Unit_Price;

-- descriptive analysis --
select count (*) as CNT from sales_data_700
--700 Rows

-- total revenue generated
select sum(Amount) as Total_revenue from sales_data_700
--698715 = Total Revenue

-- PRODUCT WISE REVENUE 
select Product , sum(Amount) as Total_revenue from sales_data_700
group by Product;


--PRODUCT TOTALREVENUE 
/*Biscuits	45900
Bread	53500
Butter	61695
Cheese	102780
Eggs	18470
Juice	72200
Milk	51180
Oil	148500
Rice	83100
Sugar	61390 */

-- TOP 1 PRODUCT

select top(1)Product , sum(Amount) as Total_revenue from sales_data_700
group by Product
order by Total_revenue desc 

--Oil =148500

-- BOTTOM 3 PRODUCTS 
select top (3)Product , sum(Amount) as Total_revenue from sales_data_700
group by Product
order by Total_revenue

/*Eggs	18470
Biscuits	45900
Milk	51180 */

--total no. of products sold 
select sum(Units_sold) as TOTAL_PRODUCT_SOLD from sales_data_700
--17778

--product wise quantity 
select product , sum(Units_sold) as TOTAL_PRODUCT_SOLD from sales_data_700
group by product ;

-- TOP 5 PRODUCTS QUANTITY WISE 
select TOP(5) product , sum(Units_sold) as TOTAL_PRODUCT_SOLD from sales_data_700
group by product 
ORDER BY TOTAL_PRODUCT_SOLD DESC;

/*
Biscuits	2295
Bread	2140
Eggs	1847
Juice	1805
Sugar	1754  */

--Time based Analysis--
SELECT * FROM sales_data_700

ALTER TABLE sales_data_700
ADD SALEMONTH INT


UPDATE sales_data_700
SET SALEMONTH = MONTH(DATE)

--MONTH WISE DATE ANALYSIS 
SELECT SALEMONTH, SUM(AMOUNT) AS MONTHLYREVENUE   FROM sales_data_700
GROUP BY SALEMONTH;

/*1	106605
2	106250
3	125540
4	122035
5	121375
6	116910 */