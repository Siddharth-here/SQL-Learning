CREATE TABLE ipl_players (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    team VARCHAR(50),
    role VARCHAR(50),
    runs_scored INT CHECK(runs_scored > 0),
    wickets_taken INT CHECK(wickets_taken > 0),
    auction_price_corores INT
);
ALTER TABLE ipl_players
ADD COLUMN IF NOT EXISTS nickname VARCHAR(50);
INSERT INTO ipl_players (
        name,
        team,
        role,
        runs_scored,
        wickets_taken,
        auction_price_corores,
        nickname
    )
VALUES (
        'Virat Kohli',
        'Royal Challengers Bangalore',
        'Batsman',
        8000,
        4,
        15,
        'King Kohli'
    ),
    (
        'MS Dhoni',
        'Chennai Super Kings',
        'Wicketkeeper Batsman',
        5000,
        1,
        12,
        'Mahi'
    ),
    (
        'Rohit Sharma',
        'Mumbai Indians',
        'Batsman',
        6500,
        15,
        16,
        'Hitman'
    ),
    (
        'Jasprit Bumrah',
        'Mumbai Indians',
        'Bowler',
        50,
        165,
        12,
        'Boom Boom'
    ),
    (
        'Sachin Tendulkar',
        'Mumbai Indians',
        'Batsman',
        5500,
        5,
        18,
        'Little Master'
    ),
    (
        'Yuvraj Singh',
        'Punjab Kings',
        'All-rounder',
        4000,
        75,
        14,
        'Yuvi'
    ),
    (
        'Ravindra Jadeja',
        'Chennai Super Kings',
        'All-rounder',
        3000,
        160,
        16,
        'Sir Jadeja'
    ),
    (
        'KL Rahul',
        'Lucknow Super Giants',
        'Wicketkeeper Batsman',
        4500,
        1,
        17,
        'KL'
    ),
    (
        'Suryakumar Yadav',
        'Mumbai Indians',
        'Batsman',
        3500,
        1,
        8,
        'SKY'
    ),
    (
        'Hardik Pandya',
        'Mumbai Indians',
        'All-rounder',
        2500,
        60,
        15,
        'Kung Fu Pandya'
    );
SELECT *
from ipl_players;
SELECT name,
    nickname,
    team
FROM ipl_players;
-- Filtering
SELECT *
FROM ipl_players
WHERE team = 'Mumbai Indians';
SELECT name,
    nickname,
    auction_price_corores
FROM ipl_players
WHERE auction_price_corores > 10;
-- Logical operators (AND, OR)
-- AND
SELECT *
FROM ipl_players
WHERE wickets_taken > 10
    AND role = 'All-rounder' --OR
SELECT *
FROM ipl_players
WHERE team = 'Chennai Super Kings'
    OR team = 'Royal Challengers Bangalore';
-- Pattern Matching
SELECT *
FROM ipl_players
WHERE name LIKE '_a%';
-- not case sensitive
SELECT *
FROM ipl_players
WHERE name ILIKE '_A%';
--IN array
SELECT *
FROM ipl_players
WHERE team IN (
        'Punjab Kings',
        'Mumbai Indians',
        'Chennai Super Kings'
    );
-- BETWEEN
SELECT *
FROM ipl_players
WHERE auction_price_corores BETWEEN 10 AND 15
SELECT *
FROM ipl_players
WHERE team <> 'Chennai Super Kings';

--Sorting
SELECT name,
    nickname,
    auction_price_corores
FROM ipl_players
ORDER BY auction_price_corores DESC;

SELECT team, nickname, auction_price_corores FROM ipl_players ORDER BY team ASC, auction_price_corores DESC

--PAGINATION
SELECT name, nickname, auction_price_corores FROM ipl_players ORDER BY auction_price_corores DESC LIMIT 3;

SELECT name, nickname, auction_price_corores FROM ipl_players ORDER BY auction_price_corores DESC LIMIT 3 OFFSET 3; --How many rows i want to skip 

page 1: (1-1) * 15 = 0 --offset
page 1: (2-1) * 15 = 15 --offset
page 1: (3-1) * 15 = 30 --offset
page 1: (4-1) * 15 = 45 --offset

-- Modify data in runtime 

SELECT name, nickname, auction_price_corores, (auction_price_corores * 100) AS price_in_lakhs FROM ipl_players

SELECT name, nickname, auction_price_corores, (auction_price_corores * 2 ) AS new_price FROM ipl_players

-- How you can get distinct values

SELECT distinct role FROM ipl_players 

--Data Query Language(DQL)

