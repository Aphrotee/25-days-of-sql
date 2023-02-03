-- This sql script returns all player details
-- in ascending order of their names and positon
-- alongside correlating serial numbers
USE my_db;
SET @sN := 0;
SELECT (@sN := @sN+1) AS Serial_Number, WC_PLAYERS.*
FROM WC_PLAYERS
ORDER BY Player_Name, Position;