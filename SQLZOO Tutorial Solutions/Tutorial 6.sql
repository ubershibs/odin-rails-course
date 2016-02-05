Tutorial 6
The JOIN Operation

Exercise 1:
  SELECT matchid, player FROM goal 
  WHERE teamid =  'GER'

Exercise 2:
SELECT id,stadium,team1,team2
  FROM game
  WHERE id = 1012

Exercise 3:
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid = 'GER'

Exercise 4:
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
  WHERE player LIKE 'Mario%'

Exercise 5:
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid=id
  WHERE gtime<=10

Exercise 6:
SELECT mdate, teamname
  FROM game JOIN eteam ON (team1=eteam.id)
  WHERE coach="Fernando Santos"

Exercise 7: 
SELECT player 
  FROM goal JOIN game ON id=matchid
  WHERE stadium='National Stadium, Warsaw'

Exercise 8:
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
  WHERE (team1='GER' OR team2='GER') AND teamid !='GER'

Exercise 9:
SELECT teamname, COUNT(goal.teamid)
  FROM eteam JOIN goal ON id=teamid
  GROUP BY teamname

Exercicse 10:
SELECT stadium, COUNT(player)
  FROM goal JOIN game ON id=matchid
  GROUP BY stadium

Exercise 11:
SELECT matchid, mdate, COUNT(matchid)
FROM game JOIN goal ON id=matchid
  Where (team1 = 'POL' OR team2='POL')
  GROUP BY matchid

Exercise 12:
SELECT matchid, mdate, COUNT(teamid)
  FROM game JOIN goal ON matchid=id
  WHERE (teamid='GER')
  GROUP BY matchid, mdate

Exercise 13:
SELECT  mdate, team1, 
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, 
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2 
FROM game LEFT JOIN goal ON id=matchid
GROUP BY mdate, matchid, team1, team2