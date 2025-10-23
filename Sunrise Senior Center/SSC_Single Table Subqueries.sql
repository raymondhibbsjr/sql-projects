USE ONL02_Student3_DB;

--1. List each Property ID that has more than one service request. 

SELECT PROPERTY_ID--,COUNT (*) AS NumberOfServiceRequests
--COUNT(SERVICE_ID) AS NumberOfServiceRequests, I was doing this where I was counting the duplicate service IDs attached to property ID, but I realized you can just count the number
--of times a PROPERTY_ID is listed and ignore the SERVICE_ID column completely, because that is the PK and we are essentially just looking for all PROPERTY_ID values that appear more than once.
	FROM SERVICE_REQUEST
	GROUP BY PROPERTY_ID
	HAVING COUNT (*) > 1;

--2. List each Property ID that has three or more tenants in that property. 

SELECT PROPERTY_ID--,COUNT (*) AS NumberOfTenants (this was used for testing/verification)
	FROM RESIDENTS
	GROUP BY PROPERTY_ID
	HAVING COUNT (*) >= 3;

--3. For just those single digit property IDs (1,2,3, ... 9), list each Property ID that has exactly three tenants in that property.  

SELECT PROPERTY_ID
	FROM RESIDENTS
	WHERE PROPERTY_ID < 10
	GROUP BY PROPERTY_ID
	HAVING COUNT (*) = 3;

--The following queries must include a SUB QUERY: 

--4. List the first and last names for all the OWNERS who own a 3-bedroom (BDRM) property.  

SELECT FNAME, LNAME
	FROM PROPOWNER
	WHERE PROPOWNER_ID IN (
		SELECT PROPOWNER_ID
			FROM PROPERTY
			WHERE BDRMS = 3);

--5. List the property ADDRESS and SQR_FT for all property's whose owner last name is Cole or Moore 

SELECT ADDRESS, SQR_FT
	FROM PROPERTY
		WHERE PROPOWNER_ID IN(
			SELECT PROPOWNER_ID
				FROM PROPOWNER
				WHERE LNAME = 'Cole' OR LNAME = 'Moore');

--6. List the Property IDs for the properties with a Plumbing or Heating Service Request. 

SELECT PROPERTY_ID
	FROM SERVICE_REQUEST
		WHERE CATEGORY_NUMBER IN(
			SELECT CATEGORY_NUM
				FROM SERVICE_CATEGORY
				--WHERE CATEGORY_NUM = 1 OR CATEGORY_NUM = 2);
				WHERE CATEGORY_DESCRIPTION = 'Plumbing' OR CATEGORY_DESCRIPTION = 'Heating');
				--While the text based CATEGORY_DESCRIPTION query has higher odds of failure due to spelling/typos it will be easier at a glance to know what information is being pulled here
				--This query could technically be run without a subquery if the SERVICE_CATEGORY table is static/hardcoded

--7. Who are the Residents whose properties have more than 1200 SQR_FT 

SELECT FIRST_NAME, LASTNAME
	FROM RESIDENTS
		WHERE PROPERTY_ID IN(
			SELECT PROPERTY_ID
				FROM PROPERTY
				WHERE SQR_FT > 1200.00); 

--8. What is the AVERAGE EST_HOURS for all Service Requests in category "Electrical Systems"? 

SELECT AVG (EST_HOURS) AS AverageEstimatedHoursForElectricalSystemsServiceRequests
	FROM SERVICE_REQUEST
		WHERE CATEGORY_NUMBER IN(
			SELECT CATEGORY_NUM
				FROM SERVICE_CATEGORY
				WHERE CATEGORY_DESCRIPTION = 'Electrical Systems');

--9. How many properties have service requests for Painting or Framing? 

SELECT COUNT(DISTINCT PROPERTY_ID) AS NumberOfPropertiesWithPaintingOrFramingServiceRequests
--DISTINCT is used here so that if a PROPERTY_ID has more than one painting or service request it is still only counted once.
	FROM SERVICE_REQUEST
		WHERE CATEGORY_NUMBER IN(
			SELECT CATEGORY_NUM
				FROM SERVICE_CATEGORY
				WHERE CATEGORY_DESCRIPTION = 'Painting' OR CATEGORY_DESCRIPTION = 'Framing');

--The following queries must include an EXPRESSION (New calculated field): 

--10. List each Property ID and the Annual Rent for each (Monthly Rent * 12).  Be sure to create a new field in your query and call it "Annual Rent". 

SELECT PROPERTY_ID, MONTHLY_RENT * 12 AS 'Annual Rent'
	FROM PROPERTY;

--11. List each Property ID and the Monthly Rent per Sqr_Ft as "Price per Sqr Ft" 

SELECT PROPERTY_ID, MONTHLY_RENT / SQR_FT AS 'Price per Sqr Ft'
	FROM PROPERTY;

--12. List each Property ID whose rent is greater than the average rent for all properties. 

--SELECT AVG(MONTHLY_RENT) AS AvgMonthlyRent
	--FROM PROPERTY;

SELECT PROPERTY_ID
	FROM PROPERTY
		WHERE MONTHLY_RENT > (
			SELECT AVG(MONTHLY_RENT)
				FROM PROPERTY);