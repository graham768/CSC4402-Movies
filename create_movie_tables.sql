#Create tables

create table Genres
(
	movieId integer, 
	genre varchar(1000)
);

create table Movies
(
	movieId integer, 
	title varchar(1000),
	primary key(movieId)
);

create table Ratings
(
	userId integer, 
	movieId integer,
	rating decimal(1,1),
	primary key(userId, movieId)
);

create table Tags
(
	userId integer, 
	movieId integer, 
	tag varchar(1000),
	primary key(userId, movieId)
);

create table Genome_tags
(
	tagId integer, 
	tag varchar(1000), 
	primary key(tagId)
);

create table Genome_scores
(
	movieId integer, 
	tagId integer, 
	relevance decimal(5,5),
	primary key(movieId, tagId)
);

-- Takes first two columns and ignores genre
load data local infile './movie_data/movies.csv'
into table Movies 
fields terminated by ','
lines terminated by '\n'
ignore 1 lines
(movieId, title, @dummy);

load data local infile './movie_data/genres-normalized.csv' 
into table Genres
fields terminated by ',' 
lines terminated by '\r\n'
ignore 1 lines;

load data local infile './movie_data/ratings.csv' 
into table Ratings
fields terminated by ',' 
lines terminated by '\n'
ignore 1 lines;

load data local infile './movie_data/tags.csv' 
into table Tags 
fields terminated by ',' 
lines terminated by '\n'
ignore 1 lines;

load data local infile './movie_data/genome-tags.csv' 
into table Genome_tags 
fields terminated by ',' 
lines terminated by '\n'
ignore 1 lines;

load data local infile './movie_data/genome-scores.csv' 
into table Genome_scores 
fields terminated by ',' 
lines terminated by '\n'
ignore 1 lines;

