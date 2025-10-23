/*
Sunrise Database Lab 2 Single Table Queries 2025-3
Raymond Hibbs
*/

--1.List the first and last names of all owners who live in the state of CT.  
USE ONL02_Student3_DB
SELECT FNAME, LNAME--,STATE
	FROM PROPOWNER
	WHERE STATE = 'CT';

--2.List the first and last name, in alphabetical order, of all owners who do NOT live in the state of WA. 
USE ONL02_Student3_DB;
SELECT FNAME, LNAME--,STATE
	FROM PROPOWNER
	WHERE STATE <> 'WA'
	ORDER BY FNAME ASC;

--3.List the property ID and Owner ID (PROPOWNER_ID) for all properties with more than 1400 SQR_FT 
USE ONL02_Student3_DB;
SELECT PROPERTY_ID, PROPOWNER_ID--,SQR_FT
	FROM PROPERTY
	WHERE SQR_FT > 1400;

--4.Which owners have last names that begin with the letter "B"? 
USE ONL02_Student3_DB;
SELECT FNAME, LNAME
	FROM PROPOWNER
	WHERE LNAME LIKE 'B%';

--5.How many properties have 3 or more bedrooms (BDRMS)? 
USE ONL02_Student3_DB;
SELECT COUNT(*) AS PropertiesWith3OrMoreBedrooms
	FROM PROPERTY
	WHERE BDRMS >= 3;


--6.Which property addresses rent for more than $1200? 
USE ONL02_Student3_DB;
SELECT ADDRESS
	FROM PROPERTY
	WHERE MONTHLY_RENT > 1200;

--7.What is the average rent for properties with at least 4 bedrooms? 
USE ONL02_Student3_DB;
SELECT AVG(MONTHLY_RENT) AS AverageMonthlyRentWithAtLeast4Bedrooms
	FROM PROPERTY
	WHERE BDRMS >= 4;

--8.What is the average SQR_FT for properties with 3 bedrooms? 
USE ONL02_Student3_DB;
SELECT AVG(SQR_FT) AS AverageSquareFootageForPropertiesWith3Bedrooms
	FROM PROPERTY
	WHERE BDRMS = 3;

--9.What is the total of monthly rents collected for all properties with 2 floors? 
USE ONL02_Student3_DB;
SELECT SUM(MONTHLY_RENT) AS MonthlyRentsCollectedForAllPropertiesWith2Floors
	FROM PROPERTY
	WHERE FLOORS = 2;

--10.List the property IDs and addresses in order, from highest to lowest, based on their rent per SQR_FT. (MONTHLY_RENT / SQR_FT)? 
USE ONL02_Student3_DB;
SELECT PROPERTY_ID, ADDRESS--,MONTHLY_RENT/SQR_FT AS RentPerSqrFt
	FROM PROPERTY
	ORDER BY MONTHLY_RENT / SQR_FT DESC;

--11.List each Office_ID and the average EST_HOURS for their Service Requests. 
USE ONL02_Student3_DB;
SELECT OFFICE_ID, AVG(EST_HOURS) AS AverageEstimatedHoursforServiceRequests
	FROM SERVICE_REQUEST
		GROUP BY OFFICE_ID;

--12.Which property IDs had service requests describing a problem with their "kitchen". 
USE ONL02_Student3_DB;
SELECT PROPERTY_ID
	FROM SERVICE_REQUEST
	WHERE DESCRIPTION LIKE '%kitchen%';

--13.How much does each owner (PROPOWNER_ID) collect in monthly rent? 
USE ONL02_Student3_DB;
SELECT PROPOWNER_ID, SUM(MONTHLY_RENT) AS CollectionOfMonthlyRent
	FROM PROPERTY
		GROUP BY PROPOWNER_ID;

--14.Which SERVICE_IDs have a NEXT_SERVICE_DATE sometime in October 2019? 
USE ONL02_Student3_DB;
SELECT SERVICE_ID
	FROM SERVICE_REQUEST
	WHERE NEXT_SERVICE_DATE LIKE '2019-10%';

--15.List each Property ID and how many residents live in each unit?
USE ONL02_Student3_DB;
SELECT PROPERTY_ID, COUNT(*) AS NumberOfResidents
	FROM RESIDENTS
		GROUP BY PROPERTY_ID;