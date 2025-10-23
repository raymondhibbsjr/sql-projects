--Queen Anne Curiosity Shop – Multiple Table Queries 
--Raymond Hibbs
USE ONL02_Student3_DB;

--1. Write an SQL statement to list ItemID and ItemDescription for all items that cost less than $500 and were purchased from a vendor whose CompanyName contains the word Antiques. 
SELECT ItemID, ItemDescription
FROM ITEM
WHERE (ItemCost < 500.00) AND VendorID in
(
	SELECT VendorID
	FROM VENDOR
	WHERE CompanyName LIKE '%Antiques%'
);
 

--2. Write an SQL statement to list LastName, FirstName and Phone of the customer who made the purchase of Item ID 7.  Use a subquery. 
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE CustomerID IN
(
	SELECT CustomerID
	FROM SALE
	WHERE SaleID IN
	(
		SELECT SaleID
		FROM SALE_ITEM
		WHERE ItemID = 7
	)
);
 

--3. Answer # 2 but use a join using JOIN ON syntax.  

SELECT LastName, FirstName, Phone
FROM CUSTOMER
JOIN SALE ON CUSTOMER.CustomerID = SALE.CustomerID
JOIN SALE_ITEM ON SALE.SaleID = SALE_ITEM.SaleID
WHERE SALE_ITEM.ItemID = 7;

--4. Write an SQL statement to list LastName, FirstName, CustomerID and Phone of the customers who made purchases totaling $1000 or more.  Use a subquery. 

SELECT LastName, FirstName, CustomerID, Phone
FROM CUSTOMER
WHERE CustomerID IN
(
	SELECT CustomerID
	FROM SALE
	GROUP BY CustomerID
	HAVING SUM(Total) > 1000.00
)

--5. Answer # 4 but use a join using JOIN ON syntax. What are the consequences of using (or not using) the DISTINCT keyword in this version of the query? 

SELECT LastName, FirstName, CUSTOMER.CustomerID, Phone
FROM CUSTOMER
JOIN SALE ON CUSTOMER.CustomerID = SALE.CustomerID
GROUP BY CUSTOMER.LastName, CUSTOMER.FirstName, CUSTOMER.CustomerID, CUSTOMER.Phone
HAVING SUM(SALE.Total) > 1000.00;

--The DISTINCT keyword is not needed here because while joining the tables together you are grouping together all rows with the same values in the GROUP BY line.
--The GROUP BY is already compiling all duplicate cases into a single row for the SALE.Total SUM value, so DISTINT would just be doing a duplicate "check" on something that is already intentionally being grouped up
--to remove any duplicates, which would just be wasting system resources.
 

--6. Write an SQL statement that gives the full name and total value of the orders from employees whose last name is Stuart. 

SELECT FirstName + LastName AS 'Full Name' , SUM(SALE.Total) AS 'Total Value of Orders'
FROM EMPLOYEE
JOIN SALE ON EMPLOYEE.EmployeeID = SALE.EmployeeID
GROUP BY FirstName, LastName
HAVING LastName = 'Stuart';

--7. Write an SQL statement that gives the Item ID AND Item Description for the most expensive item PURCHASED!   

SELECT ITEM.ItemID, ItemDescription
FROM ITEM
JOIN SALE_ITEM ON ITEM.ItemID = SALE_ITEM.ItemID
JOIN SALE ON SALE_ITEM.SaleID = SALE.SaleID
WHERE SALE_ITEM.SaleItemPrice =
(
	SELECT MAX(SaleItemPrice)
	FROM SALE_ITEM
);


--8. Write a SQL statement that gives the first and last name of the customer who purchased the most expensive item. 
SELECT FirstName, LastName
FROM CUSTOMER
JOIN SALE ON CUSTOMER.CustomerID = SALE.CustomerID
JOIN SALE_ITEM ON SALE.SaleID = SALE_ITEM.SaleID
WHERE SALE_ITEM.SaleItemPrice =
(
	SELECT MAX(SaleItemPrice)
	FROM SALE_ITEM
);

--9. Write an SQL statement to list LastName, FirstName, Customer ID and Phone of customers who have purchased an item that was supplied by a vendor with a CompanyName that begins with the letter L.  Use a subquery. 

SELECT LastName, FirstName, CustomerID, Phone
FROM CUSTOMER
WHERE CustomerID IN
(
	SELECT CustomerID
	FROM SALE
	WHERE SaleID IN
	(
		SELECT SaleID
		FROM SALE_ITEM
		WHERE ItemID IN
		(
			SELECT ItemID
			FROM ITEM
			WHERE VendorID IN
			(
				SELECT VendorID
				FROM VENDOR
				WHERE CompanyName LIKE 'L%'
			)
		)
	)
);
 

--10. Answer # 9 but use a join using JOIN ON syntax. What are the consequences of using (or not using) the DISTINCT keyword in this version of the query? 

SELECT DISTINCT LastName, FirstName, c.CustomerID, c.Phone
FROM CUSTOMER c
JOIN SALE s ON c.CustomerID = s.CustomerID
JOIN SALE_ITEM si ON s.SaleID = si.SaleID
JOIN ITEM i ON si.ItemID = i.ItemID
JOIN VENDOR v ON i.VendorID = v.VendorID
WHERE v.CompanyName LIKE 'L%';

--Using DISTINCT in this query is needed because there is no grouping being done to eliminate rows of customers who bought multiple items from the vendors.
--The WHERE filter is only filtering out vendors that don't start with L, but that doesn't mean customers didn't have multiple purchases from that vendor.
--If you don't use DISTINCT here, it will list any customers that purchased from this vendor with different Sale IDs.
