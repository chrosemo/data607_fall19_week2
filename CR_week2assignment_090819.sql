/*
DATA 607: Week 2 Assignment - SQL and R
C. Rosemond 090819
PostgreSQL
*/

--Creating table for movie ratings
CREATE TABLE ratings (
	critic_id varchar(2) PRIMARY KEY,
	endgame integer NULL, --Avengers: Endgame
	midsommar integer NULL, --Midsommar
	lion_king integer NULL, --The Lion King
	john_wick3 integer NULL, --John Wick: Chapter 3 - Parabellum
	last_SF integer NULL, --The Last Black Man in San Francisco
	once_hollywood integer NULL --Once Upon a Time in Hollywood
);
--Inserting values into table ratings
INSERT INTO ratings (
	critic_id,
	endgame,
	midsommar,
	lion_king,
	john_wick3,
	last_SF,
	once_hollywood)
VALUES ('1', 3, 4, NULL, 5, NULL, 6),
       ('2', NULL, 4, NULL, NULL, 5, 5),
	   ('3', 5, NULL, 2, NULL, NULL, NULL),
	   ('4', 4, 3, NULL, 4, 4, NULL),
	   ('5', 4, NULL, 3, NULL, NULL, 4),
	   ('6', NULL, NULL, 2, 3, NULL, NULL),
	   ('7', NULL, NULL, NULL, NULL, 5, 5),
	   ('8', 3, 4, NULL, 4, 5, NULL),
	   ('9', 4, NULL, 3, NULL, NULL, NULL),
	   ('10', 4, 4, NULL, 4, 5, 5);
--Checking table ratings
SELECT * FROM ratings;