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

### 3. **Table Schema Overview**

Based on the CSV files and ERD, the following table schemas were created:

- **Employees Table**:
  - `employee_number` (INT, PRIMARY KEY)
  - `first_name` (VARCHAR)
  - `last_name` (VARCHAR)
  - `sex` (CHAR)
  - `hire_date` (DATE)

- **Departments Table**:
  - `department_number` (INT, PRIMARY KEY)
  - `department_name` (VARCHAR)

- **Salaries Table**:
  - `employee_number` (INT, FOREIGN KEY, REFERENCES Employees)
  - `salary` (INT)
  - `from_date` (DATE)
  - `to_date` (DATE)
  - PRIMARY KEY (`employee_number`, `from_date`)

- **Dept_Manager Table**:
  - `employee_number` (INT, FOREIGN KEY, REFERENCES Employees)
  - `department_number` (INT, FOREIGN KEY, REFERENCES Departments)
  - `from_date` (DATE)
  - `to_date` (DATE)
  - PRIMARY KEY (`employee_number`, `department_number`)

- **Dept_Emp Table**:
  - `employee_number` (INT, FOREIGN KEY, REFERENCES Employees)
  - `department_number` (INT, FOREIGN KEY, REFERENCES Departments)
  - PRIMARY KEY (`employee_number`, `department_number`)

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
