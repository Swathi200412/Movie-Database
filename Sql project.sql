CREATE DATABASE MovieDB;

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100),
    release_year INT,
    genre VARCHAR(50),
    duration INT
);

CREATE TABLE Actors (
    actor_id INT PRIMARY KEY,
    actor_name VARCHAR(100),
    gender VARCHAR(10),
    age INT
);

CREATE TABLE Directors (
    director_id INT PRIMARY KEY,
    director_name VARCHAR(100),
    nationality VARCHAR(50)
);

CREATE TABLE Ratings (
    rating_id INT PRIMARY KEY,
    movie_id INT,
    rating DECIMAL(3,1),
    reviewer VARCHAR(100),
    FOREIGN KEY (movie_id)
    REFERENCES Movies(movie_id)
);

CREATE TABLE Movie_Actors (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY(movie_id, actor_id),
    FOREIGN KEY(movie_id)
    REFERENCES Movies(movie_id),
    FOREIGN KEY(actor_id)
    REFERENCES Actors(actor_id)
);

CREATE TABLE Movie_Directors (
    movie_id INT,
    director_id INT,
    PRIMARY KEY(movie_id, director_id),
    FOREIGN KEY(movie_id)
    REFERENCES Movies(movie_id),
    FOREIGN KEY(director_id)
    REFERENCES Directors(director_id)
);




INSERT INTO Movies VALUES (5,'96',2018,'Romance',158);

select*from movies;
INSERT INTO Movies VALUES (1,'Leo',2023,'Action',165);
INSERT INTO Movies VALUES (2,'Jailer',2023,'Action',170);
INSERT INTO Movies VALUES (3,'Master',2021,'Action',179);
INSERT INTO Movies VALUES (4,'Vikram',2022,'Thriller',175);
select*from movies;


INSERT INTO Actors VALUES
(101,'Vijay','Male',50),
(102,'Rajinikanth','Male',74),
(103,'Vijay Sethupathi','Male',47),
(104,'Kamal Haasan','Male',71),
(105,'Trisha','Female',42);
select*from Actors;

INSERT INTO Directors VALUES
(201,'Lokesh Kanagaraj','Indian'),
(202,'Nelson Dilipkumar','Indian'),
(203,'C Prem Kumar','Indian');
select*from Directors;

INSERT INTO Ratings VALUES
(1,1,8.5,'User1'),
(2,2,8.8,'User2'),
(3,3,8.2,'User3'),
(4,4,9.1,'User4'),
(5,5,8.7,'User5');
select*from Ratings;

INSERT INTO Movie_Actors VALUES
(1,101),
(2,102),
(3,101),
(3,103),
(4,104),
(4,103),
(5,105),
(5,103);
select*from Movie_Actors; 


INSERT INTO Movie_Directors VALUES
(1,201),
(2,202),
(3,201),
(4,201),
(5,203);
select*from Movie_Directors;


SELECT *
FROM Movies;
(Movies Released After 2020)
SELECT *
FROM Movies
WHERE release_year > 2020;
(Show Movie Ratings)
SELECT m.title, r.rating
FROM Movies m
JOIN Ratings r
ON m.movie_id = r.movie_id;

(Highest Rated Movie)
SELECT m.title, r.rating
FROM Movies m
JOIN Ratings r
ON m.movie_id = r.movie_id
ORDER BY r.rating DESC
LIMIT 1;

(Actors in Each Movie)
SELECT m.title, a.actor_name
FROM Movies m
JOIN Movie_Actors ma
ON m.movie_id = ma.movie_id
JOIN Actors a
ON ma.actor_id = a.actor_id;

(Director of Each Movie)
SELECT m.title, d.director_name
FROM Movies m
JOIN Movie_Directors md
ON m.movie_id = md.movie_id
JOIN Directors d
ON md.director_id = d.director_id;

(Average Movie Rating)
SELECT AVG(rating) AS Average_Rating
FROM Ratings;

(Count Movies by Genre)
SELECT genre,
       COUNT(*) AS Total_Movies
FROM Movies
GROUP BY genre;

(Movies with Rating Above 8.5)
SELECT m.title, r.rating
FROM Movies m
JOIN Ratings r
ON m.movie_id = r.movie_id
WHERE r.rating > 8.5;

(Actor Appearing in Most Movies)
SELECT a.actor_name,
       COUNT(ma.movie_id) AS Movie_Count
FROM Actors a
JOIN Movie_Actors ma
ON a.actor_id = ma.actor_id
GROUP BY a.actor_name
ORDER BY Movie_Count DESC;




