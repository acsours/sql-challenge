--Create new table
drop table if exists titles cascade; 

create table titles (
	title_id varchar not null,
	title varchar not null, 
	primary key(title_id) 
	);

-- import data

--verify successful data import
select * from titles;

drop table if exists employees cascade; 

--Create new table
create table employees (
	emp_no int not null,
	emp_title_id varchar not null,
	birth_date date not null, 
	first_name varchar not null, 
	last_name varchar not null,
	sex varchar not null,
	hire_date date not null,
	foreign key (emp_title_id) references titles(title_id),
	primary key (emp_no)
	);


-- Create tables and import data
--Drop table if exists
drop table if exists departments cascade;

--Create new table
create table departments (
    dept_no  varchar not null, 
    dept_name varchar not null,
	primary key(dept_no)
	);


drop table if exists dept_emp;

create table dept_emp (
	emp_no int not null, 
	dept_no varchar not null,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments (dept_no)
	);

alter table dept_emp add primary key (emp_no, dept_no);

select * from dept_emp;
--Drop table if exists
drop table if exists dept_manager;

--Create new table
create table dept_manager (
	dept_no varchar not null,
	emp_no int not null,
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no),
	primary key	(emp_no)
	);

--verify successful data import
select * from dept_manager;



--Drop table if exists
drop table if exists salaries;

--Create new table
create table salaries (
	emp_no int not null,
	salary int not null,
	foreign key (emp_no) references employees (emp_no),
	primary key (emp_no)
	);
	
select * from salaries;

