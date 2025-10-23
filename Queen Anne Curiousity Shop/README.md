# The Queen Anne Curiosity Shop – SQL Database Project

This project models and analyzes data for a fictional small business: **The Queen Anne Curiosity Shop**, an antiques and specialty furniture store.  
It demonstrates **database design, data insertion, and multi-table query logic** using **T-SQL (Microsoft SQL Server)**.

---

## Project Overview

The project consists of:
- **Database schema design** with referential integrity constraints.
- **Data population scripts** for customers, employees, vendors, items, and sales.
- **Multi-table analytical queries** showcasing joins, subqueries, grouping, and filtering.

This was built as part of a database programming exercise to strengthen real-world SQL skills in data modeling and relational logic.

---

## Files Included

| File | Description |
|------|--------------|
| `TheQueenAnneCuriosityShop_CreateDB.sql` | Creates all database tables, defines keys, and establishes relationships. |
| `TheQueenAnneCuriosityShop_AddData.sql` | Populates the database with sample data for customers, employees, vendors, items, and sales transactions. |
| `TheQueenAnneCuriosityShop_MultipleTableQueries_Part1.sql` | Contains query exercises using subqueries and joins to retrieve customer, item, and sales insights. |
| `TheQueenAnneCuriosityShop_MultipleTableQueries_Part2.sql` | Expands on analysis with aggregate functions, business logic (like contests and promotions), and left joins. |

---

## Concepts Demonstrated

- Database normalization and referential integrity
- Table creation with primary and foreign keys
- Data insertion using realistic business records
- Aggregate functions (`SUM`, `AVG`, `COUNT`, `MAX`)
- Multi-table joins (`INNER JOIN`, `LEFT JOIN`)
- Subqueries and correlated queries
- `GROUP BY` and `HAVING` for summarization
- Filtering with `WHERE` and `LIKE` operators

---

## Technology Used

- **SQL Server: SSMS 19 (T-SQL dialect)**
- Tested with: `ONL02_Student3_DB` database environment
- Compatible with most SQL Server versions (2019+)

---

## Example Query

```sql
-- List all customers who have purchased items from vendors
-- whose company name starts with 'L'
SELECT DISTINCT c.LastName, c.FirstName, c.CustomerID, c.Phone
FROM CUSTOMER c
JOIN SALE s ON c.CustomerID = s.CustomerID
JOIN SALE_ITEM si ON s.SaleID = si.SaleID
JOIN ITEM i ON si.ItemID = i.ItemID
JOIN VENDOR v ON i.VendorID = v.VendorID
WHERE v.CompanyName LIKE 'L%';
