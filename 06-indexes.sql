CREATE TABLE marks(
    id SERIAL PRIMARY KEY,
    name text,
    marks INT not null
)

INSERT INTO marks (name, marks)
SELECT
    substr(
        translate(
            md5(random()::text || gs::text),
            'abcdefghijklmnopqrstuvwxyz',
            'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
        ),
        1,
        12
    ) AS name,
    floor(random() * 100 + 1)::int AS marks

FROM generate_series(1, 1000000) AS gs;

SELECT * FROM marks;

explain analyze SELECT * FROM marks WHERE name = '326E2CB9CE65'

CREATE INDEX idx_name ON marks (name)
CREATE INDEX idx_name ON marks (name) INCLUDE (marks); -- non-key column for covering index

DROP INDEX IF EXISTS idx_name;