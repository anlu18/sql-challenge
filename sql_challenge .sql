##1 Employee #,last_name,first_name,sex & salary
select emp_no,last_name,first_name,sex
from employees

select salary
from salaries

#join two tables
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

##2 select first_name,last_name,hire_date
from employees
##maybes
where hire_date  '01/01/1986' and '12/31/1986';
##maybes
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

##not finished need to come back

##3 Manager of each department with dept_no, dept_name,emp_no,
## first_name,last_name
##prework
select dept_no,emp_no
from dept_manager

select dept_no,dept_name
from departments

select emp_no,first_name,last_name
from employees
##merger
SELECT dm.dept_no, dm.emp_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

##4 department # for employee with employee #, last name, first name, department name
##prework
select emp_no,first_name,last_name
from employees

select emp_no, dept_no
from dept_emp
	
select dept_no,dept_name
from departments
##merger
SELECT e.emp_no, e.first_name, e.last_name, de.dept_no, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

##5  first_name, last_name, and sex. For each employee whose first_name == 'Hercules'
##   And whose last_name starts with 'B'
select first_name,last_name,sex
from employees
where first_name = 'Hercules'
AND last_name LIKE 'B%';


##6 each employee in the sales department: emp_no,last_name,first_name
##prework
select emp_no,last_name,first_name
from employees

select emp_no,dept_no
from dept_emp

select dept_no,dept_name
from departments
where dept_name = 'Sales'

##merger
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

##7 employee in sales & development department including empo_no, last_name,first_name
##  & dept_name
##prework
select emp_no,last_name,first_name
from employees

select emp_no,dept_no
from dept_emp

select dept_no,dept_name
from departments
where dept_name = 'Sales'
or dept_name = 'Development'

##merger
SELECT e.emp_no, e.last_name, e.first_name,d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

##8 FRENQUENCEY COUNT IN DECENDING ORDER OF ALL THE EMPLOYEE BY LAST NAME 
SELECT last_name, COUNT(*) AS frequency_counts
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;
##CLEAN UP FOR NAME dAstous to fix order

UPDATE employees
SET last_name = CONCAT(UPPER(SUBSTRING(last_name, 1, 1)), LOWER(SUBSTRING(last_name, 2)))
WHERE last_name = 'dAstous';



