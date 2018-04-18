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

-- Takes first two columns and ignores genre
load data local infile '../data/movies.csv'
into table Movies 
(column1, column2, @dummy)
fields terminated by ','
lines terminated by '\n';

load data local infile '../data/ratings.csv' 
into table Ratings
fields terminated by ',' 
lines terminated by '\n';

load data local infile '../data/tags.csv' 
into table Tags 
fields terminated by ',' 
lines terminated by '\n';

load data local infile '../data/genome-tags.csv' 
into table Genome_tags 
fields terminated by ',' 
lines terminated by '\n';

load data local infile '../data/genome-scores.csv' 
into table Genome_scores 
fields terminated by ',' 
lines terminated by '\n';


