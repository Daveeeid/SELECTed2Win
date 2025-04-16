CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    join_date DATE
);

INSERT INTO employees (id, name, department, salary, join_date)  
VALUES (1, 'Alice', 'Sales', 4500, TO_DATE('2022-01-15', 'YYYY-MM-DD'));

INSERT INTO employees (id, name, department, salary, join_date)  
VALUES (2, 'Mucyo', 'Sales', 4700, TO_DATE('2021-03-10', 'YYYY-MM-DD'));

INSERT INTO employees (id, name, department, salary, join_date)  
VALUES (3, 'Alain', 'HR', 4900, TO_DATE('2020-06-01', 'YYYY-MM-DD'));

INSERT INTO employees (id, name, department, salary, join_date)  
VALUES (4, 'Dave', 'HR', 4900, TO_DATE('2021-05-22', 'YYYY-MM-DD'));

INSERT INTO employees (id, name, department, salary, join_date)  
VALUES (5, 'Emile', 'IT', 5200, TO_DATE('2023-01-10', 'YYYY-MM-DD'));

INSERT INTO employees (id, name, department, salary, join_date)  
VALUES (6, 'Frank', 'IT', 4700, TO_DATE('2022-04-18', 'YYYY-MM-DD'));

INSERT INTO employees (id, name, department, salary, join_date)  
VALUES (7, 'Grace', 'IT', 4700, TO_DATE('2022-06-30', 'YYYY-MM-DD'));

INSERT INTO employees (id, name, department, salary, join_date)  
VALUES (8, 'Cyusa', 'Sales', 4000, TO_DATE('2023-02-01', 'YYYY-MM-DD'));

























SELECT 
    id,
    name,
    department,
    salary,
    LAG(salary) OVER (ORDER BY salary) AS previous_salary,
    LEAD(salary) OVER (ORDER BY salary) AS next_salary,
    CASE 
        WHEN salary > LAG(salary) OVER (ORDER BY salary) THEN 'HIGHER'
        WHEN salary < LAG(salary) OVER (ORDER BY salary) THEN 'LOWER'
        ELSE 'EQUAL'
    END AS compare_with_previous,
    CASE 
        WHEN salary > LEAD(salary) OVER (ORDER BY salary) THEN 'HIGHER'
        WHEN salary < LEAD(salary) OVER (ORDER BY salary) THEN 'LOWER'
        ELSE 'EQUAL'
    END AS compare_with_next
FROM employees
ORDER BY salary;















SELECT 
    id,
    name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_in_dept,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank_in_dept
FROM employees
ORDER BY department, salary DESC;















