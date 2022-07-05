-- Code to build out video game database
CREATE TABLE games (
    id int PRIMARY KEY,
    title varchar(50) UNIQUE,
    players int,
    release_date date,
    rating decimal
);

CREATE TABLE publisher (
    id int PRIMARY KEY,
    name varchar(30) UNIQUE,
    number_games_published int,
    year_founded varchar(4),
    first_party boolean
);

CREATE TABLE developer (
    id int PRIMARY KEY,
    name varchar(30) UNIQUE,
    number_games_developed int,
    year_founded varchar(4),
    first_party boolean    
);

CREATE TABLE games_developers_publishers (
    game_title varchar(50) REFERENCES games(title),
    developer_name varchar(30) REFERENCES developer(name),
    publisher_name varchar(30) REFERENCES publisher(name),
    PRIMARY KEY (game_title, developer_name, publisher_name)
);