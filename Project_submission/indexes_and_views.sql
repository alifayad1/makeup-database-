--> Views
--> Display customers that have orders
create view  customers_with_orders as
select CustomerID, Fname, Lname
from Customer, Orders
where Customer.CustomerID = orders.Customer_ID
--> Displays credit card type used for each order
CREATE VIEW credit_card_type_used AS
select orders.OrderNum ,Fname, CreditCardType
from Payment JOIN orders ON payment.Customer_id = orders.Customer_ID,customer
where Customer.CustomerID = orders.Customer_ID
--> Display Payments that are on hold and amount paid is less than 10 $
create VIEW  on_hold as
select PaymentNum, Status, AmountPaid
from Payment
where Status = 'on hold' and AmountPaid < 10
--> Display products that has the highest price
CREATE view highest_price as
select ProductID, Name, Price
from Makeup_Product
where Price >= ALL (select Price from Makeup_Product)
--> Display customers that live in Lebanon
CREATE view customer_in_lebanon as
select CustomerID, Fname, Lname, Shipping_Address
from Customer
where customer.Shipping_Address like'%Lebanon%'
--> Display discount on items
create view discount_on_items as
select ORDERs.OrderNum,discount.DiscountAmount
FROM orders join discount ON orders.OrderNum = discount.Order_Num
--> Display items bought in bulk and their special price
create view items_in_bulk as
select orders.OrderNum,customer.FName,in_bulk.SpecialPrice
FROM customer,orders,in_bulk
WHERE customer.CustomerID = orders.Customer_ID and in_bulk.Order_Num = orders.OrderNum
--> Display makeup products with their supplier and their types
create view type_and_supplier as
SELECT supplier.CompanyName,makeup_product.Name,category.Type
FROM makeup_product join supplier on supplier.SupplierID=makeup_product.Supplier_ID JOIN  category on category.SerialNum = Category_SerialNum
-->  Displays the gender and the product brand and count that each gender bought of that brand
CREATE view gender_picks as
SELECT customer.Gender, brand.BrandName, COUNT(brandname)
FROM customer join orders_and_names on customer.CustomerID = orders_and_names.CustomerID join order_details on Order_Num = OrderNum,makeup_product,brand
WHERE order_details.MakeupProduct_id = makeup_product.ProductID and brand.BrandSerialNum = makeup_product.Brand_SerialNum
GROUP BY gender,brandname
ORDER by COUNT(*)




-->Indexes
CREATE INDEX mp_index ON Makeup_Product(ProductID, Supplier_ID, Category_SerialNum);

CREATE INDEX od_index ON Order_Details(Date_Shipped, OrderNum, Order_Num );

create index c_index on Customer(CustomerID, Shipping_Address);

create index cate_index on Category(SerialNum);

create index o_index on orders(OrderNum, Customer_ID);

create index L_index on linked(Order_Num, Cart_Num);

create index s_index on supplier(SupplierID);

create index seo_index on special_event_order(Order_Num);