SELECT *
FROM "Employees"
LIMIT (5);

SELECT *
FROM "Departments"
LIMIT (5);

SELECT *
FROM "Dept_Emp"
LIMIT (5);


SELECT *
FROM "Dept_Managers"
LIMIT (5);

SELECT *
FROM "Salaries"
LIMIT (5);

SELECT *
FROM "Titles"
LIMIT (5);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 1. List the following details of each employee: employee number, 
-- last name, first name, sex, and salary.
SELECT "Employees".emp_no AS Employee_Number, "Employees".last_name, "Employees".first_name, "Employees".sex, "Salaries".salary
FROM "Employees"
JOIN "Salaries" ON "Employees".emp_no = "Salaries".emp_no
LIMIT 5;





-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT "Employees".first_name, "Employees".last_name, "Employees".hire_date
FROM "Employees"
WHERE "Employees".hire_date > '1986-1-1'::date AND "Employees".hire_date < '1987-1-1'::date
LIMIT 5;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT "Dept_Managers".dept_no,"Departments".dept_name, "Dept_Managers".emp_no,"Employees".last_name,"Employees".first_name
FROM "Dept_Managers"
JOIN "Employees"
ON "Dept_Managers".emp_no = "Employees".emp_no
JOIN "Departments" 
ON "Dept_Managers".dept_no = "Departments".dept_no
LIMIT 5;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_Emp" 
ON "Employees".emp_no = "Dept_Emp".emp_no
JOIN "Departments" 
ON "Dept_Emp".dept_no = "Departments".dept_no
LIMIT 5;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 5. List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
SELECT "Employees".first_name, "Employees".last_name, "Employees".sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
LIMIT 5;


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_Emp" 
ON "Employees".emp_no = "Dept_Emp".emp_no
JOIN "Departments" 
ON "Dept_Emp".dept_no = "Departments".dept_no
WHERE "Departments".dept_name = 'Sales'
LIMIT 5;



-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_Emp" 
ON "Employees".emp_no = "Dept_Emp".emp_no
JOIN "Departments" 
ON "Dept_Emp".dept_no = "Departments".dept_no
WHERE "Departments".dept_name = 'Sales' OR "Departments".dept_name = 'Development'
LIMIT 5;



-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
SELECT "Employees".last_name, Count (*)
FROM "Employees"
GROUP BY "Employees".last_name
ORDER BY Count (*) DESC;
