# 🚗 Vehicle Rental System - Database Design & SQL Queries

![Database](https://img.shields.io/badge/Database-SQL-blue)
![Language](https://img.shields.io/badge/Language-SQL-lightgrey)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

## 📖 Overview

The **Vehicle Rental System** is a structured database system designed to manage **users, vehicles, and bookings** efficiently.  
It demonstrates real-world database management concepts including:

- Designing **ERD with 1:1, 1:N, N:1 relationships**
- Proper use of **Primary Keys (PK)** and **Foreign Keys (FK)**
- Writing **complex SQL queries** using `JOIN`, `EXISTS`, `WHERE`, `GROUP BY`, and `HAVING`

This project is perfect for learning database design and query optimization in a practical scenario.

---

## 🗂 Table of Contents

1. [Database Design](#database-design)
   - [Users Table](#1-users)
   - [Vehicles Table](#2-vehicles)
   - [Bookings Table](#3-bookings)
2. [Relationships](#relationships)
3. [SQL Queries](#sql-queries)
4. [Submission Requirements](#submission-requirements)
5. [Author](#author)
6. [Notes](#notes)

---

## 🏗 Database Design

### 1️⃣ Users

Stores system users including **Admin** and **Customer** roles.

| Column Name | Data Type | Constraints               |
| ----------- | --------- | ------------------------- |
| `id`        | INT       | PK, AUTO_INCREMENT        |
| `role`      | VARCHAR   | NOT NULL (Admin/Customer) |
| `name`      | VARCHAR   | NOT NULL                  |
| `email`     | VARCHAR   | UNIQUE, NOT NULL          |
| `password`  | VARCHAR   | NOT NULL                  |
| `phone`     | VARCHAR   | NULLABLE                  |

---

### 2️⃣ Vehicles

Stores information about vehicles available for rent.

| Column Name       | Data Type | Constraints                             |
| ----------------- | --------- | --------------------------------------- |
| `id`              | INT       | PK, AUTO_INCREMENT                      |
| `name`            | VARCHAR   | NOT NULL                                |
| `type`            | VARCHAR   | NOT NULL (car/bike/truck)               |
| `model`           | VARCHAR   | NOT NULL                                |
| `registration_no` | VARCHAR   | UNIQUE, NOT NULL                        |
| `rental_price`    | DECIMAL   | NOT NULL                                |
| `availability`    | VARCHAR   | NOT NULL (available/rented/maintenance) |

---

### 3️⃣ Bookings

Stores details of vehicle bookings made by users.

| Column Name  | Data Type | Constraints                                      |
| ------------ | --------- | ------------------------------------------------ |
| `id`         | INT       | PK, AUTO_INCREMENT                               |
| `user_id`    | INT       | FK → Users(id)                                   |
| `vehicle_id` | INT       | FK → Vehicles(id)                                |
| `start_date` | DATE      | NOT NULL                                         |
| `end_date`   | DATE      | NOT NULL                                         |
| `status`     | VARCHAR   | NOT NULL (pending/confirmed/completed/cancelled) |
| `total_cost` | DECIMAL   | NOT NULL                                         |

---

## 🔗 Relationships

- **One-to-Many:** A user can have multiple bookings.
- **Many-to-One:** Multiple bookings can refer to the same vehicle.
- **One-to-One (Logical):** Each booking is linked to exactly one user and one vehicle.

> 💡 **Tip:** Ensure your ERD highlights **PKs, FKs, cardinality, and status fields** clearly.

---

## 🛠 SQL Queries

### Query 1: JOIN

Retrieve booking information along with customer and vehicle names.

```sql
SELECT
    b.id AS booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status,
    b.total_cost
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.id
INNER JOIN Vehicles v ON b.vehicle_id = v.id;
```
