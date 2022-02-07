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
