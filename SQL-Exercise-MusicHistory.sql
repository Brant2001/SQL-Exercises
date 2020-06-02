SELECT
	Id,
	Label
FROM Genre;

SELECT
	Id,
	ArtistName,
	YearEstablished
FROM Artist ORDER BY(ArtistName);

SELECT
	song.Id,
	song.Title,
	song.ArtistId,
	artist.ArtistName
FROM Song song JOIN Artist artist ON song.ArtistId = artist.Id;

SELECT
	Artist.ArtistName,
	Genre.Label
FROM Album album
LEFT JOIN Artist artist ON artist.Id = album.ArtistId
LEFT JOIN Genre genre ON genre.Id = album.GenreId
WHERE Album.GenreId = 7;

SELECT
	Artist.ArtistName,
	Genre.Label
FROM Album album
LEFT JOIN Artist artist ON artist.Id = album.ArtistId
LEFT JOIN Genre genre ON genre.Id = album.GenreId
WHERE Album.GenreId = 2 OR Album.GenreId = 4;

SELECT
	Song.Id,
	Album.Title
FROM Song song
LEFT JOIN Album album ON album.Id = song.AlbumId
WHERE Song.AlbumId = 0;