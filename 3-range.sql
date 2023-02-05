-- This sql script returns the range of player ages for
-- a particular player position

USE my_db;

DELIMITER $$
DROP PROCEDURE IF EXISTS position_age_range$$
CREATE PROCEDURE position_age_range(IN player_position VARCHAR(2))
	BEGIN
		DECLARE youngest_age, oldest_age INT DEFAULT 0;
        SELECT MIN(YEAR(CURDATE()) - YEAR(player_dob)) INTO youngest_age
		FROM wc_players
        WHERE position = player_position;
        SELECT MAX(YEAR(CURDATE()) - YEAR(player_dob)) INTO oldest_age
        FROM wc_players
        WHERE position = player_position;
        SELECT player_position AS position,
			oldest_age - youngest_age AS 'range';
	END;
$$

CALL position_age_range('FW')$$
CALL position_age_range('GK')$$
CALL position_age_range('DF')$$
CALL position_age_range('MF')$$
CALL position_age_range('ST')$$ -- non-exitent position, returns null

DELIMITER ;