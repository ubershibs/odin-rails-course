Tutorial 7
More JOIN operations

Exercise 1:
SELECT id, title
  FROM movie
  WHERE yr=1962

Exercise 2:
SELECT yr
  FROM movie
  WHERE title='Citizen Kane'

Exercise 3:
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr

Exercise 4:
SELECT title
  FROM movie
  WHERE id IN ('11768','11955','21191')

Exercise 5:
SELECT id
  FROM actor
  WHERE name='Glenn Close'

Exercise 6:
SELECT id
  FROM movie
  WHERE title='Casablanca'

Exercise 7:
SELECT name
  FROM actor JOIN casting ON id=actorid
  WHERE movieid=11768

Exercise 8:
SELECT name
  FROM casting
    JOIN actor ON actor.id=casting.actorid
    JOIN movie ON movie.id=casting.movieid
      WHERE title='Alien'

Exercise 9:
SELECT title
  FROM casting
    JOIN actor ON actor.id=casting.actorid
    JOIN movie ON movie.id=casting.movieid
      WHERE name='Harrison Ford'

Exercise 10:
SELECT title
  FROM casting
    JOIN actor ON actor.id=casting.actorid
    JOIN movie ON movie.id=casting.movieid
      WHERE name='Harrison Ford' 
      AND ord != 1

Exercise 11:
SELECT title, name
  FROM casting
    JOIN actor ON actor.id=casting.actorid
    JOIN movie ON movie.id=casting.movieid
      WHERE yr=1962 
      AND ord=1

Exercise 12:
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
    WHERE name='John Travolta'
  GROUP BY yr
  HAVING COUNT(title)=(SELECT MAX(c) FROM
  (SELECT yr,COUNT(title) AS c FROM
    movie JOIN casting ON movie.id=movieid
          JOIN actor   ON actorid=actor.id
      WHERE name='John Travolta'
    GROUP BY yr) AS t
    )

Exercise 13:
SELECT title, name 
  FROM movie JOIN casting ON movie.id=movieid 
    JOIN actor ON actorid=actor.id
      WHERE ord=1 AND movie.id IN 
      (SELECT movie.id FROM movie 
        JOIN casting ON movie.id=movieid 
        JOIN actor ON actorid=actor.id 
          WHERE name = 'Julie Andrews')

Exercise 14:
SELECT name
FROM movie JOIN casting ON movie.id=movieid
           JOIN actor ON actorid=actor.id
  WHERE ORD=1
    GROUP BY name
    HAVING 
      COUNT(title)>=30
      ORDER BY name


Exercise 15:
SELECT title, COUNT(actorid) AS 'actors'
  FROM movie JOIN casting ON movie.id=movieid 
             JOIN actor ON actorid=actor.id
    WHERE movie.yr=1978
      GROUP BY title
        ORDER BY actors DESC

Exercise 16:
SELECT name
  FROM actor INNER JOIN casting ON actor.id=actorid
    WHERE movieid IN 
      (SELECT movieid FROM casting INNER JOIN actor ON actorid=actor.id
        WHERE name='Art Garfunkel') AND name != 'Art Garfunkel'
