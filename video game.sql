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
    name varchar(30) NOT NULL UNIQUE,
    year_founded varchar(4),
    first_party boolean
);

CREATE TABLE developer (
    id int PRIMARY KEY,
    name varchar(30) NOT NULL UNIQUE,
    year_founded varchar(4),
    first_party boolean    
);

CREATE TABLE games_developers_publishers (
    game_title varchar(200) REFERENCES games(title),
    developer_name varchar(30) REFERENCES developer(name),
    publisher_name varchar(30) REFERENCES publisher(name),
    PRIMARY KEY (game_title, developer_name, publisher_name)
);

CREATE TABLE consoles (
    id int PRIMARY KEY,
    name varchar(30) NOT NULL UNIQUE,
    year_released varchar(4),
    developer varchar(30) REFERENCES developer(name),
    total_games int
);

CREATE TABLE games_and_consoles (
    game_title varchar(200) REFERENCES games(title),
    console_name varchar(30) REFERENCES consoles(name),
    PRIMARY KEY (game_title, console_name)
);

CREATE TABLE genre (
    id int PRIMARY KEY,
    name varchar(30) UNIQUE,
    description varchar(300)
);

CREATE TABLE games_genre (
    genre_name varchar(30) REFERENCES genre(name),
    game_title varchar(200) REFERENCES games(title),
    PRIMARY KEY (name, game_title)
);
