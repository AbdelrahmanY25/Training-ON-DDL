CREATE DATABASE movies_mangement;
go

CREATE SCHEMA movies;
go

CREATE TABLE movie (
	mov_id int primary key,
	mov_title varchar(50),
	mov_year int,
	mov_time int,
	mov_lang char(50),
	mav_dt_rel date,
	mov_rel_country char(50)
);

alter schema movies transfer object :: dbo.movie;

alter table movies.movie
alter column mov_title varchar(50) NOT NULL;

alter table movies.movie
alter column mov_rel_country char(50) NOT NULL;

CREATE TABLE movies.actor (
	act_id int primary key,
	act_fname char(20) not null,
	act_lname char(20) not null,
	act_gender char(1) not null
);

CREATE TABLE movies.rating (
	mov_id int,
	rev_id int,
	rev_stars int,
	num_o_ratings int
);

ALTER TABLE movies_mangement.movies.rating
ADD CONSTRAINT fk_rat_of_mov FOREIGN KEY(mov_id) REFERENCES movies.movie(mov_id);

ALTER TABLE movies_mangement.movies.rating
ADD CONSTRAINT fk_rat_of_reviewer FOREIGN KEY(rev_id) REFERENCES movies.reviewer(rev_id);

CREATE TABLE movies.director (
	dir_id int,
	dir_fname char(20),
	dir_lname char(20)
);

alter table movies.director
alter column dir_id int not null;

alter table movies.director
add primary key (dir_id);

CREATE TABLE movies.movie_cast (
	act_id int,
	mov_id int,
	role char(30)
);

Alter TABLE movies_mangement.movies.movie_cast
ADD CONSTRAINT fk_cast_o_movie FOREIGN KEY(act_id) REFERENCES movies.actor(act_id);

Alter TABLE movies_mangement.movies.movie_cast
ADD CONSTRAINT fk_movie_o_movies FOREIGN KEY(mov_id) REFERENCES movies.movie(mov_id);

CREATE TABLE movies.movie_genres (
	mov_id int,
	gen_id int
);

ALTER TABLE movies_mangement.movies.movie_genres
ADD CONSTRAINT fk_mov_gen FOREIGN KEY(mov_id) REFERENCES movies.movie(mov_id);

ALTER TABLE movies_mangement.movies.movie_genres
ADD CONSTRAINT fk_gen_gens FOREIGN KEY(gen_id) REFERENCES movies.genres(gen_id);


alter table movies.movie_genres
alter column mov_id int not null;

CREATE TABLE movies.genres (
	gen_id int primary key,
	gen_title char(20)
);

CREATE TABLE movies.reviewer (
	rev_id int primary key,
	rev_name char(30)
);

CREATE TABLE movies.movie_direction (
	dir_id int not null,
	mov_id int not null
);

ALTER TABLE movies_mangement.movies.movie_direction
ADD CONSTRAINT fk_dir_o_mov FOREIGN KEY(mov_id) REFERENCES movies.movie(mov_id);

ALTER TABLE movies_mangement.movies.movie_direction
ADD CONSTRAINT fk_director_o_dir FOREIGN KEY(dir_id) REFERENCES movies.director(dir_id);