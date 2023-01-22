-- 1. Product Sales
/* You need to create a report on whether customers who purchased the product named '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD' buy the product below or not.

1. 'Polk Audio - 50 W Woofer - Black' -- (other_product)

To generate this report, you are required to use the appropriate SQL Server Built-in functions or expressions as well as basic SQL knowledge. */ 


select c.customer_id, c.first_name, c.last_name, 'No' as Other_Product
from sale.customer c, product.product p, sale.order_item oi, sale.orders o
where oi.product_id = p.product_id
      and oi.order_id = o.order_id
	  and o.customer_id = c.customer_id
      and product_name = '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD'
EXCEPT
select c.customer_id, first_name, last_name, 'No' as Other_Product
from sale.customer c, product.product p, sale.order_item oi, sale.orders o
where oi.product_id = p.product_id
      and oi.order_id = o.order_id
	  and o.customer_id = c.customer_id
	  and first_name + last_name IN (
select first_name + last_name
from sale.customer c, product.product p, sale.order_item oi, sale.orders o
where oi.product_id = p.product_id
      and oi.order_id = o.order_id
	  and o.customer_id = c.customer_id
      and product_name = '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD' ) 
	  and product_name = 'Polk Audio - 50 W Woofer - Black'
UNION
select c.customer_id, first_name, last_name, 'Yes'as Other_Product
from sale.customer c, product.product p, sale.order_item oi, sale.orders o
where oi.product_id = p.product_id
      and oi.order_id = o.order_id
	  and o.customer_id = c.customer_id
	  and first_name + last_name IN (
select first_name + last_name
from sale.customer c, product.product p, sale.order_item oi, sale.orders o
where oi.product_id = p.product_id
      and oi.order_id = o.order_id
	  and o.customer_id = c.customer_id
      and product_name = '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD' ) 
	  and product_name = 'Polk Audio - 50 W Woofer - Black'
order by c.customer_id



----- 2. Conversion Rate
/* Below you see a table of the actions of customers visiting the website by clicking on two different types of advertisements given by an E-Commerce company. Write a query to return the conversion rate for each Advertisement type. */


create table conversionrate(
Visitor_ID int not null,
Adv_Type varchar(20),
action varchar(20),
primary key (Visitor_ID)
)

insert into conversionrate values(1, 'A', 'Left')
insert into conversionrate values(2, 'A', 'Order')
insert into conversionrate values(3, 'B', 'Left')
insert into conversionrate values(4, 'A', 'Order')
insert into conversionrate values(5, 'A', 'Review')
insert into conversionrate values(6, 'A', 'Left')
insert into conversionrate values(7, 'B', 'Left')
insert into conversionrate values(8, 'B', 'Order')
insert into conversionrate values(9, 'B', 'Review')
insert into conversionrate values(10, 'A', 'Review')

select *
from conversionrate

select * 
from conversionrate
where Adv_Type = 'A' and action = 'Order'

select * 
from conversionrate
where Adv_Type = 'B' and action = 'Order'

--- istenilen tablo

with tablo1 as
(select Adv_Type, count(action) as sum_of_order
from conversionrate
where action = 'Order'
group by Adv_Type),
tablo2 as
(
select Adv_Type, count(Adv_Type) as sum_of_adv
from conversionrate
group by Adv_Type )
select tablo1.Adv_Type , cast((sum_of_order*1.0 / sum_of_adv*1.0) as numeric (18,2)) Convertion_Rate
from tablo1, tablo2
where tablo1.Adv_Type = tablo2.Adv_Type


---- Hocam bu kadar cok kod karmasasi oldugu icin uzgunum, bunlarin cok daha kisa yazilabilecegini biliyorum. Alakali dersler islenmeden once baslayip yazmistim, bu yuzden yazilanlari baglamak daha kolay geldi. (Eski konulari da fazla calismadigim icin onlarda da fazlaliklar vardir.) Kontrol ettiginiz icin tesekkurler. 