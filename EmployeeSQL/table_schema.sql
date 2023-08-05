 drop table if exists dept_emp;
 
 drop table if exists dept_manager;
 
 drop table if exists salaries;
 
 drop table if exists employees;
 
 drop table if exists departments;
 
 drop table if exists titles;


create table titles
(
	title_id varchar(10) primary key NOT NULL,
	title varchar(25) NOT NULL
);

create table departments
(
	dept_no varchar(5) primary key NOT NULL,
	dept_name varchar(25) NOT NULL
);

create table employees
(
	emp_no int primary key NOT NULL,
	emp_title_id varchar(10) NOT NULL,
	birth_date Date NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	sex varchar(1) NOT NULL,
	hire_date date NOT NULL,
	Foreign key (emp_title_id) References Titles (title_id)
);

create table salaries
(
	emp_no int NOT NULL,
	salary int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

create table dept_manager
(
	dept_no varchar(5) NOT NULL,
	emp_no int NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

create table dept_emp
(
	emp_no int NOT NULL,
	dept_no varchar(5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

