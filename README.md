# Task 4: Aggregate Functions and Grouping

##  Objective
Use aggregate functions and grouping to **summarize data**.

##  Tools
- **DB Browser for SQLite**  
- **MySQL Workbench**

##  Deliverables
- SQL queries using:
  - `SUM`
  - `COUNT`
  - `AVG`
  - `GROUP BY`

---

##  Hints / Mini Guide
1. Apply aggregate functions on numeric columns.
2. Use `GROUP BY` to categorize data.
3. Filter groups using `HAVING`.

---

##  Outcome
Ability to **summarize** and **analyze** tabular data efficiently.

---

##  Interview Questions
1. What is `GROUP BY`?
2. Difference between `WHERE` and `HAVING`?
3. How does `COUNT(*)` differ from `COUNT(column)`?
4. Can you group by multiple columns?
5. What is `ROUND()` used for?
6. How do you find the highest salary by department?
7. What is the default behavior of `GROUP BY`?
8. Explain `AVG` and `SUM`.
9. How to count distinct values?
10. What is an aggregate function?

---

## 🗝 Key Concepts
- **Aggregation**
- **Grouping**

---

##  Example Queries

- **Average price by category**
```sql
SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM products
GROUP BY category;
Total sales per region

sql
Copy
Edit
SELECT region, SUM(sales) AS total_sales
FROM orders
GROUP BY region;
Filter groups with HAVING

sql
Copy
Edit
SELECT department, COUNT(*) AS num_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;


