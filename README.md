# sql-challenge
# Data Engineering and Analysis

## Project Overview

This project involves processing and analyzing employee data from multiple CSV files by building an entity-relationship diagram (ERD), defining table schemas, and performing SQL-based queries for detailed insights. Below is a step-by-step guide on the tasks performed.

### 1. **Entity-Relationship Diagram (ERD) & Table Schema**

The CSV files were analyzed, and based on the structure and relationships, an ERD was created using QuickDBD. The ERD helps visualize the relationships between the tables, and from it, the table schemas were derived. Each table's schema was designed with careful attention to primary keys, foreign keys, data types, and constraints.

#### Key Steps:
- **Primary Keys**: For columns with unique values, primary keys were directly assigned. For non-unique columns, composite primary keys were created by combining multiple columns.
- **Foreign Keys**: Foreign key relationships were established between tables based on the dependencies found in the ERD.
- **Data Types**: Appropriate data types (e.g., `INT`, `VARCHAR`, `DATE`, etc.) were assigned to each column based on the values in the CSVs.

### 2. **Table Creation & Data Import**

The tables were created in a specific order to handle foreign key constraints. Each CSV file was imported into the corresponding SQL table in the same order to ensure referential integrity.

### 3. 

### Step-by-Step Schema Creation

#### 1. Drop Tables if They Exist
First, to ensure a clean slate, we drop any existing tables that may conflict with the new table definitions.

```sql
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;
```

#### 2. Create Tables

We create each table in an order that respects foreign key dependencies.

##### **2.1 Create `titles` Table**
This table must be created first since the `employees` table has a foreign key dependency on it.

```sql
CREATE TABLE titles (
    title_id VARCHAR(250) PRIMARY KEY,
    title VARCHAR(250) NOT NULL
);
```

##### **2.2 Create `departments` Table**
The departments table is standalone and doesn't depend on any other tables.

```sql
CREATE TABLE departments (
    dept_no VARCHAR(250) PRIMARY KEY,
    dept_name VARCHAR(250) NOT NULL
);
```

##### **2.3 Create `employees` Table**
The employees table references the `titles` table, so it is created after `titles`.

```sql
CREATE TABLE employees (
    emp_no VARCHAR(250) PRIMARY KEY,
    emp_title_id VARCHAR(250) NOT NULL,
    birth_date VARCHAR(250) NOT NULL,
    first_name VARCHAR(250) NOT NULL,
    last_name VARCHAR(250) NOT NULL,
    sex VARCHAR(250) NOT NULL,
    hire_date VARCHAR(250) NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
```

##### **2.4 Create `salaries` Table**
The `salaries` table has a foreign key relationship with the `employees` table, so it must come after it.

```sql
CREATE TABLE salaries (
    emp_no VARCHAR(250) PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);
```

##### **2.5 Create `dept_emp` Table**
This is a junction table that links employees to departments, so it references both `employees` and `departments`.

```sql
CREATE TABLE dept_emp (
    emp_no VARCHAR(250) NOT NULL,
    dept_no VARCHAR(250) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
```

##### **2.6 Create `dept_manager` Table**
Finally, we create the `dept_manager` table, which references both the `departments` and `employees` tables.

```sql
CREATE TABLE dept_manager (
    dept_no VARCHAR(250) NOT NULL,
    emp_no VARCHAR(250) NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
```

### Summary of Table Creation

- **titles**: Holds employee titles.
- **departments**: Holds department information.
- **employees**: Holds employee information and links to their titles.
- **salaries**: Holds salary data for employees.
- **dept_emp**: Junction table that links employees to departments.
- **dept_manager**: Junction table that links department managers to departments.

This structure ensures referential integrity and maintains a normalized database design. You can now proceed to import the CSV data in the appropriate order (first `titles`, then `departments`, then `employees`, etc.) and ensure the correct foreign key relationships are maintained.

### 4. **Data Analysis Tasks**

Once the data was successfully imported, several queries were executed to extract meaningful insights from the dataset.

#### Key SQL Queries:

1. **List details of each employee**:
   - Query: Retrieve `employee number`, `last name`, `first name`, `sex`, and `salary`.

2. **List employees hired in 1986**:
   - Query: Retrieve `first name`, `last name`, and `hire date` for employees hired in 1986.

3. **List department managers**:
   - Query: Retrieve `department number`, `department name`, `manager's employee number`, `last name`, and `first name`.

4. **List department for each employee**:
   - Query: Retrieve `employee number`, `last name`, `first name`, and `department name`.

5. **List employees with first name "Hercules" and last names starting with "B"**:
   - Query: Retrieve `first name`, `last name`, and `sex` for employees meeting these conditions.

6. **List all employees in the Sales department**:
   - Query: Retrieve `employee number`, `last name`, `first name`, and `department name`.

7. **List all employees in the Sales and Development departments**:
   - Query: Retrieve `employee number`, `last name`, `first name`, and `department name` for employees in these departments.

8. **List frequency count of employee last names**:
   - Query: In descending order, list how many employees share each last name.

### Conclusion

This project involved building and normalizing the database structure, importing data, and analyzing employee information using SQL queries. Through this process, a clear understanding of the employee data and departmental structures was achieved. The queries provide insights into employee details, departments, managers, and other key information from the dataset.
