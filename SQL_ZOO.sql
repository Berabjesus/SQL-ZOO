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

-- Problem 3


-- Problem 4


-- Problem 5


-- Problem 6


-- Problem 7


-- Problem 8


-- Problem 8+


-- Problem 9-


-- Problem 9+


-- Problem 9

