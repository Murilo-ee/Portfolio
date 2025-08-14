select * 
from employee_demographics;
select * 
from employee_salary;

select *
from employee_demographics
inner join employee_salary
	on employee_demographics.employee_id = employee_salary.employee_id;
    
    
    
select * 
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
SELECT 
    dem.employee_id, age, occupation
FROM
    employee_demographics AS dem
        INNER JOIN
    employee_salary AS sal ON dem.employee_id = sal.employee_id;
    



select * 
from employee_demographics as dem
left join employee_salary as sal
	on dem.employee_id = sal.employee_id;






select * 
from employee_demographics as dem
right join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
    
    



select * 
from employee_demographics as dem
left join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
    
select *
from employee_salary emp1
join employee_salary emp2
	on emp1.employee_id = emp2.employee_id;
    
    
    

select emp1.employee_id as emp_santa,
emp1.first_name as firstname_santa,
emp1.last_name as lastname_santa,
emp2.employee_id as emp_santa,
emp2.first_name as empname,
emp2.last_name as emplastname
from employee_salary emp1
join employee_salary emp2
	on emp1.employee_id +1 = emp2.employee_id;
    
    
select * 
from parks_departments;

select *
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
inner join parks_departments pd
	on sal.dept_id = pd.department_id;