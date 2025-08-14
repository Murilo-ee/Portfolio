select *
from employee_salary
where salary >= 5000;



select *
from employee_salary
where salary = 5000;

select *
from employee_demographics
where gender != 'male'
and age >35;

select *
from employee_demographics
where (first_name = 'Leslie' and age = 44 ) or age < 40;



select *
from employee_demographics
where first_name like 'a%';


select *
from employee_demographics
where first_name like 'a__'


