select * from covid_deaths
order by 3, 4;
select * from covid_vaccinations

SELECT COUNT(*) AS column_count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_schema = 'covid'      -- nome do banco de dados
  AND table_name = 'covid_deaths'; -- nome da tabela


SELECT COLUMN_NAME, ORDINAL_POSITION
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_schema = 'covid'
  AND table_name = 'covid_deaths'
ORDER BY ORDINAL_POSITION;


SELECT 
    COUNT(DISTINCT date) AS total_datas_unicas
FROM
    covid_deaths;
    
    select  population
from covid_vaccinations;



select Location, date, total_cases, new_cases, total_cases, population
from covid_deaths
order by 1,2;

 
 
 
select Location, date, total_cases, new_cases, total_cases, population, (total_deaths/total_cases)*100 as percentage
from covid_deaths
where location like '%states%'
order by 1,2;