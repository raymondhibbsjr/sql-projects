--The Queen Anne Curiousity Shop
--Chapter 3
--Part C
--Raymond Hibbs

USE ONL02_Student3_DB
GO


/***CUSTOMER DATA***/
/*-------------------------------------------------------------------*/

--1
INSERT INTO CUSTOMER(LastName, FirstName, Address, City, State, ZIP, Phone, EmailAddress) VALUES(
	'Shire', 'Robert', '6225 Evanston Ave N', 'Seattle', 'WA', '98103', '206-524-2433', 'Robert.Shire@somewhere.com');
--2
INSERT INTO CUSTOMER(LastName, FirstName, Address, City, State, ZIP, Phone, EmailAddress) VALUES(
	'Goodyear','Katherine','7335 11th Ave NE', 'Seattle', 'WA', '98105', '206-524-3544', 'Katherine.Goodyear@somewhere.com');
--3
INSERT INTO CUSTOMER(LastName, FirstName, Address, City, State, ZIP, Phone, EmailAddress) VALUES(
	'Bancroft','Chris','12605 NE 6th Street','Bellevue','WA','98005','425-635-9788','Chris.Bancroft@somewhere.com');
--4
INSERT INTO CUSTOMER(LastName, FirstName, Address, City, State, ZIP, Phone, EmailAddress) VALUES(
	'Griffith','John','335 Aloha Street','Seattle','WA','98109','206-524-4655','John.Griffith@somewhere.com');
--5
INSERT INTO CUSTOMER(LastName, FirstName, Address, City, State, ZIP, Phone, EmailAddress) VALUES(
	'Tiemey','Doris','14510 NE 4th Street','Bellevue','WA','98005','425-635-8677','Doris.Tiemey@somewhere.com');
--6
INSERT INTO CUSTOMER(LastName, FirstName, Address, City, State, ZIP, Phone, EmailAddress) VALUES(
	'Anderson','Donna','1410 Hillcrest Parkway','Mt. Vernon','WA','98273','360-538-7566','Donna.Anderson@elsewhere.com');
--7
INSERT INTO CUSTOMER(LastName, FirstName, Address, City, State, ZIP, Phone, EmailAddress) VALUES(
	'Svane','Jack','3211 42nd Street','Seattle','WA','98115','206-524-5766','Jack.Svane@somewhere.com');
--8
INSERT INTO CUSTOMER(LastName, FirstName, Address, City, State, ZIP, Phone, EmailAddress) VALUES(
	'Walsh','Denesha','6712 24th Avenue NE','Redmond','WA','98053','425-635-7566','Denesha.Walsh@somewhere.com');
--9
INSERT INTO CUSTOMER(LastName, FirstName, Address, City, State, ZIP, Phone, EmailAddress) VALUES(
	'Enquist','Craig','534 15th Street','Bellingham','WA','98225','360-538-6455','Craig.Enquist@elsewhere.com');
--10
INSERT INTO CUSTOMER(LastName, FirstName, Address, City, State, ZIP, Phone, EmailAddress) VALUES(
	'Anderson','Rose','6823 17th Ave NE','Seattle','WA','98105','206-524-6877','Rose.Anderson@elsewhere.com');


/****EMPLOYEE DATA****/
/*-------------------------------------------------------------------*/
--1
INSERT INTO EMPLOYEE(LastName, FirstName, Phone, EmailAddress) VALUES(
	'Stuart','Anne','206-527-0010','Anne.Stuart@QACS.com');
--2
INSERT INTO EMPLOYEE(LastName, FirstName, Phone, EmailAddress) VALUES(
	'Stuart','George','206-527-0011','George.Stuart@QACS.com');
--3
INSERT INTO EMPLOYEE(LastName, FirstName, Phone, EmailAddress) VALUES(
	'Stuart','Mary','206-527-0012','Mary.Stuart@QACS.com');
--4
INSERT INTO EMPLOYEE(LastName, FirstName, Phone, EmailAddress) VALUES(
	'Orange','William','206-527-0013','William.Orange@QACS.com');
--5
INSERT INTO EMPLOYEE(LastName, FirstName, Phone, EmailAddress) VALUES(
	'Griffith','John','206-527-0014','John.Griffith@QACS.com');


/****VENDOR DATA****/
/*-------------------------------------------------------------------*/
--1
INSERT INTO VENDOR(CompanyName, ContactLastName, ContactFirstName, Address, City, State, ZIP, Phone, Fax, EmailAddress) VALUES(
	'Linens and Things','Huntington','Anne','1515 NW Market Street','Seattle','WA','98107','206-325-6755','206-329-9675','LAT@business.com');
--2
INSERT INTO VENDOR(CompanyName, ContactLastName, ContactFirstName, Address, City, State, ZIP, Phone, Fax, EmailAddress) VALUES(
	'European Specialties','Tadema','Ken','6123 15th Avenue NW','Seattle','WA','98107','206-325-7866','206-329-9786','ES@business.com');
--3
INSERT INTO VENDOR(CompanyName, ContactLastName, ContactFirstName, Address, City, State, ZIP, Phone, Fax, EmailAddress) VALUES(
	'Lamps and Lighting','Swanson','Sally','506 Prospect Street','Seattle','WA','98109','206-325-8977','206-329-9897','LAL@business.com');
--4
INSERT INTO VENDOR(CompanyName, ContactLastName, ContactFirstName, Address, City, State, ZIP, Phone, Fax, EmailAddress) VALUES(
	NULL,'Lee','Andrew','1102 3rd Street','Kirkland','WA','98033','425-746-5433',NULL, 'Andrew.Lee@somewhere.com');
--5
INSERT INTO VENDOR(CompanyName, ContactLastName, ContactFirstName, Address, City, State, ZIP, Phone, Fax, EmailAddress) VALUES(
	NULL,'Harrison','Denise','533 10th Avenue,','Kirkland','WA','98033','425-746-4322',NULL,'Denise.Harrison@somewhere.com');
--6
INSERT INTO VENDOR(CompanyName, ContactLastName, ContactFirstName, Address, City, State, ZIP, Phone, Fax, EmailAddress) VALUES(
	'New York Brokerage','Smith','Mark','621 Roy Street','Seattle','WA','98109','206-325-9088','206-329-9908','NYB@business.com');
--7
INSERT INTO VENDOR(CompanyName, ContactLastName, ContactFirstName, Address, City, State, ZIP, Phone, Fax, EmailAddress) VALUES(
	NULL,'Walsh','Denesha','6712 24th Avenue NE','Redmond','WA','98053','425-635-7566',NULL,'Denesha.Walsh@somewhere.com');
--8
INSERT INTO VENDOR(CompanyName, ContactLastName, ContactFirstName, Address, City, State, ZIP, Phone, Fax, EmailAddress) VALUES(
	NULL,'Bancroft','Chris','12605 NE 6th Street','Bellevue','WA','98005','425-635-9788','425-639-9978','Chris.Bancroft@somewhere.com');
--9
INSERT INTO VENDOR(CompanyName, ContactLastName, ContactFirstName, Address, City, State, ZIP, Phone, Fax, EmailAddress) VALUES(
	'Specialty Antiques','Nelson','Fred','2512 Lucky Street','San Francisco','CA','94110','415-422-2121','415-423-5212','SA@business.com');
--10
INSERT INTO VENDOR(CompanyName, ContactLastName, ContactFirstName, Address, City, State, ZIP, Phone, Fax, EmailAddress) VALUES(
	'General Antiques','Garner','Patty','2515 Lucky Street','San Francisco','CA','94110','415-422-3232','415-429-9323','GA@business.com');


/****ITEM DATA****/
/*-------------------------------------------------------------------*/
--1
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Antique Desk','2022-11-07',1800.00, 3000.00, 2);
--2
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Antique Desk Chair','2022-11-10',300.00, 500.00, 4);
--3
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Dining Table Linens','2022-11-14',600.00, 1000.00, 1);
--4
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Candles','2022-11-14',30.00 ,50.00, 1);
--5
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Candles','2022-11-14',27.00 ,45.00, 1);
--6
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Desk Lamp','2022-11-14', 150.00 ,250.00, 3);
--7
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Dining Table Linens','2022-11-14',450.00 ,750.00, 1);
--8
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Book Shelf','2022-11-21',150.00 ,250.00, 5);
--9
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Antique Chair','2022-11-21',750.00 ,1250.00, 6);
--10
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Antique Chair','2022-11-21',1050.00, 1750.00, 6);
--11
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Antique Candle Holders','2022-11-28',210.00, 350.00, 2);
--12
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Antique Desk','2023-01-05',1920.00, 3200.00, 2);
--13
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Antique Desk','2023-01-05',2100.00, 3500.00, 2);
--14
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Antique Desk Chair','2023-01-06',285.00 ,475.00, 9);
--15
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Antique Desk Chair','2023-01-06',339.00 ,565.00, 9);
--16
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Desk Lamp','2023-01-06',150.00 ,250.00, 10);
--17
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Desk Lamp','2023-01-06',150.00 ,250.00, 10);
--18
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Desk Lamp','2023-01-06',144.00 ,240.00, 3);
--19
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Antique Dining Table','2023-01-10',3000.00 ,5000.00, 7);
--20
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Antique Sideboard','2023-01-11',2700.00 ,4500.00, 8);
--21
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Dining Table Chairs','2023-01-11',5100.00, 8500.00, 9);
--22
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Dining Table Linens','2023-01-12',450.00 ,750.00, 1);
--23
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Dining Table Linens','2023-01-12',480.00 ,800.00, 1);
--24
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Candles','2023-01-17',30.00 ,50.00, 1);
--25
INSERT INTO ITEM(ItemDescription,PurchaseDate, ItemCost, ItemPrice, VendorID) VALUES(
	'Candles','2023-01-17',36.00, 60.00, 1);


/****SALE DATA****/
/*-------------------------------------------------------------------*/
--1
INSERT INTO SALE(CustomerID, EmployeeID,SaleDate, SubTotal, Tax, Total) VALUES(
	 1,1,'2022-12-14',3500.00 ,290.50 ,3790.50);
--2
INSERT INTO SALE(CustomerID, EmployeeID,SaleDate, SubTotal, Tax, Total) VALUES(
	 2,1,'2022-12-15',1000.00 ,83.00 ,1083.00);
--3
INSERT INTO SALE(CustomerID, EmployeeID,SaleDate, SubTotal, Tax, Total) VALUES(
	 3,1,'2022-12-15',50.00 ,4.15 ,54.15);
--4
INSERT INTO SALE(CustomerID, EmployeeID,SaleDate, SubTotal, Tax, Total) VALUES(
	 4,3,'2022-12-23',45.00 ,3.74 ,48.74);
--5
INSERT INTO SALE(CustomerID, EmployeeID,SaleDate, SubTotal, Tax, Total) VALUES(
	 1,5,'2023-01-05',250.00 ,20.75 ,270.75);
--6
INSERT INTO SALE(CustomerID, EmployeeID,SaleDate, SubTotal, Tax, Total) VALUES(
	 5,5,'2023-01-10',750.00 ,62.25 ,812.25);
--7
INSERT INTO SALE(CustomerID, EmployeeID,SaleDate, SubTotal, Tax, Total) VALUES(
	 6,4,'2023-01-12',250.00 ,20.75 ,270.75);
--8
INSERT INTO SALE(CustomerID, EmployeeID,SaleDate, SubTotal, Tax, Total) VALUES(
	 2,1,'2023-01-15',3000.00 ,249.00 ,3249.00);
--9
INSERT INTO SALE(CustomerID, EmployeeID,SaleDate, SubTotal, Tax, Total) VALUES(
	5,5,'2023-01-25',350.00 ,29.05 ,379.05);
--10
INSERT INTO SALE(CustomerID, EmployeeID,SaleDate, SubTotal, Tax, Total) VALUES(
	 7,1,'2023-02-04',14250.00 ,1182.75 ,15432.75);
--11
INSERT INTO SALE(CustomerID, EmployeeID,SaleDate, SubTotal, Tax, Total) VALUES(
	 8,5,'2023-02-04',250.00 ,20.75 ,270.75);
--12
INSERT INTO SALE(CustomerID, EmployeeID,SaleDate, SubTotal, Tax, Total) VALUES(
	 5,4,'2023-02-07',50.00 ,4.15 ,54.15);
--13
INSERT INTO SALE(CustomerID, EmployeeID,SaleDate, SubTotal, Tax, Total) VALUES(
	 9,2,'2023-02-07',4500.00 ,373.50 ,4873.50);
--14
INSERT INTO SALE(CustomerID, EmployeeID,SaleDate, SubTotal, Tax, Total) VALUES(
	10,3,'2023-02-11',3675.00, 305.03 ,3980.03);
--15
INSERT INTO SALE(CustomerID, EmployeeID,SaleDate, SubTotal, Tax, Total) VALUES(
	 2,2,'2023-02-11',800.00 ,66.40 ,866.40);


/****SALE_ITEM DATA****/
/*-------------------------------------------------------------------*/
SET IDENTITY_INSERT SALE_ITEM ON;
--1
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	 1,1, 1,3000.00);
--2
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	 1,2, 2,500.00 );
--3
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	 2,1, 3,1000.00 );
--4
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	 3,1, 4,50.00);
--5
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	 4,1, 5,45.00);
--6
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	 5,1, 6,250.00 );
--7
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	 6,1, 7,750.00);
--8
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	 7,1, 8,250.00);
--9
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	 8,1, 9,1250.00 );
--10
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	 8,2,10,1750.00);
--11
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	 9,1,11,350.00);
--12
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	10,1,19,5000.00);
--13
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	10,2,21,8500.00);
--14
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	10,3,22,750.00 );
--15
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	11,1,17,250.00);
--16
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	12,1,24,50.00);
--17
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	13,1,20,4500.00);
--18
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	14,1,12,3200.00 );
--19
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	14,2,14,475.00);
--20
INSERT INTO SALE_ITEM(SaleID,SaleItemID,ItemID,SaleItemPrice) VALUES(
	15,1,23,800.00 );
