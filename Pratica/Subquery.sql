select * from employee_demographics	;
select * from employee_salary;
select * from parks_departments;
select * from employee_demographics
where employee_id in (
		select employee_id
			from employee_salary
            where
				dept_id = 1
);

 
 SELECT  gender, avg((`max(age)`),
  first_name,
  salary,
  (SELECT AVG(salary) FROM employee_salary) AS avg_salary
FROM 
  employee_salary;
  select *
  from
  (
  select gender, avg(age), min(age), count(age)
  from employee_demographics
  group by gender;
  )
  as agg_table
