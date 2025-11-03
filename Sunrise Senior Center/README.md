# SSC Property Management Database Project

This project models a **Property and Service Coordination System (SSC)** designed to manage property owners, residents, maintenance offices, and service requests.  
It demonstrates comprehensive SQL database development — including schema design, data population, and analytical querying — using **Microsoft SQL Server Management Studio (SSMS) 19**.

---

## Project Overview

The SSC database simulates a real-world property management company. It tracks:
- Ownership, rental properties, and office operations  
- Tenant and maintenance service data  
- Service categories and request tracking  
- Recursive relationships and SQL Views for simplified data retrieval  

This project highlights both **database design fundamentals** and **advanced SQL querying techniques**.

---

## Files Included

| File | Description |
|------|--------------|
| `SSC_Create DB.sql` | Builds the database schema, defines all tables, keys, and referential integrity constraints. |
| `SSC_Insert Data.sql` | Populates the SSC database with realistic data for owners, properties, offices, service categories, service requests, and residents. |
| `SSC_Single Table Queries.sql` | Contains single-table query examples demonstrating filtering, sorting, and simple aggregations. |
| `SSC_Single Table Subqueries.sql` | Includes more advanced examples using subqueries to derive insights from single tables. |
| `SSC_Recursion and Views.sql` | Demonstrates recursive SQL queries and creation of Views for reusable and hierarchical data access. |

---

## Concepts Demonstrated

- Relational database schema design  
- Table creation with primary and foreign keys  
- Referential integrity enforcement  
- Data insertion using realistic sample records  
- Single-table queries and filtering logic  
- Subqueries and derived result sets  
- Recursive queries and hierarchical relationships  
- Creation and use of **SQL Views** for simplified analysis  
- Data organization for property, tenant, and maintenance management  

---

## Database Entities

| Table | Description |
|--------|--------------|
| **OWNER / PROPOWNER** | Property owner contact and address information. |
| **PROPERTY** | Property listings with square footage, layout, and rent details. |
| **OFFICE** | Property management offices overseeing different regions. |
| **SERVICE_CATEGORY** | Categories of available maintenance and repair services. |
| **SERVICE_REQUEST** | Records of service issues, their descriptions, and repair status. |
| **RESIDENTS** | List of tenants associated with each property. |

---

## Example Query

```sql
-- Retrieve each office and the total number of service requests assigned to it
SELECT o.OFFICE_NAME, COUNT(s.SERVICE_ID) AS TotalRequests
FROM OFFICE o
JOIN SERVICE_REQUEST s ON o.OFFICE_NUM = s.OFFICE_ID
GROUP BY o.OFFICE_NAME
ORDER BY TotalRequests DESC;
