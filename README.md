Group Name: SELECTed2Win

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



