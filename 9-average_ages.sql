-- This sql script returns the average ages of players

USE my_db;

SELECT
ROUND(AVG(CASE WHEN position = 'DF' THEN YEAR(CURDATE()) - YEAR(player_dob) END)) DF,
ROUND(AVG(CASE WHEN position = 'MF' THEN YEAR(CURDATE()) - YEAR(player_dob) END)) MF,
ROUND(AVG(CASE WHEN position = 'FW' THEN YEAR(CURDATE()) - YEAR(player_dob) END)) FW,
ROUND(AVG(CASE WHEN position = 'GK' THEN YEAR(CURDATE()) - YEAR(player_dob) END)) GK
FROM wc_players;