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

-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 5

-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 6

-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 7

-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 8

-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 8+

-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 9-

-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 9+

-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 9

