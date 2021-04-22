from models.genre import Genre
import sqlite3
import json
from models.movie import Movie
from models.actor import Actor


def get_all_movies():
    # TODO: Return all movies with their genre and list of actors
    with sqlite3.connect('./movies.db') as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        select
            m.id as movie_id,
            m.title,
            m.year,
            g.label,
            g.id as genre_id
        from Movie m
        join Genre g on g.id = m.genre_id
        """)

        dataset = db_cursor.fetchall()

        movies = []

        for potato in dataset:
            movie = Movie(potato['movie_id'], potato['title'], potato['year'])
            genre = Genre(potato['genre_id'], potato['label'])

            movie.genre = genre.__dict__

            db_cursor.execute("""
                select a.id, a.name
                from Actor a
                join Movie_Actor ma on a.id = ma.actor_id
                where ma.movie_id = ?
            """, (movie.id, ))

            actors_rows = db_cursor.fetchall()

            actors = []

            for actor in actors_rows:
                a = Actor(actor['id'], actor['name'])
                actors.append(a.__dict__)
            
            movie.actors = actors
            movies.append(movie.__dict__)
        
        return json.dumps(movies)


def get_movies_by_year(year):
    # TODO: Get all movies released in the same year
   with sqlite3.connect('./movies.db') as conn:
    #    class with init method db_cursor and tuple as args
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        select m.id, m.year, m.title, m.genre_id
        from Movie m
        where year = ?
        """, (year, ))

        dataset = db_cursor.fetchall()

        movies = []

        for row in dataset:
            movie = Movie(row['id'], row['title'], row['year'], row['genre_id'])
            movies.append(movie.__dict__)

        return json.dumps(movies)


    

