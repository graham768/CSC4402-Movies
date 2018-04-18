#Create tables

create table Genres
(
	movieId integer, 
	genre varchar(1000)
	primary key(movieId, genre)
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
	rating decimal,
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
	relevance decimal,
	primary key(movieId, tagId)
);





