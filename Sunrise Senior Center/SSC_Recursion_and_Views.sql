--Sunrise Senior Center
--Chapter 3 Textbook Extension B
--Recursion and Views
USE ONL02_Student3_DB;


--A.  
-- Figure 1 says to make the Referred_By value UNIQUE, but that wouldn't be possible given the table has residents in RESIDENT_ID with multiple references, such as RESIDENT_ID 20 with 8 references.
-- The nomencalture for this database from the create_insert SQL file is different from the question which is also different from the Figure so I am rewriting them to fit the current nomenclature already declared in the DB.

--DROP TABLE IF EXISTS RESIDENTS
--**note** use SSC_Create_Insert.sql to redeploy tables if table is dropped located in class folder\SQL Files

ALTER TABLE RESIDENTS
ADD REFERRED_BY INT NULL;

ALTER TABLE RESIDENTS
ADD CONSTRAINT REFERREDBYFK FOREIGN KEY (REFERRED_BY)
	REFERENCES RESIDENTS(RESIDENT_ID);

UPDATE RESIDENTS SET REFERRED_BY = 20 WHERE RESIDENT_ID = 1;
UPDATE RESIDENTS SET REFERRED_BY = 20 WHERE RESIDENT_ID = 2;
UPDATE RESIDENTS SET REFERRED_BY = 20 WHERE RESIDENT_ID = 3;
UPDATE RESIDENTS SET REFERRED_BY = 20 WHERE RESIDENT_ID = 4;
UPDATE RESIDENTS SET REFERRED_BY = 8 WHERE RESIDENT_ID = 5;
UPDATE RESIDENTS SET REFERRED_BY = 8 WHERE RESIDENT_ID = 6;
UPDATE RESIDENTS SET REFERRED_BY = 8 WHERE RESIDENT_ID = 7;
UPDATE RESIDENTS SET REFERRED_BY = 1 WHERE RESIDENT_ID = 8;
UPDATE RESIDENTS SET REFERRED_BY = 1 WHERE RESIDENT_ID = 9;
UPDATE RESIDENTS SET REFERRED_BY = 1 WHERE RESIDENT_ID = 10;
UPDATE RESIDENTS SET REFERRED_BY = 1 WHERE RESIDENT_ID = 12;
UPDATE RESIDENTS SET REFERRED_BY = 1 WHERE RESIDENT_ID = 13;
UPDATE RESIDENTS SET REFERRED_BY = 27 WHERE RESIDENT_ID = 14;
UPDATE RESIDENTS SET REFERRED_BY = 27 WHERE RESIDENT_ID = 15;
UPDATE RESIDENTS SET REFERRED_BY = 35 WHERE RESIDENT_ID = 16;
UPDATE RESIDENTS SET REFERRED_BY = 35 WHERE RESIDENT_ID = 17;
UPDATE RESIDENTS SET REFERRED_BY = 35 WHERE RESIDENT_ID = 18;
UPDATE RESIDENTS SET REFERRED_BY = 35 WHERE RESIDENT_ID = 19;
UPDATE RESIDENTS SET REFERRED_BY = 27 WHERE RESIDENT_ID = 20;
UPDATE RESIDENTS SET REFERRED_BY = 27 WHERE RESIDENT_ID = 21;
UPDATE RESIDENTS SET REFERRED_BY = 27 WHERE RESIDENT_ID = 22;
UPDATE RESIDENTS SET REFERRED_BY = 13 WHERE RESIDENT_ID = 23;
UPDATE RESIDENTS SET REFERRED_BY = 13 WHERE RESIDENT_ID = 24;
UPDATE RESIDENTS SET REFERRED_BY = 13 WHERE RESIDENT_ID = 25;
UPDATE RESIDENTS SET REFERRED_BY = 13 WHERE RESIDENT_ID = 26;
UPDATE RESIDENTS SET REFERRED_BY = NULL WHERE RESIDENT_ID = 27;
UPDATE RESIDENTS SET REFERRED_BY = 1 WHERE RESIDENT_ID = 28;
UPDATE RESIDENTS SET REFERRED_BY = 1 WHERE RESIDENT_ID = 29;
UPDATE RESIDENTS SET REFERRED_BY = 1 WHERE RESIDENT_ID = 30;
UPDATE RESIDENTS SET REFERRED_BY = 1 WHERE RESIDENT_ID = 31;
UPDATE RESIDENTS SET REFERRED_BY = 20 WHERE RESIDENT_ID = 32;
UPDATE RESIDENTS SET REFERRED_BY = 20 WHERE RESIDENT_ID = 33;
UPDATE RESIDENTS SET REFERRED_BY = 20 WHERE RESIDENT_ID = 34;
UPDATE RESIDENTS SET REFERRED_BY = 20 WHERE RESIDENT_ID = 35;
UPDATE RESIDENTS SET REFERRED_BY = NULL WHERE RESIDENT_ID = 36;
UPDATE RESIDENTS SET REFERRED_BY = NULL WHERE RESIDENT_ID = 37;

--combination of UPDATE along with SET from 3.10: SQL for DML, also here is an example on Microsoft I found after I figured out how to make it work:
--https://learn.microsoft.com/en-us/ssms/visual-db-tools/create-update-queries-visual-database-tools?view=sql-server-ver17


--B. The Office at Sunrise forgot to add the lease term information to the RESIDENTS table.  Use the column characteristics in Figure 3 to add the new column and the data from Figure 4 to populate the new column.
--Be very mindful of the column characteristics and how they will alter your approach from step A. 

ALTER TABLE RESIDENTS
ADD LEASE_TERM_YRS INT NOT NULL DEFAULT 0;
--I could either set a default value for not null, or MODIFY the LEASE_TERM_YRS INT value to contain NOT NULL after entry, or set DEFAULT 0 to make it work now, also with default zero you have the potential to
--keep potential residents or previous residents in the DB that can be auto-removed from tables with tasks if you put in a registered date when the default was set to 0 to move the data to another table such as expired lease
--terms table for potential follow-up and for record-keeping for legal coverage, considering this is a senior center, it should be held for much longer for HIPAA related documentation

UPDATE RESIDENTS SET LEASE_TERM_YRS = 1 WHERE RESIDENT_ID = 1;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 1 WHERE RESIDENT_ID = 2;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 1 WHERE RESIDENT_ID = 3;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 1 WHERE RESIDENT_ID = 4;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 1 WHERE RESIDENT_ID = 5;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 1 WHERE RESIDENT_ID = 6;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 1 WHERE RESIDENT_ID = 7;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 2 WHERE RESIDENT_ID = 8;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 2 WHERE RESIDENT_ID = 9;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 1 WHERE RESIDENT_ID = 10;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 1 WHERE RESIDENT_ID = 12;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 1 WHERE RESIDENT_ID = 13;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 2 WHERE RESIDENT_ID = 14;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 2 WHERE RESIDENT_ID = 15;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 3 WHERE RESIDENT_ID = 16;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 3 WHERE RESIDENT_ID = 17;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 3 WHERE RESIDENT_ID = 18;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 3 WHERE RESIDENT_ID = 19;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 1 WHERE RESIDENT_ID = 20;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 1 WHERE RESIDENT_ID = 21;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 1 WHERE RESIDENT_ID = 22;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 2 WHERE RESIDENT_ID = 23;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 2 WHERE RESIDENT_ID = 24;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 2 WHERE RESIDENT_ID = 25;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 2 WHERE RESIDENT_ID = 26;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 5 WHERE RESIDENT_ID = 27;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 2 WHERE RESIDENT_ID = 28;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 2 WHERE RESIDENT_ID = 29;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 1 WHERE RESIDENT_ID = 30;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 1 WHERE RESIDENT_ID = 31;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 3 WHERE RESIDENT_ID = 32;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 3 WHERE RESIDENT_ID = 33;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 3 WHERE RESIDENT_ID = 34;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 3 WHERE RESIDENT_ID = 35;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 5 WHERE RESIDENT_ID = 36;
UPDATE RESIDENTS SET LEASE_TERM_YRS = 5 WHERE RESIDENT_ID = 37;


--C. Write an SQL SELECT statement to create a query on the recursive relationship in the RESIDENTS table that shows each resident’s FirstName (as ResFirstName), LastName (as ResLastName) and Property_ID
--followed by the name of the resident who referred him or her to SSC using the referring resident’s FirstName (as ReferrerFirstName) and LastName (as ReferrerLastName).  

--Do not include residents who were not referred by another customer. 

SELECT R.FIRST_NAME AS ResFirstName,
	R.LASTNAME AS ResLastName,
	R.PROPERTY_ID,
	REF.FIRST_NAME AS ReferrerFirstName,
	REF.LASTNAME AS ReferrerLastName
FROM RESIDENTS AS R
JOIN RESIDENTS AS REF
ON R.REFERRED_BY = REF.RESIDENT_ID
ORDER BY R.RESIDENT_ID;

--page 559 in textbook


--D. repeat step C but...
--DO include customers who were not referred by another customer. 
--left join

SELECT 
    R.FIRST_NAME AS ResFirstName,
    R.LASTNAME AS ResLastName,
    R.PROPERTY_ID,
    REF.FIRST_NAME AS ReferrerFirstName,
    REF.LASTNAME AS ReferrerLastName
FROM RESIDENTS AS R 
LEFT JOIN RESIDENTS AS REF
    ON R.REFERRED_BY = REF.RESIDENT_ID
ORDER BY R.RESIDENT_ID;


--E. Take the query from Part B and create a view named Referral_List_View.  
--Using the Referral_List_ View and the information provided in Part A and Part B, 
--write a second query that sums up all the referral dollars each resident received as a bonus.   

CREATE VIEW Referral_List_View AS
SELECT 
    R.FIRST_NAME AS ResFirstName,
    R.LASTNAME AS ResLastName,
    R.PROPERTY_ID,
    REF.FIRST_NAME AS ReferrerFirstName,
    REF.LASTNAME AS ReferrerLastName,
    REF.RESIDENT_ID AS ReferrerID,
    R.LEASE_TERM_YRS
FROM RESIDENTS AS R 
LEFT JOIN RESIDENTS AS REF
    ON R.REFERRED_BY = REF.RESIDENT_ID;

--Second query for referral bonus in dollars for each resident that recieved bonus

SELECT 
    ReferrerFirstName,
    ReferrerLastName,
    ReferrerID,
    COUNT(*) AS NumberOfReferralsTwoYearsOrMore,
    COUNT(*) * 500 AS TotalReferralBonus
FROM Referral_List_View
WHERE ReferrerID IS NOT NULL
	AND LEASE_TERM_YRS >= 2
GROUP BY ReferrerID, ReferrerFirstName, ReferrerLastName
ORDER BY TotalReferralBonus DESC, ReferrerLastName;