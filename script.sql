create table zipcodes (
  zip      int,
  city     char(30),
  primary key (zip));

create table employees (
  eno      int not null primary key, 
  ename    char(30),
  zip      int references zipcodes,
  hdate    date);

create table parts(
  pno      int not null primary key,
  pname    char(30),
  qoh      int check(qoh >= 0),
  price    decimal(6,2) check(price >= 0.0),
  olevel   int);

create table customers (
  cno      int not null primary key,
  cname    char(30),
  street   char(30),
  zip      int references zipcodes,
  phone    char(12));
 
create table orders (
  ono      int not null primary key,
  cno      int references customers,
  eno      int references employees,
  received date,
  shipped  date);

create table odetails (
  ono      int not null references orders,
  pno      int not null references parts,
  qty      int check(qty > 0),
  sfee     decimal(6,2) check(sfee >= 0.0),
  primary key (ono,pno));


insert into  zipcodes values
  (67226,'Wichita');
insert into  zipcodes values
  (60606,'Fort Dodge');
insert into  zipcodes values
  (50302,'Kansas City');
insert into  zipcodes values
  (54444,'Columbia');
insert into  zipcodes values
  (66002,'Liberal');
insert into  zipcodes values
  (61111,'Fort Hays');
insert into  zipcodes values
  (47907,'West Lafayette');

insert into employees values
  (1000,'Jones',67226,'95-12-12');
insert into employees values
  (1001,'Smith',60606,'92-01-01');
insert into employees values
  (1002,'Brown',50302,'94-09-01');

insert into parts values
  (10506,'Land Before Time I',200,19.99,20);
insert into parts values
  (10507,'Land Before Time II',156,19.99,20);
insert into parts values
  (10508,'Land Before Time III',190,19.99,20); 
insert into parts values
  (10509,'Land Before Time IV',60,19.99,20);
insert into parts values
  (10601,'Sleeping Beauty',300,24.99,20);
insert into parts values
  (10701,'When Harry Met Sally',120,19.99,30);
insert into parts values
  (10800,'Dirty Harry',140,14.99,30);
insert into parts values
  (10900,'Dr. Zhivago',100,24.99,30);

insert into customers values
  (1111,'Charles','123 Main St.',67226,'316-636-5555');
insert into customers values
  (2222,'Bertram','237 Ash Avenue',67226,'316-689-5555');
insert into customers values
  (3333,'Barbara','111 Inwood St.',60606,'316-111-1234');
insert into customers values
  (4444,'Jorge','131 State St.',47907,'765-111-1884');
insert into customers values
  (5555,'Jannes','41 1st St.',47907,'765-122-2232');

insert into orders values
  (1020,1111,1000,'94-12-10','94-12-12');
insert into orders values
  (1021,1111,1000,'95-01-12','95-01-15');
insert into orders values
  (1022,2222,1001,'95-02-13','95-02-20');
insert into orders values
  (1023,3333,1000,'97-06-20',null);
insert into orders values
  (1024,4444,1002,'95-04-13','95-04-17');
insert into orders values
  (1025,4444,1000,'95-04-25','95-04-30');
insert into orders values
  (1026,2222,1001,'96-01-03','96-01-08');

insert into odetails values
  (1020,10506,1,0.0);
insert into odetails values
  (1020,10507,1,4.0);
insert into odetails values
  (1020,10508,2,5.0);
insert into odetails values
  (1020,10509,3,5.0);
insert into odetails values
  (1021,10601,4,0.0);
insert into odetails values
  (1022,10601,1,3.0);
insert into odetails values
  (1022,10701,1,0.0);
insert into odetails values
  (1023,10800,1,0.0);
insert into odetails values
  (1024,10900,1,0.0);
insert into odetails values
  (1024,10506,1,0.0);
insert into odetails values
  (1025,10601,2,5.0);
insert into odetails values
  (1026,10508,1,0.0);
insert into odetails values
  (1026,10509,1,0.0);
insert into odetails values
  (1023,10900,1,0.0);

