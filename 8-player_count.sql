-- This sql script returns the number of players in
-- each position provided by every team

USE my_db;

SELECT
nationality AS team,
COUNT(CASE WHEN position = 'DF' THEN position END) DF,
COUNT(CASE WHEN position = 'MF' THEN position END) MF,
COUNT(CASE WHEN position = 'FW' THEN position END) FW,
COUNT(CASE WHEN position = 'GK' THEN position END) GK
FROM wc_players
GROUP BY nationality;