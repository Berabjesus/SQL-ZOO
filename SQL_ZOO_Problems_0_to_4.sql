-- Problem 0 SELECT basics
-- 1
SELECT population
FROM world
WHERE name = 'Germany' -- 2SELECT name,
         population
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3
SELECT name,
         area
FROM world
WHERE area
    BETWEEN 200000
        AND 250000

-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 1 SELECT name

-- 1
SELECT name
FROM world
WHERE name LIKE 'Y%'

-- 2
SELECT name
FROM world
WHERE name LIKE '%y'

-- 3
SELECT name
FROM world
WHERE name LIKE '%x%' 
-- 4
SELECT name
FROM world
WHERE name LIKE '%land'

-- 5
SELECT name
FROM world
WHERE name LIKE 'C%ia' 
-- 6
SELECT name
FROM world
WHERE name LIKE '%oo%'

-- 7
SELECT name
FROM world
WHERE name LIKE '%a%a%a%'

-- 7 (2)
SELECT name
FROM world
WHERE length(LOWER(name)) - length(REPLACE(LOWER(name), 'a','')) > 2 
-- 8
SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name

-- 9
SELECT name FROM world
WHERE name LIKE '%o__o%'

-- 10
SELECT name FROM world
WHERE name LIKE '____'

-- 10 (2)
SELECT name FROM world
WHERE length(name) = 4

-- 11
SELECT name FROM world
WHERE name = capital

-- 12
SELECT name
FROM world
WHERE capital = CONCAT(name,' city')

-- 13
SELECT capital,
         name
FROM world
WHERE capital LIKE CONCAT('%',name,'%') 
-- 14
SELECT capital,
         name
FROM world
WHERE capital LIKE CONCAT('%',name,'_%')

-- 15
SELECT name,
         REPLACE(capital,
         name,
        '') AS extension
FROM world
WHERE capital LIKE CONCAT(name,'_%') 
-- Problem 2
-- 1
SELECT name,
         continent,
         population
FROM world 
-- 2
SELECT name
FROM world
WHERE population >= 200000000 
-- 3
SELECT name,
         SUM(gdp/population) AS per_capita_GDP
FROM world
WHERE population >= 200000000
GROUP BY  name 
-- 4
SELECT name,
         SUM(population / 1000000) pop_in_mil
FROM world
WHERE continent = 'South America'
GROUP BY  name 
-- 5
SELECT name,
         population
FROM world
WHERE name IN ('France','Germany', 'Italy') 
-- 6
SELECT name
FROM world
WHERE name LIKE '%united%' 
-- 7
SELECT name,
         population,
         area
FROM world
WHERE area > 3000000
        OR population > 250000000 
-- 8
SELECT name,
         population,
         area
FROM world
WHERE area > 3000000 XOR population > 250000000 
-- 9
SELECT name,
         ROUND(SUM(population/1000000),
         2) AS population_mil,
         ROUND(SUM(gdp/1000000000),
         2) AS gdp_bil
FROM world
WHERE continent = 'South America'
GROUP BY  name 
-- 10
SELECT name,
         ROUND(SUM(gdp/population),
         -3) AS per_capita
FROM world
WHERE gdp > 1000000000000
GROUP BY  name 
-- 11
SELECT name,
         capital
FROM world
WHERE LENGTH(name) = LENGTH(capital) 
-- 12
SELECT name,
         capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
        AND name <> capital 
-- 13
SELECT name
FROM world
WHERE name LIKE '%a%'
        AND name LIKE '%e%'
        AND name LIKE '%i%'
        AND name LIKE '%o%'
        AND name LIKE '%u%'
        AND name NOT LIKE '% %' 

-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 3
-- 1
SELECT yr,
         subject,
         winner
FROM nobel
WHERE yr = 1950 
--  2
SELECT winner
FROM nobel
WHERE yr = 1962
        AND subject = 'Literature' 
-- 3
SELECT yr,
         subject
FROM nobel
WHERE winner = 'Albert Einstein' 
-- 4
SELECT winner
FROM nobel
WHERE yr >= 2000
        AND subject = 'Peace' 
-- 5
SELECT *
FROM nobel
WHERE yr
    BETWEEN 1980
        AND 1989
        AND subject = 'Literature' 
-- 6
SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama') 
-- 7
SELECT winner
FROM nobel
WHERE winner LIKE 'John%' 
-- 8
SELECT *
FROM nobel
WHERE (yr = 1980
        AND subject = 'Physics')
        OR (yr = 1984
        AND subject = 'Chemistry') 
-- 9
SELECT *
FROM nobel
WHERE yr = 1980
        AND subject NOT IN ('Medicine', 'Chemistry') 
-- 10
SELECT *
FROM nobel
WHERE (subject = 'Medicine'
        AND yr < 1910)
        OR (subject = 'Literature'
        AND yr >= 2004) 

-- 11
SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG' 
-- 12
SELECT *
FROM nobel
WHERE winner = 'EUGENE O\'\NEILL'

'-- 13
SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir %'
ORDER BY yr DESC

-- 14
SELECT winner,
         subject
FROM nobel
WHERE yr=1984
ORDER BY  subject IN ('Physics','Chemistry'), subject, winner

-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 4
-- 1
SELECT name
FROM world
WHERE population > 
    (SELECT population
    FROM world
    WHERE name='Russia')

-- 2
SELECT name FROM world
WHERE gdp/population > (SELECT gdp/population AS per_capita FROM world WHERE name = 'United Kingdom') AND continent = 'Europe'

-- 3
SELECT name, continent FROM world
WHERE continent IN ((SELECT continent FROM world WHERE name = 'Argentina'),(SELECT continent FROM world WHERE name = 'Australia')) 
ORDER BY name

-- 4
SELECT name, population FROM world 
WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND population < (SELECT population FROM world WHERE name = 'Poland')

-- 5
SELECT name, CONCAT(ROUND(SUM(population/(SELECT population FROM world WHERE name = 'Germany')*100)), '%') AS percent FROM world
WHERE continent = 'Europe'
GROUP BY name

-- 6
SELECT name FROM world
WHERE gdp > (SELECT gdp FROM world WHERE continent = 'Europe' ORDER BY gdp DESC LIMIT 1)

-- 7
SELECT continent, name, area FROM world
WHERE area IN (SELECT MAX(area) FROM world GROUP BY continent)

-- 8
SELECT continent, MIN(name) AS name
FROM world 
GROUP BY continent


-- 9
select name,continent ,population from world 
    where continent in( select continent from world group by
         continent having MAX(population)<=25000000 )

-- 10
SELECT
  name, continent
FROM
  world AS x
WHERE
  population / 3 > ALL(SELECT population FROM world AS y
WHERE
  x.name <> y.name AND x.continent = y.continent AND population IS NOT NULL);

