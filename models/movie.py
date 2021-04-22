class Movie:
    def __init__(self, id, title, year, genre_id = None):
        self.id = id
        self.title = title
        self.year = year
        self.genre_id = genre_id
        self.genre = None
        self.actors = None
