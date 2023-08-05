/* List the employee number, last name, first name, sex, and salary of each employee */

select e.emp_no "Employee Number",
e.last_name "Last Name",
e.first_name "First Name",
e.sex "Sex",
s.salary "Salary"
from employees e
inner join salaries s on e.emp_no=s.emp_no
order by "Employee Number";

/* List the first name, last name, and hire date for the employees who were hired in 1986 */
select e.first_name "First Name",
e.last_name "Last Name",
e.hire_date "Hire Date"
from employees e
where extract('Year'from hire_date)='1986';

/*List the manager of each department along with their department number, department name, employee number, last name, and first name */

select d.dept_no "Dept No",
d.dept_name "Dept Name",
e.emp_no "Emp No",
e.last_name "Last Name",
e.first_name "First Name"
from employees e
inner join dept_manager dm on e.emp_no=dm.emp_no
inner join departments d on d.dept_no=dm.dept_no;

/*List the department number for each employee along with that employee’s employee number, last name, first name, and department name */
select d.dept_no "Dept No",
e.emp_no "Emp No",
e.last_name "Last Name",
e.first_name "First Name",
d.dept_name "Dept Name"
from employees e
inner join dept_emp de on e.emp_no=de.emp_no
inner join departments d on d.dept_no=de.dept_no ;

/*List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B */
select e.first_name "First Name",
e.last_name "Last Name",
e.sex "Sex"
from employees e
where e.first_name='Hercules' and e.last_name like 'B%';

/*List each employee in the Sales department, including their employee number, last name, and first name */
select e.emp_no "Employee Number",
e.last_name "Last Name",
e.first_name "First Name"
from employees e
inner join dept_emp de on e.emp_no=de.emp_no
inner join departments d on d.dept_no=de.dept_no 
where d.dept_name='Sales';

/*List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name*/
select e.emp_no "Employee Number",
e.last_name "Last Name",
e.first_name "First Name",
d.dept_name "Department Name"
from employees e
inner join dept_emp de on e.emp_no=de.emp_no
inner join departments d on d.dept_no=de.dept_no 
where d.dept_name in ('Sales', 'Development');

/*List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) */
select last_name "Last Name",
count(last_name) "Frequency Count"
from employees
group by last_name
order by "Frequency Count" desc;