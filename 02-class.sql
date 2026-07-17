CREATE TABLE ipl_players (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    team VARCHAR(50),
    role VARCHAR(50),
    runs_scored INT CHECK(runs_scored > 0),
    wickets_taken INT CHECK(wickets_taken > 0),
    auction_price_corores INT
);

ALTER TABLE ipl_players ADD COLUMN IF NOT EXISTS nickname VARCHAR(50);

