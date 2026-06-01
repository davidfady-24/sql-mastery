/* =========================================================
   SQL WINDOW FUNCTIONS
   Author: David Fady
   Topic: OVER(), PARTITION BY, ORDER BY
   ========================================================= */


/* =========================================================
   1. SUM() OVER()
   Calculate total sales while keeping all rows visible
   ========================================================= */

SELECT
    month,
    sales,
    SUM(sales) OVER() AS total_sales
FROM sales_table;


/* =========================================================
   2. Running Total
   Creates a cumulative sum based on row order
   ========================================================= */

SELECT
    month,
    sales,
    SUM(sales) OVER(
        ORDER BY month
    ) AS running_total
FROM sales_table;


/* =========================================================
   3. PARTITION BY
   Calculate total salary for each department
   ========================================================= */

SELECT
    department,
    salary,
    SUM(salary) OVER(
        PARTITION BY department
    ) AS department_total
FROM employees;


/* =========================================================
   4. PARTITION BY + ORDER BY
   Running total inside each department
   ========================================================= */

SELECT
    department,
    salary,
    SUM(salary) OVER(
        PARTITION BY department
        ORDER BY salary
    ) AS running_department_total
FROM employees;


/* =========================================================
   5. COUNT() OVER()
   Count employees in each department
   ========================================================= */

SELECT
    department,
    employee_name,
    COUNT(*) OVER(
        PARTITION BY department
    ) AS employee_count
FROM employees;


/* =========================================================
   6. AVG() OVER()
   Calculate average salary per department
   ========================================================= */

SELECT
    department,
    salary,
    AVG(salary) OVER(
        PARTITION BY department
    ) AS average_salary
FROM employees;


/* =========================================================
   QUICK NOTES

   OVER()
       → Entire dataset

   PARTITION BY
       → Split data into groups

   ORDER BY
       → Running calculations

   PARTITION BY + ORDER BY
       → Running calculations within groups

   Window Functions keep all rows visible,
   unlike GROUP BY which collapses rows.
   ========================================================= */
