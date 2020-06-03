--#1
SELECT
	Id,
	Label
FROM Genre;

--#2
SELECT
	Id,
	ArtistName,
	YearEstablished
FROM Artist ORDER BY(ArtistName);

--#3
SELECT
	song.Id,
	song.Title,
	song.ArtistId,
	artist.ArtistName
FROM Song song JOIN Artist artist ON song.ArtistId = artist.Id;

--#4
SELECT
	Artist.ArtistName,
	Genre.Label
FROM Album album
LEFT JOIN Artist artist ON artist.Id = album.ArtistId
LEFT JOIN Genre genre ON genre.Id = album.GenreId
WHERE Album.GenreId = 7;

--#5
SELECT
	Artist.ArtistName,
	Genre.Label
FROM Album album
LEFT JOIN Artist artist ON artist.Id = album.ArtistId
LEFT JOIN Genre genre ON genre.Id = album.GenreId
WHERE Album.GenreId = 2 OR Album.GenreId = 4;

--#6
SELECT
	album.Title
FROM Album album
LEFT JOIN Song song ON album.Id = song.AlbumId
WHERE song.AlbumId IS NULL;

-- Steps 7-9 were all insert statements.

--#10
SELECT
	song.Title AS 'Song Title',
	album.Title AS 'Album Title',
	artist.ArtistName As 'Artist'
FROM Song song 
LEFT JOIN Album album ON album.Id = song.AlbumId
LEFT JOIN Artist artist ON artist.Id = song.ArtistId
WHERE album.Title = 'Frank Proffitt Sings Folk Songs'

--#11
SELECT 
	album.Title, 
	Count(song.Id) AS 'Song Count'
FROM Album album
JOIN Song song ON song.AlbumId = album.Id
GROUP BY (album.Title)

--#12
SELECT 
	artist.ArtistName, 
	Count(song.Id) AS 'Song Count'
FROM Artist artist
JOIN Song song ON song.ArtistId = artist.Id
GROUP BY (artist.ArtistName)

--#13
SELECT 
	genre.Label, 
	COUNT(song.Id) AS 'Song Count' 
FROM Genre genre
INNER JOIN Song song ON song.GenreId = genre.Id
GROUP BY (genre.Label)
ORDER BY COUNT(song.Id) DESC

--#14
SELECT
	artist.ArtistName,
	COUNT(album.Label) AS 'RecordLabels'
FROM Artist artist
LEFT JOIN Album album ON album.artistId = artist.Id
GROUP BY (artist.ArtistName)
HAVING COUNT(album.Label) > 1;

--#15
SELECT
	Title,
	AlbumLength
FROM Album
WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album);

--#16
SELECT
	song.Title,
	song.SongLength,
	album.Title AS 'Album Title'
FROM Song song
LEFT JOIN Album album ON song.AlbumId = album.Id
WHERE SongLength = (SELECT MAX(SongLength) FROM Song);


