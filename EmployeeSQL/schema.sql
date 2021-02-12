-- Create tables and import data
--Drop table if exists
drop table if exists departments;

--Create new table
create table departments (
    dept_no  varchar, --should be a pk? 
    dept_name varchar,
	id serial primary key --should be a pk? 
	);

-- import data

--verify successful data import
select * from departments;


drop table if exists dept_emp;

create table dept_emp (
	emp_no int, --can't get this to work as primary key. it won't import the file.. i'ts b/c  one emp is working in multiple departements possibly, so it's not unique
	dept_no varchar,
	id serial primary key
	);

--
-- import data

--verify successful data import
select * from dept_emp;




--Drop table if exists
drop table if exists dept_manager;

--Create new table
create table dept_manager (
	dept_no varchar,
	emp_no int primary key	
	);

-- import data

--verify successful data import
select * from dept_manager;



--Drop table if exists
drop table if exists employees;

--Create new table
create table employees (
	emp_no int primary key,
	emp_title_id varchar,
	birth_date date, 
	first_name varchar, 
	last_name varchar,
	sex varchar,
	hire_date date	
	);

-- import data

--verify successful data import
select * from employees;



--Drop table if exists
drop table if exists salaries;

--Create new table
create table salaries (
	emp_no int primary key,
	salary int	
	);
---

-- import data

--verify successful data import
select * from salaries;


--Drop table if exists
drop table if exists titles;

--Create new table
create table titles (
	id serial primary key,
	title_id varchar,
	title varchar
	);

-- import data

--verify successful data import
select * from titles;

