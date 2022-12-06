---------------------------------Deliverable 1

-- I wrote this query just trying to anticipate the direction to use the distinct on clause.
-- It essentially skips the required steps from the challenge.  I'll now try and follow along and make sure
--I have all necessary tables and csv files
/*
SELECT Distinct on (tt.emp_no) tt.emp_no, e.first_name, e.last_name, tt.title, tt.from_date, tt.to_date
FROM employees as e
inner join titles as tt
on e.emp_no = tt.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by tt.emp_no, tt.to_date desc;

select distinct on (emp_no) emp_no, title, from_date, to_date from titles
order by emp_no, to_date desc;

select * from titles;

*/

--Following along again

SELECT tt.emp_no, e.first_name, e.last_name, tt.title, tt.from_date, tt.to_date
INTO retirement_titles
FROM employees as e
inner join titles as tt
on e.emp_no = tt.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by tt.emp_no;

select * from retirement_titles;

select distinct on (emp_no) emp_no, first_name, last_name, title
from retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
--INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

select * from unique_titles;

select title, count(title) as "Number_to_Retire"
into retiring_titles
from unique_titles
group by title
order by "Number_to_Retire" desc;

select * from retiring_titles;

------------------------------- Deliverable 2
--I built a general query first to understand what all I had returning from the join statements
--then i built the query to create the mentorship_eligibility.csv
/*
select * from titles;

select *
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join titles as tt
on e.emp_no = tt.emp_no
order by e.emp_no;
*/

select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name,
de.from_date, de.to_date,
tt.title
into mentorship_eligibility
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join titles as tt
on e.emp_no = tt.emp_no
where de.to_date = '9999-01-01'
and (e.birth_date between '1965-01-01' and '1965-12-31')
order by e.emp_no, tt.to_date desc;



select * from mentorship_eligibility;