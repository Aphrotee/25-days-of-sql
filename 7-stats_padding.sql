-- This sql script calculates the variance
-- and standard deviation of the player appearances

USE my_db;

SELECT VARIANCE(CAST(appearances AS UNSIGNED)) AS Variance,
STDDEV(CAST(appearances AS UNSIGNED)) AS 'Standard deviation'
FROM wc_players;