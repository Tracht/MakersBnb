\c makersbnb
CREATE TABLE Users (userID SERIAL PRIMARY KEY, first_name VARCHAR(60), last_name VARCHAR(60), email VARCHAR(60), password VARCHAR(60));
\c makersbnb_test 
CREATE TABLE Users (userID SERIAL PRIMARY KEY, first_name VARCHAR(60), last_name VARCHAR(60), email VARCHAR(60), password VARCHAR(60));
