-- check counts to be sure no rows are lost
select 'employees' as table_s, count(*) as actual, 300024 as expected from employees
UNION ALL
select 'departments' as table_s, count(*) as actual, 9 as expected from departments
UNION ALL
select 'salaries' as table_s, count(*) as actual, 300024 as expected from salaries
UNION ALL
select 'titles' as table_s, count(*) as actual, 7 as expected from titles
UNION ALL
select 'dept_manager' as table_s, count(*) as actual, 24 as expected from dept_manager
UNION ALL
select 'dept_emp' as table_s, count(*) as actual, 331603 as expected from dept_emp;

/* List the employee number, last name, first name, sex, and salary of each employee */
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
from employees e
left join salaries s on e.emp_no=s.emp_no;


/* List the first name, last name, and hire date for the employees who were hired in 1986
 https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-extract/  */
select first_name, last_name, hire_date from employees 
where extract(Year from hire_date)=1986;

/*List the manager of each department along with their department number, 
department name, employee number, last name, and first name */
select e.emp_no, e.first_name, e.last_name, dm.dept_no, d.dept_name 
from dept_manager dm
join departments d on dm.dept_no=d.dept_no
join employees e on e.emp_no=dm.emp_no;



/* List the department number for each employee along with that employee’s employee number, 
last name, first name, and department name. */
select e.emp_no, e.first_name, e.last_name, d.dept_no, d.dept_name 
from employees e 
join dept_emp de on de.emp_no=e.emp_no
join departments d on d.dept_no=de.dept_no;


/*  List first name, last name, and sex of each employee 
whose first name is Hercules and whose last name begins with the letter B 
https://www.w3schools.com/sql/sql_like.asp */
select first_name, last_name, sex from employees where first_name='Hercules' and last_name like 'B%';


/* List each employee in the Sales department, 
including their employee number, last name, and first name
*/
select e.emp_no, e.first_name, e.last_name 
from departments d
join dept_emp de on d.dept_no=de.dept_no
join employees e on de.emp_no=e.emp_no
where d.dept_name='Sales';


/* List each employee in the Sales and Development departments, including 
their employee number, last name, first name, and department name
*/
select e.emp_no, e.first_name, e.last_name, d.dept_name 
from departments d
join dept_emp de on d.dept_no=de.dept_no
join employees e on de.emp_no=e.emp_no
where d.dept_name in ('Sales','Development');

/* List the frequency counts, in descending order, 
of all the employee last names (that is, how many employees share each last name)
*/
select last_name, count(last_name) as "number of employees" from employees
group by last_name
order by "number of employees" desc;

  -- for curiosity checking if there are employees without assignment to any department
select e.emp_no, de.dept_no from employees e
left join dept_emp de on de.emp_no=e.emp_no 
where de.dept_no is null

