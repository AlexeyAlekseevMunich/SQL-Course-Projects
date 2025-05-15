# SQL-Course-Projects

This repository showcases my solutions to exams completed as part of a professional development program focused on SQL and Database Management with **VelpTEC GmbH**.

The program covered fundamental and advanced concepts of relational databases, database design, and practical application of SQL for data definition, manipulation, and querying.

## Repository Structure:

The coursework is organized into exam-specific folders:

*   **/exams**: Contains solutions for four SQL exams. Each exam is in its own subfolder, typically containing `.sql` script(s) or conceptual design files (like ER diagrams) and a dedicated `README.md` detailing the tasks and skills demonstrated.
    *   **Exam 1:** ER Modeling for a University Database - (Designing an Entity-Relationship model including entity types, attributes, relationships, cardinalities, dependent entities, and ISA relationships.)
    *   **Exam 2:** SQL DDL - Library Database Schema - (Creating tables (`Autor`, `Buch`, `Ausleihe`) with primary/foreign keys, constraints, and a custom domain type for genres.)
    *   **Exam 3:** SQL DQL - Customer and Order Data Analysis - (Writing complex SQL queries to extract information from `Kunden`, `Bestellungen`, `Produkte` tables, including filtering, sorting, joins, aggregations, and subqueries.)
    *   **Exam 4:** SQL - Data Integrity and Triggers for Warehouse Management - (Defining tables with integrity constraints, implementing a trigger to check stock levels, and creating an assertion for average price. Includes description of testing procedures.)

## Key SQL & Database Skills Demonstrated Across This Coursework:

*   **Relational Database Design:**
    *   Developing Entity-Relationship (ER) models, defining entity types, attributes, relationships (1:1, 1:n, n:m), cardinalities, optional/mandatory participation, dependent entities, and ISA (specialization/generalization) relationships.
    *   Translating conceptual models into logical relational database schemas.
*   **SQL Data Definition Language (DDL):**
    *   Creating tables (`CREATE TABLE`) with appropriate data types.
    *   Defining primary keys, foreign keys, and referential integrity.
    *   Implementing constraints: `NOT NULL`, `CHECK`, default values.
    *   (If applicable, based on SQL dialect for custom domain) Defining custom value ranges or types.
*   **SQL Data Manipulation Language (DML):**
    *   (Implied, as DQL and DDL are the focus of these exams, but understanding DML is fundamental).
*   **SQL Data Query Language (DQL):**
    *   Writing complex `SELECT` queries for data retrieval and analysis.
    *   Filtering data using `WHERE` clause with various conditions (e.g., `BETWEEN`, `LIKE`).
    *   Sorting results with `ORDER BY`.
    *   Using aggregate functions (`AVG`) with `GROUP BY` and filtering groups with `HAVING`.
    *   Utilizing subqueries and the `EXISTS` predicate.
    *   Performing calculations with scalar expressions.
*   **Advanced SQL & Database Integrity:**
    *   Implementing Triggers (`CREATE TRIGGER`) to enforce business rules (e.g., stock level checks).
    *   Defining Assertions (`CREATE ASSERTION`) to maintain database-wide integrity constraints.
    *   Understanding and describing methods for testing triggers and assertions.
*   **Database Concepts:**
    *   Strong understanding of data integrity and constraints.
