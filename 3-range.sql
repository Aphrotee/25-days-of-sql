-- This sql script returns the range of player ages for
-- each player position and the overall range of players

USE my_db;

SELECT position, MAX(YEAR(CURDATE()) - YEAR(player_dob)) - MIN(YEAR(CURDATE()) - YEAR(player_dob))
AS 'range'
FROM wc_players
GROUP BY position;

SELECT MAX(YEAR(CURDATE()) - YEAR(player_dob)) - MIN(YEAR(CURDATE()) - YEAR(player_dob))
AS 'range_of_all_players'
FROM wc_players;