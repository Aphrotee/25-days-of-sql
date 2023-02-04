-- This sql script returns the JSON object of the player(s) with the
-- highest goals, one(s) with the highest assists and the overall best player(s)

USE my_db;

SELECT 'highest_goal_scorer' AS title, JSON_OBJECT('id', id, 'nationality', nationality, 'fifa_ranking', fifa_ranking,
												   'national_team_kit_sponsor', national_team_kit_sponsor, 'position', position,
                                                   'national_team_jersey_number', national_team_jersey_number, 'player_dob', player_dob,
                                                   'club', club, 'player_name', player_name, 'appearances', appearances,
                                                   'goals_scored', goals_scored, 'assists_provided', assists_provided,
                                                   'dribbles_per_90', dribbles_per_90, 'interceptions_per_90', interceptions_per_90,
                                                   'tackles_per_90', tackles_per_90, 'total_duels_won_per_90', total_duels_won_per_90,
                                                   'save_percentage', save_percentage, 'clean_sheets', clean_sheets,
                                                   'brand_sponsorbrand_used', brand_sponsorbrand_used) AS player
  FROM wc_players
  WHERE goals_scored = (SELECT MAX(goals_scored)
						  FROM wc_players
                          WHERE goals_scored REGEXP '[0-9]')
;

SELECT 'highest_assists' AS title, JSON_OBJECT('id', id, 'nationality', nationality, 'fifa_ranking', fifa_ranking,
											   'national_team_kit_sponsor', national_team_kit_sponsor, 'position', position,
                                               'national_team_jersey_number', national_team_jersey_number, 'player_dob', player_dob,
                                               'club', club, 'player_name', player_name, 'appearances', appearances,
                                               'goals_scored', goals_scored, 'assists_provided', assists_provided,
                                               'dribbles_per_90', dribbles_per_90, 'interceptions_per_90', interceptions_per_90,
                                               'tackles_per_90', tackles_per_90, 'total_duels_won_per_90', total_duels_won_per_90,
                                               'save_percentage', save_percentage, 'clean_sheets', clean_sheets,
                                               'brand_sponsorbrand_used', brand_sponsorbrand_used) AS player
  FROM wc_players
  WHERE assists_provided = (SELECT MAX(assists_provided)
							  FROM wc_players
                              WHERE assists_provided REGEXP '[0-9]')
;

SELECT 'overall_best_player' AS title, JSON_OBJECT('id', id, 'nationality', nationality, 'fifa_ranking', fifa_ranking,
												   'national_team_kit_sponsor', national_team_kit_sponsor, 'position', position,
                                                   'national_team_jersey_number', national_team_jersey_number, 'player_dob', player_dob,
                                                   'club', club, 'player_name', player_name, 'appearances', appearances,
                                                   'goals_scored', goals_scored, 'assists_provided', assists_provided,
                                                   'dribbles_per_90', dribbles_per_90, 'interceptions_per_90', interceptions_per_90,
                                                   'tackles_per_90', tackles_per_90, 'total_duels_won_per_90', total_duels_won_per_90,
                                                   'save_percentage', save_percentage, 'clean_sheets', clean_sheets,
                                                   'brand_sponsorbrand_used', brand_sponsorbrand_used) AS player
  FROM wc_players
  WHERE goals_scored + assists_provided = (SELECT MAX(goals_scored + assists_provided)
							  FROM wc_players
                              WHERE goals_scored REGEXP '[0-9]'
                              AND assists_provided REGEXP '[0-9]')
;