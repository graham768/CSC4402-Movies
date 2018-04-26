# Normalize the genres from the movie table

import csv 
input = csv.reader(open('movie_data/movies.csv'), delimiter=",") 
output = csv.writer(open('movie_data/genres-normalized.csv', 'w'), delimiter=",") 
for row in input:
	if row:
		for cell in row[2].split("|"):
			output.writerow([row[0], cell.replace('\r', '')])