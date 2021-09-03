/* select * from sales.customers; */
/* select * from sales.customers where zip_code like '[1-4]%'; */
/*select first_name +''+last_name As'Full name' from sales.customers;*/
/* select * from production.categories; */
/* select category_name 'product names' from production.categories;*/
/* create schema hr; */
/* create table hr.candidates(id int primary key identity,fullname varchar(100) Not null); */
/* create table hr.employee(id int primary key identity,fullname varchar(100) not null); */
/* insert into hr.candidates(fullname) values ('Sachine Tendulkar'),('Virat kohli'),('Rohit sharma'),('kapil dev'); */
/* insert into hr.employee(fullname) values ('sabastian vettel'),('lewis hamilton'),('max verstappen'),('charles leclerc'); */
/* insert into hr.candidates(fullname) values('charles leclers'),('lewis hamilton'); */
/* select * from hr.candidates;
select * from hr.employee; 
select * from hr.candidates c inner join hr.employee e on e.fullname = c.fullname; */
/* select * from hr.candidates c full join  hr.employee e on e.fullname = c.fullname; */
/*select * from hr.candidates c full outer join  hr.employee e on e.fullname = c.fullname; Completion time: 2021-08-18T10:12:58.2895954+05:30 */
/* select * from hr.candidates c right join hr.employee e on e.fullname=c.fullname; */
/* insert into hr.employee(fullname) values ('virat kohli'),('rohit sharma'); */
 /* select * from hr.employee;
select * from hr.candidates c right join hr.employee e on e.fullname=c.fullname; */
/* select * from hr.candidates c right join hr.employee e on e.fullname=c.fullname; */
--select * from sys.tables; 
 --select * from sys.objects
-- select * from sys.columns;
--select * from production.products;
--select * from production.categories;
--select * from production.products p inner join  production.categories c on c.category_id = p.category_id;
--SELECT product_name, category_name, brand_name, list_price FROM production.products p INNER JOIN production.categories c ON c.category_id = p.category_id INNER JOIN production.brands b ON b.brand_id = p.brand_id
/*SELECT  e.first_name + ' ' + e.last_name employee, m.first_name + ' ' + m.last_name manager FROM sales.staffs e INNER JOIN sales.staffs m ON m.staff_id = e.manager_id
select * from sales.staffs;
SELECT c1.customer_id,c1.city,c2.city, c1.first_name + ' ' + c1.last_name customer_1,c2.customer_id, c2.first_name + ' ' + c2.last_name customer_2 FROM sales.customers c1 INNER JOIN sales.customers c2 ON c1.customer_id > c2.customer_id AND c1.city = c2.city */
--SELECT product_id, product_name, store_id  FROM production.products CROSS JOIN sales.stores;
--select * from production.stocks where quantity=0;
--SELECT customer_id, YEAR (order_date),  COUNT (order_id) order_count FROM sales.orders GROUP BY customer_id, YEAR (order_date) HAVING COUNT (order_id) >= 2 ORDER BY customer_id
--select * from sales.customers;
--select  (first_name)first_name, max(phone)phone_number from sales.customers c  group by phone having phone is  null;
/* SELECT
    b.brand_name AS brand,
    c.category_name AS category,
    p.model_year,
    round(
        SUM (
            quantity * i.list_price * (1 - discount)
        ),
        0
    ) sales INTO sales.sales_summary
FROM
    sales.order_items i
INNER JOIN production.products p ON p.product_id = i.product_id
INNER JOIN production.brands b ON b.brand_id = p.brand_id
INNER JOIN production.categories c ON c.category_id = p.category_id
GROUP BY
    b.brand_name,
    c.category_name,
    p.model_year
ORDER BY
    b.brand_name,
    c.category_name,
    p.model_year;  */
--SELECT * FROM sales.sales_summary;
--select * from sales.orders;
	--Grouping set function
 /* SELECT 
    brand,
	category,
    SUM(sales)sales_sums
FROM 
    sales.sales_summary
GROUP BY 
	grouping sets((brand,category),(brand),(category),()); */
	--cube function
/* SELECT 
    brand,
	category,
    SUM(sales)sales_sums
FROM 
    sales.sales_summary
GROUP BY 
	cube(brand,category); */
	--Roll Up
/*	SELECT 
    brand,
	category,
    SUM(sales)sales_sums
FROM 
    sales.sales_summary
GROUP BY 
	Rollup(brand,category); */
	--Sub query
--select * from production.products where brand_id not in( select brand_id from production.brands where model_year=2017);
--Except
/* SELECT
    product_id
FROM
    production.products
EXCEPT
SELECT
    product_id
FROM
    sales.order_items; */
	--select * from production.brands; --Completion time: 2021-08-18T19:06:17.2345311+05:30
	--view--
	/* SELECT
    product_name, 
    brand_name, 
    list_price
FROM
    production.products p
INNER JOIN production.brands b 
        ON b.brand_id = p.brand_id;

	CREATE VIEW sales.product_info
AS
SELECT
    product_name, 
    brand_name, 
    list_price
FROM
    production.products p
INNER JOIN production.brands b 
        ON b.brand_id = p.brand_id;

		

	

	

/*	EXEC sp_rename 
    @objname = 'sales.product_info',
    @newname = 'product_data';
	select * from sales.product_data; */ --Completion time: 2021-08-19T18:21:01.9421694+05:30*/
	--Login
	--Completion time: 2021-08-20T09:36:59.0375358+05:30
--	use BikeStores;

	--select * from production.brands; 
	--Indexes
	CREATE TABLE production.parts(
    part_id   INT NOT NULL, 
    part_name VARCHAR(100)
);
INSERT INTO 
    production.parts(part_id, part_name)
VALUES
    (1,'Frame'),
    (2,'Head Tube'),
    (3,'Handlebar Grip'),
    (4,'Shock Absorber'),
    (5,'Fork');

	SELECT 
    part_id, 
    part_name
FROM 
    production.parts
WHERE 
    part_id = 5;
	--new table
	CREATE TABLE production.part_prices(
    part_id int,
    valid_from date,
    price decimal(18,4) not null,
    PRIMARY KEY(part_id, valid_from) 
);

select * from production.part_prices;


CREATE CLUSTERED INDEX ix_parts_id
ON production.parts (part_id);  

--non-clustered index--
SELECT 
    customer_id, 
    city
FROM 
    sales.customers
WHERE 
    city = 'Atwater';

	--creating non clustered index
	CREATE INDEX ix_customers_city
ON sales.customers(city);

	SELECT 
    customer_id, 
    first_name, 
    last_name
FROM 
    sales.customers
WHERE 
    last_name = 'Berg' AND 
    first_name = 'Monika';

	CREATE INDEX ix_customers_name 
ON sales.customers(last_name, first_name);

	SELECT 
    customer_id, 
    first_name, 
    last_name
FROM 
    sales.customers
WHERE 
    last_name = 'Albert';

	SELECT 
    customer_id, 
    first_name, 
    last_name
FROM 
    sales.customers
WHERE 
    first_name = 'Adam';

	CREATE INDEX ix_customers_names 
ON sales.customers( first_name);
	--Rename Index
EXEC sp_rename 
        N'sales.customers.ix_customers_city',
        N'ix_cust_city' ,
        N'INDEX';

		--unique index
		SELECT
    customer_id, 
    email 
FROM
    sales.customers
WHERE 
    email = 'caren.stephens@msn.com';

	SELECT 
    email, 
    COUNT(email)
FROM 
    sales.customers
GROUP BY 
    email
HAVING 
    COUNT(email) > 1;

	CREATE UNIQUE INDEX ix_cust_email 
ON sales.customers(email);
 --unique index for multiple columns
	CREATE TABLE t1 (
    a INT, 
    b INT
);
CREATE UNIQUE INDEX ix_uniq_ab 
ON t1(a, b);

INSERT INTO t1(a,b) VALUES(1,1);
INSERT INTO t1(a,b) VALUES(1,2);
INSERT INTO t1(a,b) VALUES(1,2);
	--Disable index
	ALTER INDEX ix_cust_city 
ON sales.customers 
DISABLE;

SELECT    
    first_name, 
    last_name, 
    city
FROM    
    sales.customers
WHERE 
    city = 'San Jose';
	--Enable index
	ALTER INDEX ALL ON sales.customers
REBUILD;
--Drop index
DROP INDEX IF EXISTS ix_cust_email
ON sales.customers;
/*
--Trigger
CREATE TABLE production.product_audits(
    change_id INT IDENTITY PRIMARY KEY,
    product_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DEC(10,2) NOT NULL,
    updated_at DATETIME NOT NULL,
    operation CHAR(3) NOT NULL,
    CHECK(operation = 'INS' or operation='DEL')
);
--creating trigger
CREATE TRIGGER production.trg_product_audit
ON production.products
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO production.product_audits(
        product_id, 
        product_name,
        brand_id,
        category_id,
        model_year,
        list_price, 
        updated_at, 
        operation
    )
    SELECT
        i.product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        i.list_price,
        GETDATE(),
        'INS'
    FROM
        inserted i
    UNION ALL
    SELECT
        d.product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        d.list_price,
        GETDATE(),
        'DEL'
    FROM
        deleted d;
END
INSERT INTO production.products(
    product_name, 
    brand_id, 
    category_id, 
    model_year, 
    list_price
)
VALUES (
    'Test product',
    1,
    1,
    2018,
    599
);
SELECT 
    * 
FROM 
    production.product_audits;

	insert into production.products(
	product_name, 
    brand_id, 
    category_id, 
    model_year, 
    list_price)values('asd',7,1,2018,344);

	DELETE FROM 
    production.products
WHERE 
    product_id = 322;

	create table product_info(
	change_id int identity primary key,
	new_id int not null,
	new_name varchar(255) not null,
	product_series int not null,
	cat_id int not null,
	model smallint not null,
	list dec(10,2) not null,
	operation varchar(255) not null,
	check(operation ='Insert' or operation ='delete'));

	select * from product_info;

	create trigger product_test on production.products
	after insert,delete
	as 
	begin
	
	End; */

	--stored procedure

	SELECT 
	product_name, 
	list_price
FROM 
	production.products
ORDER BY 
	product_name;
	
	--creating stored procedure
	CREATE PROCEDURE uspProductList
AS
BEGIN
    SELECT 
        product_name, 
        list_price
    FROM 
        production.products
    ORDER BY 
        product_name;
END;

exec uspProductList;

--stored procedure with one parameter
SELECT
    product_name,
    list_price
FROM 
    production.products
ORDER BY
    list_price;

	CREATE PROCEDURE uspFindProducts
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    ORDER BY
        list_price;
END;


ALTER PROCEDURE uspFindProducts(@min_list_price AS DECIMAL)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    WHERE
        list_price >= @min_list_price
    ORDER BY
        list_price;
END;

EXEC uspFindProducts 100;

ALTER PROCEDURE uspFindProducts(@min_list_price AS DECIMAL
,@max_list_price as decimal
,@name as varchar(max)
)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    WHERE
        list_price >= @min_list_price and
		list_price <= @max_list_price and
		product_name like '%' + @name +'%'
    ORDER BY
        list_price;
END;

EXEC uspFindProducts 100 , 300,@name='trek'; --Completion time: 2021-08-20T18:58:01.7420306+05:30

--log in Completion time: 2021-08-21T09:36:30.6940619+05:30

--variables

declare @model_year smallint;
set @model_year =2018;

select 

product_name,
model_year
 from 
 production.products

 where

 @model_year=model_year

 order by
 product_name;

 --output parameters

 CREATE PROCEDURE uspFindProductByModel (
    @model_year SMALLINT,
    @product_count INT OUTPUT
) AS
BEGIN
    SELECT 
        product_name,
        list_price
    FROM
        production.products
    WHERE
        model_year = @model_year;

    SELECT @product_count = @@ROWCOUNT;
END;

DECLARE @count INT;

EXEC uspFindProductByModel
    @model_year = 2018,
    @product_count = @count OUTPUT;

SELECT @count AS 'Number of products found';

--if else

BEGIN
    DECLARE @sales INT;

    SELECT 
        @sales = SUM(list_price * quantity)
    FROM
        sales.order_items i
        INNER JOIN sales.orders o ON o.order_id = i.order_id
    WHERE
        YEAR(order_date) = 2018;

    SELECT @sales;

    IF @sales > 1000000
    BEGIN
        PRINT 'Great! The sales amount in 2018 is greater than 1,000,000';
    END
END

--while statement
DECLARE @counter INT = 1;

WHILE @counter <= 5
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END
--Continue
DECLARE @counter INT = 0;

WHILE @counter < 5
BEGIN
    SET @counter = @counter + 1;
    IF @counter = 3
        CONTINUE;	
    PRINT @counter;
END

--cursor

DECLARE 
    @product_name VARCHAR(MAX), 
    @list_price   DECIMAL;

DECLARE cursor_product CURSOR
FOR SELECT 
        product_name, 
        list_price
    FROM 
        production.products;

OPEN cursor_product;

FETCH NEXT FROM cursor_product INTO 
    @product_name, 
    @list_price;

WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @product_name + CAST(@list_price AS varchar);
        FETCH NEXT FROM cursor_product INTO 
            @product_name, 
            @list_price;
    END;

CLOSE cursor_product;

DEALLOCATE cursor_product;

select * from production.products;
--use define functions

CREATE FUNCTION sales.udfNetSale(
    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)
)
RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @quantity * @list_price * (1 - @discount);
END;

SELECT 
    sales.udfNetSale(10,100,0.1) net_sale;

	SELECT 
    order_id, 
    SUM(sales.udfNetSale(quantity, list_price, discount)) net_amount
FROM 
    sales.order_items
GROUP BY 
    order_id
ORDER BY
    net_amount DESC;

	--table function

	CREATE FUNCTION udfProductInYear (
    @model_year INT
)
RETURNS TABLE
AS
RETURN
    SELECT 
        product_name,
        model_year,
        list_price
    FROM
        production.products
    WHERE
        model_year = @model_year;

		SELECT 
    * 
FROM 
    udfProductInYear(2017);

	CREATE FUNCTION udfContacts()
    RETURNS @contacts TABLE (
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        email VARCHAR(255),
        phone VARCHAR(25),
        contact_type VARCHAR(20)
    )
AS
BEGIN
    INSERT INTO @contacts
    SELECT 
        first_name, 
        last_name, 
        email, 
        phone,
        'Staff'
    FROM
        sales.staffs;

    INSERT INTO @contacts
    SELECT 
        first_name, 
        last_name, 
        email, 
        phone,
        'Customer'
    FROM
        sales.customers;
    RETURN;
END;

SELECT 
    * 
FROM
    udfContacts();