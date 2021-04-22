CREATE TABLE `Movie` (
    `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`title`  TEXT NOT NULL,
    `year` TEXT NOT NULL,
	`genre_id` INTEGER NOT NULL,
	FOREIGN KEY(`genre_id`) REFERENCES `Genre`(`id`)
);

CREATE TABLE `Genre` (
    `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`label`  TEXT NOT NULL
);

CREATE TABLE `Actor` (
    `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`  TEXT NOT NULL
);

CREATE TABLE `Movie_Actor` (
    `id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`movie_id`  INTEGER NOT NULL,
	`actor_id`  INTEGER NOT NULL,
    FOREIGN KEY(`movie_id`) REFERENCES `Movie`(`id`),
    FOREIGN KEY(`actor_id`) REFERENCES `Actor`(`id`)
);

INSERT INTO `Genre` VALUES (null, 'Comedy');
INSERT INTO `Genre` VALUES (null, 'Drama');
INSERT INTO `Genre` VALUES (null, 'Action');

INSERT INTO `Actor` VALUES (null, 'Eric Idle');
INSERT INTO `Actor` VALUES (null, 'John Cleese');
INSERT INTO `Actor` VALUES (null, 'Michael Palin');
INSERT INTO `Actor` VALUES (null, 'Terry Jones');
INSERT INTO `Actor` VALUES (null, 'Graham Chapman');
INSERT INTO `Actor` VALUES (null, 'Terry Gilliam');

INSERT INTO `Movie` VALUES (null, 'And Now For Something Completely Different', '1971', 1);
INSERT INTO `Movie` VALUES (null, 'Monty Python and the Holy Grail', '1975', 1);
INSERT INTO `Movie` VALUES (null, "Monty Python's Life of Brian", '1979', 1);
INSERT INTO `Movie` VALUES (null, 'Monty Python Live at the Hollywood Bowl', '1982', 1);
INSERT INTO `Movie` VALUES (null, "Monty Python's Meaning of Life", '1983', 1);
INSERT INTO `Movie` VALUES (null, 'Return of the Jedi', '1983', 3);
INSERT INTO `Movie` VALUES (null, 'Willie Wonka and the Chocolate Factory', '1971', 1);
INSERT INTO `Movie` VALUES (null, 'Jaws', '1975', 2);

INSERT INTO `Movie_Actor` values (null, 1, 1);
INSERT INTO `Movie_Actor` values (null, 1, 2);
INSERT INTO `Movie_Actor` values (null, 1, 3);
INSERT INTO `Movie_Actor` values (null, 1, 4);
INSERT INTO `Movie_Actor` values (null, 1, 5);
INSERT INTO `Movie_Actor` values (null, 2, 1);
INSERT INTO `Movie_Actor` values (null, 2, 2);
INSERT INTO `Movie_Actor` values (null, 2, 3);
INSERT INTO `Movie_Actor` values (null, 2, 4);
INSERT INTO `Movie_Actor` values (null, 2, 5);
INSERT INTO `Movie_Actor` values (null, 3, 1);
INSERT INTO `Movie_Actor` values (null, 3, 2);
INSERT INTO `Movie_Actor` values (null, 3, 3);
INSERT INTO `Movie_Actor` values (null, 3, 4);
INSERT INTO `Movie_Actor` values (null, 3, 5);
INSERT INTO `Movie_Actor` values (null, 4, 1);
INSERT INTO `Movie_Actor` values (null, 4, 2);
INSERT INTO `Movie_Actor` values (null, 4, 3);
INSERT INTO `Movie_Actor` values (null, 4, 4);
INSERT INTO `Movie_Actor` values (null, 4, 5);
INSERT INTO `Movie_Actor` values (null, 5, 1);
INSERT INTO `Movie_Actor` values (null, 5, 2);
INSERT INTO `Movie_Actor` values (null, 5, 3);
INSERT INTO `Movie_Actor` values (null, 5, 4);
INSERT INTO `Movie_Actor` values (null, 5, 5);

select
    m.id as movie_id,
    m.title,
    m.year,
    g.label,
    g.id as genre_id,
    a.name
from Movie m
join Genre g on g.id = m.genre_id
join Movie_Actor ma on m.id = ma.movie_id
join Actor a on a.id = ma.actor_id;

