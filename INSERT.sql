
-- Исполнители
INSERT INTO Artist (name) VALUES
('Mariah Carey'),
('Louis Armstrong'),
('Jennifer Lopez'),
('GOT7');

-- Жанры
INSERT INTO Genre (name) VALUES
('Pop'),
('Jazz'),
('Soul');

-- Альбомы
INSERT INTO Album (title, release_year) VALUES
('Butterfly', 1997),
('What a Wonderful World', 1967),
('On the 6', 1999),
('New Era', 2020);

-- Треки
INSERT INTO Track (title, duration, album_id) VALUES
('Honey', 270, 1),
('My All', 265, 1),
('What a Wonderful World', 140, 2),
('La Vie En Rose', 180, 2),
('If You Had My Love', 245, 3),
('Waiting for Tonight', 250, 3),
('Python', 220, 4),
('Fresh Start', 200, 5);

-- Сборники
INSERT INTO Compilation (title, release_year) VALUES
('Pop Legends', 2005),
('Jazz Classics', 2000),
('Soul & Pop Hits', 2018),
('K-Pop Hits', 2020);

-- Связи ArtistGenre
INSERT INTO ArtistGenre (artist_id, genre_id) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1),
(4, 1),
(4, 3);

-- Связи ArtistAlbum
INSERT INTO ArtistAlbum (artist_id, album_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Связи CompilationTrack
INSERT INTO CompilationTrack (compilation_id, track_id)
SELECT c.id, t.id
FROM Compilation c, Track t
WHERE (c.title = 'Pop Legends' AND t.title IN ('Honey', 'If You Had My Love', 'Waiting for Tonight'))
   OR (c.title = 'Jazz Classics' AND t.title IN ('What a Wonderful World', 'La Vie En Rose'))
   OR (c.title = 'Soul & Pop Hits' AND t.title IN ('My All', 'Lullaby'))
   OR (c.title = 'K-Pop Hits' AND t.title IN ('Python', 'Fresh Start'));
