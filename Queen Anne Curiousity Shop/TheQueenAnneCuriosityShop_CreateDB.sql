--The Queen Anne Curiousity Shop
--Chapter 3
--Part A
--Raymond Hibbs


--REFERENTIAL INTEGRITY CONSTRAINTS
/* 
VendorID in ITEM must exist in VendorID in VENDOR
CustomerID in SALE must exist in CustomerID in CUSTOMER
EmployeeID in SALE must exist in EmployeeID in EMPLOYEE
SaleID in SALE_ITEM must exist in SaleID in SALE
ItemID in SALE_ITEM must exist in ItemID in ITEM
*/

/*
Assume that CustomerID of CUSTOMER, EmployeeID of EMPLOYEE, VendorID of VENDOR, ItemID of ITEM, and SaleID of SALE are all surrogate keys with values as follows:

CustomerID, EmployeeID, VendorID, ItemID, SaleID
Start at 1      
Increment by 1

SaleItemID of SALE_ITEM is not a true surrogate key, but rather a counter that starts at 1 and increments by 1 for each SaleID in SALE.
This number will require special handling in the database, needing to be either manually inserted
or to have specific program logic written to insert the correct number. In this text we will simply insert the number manually.
*/

/*
****EXTRA NOTES*****

A vendor may be an individual or a company.
If the vendor is an individual, the CompanyName field is left blank, while the ContactLastName and ContactFirstName fields must have data values.
If the vendor is a company, the company name is recorded in the CompanyName field, 
and the name of the primary contact at the company is recorded in the ContactLastName and ContactFirstName fields.
The ItemPrice of an ITEM many change over time. 
Therefore, when an ITEM is actually sold, the current ItemPrice is recorded in SALE_ITEM as SaleItemPrice. 
SaleItemPrice becomes historical data and never changes—it is the ItemPrice at the time of the SALE.

*/

--remove tables before execution so no errors
/*
USE ONL02_Student3_DB;
GO
DROP TABLE ONL02_Student3_DB.dbo.CUSTOMER;
DROP TABLE ONL02_Student3_DB.dbo.EMPLOYEE;
DROP TABLE ONL02_Student3_DB.dbo.ITEM;
DROP TABLE ONL02_Student3_DB.dbo.SALE;
DROP TABLE ONL02_Student3_DB.dbo.SALE_ITEM;
DROP TABLE ONL02_Student3_DB.dbo.VENDOR;
*/

--name database QACS

--CUSTOMER (CustomerID, LastName, FirstName, Address, City, State, ZIP, Phone,  EmailAddress)
CREATE TABLE CUSTOMER(

	CustomerID Int Identity(1,1) NOT NULL,
	LastName CHAR(25) NOT NULL,
	FirstName CHAR(25) NOT NULL,
	Address CHAR(35) NOT NULL,
	City CHAR(17) NOT NULL,
	State CHAR(2)  NOT NULL,
	ZIP CHAR(5) NOT NULL,
	Phone CHAR(12) NOT NULL,
	EmailAddress VARCHAR(100) NOT NULL UNIQUE,
	CONSTRAINT CUSTOMER_PK PRIMARY KEY(CustomerID)
	
);

--EMPLOYEE (EmployeeID, LastName, FirstName, Phone, EmailAddress)
CREATE TABLE EMPLOYEE(
	
	EmployeeID Int Identity(1,1) NOT NULL,
	LastName CHAR(25) NOT NULL,
	FirstName CHAR(25) NOT NULL,
	Phone CHAR(12) NOT NULL,
	EmailAddress VARCHAR(100) NOT NULL UNIQUE,
	CONSTRAINT EMPLOYEE_PK PRIMARY KEY(EmployeeID)

);

--VENDOR (VendorID, CompanyName, ContactLastName, ContactFirstName, Address, City,   State, ZIP, Phone, Fax, EmailAddress)
CREATE TABLE VENDOR(

	VendorID Int Identity(1,1) NOT NULL,
	CompanyName VARCHAR(100) NULL,
	ContactLastName CHAR(25) NOT NULL,
	ContactFirstName CHAR(25) NOT NULL,
	Address CHAR(35) NOT NULL,
	City CHAR(17) NOT NULL,
	State CHAR(29) NOT NULL,
	ZIP CHAR(5) NOT NULL,
	Phone CHAR(12) NOT NULL,
	Fax CHAR(12) NULL,
	EmailAddress VARCHAR(100) NOT NULL UNIQUE,
	CONSTRAINT VENDOR_PK PRIMARY KEY(VendorID)

);

--ITEM (ItemID, ItemDescription, PurchaseDate, ItemCost, ItemPrice, VendorID)
CREATE TABLE ITEM(

	ItemID Int Identity(1,1) NOT NULL,
	ItemDescription VARCHAR(255) NOT NULL,
	PurchaseDate DATE NOT NULL,
	ItemCost DECIMAL(16,2) NOT NULL,
	ItemPrice DECIMAL(16,2) NOT NULL,
	VendorID Int NOT NULL,
	CONSTRAINT ITEM_PK PRIMARY KEY(ItemID)

);

--SALE (SaleID, CustomerID, EmployeeID, SaleDate, SubTotal, Tax, Total)
CREATE TABLE SALE(

	SaleID Int Identity(1,1) NOT NULL,
	CustomerID Int NOT NULL,
	EmployeeID Int NOT NULL,
	SaleDate DATE NOT NULL,
	SubTotal DECIMAL(16,2) NOT NULL,
	Tax DECIMAL(16,2) NOT NULL,
	Total DECIMAL(16,2) NOT NULL,
	CONSTRAINT SALE_PK PRIMARY KEY(SaleID)

);

--SALE_ITEM (SaleID, SaleItemID, ItemID, SaleItemPrice)
CREATE TABLE SALE_ITEM(

	SaleID Int Identity(1,1) NOT NULL,
	SaleItemID Int NOT NULL,
	ItemID Int NOT NULL,
	SaleItemPrice DECIMAL(16,2) NOT NULL,
	CONSTRAINT SALE_ITEM_PK PRIMARY KEY(SaleID, SaleItemID)

);