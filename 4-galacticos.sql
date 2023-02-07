-- This sql script lists the number of Galacticos for each team

USE my_db;

SELECT nationality AS team,
COUNT(player_name) As galacticos
FROM wc_players
WHERE CAST(goals_scored AS unsigned)/ CAST(appearances AS unsigned) >= 0.25
GROUP BY nationality;

SELECT nationality AS team,
JSON_ARRAY(GROUP_CONCAT(player_name)) As galacticos
FROM wc_players
WHERE CAST(goals_scored AS unsigned)/ CAST(appearances AS unsigned) >= 0.25
GROUP BY nationality;