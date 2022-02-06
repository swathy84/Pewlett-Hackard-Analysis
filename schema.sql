 select * from departments;
 -- creating talbes for PH-EmployeeDB 
 CREATE TABLE titles( emp_no INT NOT NULL, title VARCHAR NOT NULL, from_date DATE NOT NULL, to_date DATE NOT NULL, FOREIGN KEY (emp_no) REFERENCES employees(emp_no), PRIMARY KEY (emp_no,title,from_date) );
 -- creating talbes for PH-EmployeeDB 
 CREATE TABLE dept_emp( emp_no INT NOT NULL, dept_no VARCHAR NOT NULL, from_date DATE NOT NULL, to_date DATE NOT NULL, FOREIGN KEY (emp_no) REFERENCES employees(emp_no), FOREIGN KEY (dept_no) REFERENCES departments(dept_no), PRIMARY KEY (emp_no, dept_no) );
  -- creating talbes for PH-EmployeeDB 
 CREATE TABLE salaries( emp_no INT NOT NULL, salary INT NOT NULL, from_date DATE NOT NULL, to_date DATE NOT NULL, FOREIGN KEY (emp_no) REFERENCES employees(emp_no), PRIMARY KEY (emp_no) );
 -- creating talbes for PH-EmployeeDB 
 CREATE TABLE dept_manager( dept_no VARCHAR(4) NOT NULL, emp_no INT NOT NULL, from_date DATE NOT NULL, to_date DATE NOT NULL, FOREIGN KEY (emp_no) REFERENCES employees(emp_no), FOREIGN KEY (dept_no) REFERENCES departments (dept_no), PRIMARY KEY (emp_no, dept_no) );
 -- creating talbes for PH-EmployeeDB 
 CREATE TABLE Employees( emp_no int NOT NULL, birth_date date NOT NULL, first_name varchar NOT NULL, last_name varchar NOT NULL, gender varchar NOT NULL, hire_date date NOT NULL, PRIMARY KEY (emp_no) );
 -- creating talbes for PH-EmployeeDB 
 CREATE TABLE Departments( dept_no varchar(4) NOT NULL, dept_name varchar(20) NOT NULL, PRIMARY KEY (dept_no), UNIQUE (dept_name) );
 -- creating talbes for PH-EmployeeDB
  CREATE TABLE Departments( dept_no varchar(4) NOT NULL, dept_name varchar(20) NOT NULL, PRIMARY KEY (dept_no), UNIQUE (dept_name) );