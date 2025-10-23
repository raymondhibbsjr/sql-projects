# Sunrise Senior Center Database Project

This project represents the **Sunrise Senior Center (SSC) Database**, designed to manage residents, staff, programs, and facility resources.  
It demonstrates relational database design, population, and querying using **Microsoft SQL Server Management Studio (SSMS) 19**.

---

## Project Overview

The Sunrise Senior Center database models a realistic senior living center workflow, including:

- Resident information and room assignments  
- Staff assignments and program responsibilities  
- Program schedules and participation tracking  
- Facility rooms and resource management  

The database is fully normalized and includes referential integrity across all relationships.

---

## Files Included

| File | Description |
|------|-------------|
| `SSC_Create DB.sql` | Defines all database tables, primary keys, and foreign key relationships. Drops existing tables for a clean build. |
| `SSC_Insert Data.sql` | Populates the SSC database with example data for residents, staff, programs, rooms, and enrollments. |
| `SSC_Single Table Queries.sql` | Contains exercises that demonstrate **basic SQL querying techniques** on individual tables, including selecting columns, filtering with `WHERE`, ordering results, aggregations like `COUNT` and `AVG`, and simple calculations. |
| `SSC_Single Table Subqueries.sql` | Demonstrates **advanced querying techniques** using subqueries, expressions, and calculated fields to extract information across multiple tables or perform conditional analysis, including filtering by aggregated data and using `IN` with nested queries. |

---

## Concepts Demonstrated

- Relational database schema design and normalization  
- Primary and foreign key constraints  
- Referential integrity enforcement  
- Data population using realistic sample values  
- Use of `DROP TABLE IF EXISTS` for re-runnable scripts  
- Data organization for residents, staff, programs, and facility management  
- Service tracking and program participation modeling  
- **Basic SQL querying techniques**:  
  - Selecting columns with `SELECT`  
  - Filtering with `WHERE` and logical operators  
  - Sorting results with `ORDER BY`  
  - Aggregation with `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`  
- **Advanced SQL querying techniques**:  
  - Subqueries using `IN`, `EXISTS`, and nested `SELECT` statements  
  - Filtering and aggregation based on subquery results  
  - Using calculated fields and expressions (`MONTHLY_FEE * 12`, `MONTHLY_RENT / SQR_FT`)  
- Querying multiple tables with `JOIN` for relational insights  

---

## Database Entities

| Table | Description |
|-------|-------------|
| **RESIDENTS** | Stores residents’ personal information, room assignments, and program participation. |
| **STAFF** | Contains staff members, their roles, and program or room assignments. |
| **PROGRAMS** | Lists activities and schedules available to residents. |
| **ROOMS** | Tracks facility rooms, capacities, and resource allocations. |
| **ENROLLMENTS** | Links residents to the programs they participate in. |
| **STAFF_ASSIGNMENTS** | Tracks staff assignments to programs and rooms. |

---

## Example Query

```sql
-- Find all residents enrolled in the 'Yoga' program along with their assigned room
SELECT r.FIRST_NAME, r.LAST_NAME, p.PROGRAM_NAME, rm.ROOM_NUMBER
FROM RESIDENTS r
JOIN ENROLLMENTS e ON r.RESIDENT_ID = e.RESIDENT_ID
JOIN PROGRAMS p ON e.PROGRAM_ID = p.PROGRAM_ID
JOIN ROOMS rm ON r.ROOM_ID = rm.ROOM_ID
WHERE p.PROGRAM_NAME = 'Yoga'
ORDER BY r.LAST_NAME, r.FIRST_NAME;
