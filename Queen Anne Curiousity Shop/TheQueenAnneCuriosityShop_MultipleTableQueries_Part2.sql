--Queen Anne Curiosity Shop – Multiple Table Queries Part Two 
--Raymond Hibbs
USE ONL02_Student3_DB;




--1. Which vendors sold more (in dollar terms) than the average vendor?   Use the retail value for this.  Create the list, using the contact last name, in descending order. 
SELECT v.ContactLastName
FROM VENDOR v
JOIN ITEM i ON v.VendorID = i.VendorID
JOIN SALE_ITEM si ON i.ItemID = si.ItemID
GROUP BY v.VendorID, v.ContactLastName, v.CompanyName
--Listing ContactLastName from combined lists
--The HAVING SUM step is the equation saying the returned subquery tables that are greater than the return of the inner subquery (AVG(VendorSales)) are what is returned
HAVING SUM(si.SaleItemPrice) > 
(
	SELECT AVG(VendorSales) --this is the outer subquery that takes the table returned from the inner subquery and finds the average of the vendors
	FROM
	(
		--subquery that joins all 3 tables needed and gets the SUM AS VendorSales to calculate the average
		SELECT SUM(si.SaleItemPrice) AS VendorSales
		FROM VENDOR v
		JOIN ITEM i ON v.VendorID = i.VendorID
		JOIN SALE_ITEM si ON i.ItemID = si.ItemID
		GROUP BY v.VendorID
		--grouping helps compact the sales into sale amounts per vendor
	)
	AS VendorTotals
)
ORDER BY v.ContactLastName DESC
;

 

--2. Queen Anne Curiosity Shop had a Sales contest in January.  The Employees who had orders with total sales greater than $300 during the month received a $100 Bonus.  List those who got the bonus. 
SELECT DISTINCT e.FirstName, e.LastName
FROM EMPLOYEE e
JOIN SALE s ON e.EmployeeID = s.EmployeeID
WHERE s.SaleDate LIKE '2023-01-%'
AND s.Total > 300
ORDER BY e.FirstName, e.LastName
;

--3. The shop also had a contest for the employee who sold the most "Antique" items based on the item description.  (“Antique” Lamp, “Antique” Desk, etc.).  Write a query that lists the winner’s name and how many items he/she sold to win. 
SELECT e.FirstName, e.LastName, COUNT(si.ItemID) AS 'Antique Items Sold'
FROM EMPLOYEE e
JOIN SALE s ON e.EmployeeID = s.EmployeeID
JOIN SALE_ITEM si ON s.SaleID = si.SaleID
JOIN ITEM i ON si.ItemID = i.ItemID
WHERE i.ItemDescription LIKE 'Antique%'
GROUP BY s.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(si.ItemID) =
(
	SELECT MAX(AntiqueCount)--this outer subquery takes the highest value return (MAX) from the inner subquery
	FROM
	(
		SELECT COUNT(si.ItemID) AS AntiqueCount
		FROM EMPLOYEE e
		JOIN SALE s ON e.EmployeeID = s.EmployeeID
		JOIN SALE_ITEM si ON s.SaleID = si.SaleID
		JOIN ITEM i ON si.ItemID = i.ItemID
		WHERE i.ItemDescription LIKE 'Antique%'
		GROUP BY e.EmployeeID
		--counts items sold by each employee starting with the word Antique
	)
	AS AntiqueCountsForEmployees
)
;

--4. In advance of the holidays, Queen Anne is sending 20% off coupons to every customer who purchased a desk.  Prepare the list of customer names who qualify along with their address for the mailing. 
SELECT c.FirstName, c.LastName, c.Address, c.City, c.State, c.ZIP
FROM CUSTOMER c
JOIN SALE s ON c.CustomerID = s.CustomerID
JOIN SALE_ITEM si ON s.SaleID = si.SaleID
JOIN ITEM i ON si.ItemID = i.ItemID
WHERE i.ItemDescription LIKE '%Desk'
--% only goes before because if % was after it would include any items that don't end in the word desk such as Antique Desk Chair and Desk Lamp
GROUP BY c.FirstName, c.LastName, c.Address, c.City, c.State, c.ZIP
;
 

--5. Queen Anne also wants to send greeting cards to all their customers when they send out the 20% coupon.  Make the necessary changes to the query in #4 so that the list returns the desk purchasers at the top and all the other customers who did not purchase a desk below them.  Names and addresses should be included in the results. 
SELECT c.FirstName, c.LastName, c.Address, c.City, c.State, c.ZIP, COUNT(i.ItemID) AS 'Number Of Desks Purchased'
FROM CUSTOMER c
LEFT JOIN SALE s ON c.CustomerID = s.CustomerID
LEFT JOIN SALE_ITEM si ON s.SaleID = si.SaleID
LEFT JOIN ITEM i ON si.ItemID = i.ItemID AND i.ItemDescription LIKE '%Desk'
GROUP BY c.FirstName, c.LastName, c.Address, c.City, c.State, c.ZIP
ORDER BY 'Number Of Desks Purchased' DESC, c.FirstName, c.LastName
;

--LEFT JOIN is used so that the table created from the previous JOIN are still included (the left tables) where the right table is the list of ONLY those that have i.ItemDescription Like '%Desk'
--because the others would return a null value and not be included with a regular JOIN

--6. Which Sale IDs (orders) in 2023 had multiple items in the order? 

SELECT s.SaleID, COUNT(si.ItemID) AS 'Number Of Items'
FROM SALE s
INNER JOIN SALE_ITEM si ON s.SaleID = si.SaleID
WHERE s.SaleDate LIKE '2023%'
GROUP BY s.SaleID
HAVING COUNT(si.ItemID) > 1
;

--7. When conducting inventory on Feb 12th, the Curiosity Shop's manager made a list of the items still available.  List the items with their descriptions. 

SELECT i.ItemID, i.ItemDescription
FROM ITEM i
--all items
LEFT JOIN SALE_ITEM si ON i.ItemID = si.ItemID
LEFT JOIN SALE s ON si.SaleID = s.SaleID AND s.SaleDate <= '2023-02-12'
--all sale items sold on or before 2/12
WHERE i.PurchaseDate <= '2023-02-12' AND s.SaleID IS NULL;
--all items purchased by vendors before the date and haven't been sold
