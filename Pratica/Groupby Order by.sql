select gender, avg(age)
from employee_demographics
group by gender;

select gender, avg(age), max(age) , min(age), count(age)
from employee_demographics
group by gender; 



select * 
from employee_demographics
order by first_name desc;

select * 
from employee_demographics
order by gender, age desc;


select * 
from employee_demographics
order by 5, 4 desc;