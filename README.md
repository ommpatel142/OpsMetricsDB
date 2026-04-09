# 🗄️ OpsMetricsDB – SQL Inventory & Order Management System

OpsMetricsDB is a SQL Server–based backend database project that simulates a real-world inventory and order processing system. It demonstrates database design, transactional integrity, stored procedures, and analytical reporting.

---

## 📌 Overview
This project was designed to replicate how inventory and order workflows operate in real production environments such as retail and logistics systems. It focuses on maintaining data consistency, handling transactions safely, and generating meaningful business insights through SQL queries.

---

## 🚀 Features
- Normalized relational database schema with constraints  
- Order processing using stored procedures and transactions  
- Automatic inventory updates with audit logging  
- Analytical queries for revenue, stock levels, and order tracking  
- Modular and structured SQL script organization  

---

## 🏗️ Database Structure

Core tables include:

- **Customers** – Stores customer details  
- **Products** – Stores product information and stock levels  
- **Orders** – Tracks orders and their status  
- **OrderItems** – Stores item-level order details  
- **InventoryTransactions** – Logs stock changes  
- **AuditLog** – Records system operations for traceability  

---

## 📂 Project Structure
OpsMetricsDB/
│
├── 01_schema/
│ └── 01_create_tables.sql
│
├── 02_seed/
│ └── 02_seed_data.sql
│
├── 03_procedures/
│ └── 03_place_order_procedure.sql
│
├── 04_queries/
│ └── 04_reports.sql


---

## ⚙️ How It Works
- The database enforces relationships using primary and foreign keys  
- Orders are processed through a stored procedure  
- Transactions ensure all operations succeed or rollback safely  
- Inventory updates are tracked through logging tables  
- Reporting queries provide insights into system performance  

---

## ▶️ How to Run

1. Open SQL Server Management Studio (SSMS)  
2. Create the database:
   ```sql
   CREATE DATABASE OpsMetricsDB;
3.Execute scripts in the following order:

01_create_tables.sql
02_seed_data.sql
03_place_order_procedure.sql
04_reports.sql
