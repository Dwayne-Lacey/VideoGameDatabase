-- Code to build out video game database
CREATE TABLE games (
    id int PRIMARY KEY,
    title varchar(200) NOT NULL UNIQUE,
    players int,
    release_date date,
    rating decimal
);

CREATE TABLE publisher (
    id int PRIMARY KEY,
    name varchar(50) NOT NULL UNIQUE,
    year_founded varchar(4),
    first_party boolean
);

CREATE TABLE developer (
    id int PRIMARY KEY,
    name varchar(50) NOT NULL UNIQUE,
    year_founded varchar(4),
    first_party boolean    
);

CREATE TABLE games_developers_publishers (
    game_id int REFERENCES games(id),
    developer_id int REFERENCES developer(id),
    publisher_id int REFERENCES publisher(id),
    PRIMARY KEY (game_id, developer_id, publisher_id)
);

CREATE TABLE consoles (
    id int PRIMARY KEY,
    name varchar(30) NOT NULL UNIQUE,
    year_released varchar(4),
    developer_id int REFERENCES developer(id),
    total_games int
);

CREATE TABLE games_and_consoles (
    game_id int REFERENCES games(id),
    console_id int REFERENCES consoles(id),
    PRIMARY KEY (game_id, console_id)
);

CREATE TABLE genre (
    id int PRIMARY KEY,
    name varchar(30) UNIQUE,
    description varchar(600)
);

CREATE TABLE games_genre (
    genre_id int REFERENCES genre(id),
    game_id int REFERENCES games(id),
    PRIMARY KEY (genre_id, game_id)
);
