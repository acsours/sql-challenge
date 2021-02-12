--List the following details of each employee: employee number, last name, first name, sex, and salary.
select * from employees;
select * from salaries;

select count(emp_no) from employees; --300024
select count(emp_no)from salaries; --30024

select employees.emp_no, 
	   employees.last_name, 
	   employees.first_name, 
	   employees.sex, 
	   salaries.salary
from employees
join salaries
on employees.emp_no=salaries.emp_no;
--List first name, last name, and hire date for employees who were hired in 1986.
select * from employees;

select employees.last_name,
	   employees.first_name,
	   employees.hire_date
from employees
where (select extract(year from hire_date) from employees) = 1986;

--below returns hire_year--> how to use this to filter? 

select extract(year from hire_date) from employees
order by date_part;

--List the manager of each department with the following information: 
---department number, department name, the manager's employee number, last name, first name.
--> join dept_manager and departemnts on dept_no
/*this first join shows each manager's employee number, department name and number
select dept_manager.dept_no,
	   dept_manager.emp_no,
	   departments.dept_name
from dept_manager
join departments
on departments.dept_no=dept_manager.dept_no
*/



select dept_manager.dept_no,
	   departments.dept_name,
	   dept_manager.emp_no,
	   employees.last_name,
	   employees.first_name
from dept_manager
join departments
on departments.dept_no=dept_manager.dept_no
join employees --> join that with employees in order to get last and first name
on dept_manager.emp_no=employees.emp_no


--List the department of each employee with the following information: employee number, last name, first name, and department name.
select * from dept_emp;
select * from employees;
select * from departments;
employees.emp_no
employees.last_name
employees.first_name
dept_emp.emp_no
dept_emp.dept_no
departments.dept_no
departments.dept_name
--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select employees.first_name, 
	   employees.last_name, 
	   employees.sex 
from employees
where first_name='Hercules' 
and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as name_count from employees
group by last_name
order by name_count desc;
