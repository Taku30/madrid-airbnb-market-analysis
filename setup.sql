SELECT current_database();

CREATE TABLE listings (
    id BIGINT PRIMARY KEY,
    name TEXT,
    host_id BIGINT,
    host_name TEXT,
    neighbourhood_group TEXT,
    neighbourhood TEXT,
    latitude NUMERIC,
    longitude NUMERIC,
    room_type TEXT,
    price NUMERIC,
    minimum_nights INTEGER,
    number_of_reviews INTEGER,
    last_review DATE,
    reviews_per_month NUMERIC,
    calculated_host_listings_count INTEGER,
    availability_365 INTEGER,
    number_of_reviews_ltm INTEGER,
    license TEXT
);

-- ==========================================================
-- SETUP (Used to verify the database)
-- ==========================================================

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';