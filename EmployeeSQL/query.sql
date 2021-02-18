--List the following details of each employee: 
--employee number, last name, first name, sex, and salary.
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

select employees.first_name,
	   employees.last_name,
	   employees.hire_date
from employees
where 
	employees.hire_date between '1986-01-01' and '1986-12-31';



--List the manager of each department with the following information: 
---department number, department name, the manager's employee number, last name, first name.

select count(*) from dept_manager;

select dept_manager.dept_no,
	   departments.dept_name,
	   dept_manager.emp_no,
	   employees.last_name,
	   employees.first_name
from dept_manager
join departments
on departments.dept_no=dept_manager.dept_no
join employees 
on dept_manager.emp_no=employees.emp_no
order by dept_no;


--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select dept_emp.emp_no,
	   employees.last_name,
	   employees.first_name,
	   departments.dept_name
from dept_emp
join departments
on departments.dept_no=dept_emp.dept_no
join employees 
on dept_emp.emp_no=employees.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select employees.first_name, 
	   employees.last_name, 
	   employees.sex 
from employees
where first_name='Hercules' 
and last_name like 'B%'
order by last_name;

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
select employees.emp_no,
	   employees.last_name,
	   employees.first_name,
	   departments.dept_name
from employees
join dept_emp
on employees.emp_no=dept_emp.emp_no
join departments
on dept_emp.dept_no=departments.dept_no
where lower(departments.dept_name)='sales';


--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
create view employee_departments as
	select employees.emp_no,
		   employees.last_name,
		   employees.first_name,
		   departments.dept_name
	from employees
	join dept_emp
	on employees.emp_no=dept_emp.emp_no
	join departments
	on dept_emp.dept_no=departments.dept_no;

select * from employee_departments
where lower(employee_departments.dept_name)='sales';


--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

select * from employee_departments
where lower(employee_departments.dept_name)='sales'
or lower(employee_departments.dept_name)='development';


--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
select last_name, count(last_name) as frequency_count from employees
group by last_name
order by frequency_count desc;


--Epilogue
select * from employees where
employees.emp_no=499942;