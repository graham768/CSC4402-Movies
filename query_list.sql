
-- 1. Highest rated movies (Large Time Complexity)
Select m.title, Avg(r.rating)
From Ratings as r, Movies as m
Where m.movieId = r.movieId
Group by r.movieId
Order by Avg(r.rating) DESC;


-- 2. Movie with the highest number of ratings (~70sec)
Select m.title, Count(r.rating)
From Ratings as r, Movies as m
Where m.movieId = r.movieId
Group by r.movieId
Order by Count(r.rating) DESC;


-- 3. Most commonly used tag
Select t.tag, Count(t.tag) as count_tag
From Tags as t
Group by t.tag
Order by count_tag DESC;


-- 4. Most common genres
Select g.genre, Count(g.genre)
From Genres as g
Group by g.genre
Order by Count(g.genre) DESC;


-- 5. Return the most relevant tags of the movie Toy Story
Select  tag, relevance
From Movies natural join Genome_scores natural join Genome_tags
Where title = 'Toy Story (1995)'
Order by relevance DESC; 


-- 6. Return all movies with the tag “Cyberpunk” with relevance of .5 or higher (~23sec)
Select title, relevance
From Movies natural join Genome_scores natural join Genome_tags
Where tag = 'cyberpunk' AND relevance >= 0.5
Order by relevance DESC;


-- 7. Highest rated 007 (series) (~14sec)
Select a.title, Avg(r.rating) as avg_rating
From ( 
	Select distinct m.title, m.movieId
	From Movies m, Tags t
	Where tag='007' and m.movieId=t.movieId
) as a, Ratings r
where a.movieId=r.movieId
group by a.movieId
order by avg_rating DESC;


-- 8. Worst Adam Sandler Movie (~17sec)
Select a.title, Avg(r.rating) as avg_rating
From ( 
	Select distinct m.title, m.movieId
	From Movies m, Tags t
	Where tag='Adam Sandler' and m.movieId=t.movieId
) as a, Ratings r
where a.movieId=r.movieId
group by a.movieId
order by avg_rating;


-- 9. List Horror Comedy
Select m.movieId, m.title
from (select a.title, a.movieId
	from Movies a, Genres g
	where genre = 'Comedy' and a.movieId=g.movieId) as m
where m.movieId in 
(select g.movieId
from Genres g
where genre='Horror');


-- 10. Best Horror Comedy With Strippers
Select a.title, Avg(r.rating) as average_rating, count(r.rating) as num_of_ratings
From ( 
	Select m.movieId, m.title
	From (
		Select distinct b.title, b.movieId
		From Movies b, Genres g, Tags t
		Where genre = 'Comedy' and b.movieId=g.movieId and tag='strippers' and b.movieId=t.movieId) as m
	Where m.movieId in (
		Select g.movieId
		From Genres g
		Where genre='Horror')) as a, Ratings r
where a.movieId=r.movieId
group by a.movieId
order by average_rating DESC;


