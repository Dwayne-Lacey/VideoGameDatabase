# Python script to automate the insertion of data for video games database
import psycopg2
from video_game_data import games_data, consoles, developer, publisher, games_developers_publishers_data, genre, games_genre, games_and_consoles
# Class designed to insert all pertinent data into video game database
class DataInserter:
    def insert_games(self, cur, data_set):
        for data in data_set:
            cur.execute("INSERT INTO games(id, title, players, release_date, rating) VALUES (%s, %s, %s, %s, %s)", (data[0], data[1], data[2], data[3], data[4]))

    def insert_consoles(self, cur, data_set):
        for data in data_set:
            cur.execute("INSERT INTO consoles(id, name, year_released, developer, total_games) VALUES (%s, %s, %s, %s, %s)", (data[0], data[1], data[2], data[3], data[4]))

    def insert_developers(self, cur, data_set):
        for data in data_set:
            cur.execute("INSERT INTO developer(id, name, year_founded, first_party) VALUES (%s, %s, %s, %s)", (data[0], data[1], data[2], data[3]))

    def insert_publishers(self, cur, data_set):
        for data in data_set:
            cur.execute("INSERT INTO publisher(id, name, year_founded, first_party) VALUES (%s, %s, %s, %s)", (data[0], data[1], data[2], data[3]))

    def insert_games_developers_publishers(self, cur, data_set):
        for data in data_set:
            cur.execute("INSERT INTO games_developers_publishers(game_title, developer_name, publisher_name) VALUES (%s, %s, %s)", (data[0], data[1], data[2]))

    def insert_genre(self, cur, data_set):
        for data in data_set:
            cur.execute("INSERT INTO genre(id, name, description) VALUES (%s, %s, %s)", (data[0], data[1], data[2]))

    def insert_games_consoles(self, cur, data_set):
        for data in data_set:
            cur.execute("INSERT INTO games_and_consoles(game_title, console_name) VALUES (%s, %s)", (data[0], data[1]))

    def insert_games_genre(self, cur, data_set):
        for data in data_set:
            cur.execute("INSERT INTO games_genre(genre_name, game_title) VALUES (%s, %s)", (data[0], data[1]))

    def insert_db_data(self):
        # Connecting to my postgres DB
        conn = psycopg2.connect(database="Games", user="postgres", password="", host="localhost", port="5432")
        
        # Open a cursor to perform database operations
        cur = conn.cursor()
        
        # Execute a query
        # Function calls to specific dataset entry functions
        self.insert_games(cur, games_data)
        self.insert_consoles(cur, consoles)
        self.insert_developers(cur, developer)
        self.insert_publishers(cur, publisher)
        self.insert_games_developers_publishers(cur, games_developers_publishers_data)
        self.insert_genre(cur, genre)
        self.insert_games_genre(cur, games_genre)
        self.insert_games_consoles(cur, games_and_consoles)


        conn.commit()
        cur.close()
        conn.close()


db_insert = DataInserter()
db_insert.insert_db_data()
