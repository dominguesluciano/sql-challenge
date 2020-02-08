/*List the following details of each employee: employee number, last name, first name, gender, and salary.*/
SELECT
	employees.emp_no,
	last_name,
	first_name,
	gender,
	salary
FROM
	employees
FULL OUTER JOIN
	salaries
ON employees.emp_no = salaries.emp_no;

/* List employees who were hired in 1986.*/
SELECT
*
FROM
employees
WHERE
DATE_TRUNC('year',hire_date) = '1986-01-01'
ORDER BY hire_date ASC

/*List the manager of each department with the following information: 
department number, department name, the manager's employee number, 
last name, first name, and start and end employment dates.*/
SELECT
	employees.first_name,
	employees.last_name,
	dept_manager.from_date,
	dept_manager.to_date,
	departments.dept_no,
	departments.dept_name
FROM employees
INNER JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments
ON departments.dept_no = dept_manager.dept_no


/* List the department of each employee with the following information:
employee number, last name, first name, and department name.*/
SELECT
	employees.emp_no,
	employees.first_name,
	employees.last_name,
	dept_emp.emp_no,
	dept_emp.to_date,
	departments.dept_no,
	departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no



/* List all employees whose first name is "Hercules" and last names begin with "B." */
SELECT * FROM employees WHERE first_name = 'Hercules' AND last_name ilike 'B%'

/* List all employees in the Sales department, including their
employee number, last name, first name, and department name*/
SELECT
	employees.emp_no,
	employees.first_name,
	employees.last_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'

/*List the manager of each department with the following information: 
department number, department name, the manager's employee number, 
last name, first name, and start and end employment dates.*/
SELECT
	employees.first_name,
	employees.last_name,
	dept_manager.from_date,
	dept_manager.to_date,
	departments.dept_no,
	departments.dept_name
FROM employees
INNER JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments
ON departments.dept_no = dept_manager.dept_no

/* In descending order, list the frequency count of employee last names, i.e.,
how many employees share each last name.*/
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC LIMIT 10


