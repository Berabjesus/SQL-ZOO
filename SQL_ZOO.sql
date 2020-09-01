-- Problem 0 SELECT basics
-- 1
SELECT population FROM world
WHERE name = 'Germany'

-- 2
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000


-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 1 SELECT name

-- 1
SELECT name FROM world
  WHERE name LIKE 'Y%'

-- 2
SELECT name FROM world
WHERE name LIKE '%y'

-- 3
SELECT name FROM world
WHERE name LIKE '%x%'

-- 4
SELECT name FROM world
  WHERE name LIKE '%land'

-- 5
SELECT name FROM world
  WHERE name LIKE 'C%ia'

-- 6
SELECT name FROM world
  WHERE name LIKE '%oo%'

-- 7
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

-- 7 (2)
SELECT name FROM world
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
SELECT name FROM world
WHERE capital = CONCAT(name,' city')

-- 13
SELECT capital, name FROM world
WHERE capital LIKE CONCAT('%',name,'%')

-- 14
SELECT capital, name FROM world
WHERE capital LIKE CONCAT('%',name,'_%')

-- 15
SELECT name, REPLACE(capital, name,'') AS extension FROM world
Where capital like CONCAT(name,'_%')

-- Problem 2
-- 1
SELECT name, continent, population FROM world

-- 2
SELECT name FROM world
WHERE population >= 200000000

-- 3
SELECT name, SUM(gdp/population) AS per_capita_GDP FROM world
WHERE population >= 200000000
GROUP BY name

-- 4
SELECT name, SUM(population / 1000000) pop_in_mil FROM world
WHERE continent = 'South America'
GROUP BY name

-- 5
SELECT name, population FROM world
WHERE name IN ('France','Germany', 'Italy')

-- 6
SELECT name FROM world
WHERE name LIKE '%united%'

-- 7
SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000  

-- 8
SELECT name, population, area FROM world
WHERE area > 3000000 XOR population > 250000000  

-- 9
SELECT name, ROUND(SUM(population/1000000), 2) AS population_mil, ROUND(SUM(gdp/1000000000), 2) AS gdp_bil FROM world
WHERE continent = 'South America'
GROUP BY name

-- 10
SELECT name, ROUND(SUM(gdp/population), -3) AS per_capita FROM world
WHERE gdp > 1000000000000
GROUP BY name

-- 11
SELECT name, capital FROM world
WHERE LENGTH(name) = LENGTH(capital)

-- 12
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital

-- 13
SELECT name
FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %'


-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 3

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

