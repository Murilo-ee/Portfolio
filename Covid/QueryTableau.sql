-- Populaçao vs vacinas


SELECT
  dea.continent,
  dea.location,
  dea.date,
  dea.population,
  MAX(vac.total_vaccinations) AS RollingPeopleVaccinated
FROM covid.covid_deaths AS dea
JOIN covid.covid_vaccinations AS vac
  ON dea.location = vac.location
 AND dea.date = vac.date
WHERE dea.location NOT IN (
    'World', 'Asia', 'Europe', 'Africa', 'Oceania', 
    'North America', 'South America', 'European Union', 'International'
)
GROUP BY dea.continent, dea.location, dea.date, dea.population
ORDER BY dea.continent, dea.location, dea.date;



-- Totais Globais sem continentes


SELECT
  SUM(new_cases) AS total_cases,
  SUM(new_deaths) AS total_deaths,
  (SUM(new_deaths) / NULLIF(SUM(new_cases), 0)) * 100 AS DeathPercentage
FROM covid.covid_deaths
WHERE location NOT IN (
    'World', 'Asia', 'Europe', 'Africa', 'Oceania', 
    'North America', 'South America', 'European Union', 'International'
)
ORDER BY total_cases, total_deaths;



-- mortes por  pais

SELECT
  location,
  SUM(new_deaths) AS TotalDeathCount
FROM covid.covid_deaths
WHERE location IN (
     'Asia', 'Europe', 'Africa', 'Oceania', 
    'North America', 'South America'
)
GROUP BY location
ORDER BY TotalDeathCount DESC;



-- maior numero de infectados

SELECT
  Location,
  Population,
  MAX(total_cases) AS HighestInfectionCount,
  MAX(total_cases / NULLIF(Population, 0)) * 100 AS PercentPopulationInfected
FROM covid.covid_deaths
WHERE location NOT IN (
    'World', 'Asia', 'Europe', 'Africa', 'Oceania', 
    'North America', 'South America', 'European Union', 'International'
)
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC;




-- tabela geral


SELECT
  Location,
  date,
  population,
  total_cases,
  total_deaths
FROM covid.covid_deaths
WHERE location NOT IN (
    'World', 'Asia', 'Europe', 'Africa', 'Oceania', 
    'North America', 'South America', 'European Union', 'International'
)
ORDER BY Location, date;


WITH series AS (
  SELECT
    location,
    population,
    date,
    new_cases,
    SUM(COALESCE(new_cases, 0)) 
      OVER (PARTITION BY location ORDER BY date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS total_cases_acum
  FROM covid.covid_deaths
  WHERE location NOT IN (
    'World','Asia','Europe','Africa','Oceania',
    'North America','South America','European Union','International'
  )
)
SELECT
  location,
  population,
  date,
  new_cases,
  total_cases_acum,
  (total_cases_acum / NULLIF(population, 0)) * 100.0 AS PercentPopulationInfected
FROM series
ORDER BY location, date;




--- CTE vacinaçao e pop vacc

WITH PopvsVac AS (
  SELECT
    dea.continent,
    dea.location,
    dea.date,
    dea.population,
    vac.new_vaccinations,
    SUM(COALESCE(vac.new_vaccinations, 0))
      OVER (PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVaccinated
  FROM covid.covid_deaths AS dea
  JOIN covid.covid_vaccinations AS vac
    ON dea.location = vac.location
   AND dea.date = vac.date
  WHERE dea.location NOT IN (
      'World', 'Asia', 'Europe', 'Africa', 'Oceania', 
      'North America', 'South America', 'European Union', 'International'
  )
)
SELECT
  *,
  (RollingPeopleVaccinated / NULLIF(population, 0)) * 100 AS PercentPeopleVaccinated
FROM PopvsVac
ORDER BY location, date;



