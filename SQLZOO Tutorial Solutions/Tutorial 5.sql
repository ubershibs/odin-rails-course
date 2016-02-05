Tutorial 5
SUM and COUNT

Exercise 1:
SELECT SUM(population)
FROM world

Exercise 2:
SELECT DISTINCT continent
FROM world

Exercise 3:
SELECT SUM(gdp)
FROM world
WHERE continent='Africa'

Exercise 4:
SELECT COUNT(name)
FROM world
WHERE area >= 1000000

Exercise 5:
SELECT SUM(population)
FROM world
WHERE name IN ('France','Germany','Spain')  

Exercise 6:
SELECT continent, COUNT(name)
FROM world
GROUP BY continent

Exercise 7:
SELECT continent, COUNT(name) 
FROM world
WHERE population > 10000000
GROUP BY CONTINENT

Exercise 8:
SELECT continent
FROM world x
GROUP BY continent
HAVING SUM(population) >= 100000000