-- This sql script lists all senior clubs
-- a senior club has at least 5 players in the worldcup

USE my_db;

SELECT club AS 'Senior club',
COUNT(player_name) AS 'Number of players',
CASE
	WHEN SUM(position = 'MF') >= 1 AND SUM(position = 'FW') >= 1 AND SUM(position = 'DF') >= 1 THEN 'Yay'
	ELSE 'Nay'
END AS 'Has all positions'
FROM wc_players
GROUP BY club
HAVING 5 <= COUNT(id);