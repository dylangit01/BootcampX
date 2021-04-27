-- Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

SELECT name, concat(CAST( ROUND(population /(SELECT population 
FROM world 
WHERE name = 'Germany') * 100, 0) as int) ,'%') AS percentage 
FROM world WHERE continent='Europe';

-- Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name 
FROM world 
WHERE gdp > 
ALL (SELECT gdp FROM world
        WHERE continent='Europe' and gdp > 0)

-- Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, area FROM world WHERE area in (SELECT MAX(area) FROM world GROUP BY continent)


-- List each continent and the name of the country that comes first alphabetically.
SELECT continent, MIN(name)
FROM world
GROUP BY continent