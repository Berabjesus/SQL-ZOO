-- Problem 5
-- 1. Show the total population of the world.
SELECT
  SUM(population)
FROM
  world;

-- 2. List all the continents - just once each.
SELECT DISTINCT
  continent
FROM
  world;

-- 3. Give the total GDP of Africa.
SELECT
  SUM(gdp)
FROM
  world
WHERE
  continent = 'Africa';

-- 4. How many countries have an area of at least 1000000?
SELECT
  COUNT(name)
FROM
  world
WHERE
  area >= 1000000;

-- 5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')?
SELECT
  SUM(population)
FROM
  world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- 6. For each continent show the continent and number of countries.
SELECT
  continent, COUNT(name)
FROM
  world
GROUP BY
  continent;

-- 7. For each continent show the continent and number of countries with populations of at least 10 million.
SELECT 
  continent, COUNT(name)
FROM
  world
WHERE
  population >= 10000000
GROUP BY
  continent;

-- 8. List the continents that have a total population of at least 100 million.
SELECT
  continent
FROM
  world
GROUP BY
  continent
HAVING
  SUM(population)>100000000;
-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 6
-- 1. Modify the example to show the matchid and player name for all goals scored by Germany.
SELECT
  matchid, player
FROM
  goal
WHERE
  teamid = 'GER';

-- 2. Show id, stadium, team1, team2 for just game 1012.
SELECT
  id, stadium, team1, team2
FROM
  game
WHERE
  id = 1012;

-- 3. Modify the example to show the player, teamid, stadium and mdate for every German goal.
SELECT
  goal.player, goal.teamid, game.stadium, game.mdate
FROM
  game JOIN goal ON (game.id = goal.matchid)
WHERE
  goal.teamid = 'GER';
  
-- 4. Show the team1, team2 and player for every goal scored by a player called 'Mario'.
SELECT
  game.team1, game.team2, goal.player
FROM
  game JOIN goal ON (game.id = goal.matchid)
WHERE
  goal.player LIKE 'Mario%';

-- 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes.
SELECT
  goal.player, goal.teamid, eteam.coach, goal.gtime
FROM
  goal JOIN eteam ON (goal.teamid = eteam.id)
WHERE
  goal.gtime <= 10;

-- 6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT
  game.mdate, eteam.teamname
FROM
  game JOIN eteam ON (team1=eteam.id)
WHERE
  eteam.coach = 'Fernando Santos';

-- 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'.
SELECT
  goal.player
FROM
  goal JOIN game ON (game.id = goal.matchid)
WHERE
  game.stadium = 'National Stadium, Warsaw';

-- 8. Show the name of all players who scored a goal against Germany.
SELECT DISTINCT
  player
FROM
  game JOIN goal ON matchid = id 
WHERE
  goal.teamid != 'GER' AND 'GER' IN (game.team1, game.team2);

-- 9. Show teamname and the total number of goals scored.
SELECT
  teamname, COUNT(*)
FROM
  eteam JOIN goal ON id=teamid
GROUP BY
  teamname;

-- 10. Show the stadium and the number of goals scored in each stadium.
SELECT
  stadium, COUNT(*)
FROM
  game JOIN goal ON id = matchid
GROUP BY
  stadium;

-- 11. For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT
  goal.matchid, game.mdate, COUNT(*)
FROM
  game JOIN goal ON matchid = id 
WHERE
  (team1 = 'POL' OR team2 = 'POL')
GROUP BY
  goal.matchid, game.mdate;

-- 12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'.
SELECT
  goal.matchid, game.mdate, COUNT(*)
FROM
  game JOIN goal ON matchid = id
WHERE
  (goal.teamid = 'GER')
GROUP BY
  goal.matchid, game.mdate;

-- 13. List every match with the goals scored by each team as shown.
SELECT  
  game.mdate, game.team1,
  SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) AS score1,
  game.team2,
  SUM(CASE WHEN goal.teamid = game.team2 THEN 1 ELSE 0 END) AS score2
FROM
  game LEFT JOIN goal ON game.id = goal.matchid
GROUP BY
  game.mdate, game.team1, game.team2
ORDER BY
  game.mdate, goal.matchid;
-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 7
-- 1. List the films where the yr is 1962 [Show id, title].
SELECT
  id, title
FROM
  movie
WHERE
  yr = 1962;

-- 2. Give year of 'Citizen Kane'.
SELECT
  yr
FROM
  movie
WHERE
  title = 'Citizen Kane';

-- 3. List all of the Star Trek movies, include the id, title and yr. Order results by year.
SELECT
  id, title, yr
FROM
  movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

-- 4. What id number does the actor 'Glenn Close' have?
SELECT
  id
FROM
  actor
WHERE actor.name = 'Glenn Close';

-- 5. What is the id of the film 'Casablanca'?
SELECT
  id
FROM
  movie
WHERE
  title = 'Casablanca';

-- 6. Obtain the cast list for 'Casablanca'.
SELECT
  actor.name
FROM
  actor JOIN casting ON casting.actorid = actor.id
WHERE
  movieid = 11768;

-- 7. Obtain the cast list for the film 'Alien'.
SELECT
  actor.name
FROM
  actor
JOIN
  casting ON actor.id = casting.actorid
JOIN
  movie ON movie.id = casting.movieid
WHERE
  movie.title = 'Alien';

-- 8. List the films in which 'Harrison Ford' has appeared.
SELECT
  movie.title
FROM
  actor
JOIN
  casting ON actor.id = casting.actorid
JOIN
  movie ON movie.id = casting.movieid
WHERE
  actor.name = 'Harrison Ford';

-- 9. List the films where 'Harrison Ford' has appeared - but not in the starring role.
SELECT
  movie.title
FROM
  actor
JOIN
  casting ON actor.id = casting.actorid
JOIN
  movie ON movie.id = casting.movieid
WHERE
  actor.name = 'Harrison Ford' AND casting.ord != 1;

-- 10. List the films together with the leading star for all 1962 films.
SELECT
  movie.title, actor.name
FROM
  actor
JOIN
  casting ON actor.id = casting.actorid
JOIN
  movie ON movie.id = casting.movieid
WHERE
  casting.ord = 1 AND movie.yr = 1962;

/* 11. Which were the busiest years for 'Rock Hudson'?
       Show the year and the number of movies he made each year for any year in which he made more than 2 movies. */
SELECT
  yr,COUNT(title)
FROM
  movie
JOIN
  casting ON movie.id=movieid
JOIN
  actor ON actorid=actor.id
WHERE
  actor.name = 'Rock Hudson'
GROUP BY
  yr
HAVING
  COUNT(title) > 2;
-- 12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT
  movie.title, actor.name
FROM
  actor
INNER JOIN
  casting ON actor.id = casting.actorid
INNER JOIN
  movie ON movie.id = casting.movieid
WHERE
  casting.movieid IN
  (SELECT casting.movieid
  FROM casting
  INNER JOIN actor ON actor.id = casting.actorid
  WHERE actor.name = 'Julie Andrews')
AND casting.ord = 1;

-- 13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT
  actor.name
FROM
  actor
JOIN
  casting ON actor.id = casting.actorid
JOIN
  movie ON movie.id = casting.movieid
WHERE
  casting.ord  = 1
GROUP BY
  actor.name
HAVING COUNT(*) >= 15;

-- 14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT
  movie.title,
  COUNT(*)
FROM
  movie
JOIN
  casting ON movie.id = casting.movieid
WHERE
  yr = 1978
GROUP BY
  movie.title
ORDER BY
  COUNT(*) DESC, movie.title;

-- 15. List all the people who have worked with 'Art Garfunkel'.
SELECT
  actor.name
FROM
  actor
JOIN
  casting ON actor.id = casting.actorid
WHERE
  casting.movieid IN
  (SELECT casting.movieid
  FROM casting
  INNER JOIN actor ON actor.id = casting.actorid
  WHERE actor.name = 'Art Garfunkel')
AND actor.name != 'Art Garfunkel';
-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 8+
-- 1. Show the the percentage who STRONGLY AGREE.
SELECT
  A_STRONGLY_AGREE
FROM
  nss
WHERE
  question = 'Q01'
AND
  institution = 'Edinburgh Napier University'
AND
  nss.subject = '(8) Computer Science';
-- 2. Show the institution and subject where the score is at least 100 for question 15.
SELECT
  nss.institution, nss.subject
FROM
  nss
WHERE
  question = 'Q15' AND score >= 100;

-- 3. Show the institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15'.
SELECT
  nss.institution, nss.score
FROM
  nss
WHERE
  nss.subject = '(8) Computer Science' AND score < 50 AND question = 'Q15';
  
/* 4. Show the subject and total number of students who responded to question 22 for each of the subjects
      '(8) Computer Science' and '(H) Creative Arts and Design'. */
SELECT
  nss.subject, SUM(response)
FROM
  nss
WHERE
  question = 'Q22'
AND
  nss.subject IN ('(H) Creative Arts and Design', '(8) Computer Science')
GROUP BY
  nss.subject;

/* 5. Show the subject and total number of students who A_STRONGLY_AGREE to question 22 for each of the subjects
      '(8) Computer Science' and '(H) Creative Arts and Design'. */
SELECT
  nss.subject, SUM(A_STRONGLY_AGREE * response / 100) AS total_students
FROM
  nss
WHERE
  question = 'Q22'
AND
  nss.subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY
  nss.subject;

/* 6. Show the percentage of students who A_STRONGLY_AGREE to question 22 for the subject
      '(8) Computer Science' show the same figure for the subject '(H) Creative Arts and Design'. */
SELECT
  nss.subject, ROUND(SUM(A_STRONGLY_AGREE / 100 * response) / SUM(response) * 100)
FROM
  nss
WHERE
  question = 'Q22'
AND
  nss.subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY
 nss.subject;

-- 7. Show the average scores for question 'Q22' for each institution that include 'Manchester' in the name.
SELECT
  institution, ROUND(SUM(score / 100 * response) / SUM(response) * 100)
FROM
  nss
WHERE
  question = 'Q22' AND (institution LIKE '%Manchester%')
GROUP BY
  institution;
-- 8. Show the institution, the total sample size and the number of computing students for institutions in Manchester for 'Q01'.
SELECT
  institution, SUM(sample),
  SUM(CASE WHEN subject = '(8) Computer Science' 
	THEN sample 
  ELSE 0 
  END)
FROM
  nss
WHERE
  question = 'Q01' AND (institution LIKE '%Manchester%')
GROUP BY
  institution;
-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 8
-- 1. List the teachers who have NULL for their department.
SELECT
  name
FROM
  teacher
WHERE dept IS NULL;

-- 2. Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT
  teacher.name, dept.name
FROM
  teacher
INNER JOIN
  dept ON (teacher.dept=dept.id);

-- 3. Use a different JOIN so that all teachers are listed.
SELECT
  teacher.name, dept.name
FROM
  teacher
LEFT JOIN
  dept ON (teacher.dept=dept.id);

-- 4. Use a different JOIN so that all departments are listed.
SELECT
  teacher.name, dept.name
FROM
  teacher
RIGHT JOIN
  dept ON (teacher.dept=dept.id);

/* 5. Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given.
      Show teacher name and mobile number or '07986 444 2266'. */
SELECT
  teacher.name, COALESCE(mobile, '07986 444 2266')
FROM
  teacher;

/* 6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name.
      Use the string 'None' where there is no department. */
SELECT
  teacher.name, COALESCE(dept.name, 'None')
FROM
  teacher
LEFT JOIN
  dept ON (teacher.dept = dept.id);

-- 7. Use COUNT to show the number of teachers and the number of mobile phones.
SELECT
  COUNT(teacher.name), COUNT(teacher.mobile)
FROM
  teacher;

/* 8. Use COUNT and GROUP BY dept.name to show each department and the number of staff.
      Use a RIGHT JOIN to ensure that the Engineering department is listed. */
SELECT
  dept.name, COUNT(teacher.name)
FROM
  teacher
RIGHT JOIN
  dept ON (teacher.dept = dept.id)
GROUP BY
  dept.name;

-- 9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
SELECT
  teacher.name,
CASE WHEN
  dept.id = 1
THEN
  'Sci'
WHEN
  dept.id = 2
THEN
  'Sci'
ELSE
  'Art'
END
FROM
  teacher
LEFT JOIN
  dept ON (dept.id = teacher.dept);

/* 10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2,
       show 'Art' if the teacher's dept is 3 and 'None' otherwise. */
SELECT
  teacher.name,
CASE WHEN
  dept.id = 1
THEN
  'Sci'
WHEN
  dept.id = 2
THEN
  'Sci'
WHEN
  dept.id = 3
THEN
  'Art'
ELSE
  'None'
END
FROM
  teacher
LEFT JOIN
  dept ON (dept.id = teacher.dept);
-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 9-
-- 1. Show the lastName, party and votes for the constituency 'S14000024' in 2017.
SELECT
  lastName, party, votes
FROM
  ge
WHERE
  constituency = 'S14000024' AND yr = 2017
ORDER BY
  votes DESC;

-- 2. Show the party and RANK for constituency S14000024 in 2017. List the output by party.
SELECT
  party, votes, RANK() OVER (ORDER BY votes DESC) as posn
FROM
  ge
WHERE
  constituency = 'S14000024 ' AND yr = 2017
ORDER BY
  party;

/* 3. Use PARTITION to show the ranking of each party in S14000021 in each year.
      Include yr, party, votes and ranking (the party with the most votes is 1). */
SELECT
  yr, party, votes, RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
FROM
  ge
WHERE
  constituency = 'S14000021'
ORDER BY
  party, yr;

/* 4. Use PARTITION BY constituency to show the ranking of each party in Edinburgh in 2017.
      Order your results so the winners are shown first, then ordered by constituency. */
SELECT
  constituency, party, votes, RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
FROM
  ge
WHERE
  constituency BETWEEN 'S14000021' AND 'S14000026' AND yr  = 2017
ORDER BY
  posn, constituency;

-- 5. Show the parties that won for each Edinburgh constituency in 2017.
SELECT
  constituency, party
FROM
  (SELECT constituency, party, votes,
  RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
FROM
  ge
 WHERE
   constituency BETWEEN 'S14000021' AND 'S14000026' AND yr  = 2017) RK
WHERE 
  RK.posn=1;

-- 6. Show how many seats for each party in Scotland in 2017.
SELECT
  party, COUNT(*)
FROM
(SELECT constituency,party, votes,
RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
FROM
  ge
WHERE
  constituency LIKE 'S%' AND yr  = 2017) RK
WHERE
  RK.posn = 1
GROUP BY
  RK.party;
-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 9+
-- 1. Modify the query to show data from Spain.
SELECT
  name, DAY(whn), confirmed, deaths, recovered
FROM
  covid
WHERE
  name = 'Spain' AND MONTH(whn) = 3
ORDER BY
  whn;

-- 2. Modify the query to show confirmed for the day before.
SELECT
  name, DAY(whn), confirmed,LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
FROM
  covid
WHERE
  name = 'Italy' AND MONTH(whn) = 3
ORDER BY
  whn;

-- 3. Show the number of new cases for each day, for Italy, for March.
SELECT
  name, DAY(whn), confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) as new
FROM
  covid
WHERE
  name = 'Italy' AND MONTH(whn) = 3
ORDER BY
  whn;

-- 4. Show the number of new cases in Italy for each week - show Monday only.
SELECT
  name, DATE_FORMAT(whn,'%Y-%m-%d'), confirmed-LAG(confirmed,1) OVER (ORDER BY whn) 'new this week'
FROM
  covid
WHERE
  name = 'Italy' and WEEKDAY(whn) = 0;

-- 5. Show the number of new cases in Italy for each week - show Monday only (using JOIN and DATE_ADD).
SELECT
  tw.name, DATE_FORMAT(tw.whn,'%Y-%m-%d'), tw.confirmed - lw.confirmed
FROM
  covid tw LEFT JOIN covid lw ON DATE_ADD(lw.whn, INTERVAL 1 WEEK) = tw.whn AND tw.name = lw.name
WHERE
  tw.name = 'Italy' AND WEEKDAY(tw.whn) = 0
ORDER BY
  tw.whn;
-- 6. Include the ranking for the number of deaths in the table.
SELECT 
  name, confirmed, RANK() OVER (ORDER BY confirmed DESC) rc, deaths, RANK() OVER (ORDER BY deaths DESC) rc
FROM
  covid
WHERE
  whn = '2020-04-20'
ORDER BY
  confirmed DESC;
-- 7. Show the infect rate ranking for each country. Only include countries with a population of at least 10 million.
SELECT 
  world.name, ROUND(100000*confirmed/population,0), RANK() OVER (ORDER BY confirmed/population) AS rank
FROM
  covid JOIN world ON covid.name=world.name
WHERE whn = '2020-04-20' AND population > 10000000
ORDER BY
  population DESC;
-- 8. For each country that has had at last 1000 new cases in a single day, show the date of the peak number of new cases.
SELECT
  name,DATE_FORMAT(whn,'%Y-%m-%d'), newCases AS peakNewCases
FROM
  (SELECT name, whn, newCases, RANK() OVER (PARTITION BY name ORDER BY newCases DESC) rnc
FROM
  (SELECT name, whn, confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) as newCases
FROM
  covid
) AS x
) AS y
WHERE rnc = 1 AND newCases > 1000
ORDER BY whn;
-- -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

-- Problem 9

-- 1. How many stops are in the database?
SELECT
  COUNT(stops.id)
FROM
  stops;

-- 2. Find the id value for the stop 'Craiglockhart'.
SELECT
  stops.id
FROM
  stops
WHERE
  stops.name = 'Craiglockhart';

-- 3. Give the id and the name for the stops on the '4' 'LRT' service.
SELECT
  stops.id, stops.name
FROM
  stops, route
WHERE
  stops.id = route.stop AND route.company = 'LRT' AND route.num = '4';

-- 4. Add a HAVING clause (to the example) to restrict the output to these two routes.
SELECT
  company, num, COUNT(*)
FROM
  route 
WHERE
  stop = 149 OR stop = 53
GROUP BY
  company, num
HAVING
  COUNT(*) > 1;

-- 5. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT
  a.company, a.num, a.stop, b.stop
FROM
  route a JOIN route b ON (a.company = b.company AND a.num = b.num)
WHERE
  a.stop = 53 AND b.stop = 149;

-- 6. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown.
SELECT
  a.company, a.num, stopa.name, stopb.name
FROM
  route a JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN
  stops stopa ON (a.stop = stopa.id)
JOIN
  stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart' AND stopb.name = 'London Road';

-- 7. Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith').
SELECT DISTINCT
  a.company, a.num
FROM
  route a JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN
  stops stopa ON (a.stop=stopa.id)
JOIN
  stops stopb ON (b.stop=stopb.id)
WHERE
  stopa.name='Haymarket' AND stopb.name = 'Leith';

-- 8. Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT DISTINCT
  a.company, a.num
FROM
  route a JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN
  stops stopa ON (a.stop = stopa.id)
JOIN
  stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross';

/* 9. Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus,
      including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services. */
SELECT DISTINCT
  stopb.name, b.company, b.num
FROM
  route AS a
JOIN
  route AS b ON a.company = b.company AND a.num = b.num
JOIN
  stops AS stopa ON a.stop = stopa.id
JOIN
  stops AS stopb ON b.stop = stopb.id
WHERE
  stopa.name = 'Craiglockhart' AND a.company = 'LRT';

/* 10. Find the routes involving two buses that can go from Craiglockhart to Lochend.
       Show the bus no. and company for the first bus, the name of the stop for the transfer,
       and the bus no. and company for the second bus. */
SELECT
  a.num AS Num1, a.comp AS Comp1, a.transfer AS Transfer, b.num AS Num2, b.comp AS Comp2
FROM
  (SELECT DISTINCT a.num AS num, a.company AS comp, stopb.name AS transfer
  FROM
    route AS a
  JOIN
    route AS b ON a.company = b.company AND a.num = b.num
  JOIN
    stops AS stopa ON a.stop = stopa.id
  JOIN
    stops AS stopb ON b.stop = stopb.id
  WHERE
    stopa.name = 'Craiglockhart') AS a
  JOIN
  (SELECT DISTINCT a.num AS num, a.company AS comp, stopb.name AS transfer
  FROM
    route AS a
  JOIN
    route AS b ON a.company = b.company AND a.num = b.num
  JOIN
    stops AS stopa ON a.stop = stopa.id
  JOIN
    stops AS stopb ON b.stop = stopb.id
  WHERE
    stopa.name = 'Lochend') AS b ON a.transfer = b.transfer
ORDER BY
  Num1,Transfer, Num2;