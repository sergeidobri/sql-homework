-- Музыкальные артисты
CREATE TABLE IF NOT EXISTS MusicalArtists (
	musical_artist_id SERIAL PRIMARY KEY,
	name VARCHAR(120) NOT NULL
);

-- Жанры
CREATE TABLE IF NOT EXISTS Jenres (
	jenre_id SERIAL PRIMARY KEY,
	name VARCHAR(120) NOT NULL UNIQUE
);

-- Связь Many-To-Many между жанрами и артистами
CREATE TABLE IF NOT EXISTS ArtistsJenres (
	musical_artist_id INTEGER REFERENCES MusicalArtists(musical_artist_id),
	jenre_id INTEGER REFERENCES Jenres(jenre_id),
	PRIMARY KEY(musical_artist_id, jenre_id)
);

-- Альбомы
CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(120) NOT NULL,
	year INTEGER NOT NULL CHECK(year > 0)
);

-- Связь Many-To-Many между альбомами и артистами
CREATE TABLE IF NOT EXISTS AlbumsArtists (
	musical_artist_id INTEGER REFERENCES MusicalArtists(musical_artist_id),
	album_id INTEGER REFERENCES Albums(album_id),
	PRIMARY KEY(musical_artist_id, album_id)
);

-- Треки
CREATE TABLE IF NOT EXISTS Recordings (
	recording_id SERIAL PRIMARY KEY,
	album_id INTEGER REFERENCES Albums(album_id),
	name VARCHAR(120) NOT NULL,
	duration INTEGER NOT NULL
);

-- Сборники
CREATE TABLE IF NOT EXISTS Collections (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(120) NOT NULL,
	year INTEGER NOT NULL CHECK(year > 0)
);

-- Связь Many-To-Many между сборниками и треками
CREATE TABLE IF NOT EXISTS CollectionsRecordings (
	recording_id INTEGER REFERENCES Recordings(recording_id),
	collection_id INTEGER REFERENCES Collections(collection_id),	
	PRIMARY KEY(recording_id, collection_id)
);