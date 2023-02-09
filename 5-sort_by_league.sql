-- This sql script returns thr number of players in the
-- world cup that are the in the following leagues.
-- a) EPL b) La Liga c) Serie A d) Ligue 1 e) Others

USE my_db;
DROP TABLE IF EXISTS leagues;
CREATE TABLE leagues (
	id INT NOT NULL,
    league VARCHAR(20),
    club VARCHAR(40),
    PRIMARY KEY(id)
);

INSERT INTO leagues VALUES (1, 'EPL', 'Arsenal');
INSERT INTO leagues VALUES (2, 'EPL', 'Aston Villa');
INSERT INTO leagues VALUES (3, 'EPL', 'Brighton & Hove Albion');
INSERT INTO leagues VALUES (4, 'EPL', 'Burnley');
INSERT INTO leagues VALUES (5, 'EPL', 'Chelsea');
INSERT INTO leagues VALUES (6, 'EPL', 'Crystal Palace');
INSERT INTO leagues VALUES (7, 'EPL', 'Everton');
INSERT INTO leagues VALUES (8, 'EPL', 'Fulham');
INSERT INTO leagues VALUES (9, 'EPL', 'Leeds United');
INSERT INTO leagues VALUES (10, 'EPL', 'Leicester City');
INSERT INTO leagues VALUES (11, 'EPL', 'Liverpool');
INSERT INTO leagues VALUES (12, 'EPL', 'Manchester City');
INSERT INTO leagues VALUES (13, 'EPL', 'Manchester United');
INSERT INTO leagues VALUES (14, 'EPL', 'Newcastle United');
INSERT INTO leagues VALUES (15, 'EPL', 'Sheffield United');
INSERT INTO leagues VALUES (16, 'EPL', 'Southampton');
INSERT INTO leagues VALUES (17, 'EPL', 'Tottenham Hotspur');
INSERT INTO leagues VALUES (18, 'EPL', 'West Bromwich Albion');
INSERT INTO leagues VALUES (19, 'EPL', 'West Ham United');
INSERT INTO leagues VALUES (20, 'EPL', 'WolverhamptonWanderers');      
INSERT INTO leagues VALUES (21, 'La Liga', 'Alaves');
INSERT INTO leagues VALUES (22, 'La Liga', 'Athletic Bilbao');
INSERT INTO leagues VALUES (23, 'La Liga','Athletico Madrid');
INSERT INTO leagues VALUES (24, 'La Liga', 'Barcelona');
INSERT INTO leagues VALUES (25, 'La Liga', 'Cadiz');
INSERT INTO leagues VALUES (26, 'La Liga', 'Celta Vigo');
INSERT INTO leagues VALUES (27, 'La Liga', 'Eibar');
INSERT INTO leagues VALUES (28, 'La Liga', 'Getafe');
INSERT INTO leagues VALUES (29,  'La Liga', 'Granada');
INSERT INTO leagues VALUES (30, 'La Liga', 'Huesca');
INSERT INTO leagues VALUES (31, 'La Liga', 'Levante');
INSERT INTO leagues VALUES (32, 'La Liga', 'Osasuna');
INSERT INTO leagues VALUES (33, 'La Liga', 'Real Betis');
INSERT INTO leagues VALUES (34, 'La Liga', 'Real Madrid');
INSERT INTO leagues VALUES (35, 'La Liga', 'Real Sociedad');
INSERT INTO leagues VALUES (36, 'La Liga', 'Sevilla');
INSERT INTO leagues VALUES (37, 'La Liga', 'Valencia');
INSERT INTO leagues VALUES (38, 'La Liga', 'Valladolid');
INSERT INTO leagues VALUES (39, 'La Liga', 'Villarreal');
INSERT INTO leagues VALUES (40, 'La Liga','TBD');
INSERT INTO leagues VALUES (41, 'Serie A', 'Atalanta');
INSERT INTO leagues VALUES (42, 'Serie A', 'Benevento');
INSERT INTO leagues VALUES (43, 'Serie A', 'Bologna');
INSERT INTO leagues VALUES (44, 'Serie A', 'Crotone');
INSERT INTO leagues VALUES (45, 'Serie A', 'Fiorentina');
INSERT INTO leagues VALUES (46, 'Serie A', 'Genoa');
INSERT INTO leagues VALUES (47, 'Serie A', 'Hellas Verona');
INSERT INTO leagues VALUES (48, 'Serie A', 'Internationale');
INSERT INTO leagues VALUES (49, 'Serie A', 'Juventus');
INSERT INTO leagues VALUES (50, 'Serie A', 'Lazio');
INSERT INTO leagues VALUES (51, 'Serie A', 'Milan');
INSERT INTO leagues VALUES (52, 'Serie A', 'Napoli');
INSERT INTO leagues VALUES (53, 'Serie A', 'Parma');
INSERT INTO leagues VALUES (54, 'Serie A', 'Roma');
INSERT INTO leagues VALUES (55, 'Serie A', 'Sampdoria');
INSERT INTO leagues VALUES (56, 'Serie A', 'Sassuolo');
INSERT INTO leagues VALUES (57, 'Serie A', 'Torino');
INSERT INTO leagues VALUES (58, 'Serie A', 'Udinese');
INSERT INTO leagues VALUES (59, 'Serie A', 'Winners of Playoff');
INSERT INTO leagues VALUES (60, 'Ligue 1', 'Ajaccio');
INSERT INTO leagues VALUES (61, 'Ligue 1', 'Angers');
INSERT INTO leagues VALUES (62, 'Ligue 1', 'Auxerre');
INSERT INTO leagues VALUES (63, 'Ligue 1', 'Brest');
INSERT INTO leagues VALUES (64, 'Ligue 1', 'Clermont');
INSERT INTO leagues VALUES (65, 'Ligue 1', 'Lens');
INSERT INTO leagues VALUES (66, 'Ligue 1', 'Lille');
INSERT INTO leagues VALUES (67, 'Ligue 1', 'Lorient');
INSERT INTO leagues VALUES (68, 'Ligue 1', 'Lyon');
INSERT INTO leagues VALUES (69, 'Ligue 1', 'Marseille');
INSERT INTO leagues VALUES (70, 'Ligue 1', 'AS Monaco');
INSERT INTO leagues VALUES (71, 'Ligue 1', 'Montpellier');
INSERT INTO leagues VALUES (72, 'Ligue 1', 'Nantes');
INSERT INTO leagues VALUES (73, 'Ligue 1', 'Nice');
INSERT INTO leagues VALUES (74, 'Ligue 1', 'Paris Saint-Germain');
INSERT INTO leagues VALUES (75, 'Ligue 1', 'Reims');
INSERT INTO leagues VALUES (76, 'Ligue 1', 'Rennes');
INSERT INTO leagues VALUES (77, 'Ligue 1', 'Strasbourg');
INSERT INTO leagues VALUES (78, 'Ligue 1', 'Toulouse');
INSERT INTO leagues VALUES (79, 'Ligue 1', 'Troyes');

SELECT l.league, COUNT(wc.club) AS 'Number of players'
FROM leagues l
INNER JOIN wc_players wc
ON l.club = wc.club
GROUP BY l.league
UNION
SELECT 'Others', ((SELECT COUNT(*) FROM wc_players) - COUNT(wc.club) ) AS 'Number of players'
FROM leagues l
INNER JOIN wc_players wc
ON l.club = wc.club;
