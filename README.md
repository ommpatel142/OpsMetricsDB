# OpsMetricsDB – SQL Inventory & Order Management System

OpsMetricsDB is a SQL Server–based backend database project that simulates a real-world inventory, order processing, and reporting system.  
The project demonstrates strong skills in database design, transactional integrity, stored procedures, and analytical queries.

This system reflects how inventory and orders are managed in production environments such as retail, logistics, and operations teams.

---

## Features

- Relational database schema with primary and foreign key constraints  
- Order placement handled using stored procedures and transactions  
- Automatic inventory updates with audit logging  
- Revenue, stock, and order analytics using SQL queries  
- Clean, structured execution flow for easy setup and testing  

---

## Database Structure

The database includes the following core tables:

- **Customers** – Stores customer details  
- **Products** – Stores product information and stock quantity  
- **Orders** – Tracks customer orders and order status  
- **OrderItems** – Stores line-level order data  
- **InventoryTransactions** – Logs stock changes  
- **AuditLog** – Records actions performed in the system  

---

## Project Structure

```
OpsMetricsDB/
│
├── 01_schema/
│   └── 01_create_tables.sql
│
├── 02_seed/
│   └── 02_seed_data.sql
│
├── 03_procedures/
│   └── 03_place_order_procedure.sql
│
├── 04_queries/
│   └── 04_reports.sql
```

---

## How to Run the Project

1. Open SQL Server Management Studio (SSMS)  
2. Create the database:
   ```sql
   CREATE DATABASE OpsMetricsDB;
   ```
3. Execute scripts in this order:
   1. `01_schema/01_create_tables.sql`
   2. `02_seed/02_seed_data.sql`
   3. `03_procedures/03_place_order_procedure.sql`
   4. `04_queries/04_reports.sql`

---

## Example Functionalities

### Place an Order
- Validates product stock availability  
- Inserts order and order items  
- Updates inventory quantities  
- Logs inventory transactions  
- Uses transactions for data consistency  

### Reporting Queries
- Total revenue per product  
- Low-stock product alerts  
- Customer order history  
- Order status overview  

---

## Technologies Used

- SQL Server (T-SQL)  
- Stored Procedures  
- Transactions & Error Handling  
- Joins, Aggregations, and Subqueries  

---

## Learning Outcomes

- Designed a normalized relational database  
- Implemented transactional business logic  
- Built real-world SQL analytics queries  
- Gained hands-on experience with inventory systems  

---

## Author

**Om Patel**  
Computer Engineering Technology Student – NAIT  
