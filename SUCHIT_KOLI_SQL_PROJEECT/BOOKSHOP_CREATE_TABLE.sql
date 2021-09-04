use BookShop;
CREATE TABLE Author (
  name varchar(255),
  CONSTRAINT unique_name UNIQUE (name) ,
  address varchar(255),
  CONSTRAINT unique_address UNIQUE (address),
  url varchar(255)
);
Create table Publisher(
name varchar(255),
  CONSTRAINT unique_pname UNIQUE (name),
  address varchar(255),
  phone varchar(255),
  url varchar(255)
  );
Create table Book(
  ISBN varchar(255),name varchar(255),
  CONSTRAINT unique_ISBN UNIQUE (ISBN),
  publisher_name varchar(255) 
  CONSTRAINT fk_book FOREIGN KEY (publisher_name) REFERENCES Publisher(name),
  AuthorName varchar(255)
  CONSTRAINT fk_author FOREIGN KEY (AuthorName) REFERENCES Author(name),
  AuthorAdress varchar(255)
  CONSTRAINT fk_adress FOREIGN KEY (AuthorAdress) REFERENCES Author(address),
  year int,
  Title varchar(255),
  Price numeric(19,0));
create table Warehouse(
  code INT primary key IDENTITY (1, 1),
  phone varchar(255),
  Adress varchar(255)
  );
Create table Warehouse_book(
  Warehouse_code int
  CONSTRAINT fk_code FOREIGN KEY (Warehouse_code) REFERENCES Warehouse(code),
  BookISBN varchar(255)
  CONSTRAINT fk_bookISBN FOREIGN KEY (BookISBN) REFERENCES Book(ISBN),
  Count int
  );
create table Customer(
  email varchar(255),
  CONSTRAINT unique_email UNIQUE (email),
  Name varchar(255),
  Phone varchar(255),
  Address varchar(255)
  );
Create table ShoppingBasket(
   Id INT primary key IDENTITY (1, 1),
   CustomerEmail varchar(255)
   CONSTRAINT fk_customeremail FOREIGN KEY (CustomerEmail) REFERENCES Customer(email),
   );
Create table ShoppingBasket_Book(
  ShoppingBasket_id int 
  CONSTRAINT fk_shoppingbook FOREIGN KEY (ShoppingBasket_id) REFERENCES ShoppingBasket(Id),
  BookISBN varchar(255)
  CONSTRAINT fk_Bookbasket FOREIGN KEY (BookISBN) REFERENCES Book(ISBN),
  count int
  );






