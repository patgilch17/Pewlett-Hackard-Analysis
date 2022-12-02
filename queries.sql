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
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--drop table retirement_info;

select * from retirement_info;

AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');