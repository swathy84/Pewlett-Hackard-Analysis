SELECT first_name,last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

--Skill-Drill queries to search for employees born in 1952
SELECT first_name,last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';


--Skill-Drill queries to search for employees born in 1953
SELECT first_name,last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

--Skill-Drill queries to search for employees born in 1954
SELECT first_name,last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

--Skill-Drill queries to search for employees born in 1955
SELECT first_name,last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';



-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

--Retirement eligibility considering hire_date
SELECT first_name,last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--Create a new table and export the queried data to it 
SELECT first_name,last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--to check the new table and its values 
SELECT * 
FROM retirement_info;

-- Joining retirement_info and dept_emp to get the number of emplyees presentyl working 
SELECT ri.emp_no,
		ri.frist_name,
		ri.last_name,
		de.to_date
FROM retirement_info as ri 
LEFT OUTER JOIN dept_emp as de 
ON ri.emp_no = de.emp_no;

--another way to join 
SELECT ri.emp_no,
		ri.first_name,
		ri.last_name,
		de.to_date
FROM retirement_info as ri 
LEFT JOIN dept_emp as de 
ON ri.emp_no = de.emp_no;


SELECT COUNT(ce.emp_no), 
			de.dept_no 
FROM current_temp as ce
LEFT JOIN dept_emp as de 
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;






SELECT ri.emp_no,
		ri.first_name,
		ri.last_name,
		de.to_date
INTO current_temp
FROM retirement_info as ri 
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date ='9999-01-01';





SELECT ri.emp_no,
		ri.first_name,
		ri.last_name,
		de.to_date
FROM retirement_info as ri 
LEFT OUTER JOIN dept_emp as de 
ON ri.emp_no = de.emp_no;



SELECT * FROM current_temp;

--Employee count by department number  . to get the count of emplyees for each department . 
SELECT COUNT(ce.emp_no), 
			de.dept_no 
FROM current_temp as ce
LEFT JOIN dept_emp as de 
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

-- To display the previous run query in order 
SELECT COUNT(ce.emp_no), 
			de.dept_no 
FROM current_temp as ce
LEFT JOIN dept_emp as de 
ON ce.emp_no = de.emp_no
GROUP BY de.`dept_no`
ORDER BY de.dept_no ;



--Changing the current_temp table name to current_emp.
ALTER TABLE current_temp
RENAME TO current_emp;

--Adding the new table import the data of count of employees
--and departments number from the query 
SELECT COUNT(ce.emp_no), 
			de.dept_no 
INTO retiring_emp
FROM current_emp as ce
LEFT JOIN dept_emp as de 
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no ;

SELECT * FROM retiring_emp;

SELECT * FROM salaries;

SELECT * FROM salaries
ORDER BY to_date DESC;

--List of Employee information
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		e.gender,
		s.salary,
		de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s 
ON e.emp_no =s.emp_no 
INNER JOIN dept_emp as de
ON e.emp_no =de.emp_no 
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

		
select * from  current_emp;		
		
-- List of manager for departmenet 
SELECT dm.dept_no,
		d.dept_name,
		dm.emp_no,
		ce.first_name,
		ce.last_name,
		dm.from_date,
		dm.to_date
INTO manager_info
FROM dept_manager as dm
	INNER JOIN departments AS d
		ON (dm.dept_no =d.dept_no)
	INNER JOIN current_emp AS ce
		ON (dm.emp_no = ce.emp_no);
		
-- Department retiries 
SELECT ce.emp_no,
		ce.first_name,
		ce.last_name,
		d.dept_name
INTO dept_info
FROM current_emp as ce
	INNER JOIN dept_emp AS de
		ON ce.emp_no = de.emp_no
	INNER JOIN departments AS d
		ON de.dept_no = d.dept_no;
		
SELECT * FROM retirement_info;

--Skill-Drill Create a query that will return only the information relevant to the Sales team. The requested list includes:
--Employee numbers
--Employee first name
--Employee last name
--Employee department name

SELECT ri.emp_no,
		ri.first_name, 
		ri.last_name,
		di.dept_name
INTO retirement_sales_info
FROM retirement_info as ri 
	INNER JOIN dept_info AS di
		ON ri.emp_no = di.emp_no
WHERE di.dept_name = 'Sales';



--SKILL Drill Create another query that will return the following information for the Sales and Development teams:
-- Employee numbers
-- Employee first name
-- Employee last name
-- Employee department name

SELECT ri.emp_no,
		ri.first_name,
		ri.last_name,
		di.dept_name
INTO retirement_sales_dev_info
FROM retirement_info AS ri
	INNER JOIN dept_info AS di
		ON ri.emp_no = di.emp_no
WHERE di.dept_name IN ('Sales','Development');
		