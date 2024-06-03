##code to create table
    
DROP TABLE IF EXISTS titles
DROP TABLE IF EXISTS departments
DROP TABLE IF EXISTS employees
DROP TABLE IF EXISTS dept_emp
DROP TABLE IF EXISTS dept_manager
DROP TABLE IF EXISTS salaries

create table departments(
	dept_no varchar (250) PRIMARY Key,
	dept_name varchar (250)
);
CREATE TABLE dept_emp(
emp_no varchar (250) NOT NULL,
dept_no VARCHAR (250) NOT NULL,
PRIMARY KEY (emp_no, dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
CREATE TABLE dept_manager(
dept_no VARCHAR (250)NOT NULL,
emp_no Varchar(250) NOT NULL,
PRIMARY KEY (dept_no, emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
CREATE TABLE employees(
emp_no varchar (250) PRIMARY KEY,
emp_title_id  VARCHAR (250) NOT NULL,
birth_date VARCHAR (250) NOT NULL,
first_name VARCHAR (250) NOT NULL,
last_name VARCHAR (250) NOT NULL,
sex VARCHAR (250) NOT NULL,
hire_date VARCHAR (250) NOT NULL,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
CREATE TABLE salaries(
emp_no Varchar (250) PRIMARY KEY,
salary INT NOT NULL,
FOREIGN KEY(emp_no)REFERENCES employees(emp_no)
);
CREATE TABLE titles(
title_id VARCHAR (250) PRIMARY KEY,
title VARCHAR (250) NOT NULL
);