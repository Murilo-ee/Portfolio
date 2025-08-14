
 -- Casos vs População 
 -- USA
select 
Location, date,  population, total_cases, 
(total_cases/population)*100 as percentage
from covid_deaths
-- where location like '%states%'
order by 1,2;

-- Paises com maior taxa de infecçãoptimize

select 
	Location,  population, max(total_cases) as HighestInfectionCount, 
	max((total_cases/population))*100 as InfectionPercentage
from covid_deaths
-- where location like '%states%'
group by location, population
order by 4 desc;



-- Paises com maior cont de morte

SELECT 
    location, 
    population,
    MAX(total_deaths) AS TotalMortes,
    MAX(total_deaths) / MAX(total_cases) * 100 AS PorcentagemDeMortes
FROM 
    covid_deaths
WHERE continent IS NOT NULL
  AND location NOT IN ('World', 'Asia', 'Europe', 'Africa', 'Oceania', 'North America', 'South America', 'European Union')

GROUP BY 
    location, population
ORDER BY 
    TotalMortes DESC;


Select Location, MAX(total_deaths) as TotalDeathCount
From covid_deaths
-- Where location like '%states%'
WHERE continent IS NOT NULL
  AND location NOT IN ('World', 'Asia', 'Europe', 'Africa', 'Oceania', 'North America', 'South America', 'European Union')

Group by Location
order by TotalDeathCount desc;


-- POR CONTINENTE



Select continent, MAX(total_deaths) as TotalDeathCount
From covid_deaths
-- Where location like '%states%'
-- WHERE continent IS NOT NULL
--  AND location NOT IN ('World', 'Asia', 'Europe', 'Africa', 'Oceania', 'North America', 'South America', 'European Union')

Group by continent
order by TotalDeathCount desc;


-- mortalidade mundial

select date, sum(new_cases), sum(new_deaths), sum(new_deaths)/sum(new_cases)*100 as TaxaDeMortalidade
from covid_deaths
group by date
order by 1, 2;



select  sum(new_cases), sum(new_deaths), sum(new_deaths)/sum(new_cases)*100 as TaxaDeMortalidade
from covid_deaths
-- group by date
order by 1, 2;

-- total vs vaccinaçao

select dea.continent, dea.location, dea.date
from covid_deaths dea
join covid_vaccinations vac
	on dea.location = vac.location
    and dea.date = vac.date;
    
    
SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations,
    sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date ) as VacinasTotal
FROM 
    covid_deaths AS dea
JOIN 
    covid_vaccinations AS vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE 
    dea.continent IS NOT NULL
ORDER BY 
    dea.location, dea.date;
    
With popvsvac (continent, location, date, population, new_vaccinations, VacinasTotal)
as
(
SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations,
    sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date ) as VacinasTotal
FROM 
    covid_deaths AS dea
JOIN 
    covid_vaccinations AS vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE 
    dea.continent IS NOT NULL
ORDER BY 
   2,3
)

select * from popvsvac




