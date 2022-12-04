-- For future queries

--select * from employees;

--my attempt below then the query from the module for all employees born between 52 and 55
/*
select * 
from employees
where birth_date BETWEEN '1952-01-01' and '1955-12-31';
*/
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

--1952 employees
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

--1953 employees
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

--1954 employees
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

--1955 employees
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

--birthyear and hiredate
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
And (hire_date Between '1985-01-01' AND '1988-12-31');

--total count
SELECT count(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
And (hire_date Between '1985-01-01' AND '1988-12-31');

--while there is a button to download the results of a query to a csv I will follow along for fun.
--the query below returns the info into a new table called retirement_info
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--drop table retirement_info;

--select * from retirement_info;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;
--same with alises
Select de.dept_name, dm.emp_no, dm.from_date, dm.to_date
from departments as de
join dept_manager as dm
on de.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no, retirement_info.first_name, retirement_info.last_name, dept_emp.to_date
From retirement_info
Left Join dept_emp
on retirement_info.emp_no = dept_emp.emp_no;
--same one with aliases
SELECT ri.emp_no, ri.first_name, ri.last_name, de.to_date
From retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no;

--current employees table
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
Into current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

--drop table current_emp;

--select * from current_emp;

-- Employee count by department number
SELECT de.dept_no, COUNT(ce.emp_no) as "Employees Per Department"
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
order by de.dept_no;
--order by "Employees Per Department" Desc;

--my attempt at employee salary list, tho the inital direcations failed to include the to_date in
--the list of columns they want
/*
select emp.emp_no,  emp.first_name, emp.last_name, emp.gender, sa.salary
from employees as emp
left join salaries as sa
on emp.emp_no = sa.emp_no
order by emp.emp_no;
*/
--employee salary list based on directions
SELECT e.emp_no,
	e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

select * from emp_info;


--management query
-- combining departments and dept_manager and employees.  I need dept_no(both tables),dept name (departments)
-- manager emp # (dept_manager), startdate, enddate (all dept_manager), last name, first name (employees)
--below is my attempt but I decided to go ahead and follow along with the module.
/*
select * 
from departments as de 
left join dept_manager as dm on de.dept_no = dm.dept_no
left join employees as em on dm.emp_no = em.emp_no;

select * from dept_manager left join dept_emp on dept_manager.emp_no = dept_emp.emp_no;
*/

-- List of managers per department per the module
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
--select *
--INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
select * from manager_info;
--When I noticed that the module based manager info had only 5 rows I wondered why.  It appears it is
--because not all the managers are in our retirement range emp_no 110039 is a manager but isn't on the list
--select * from current_emp where emp_no = 110039;

--Department Retirees
select * from current_emp;

SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
--select *
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

select * from dept_info;

-- tailored lists
select * from departments;

select * from dept_info where dept_name like '%Sales%';

select * from dept_info where dept_name in ('Sales','Development')