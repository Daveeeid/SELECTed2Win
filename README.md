Group Name: SELECTed2Win   
Names: MUHIRWA David 27436  
       IRADUKUNDA Oscar 26281

SQL Window Functions Project:
-----------------------------

This project demonstrates the use of SQL Window Functions to analyze employee data. It was built collaboratively as part of our coursework. All queries were written using SQL, and the dataset simulates a company's employee information.

Dataset Description
-------------------
We used a fictional employees table with the following columns:


Column	  |Description
---------------------------------------------------
id: Employee ID  
name: Employee Name  
department: Department name   
salary: Monthly salary in USD  
join_date: Date the employee joined  

**_Query 1: Compare Salary with Previous and Next_**  
Objective:  
Use LAG() and LEAD() to compare each employee’s salary to their previous and next colleague (by salary).  

SQL:  

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
    END AS compared_to_previous  
FROM employees;  

![image alt](https://github.com/Daveeeid/SELECTed2Win/blob/master/lag%20and%20lead.png?raw=true)

Application:
Used in salary growth tracking, performance reviews, or bonus eligibility analysis.

**_Query 2: Ranking Employees Within Each Department_**  
Objective:  
Compare RANK() vs DENSE_RANK() for employees grouped by department and sorted by salary.  
![image alt](https://github.com/Daveeeid/SELECTed2Win/blob/master/rank.png?raw=true)

Difference:   
-----------  
**RANK()** skips values after ties.  

**DENSE_RANK()** does not skip values for ties.  
**Application:**
Helpful in reward systems, rankings, and performance analysis within departments.

**_Query 3: Top 3 Salaries per Department_**

Objective:

Fetch the top 3 earners in each department using window ranking.

SQL:

![query 3](https://github.com/user-attachments/assets/e353ddc1-14c2-47fe-86b1-399585ffc727)

Note:

May return more than 3 rows if there are salary ties at the 3rd position.

Application:

Used in highlighting top performers in reports or recognition programs.

**_Query 4: Top 3 First 2 Employees per Department by Join Date_**

Objective:

Identify the earliest two employees who joined in each department.

SQL:


SELECT *  
FROM (  
    SELECT   
        id,  
        name,  
        department,  
        join_date,  
        ROW_NUMBER() OVER (PARTITION BY department ORDER BY join_date ASC) AS row_num  
    FROM employees  
) ranked  
WHERE row_num <= 2;  

![query 4](https://github.com/user-attachments/assets/c4519a5c-3c6d-47f2-b3e6-f3dea8c888d8)

Why ROW_NUMBER()?  

Guarantees exactly 2 employees per department without ties.

Application:

Useful for showcasing veteran staff or awarding loyalty programs.

**_Query 5: Query 5: Aggregation with Window Functions_**

Objective:

Calculate max salary per department and across the entire organization.

SQL:
       
![query 5](https://github.com/user-attachments/assets/579eb540-e227-432e-bdb8-b2ac9a257676)

Application:

Useful for comparing individuals to departmental and global salary benchmarks.

