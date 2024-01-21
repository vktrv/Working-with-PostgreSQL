CREATE TABLE IF NOT EXISTS music_genre (
	music_genre_id SERIAL PRIMARY KEY,
	name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS musician (
	musician_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS MusicianGenre (
	musician_id INTEGER REFERENCES musician(musician_id),
	musician_genre_id INTEGER REFERENCES music_genre(musician_genre_id),
	CONSTRAINT pk_MG PRIMARY KEY (musician_id, musician_genre_id)
);

CREATE TABLE IF NOT EXISTS album (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT null,
	year_of_issue date
);

CREATE TABLE IF NOT EXISTS MusicianAlbum (
	musician_id INTEGER REFERENCES musician(musician_id),
	album_id INTEGER REFERENCES album(album_id),
	CONSTRAINT pk_AM PRIMARY KEY (musician_id, album_id)
);

CREATE TABLE IF NOT EXISTS track (
	track_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT null,
	duration INTEGER not null,
	album_id INTEGER NOT NULL REFERENCES album(album_id)
);

CREATE TABLE IF NOT EXISTS collection (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT null,
	year_of_issue date
);

CREATE TABLE IF NOT EXISTS TrackCollection (
	collection_id INTEGER REFERENCES collection(collection_id),
	track_id INTEGER REFERENCES track(track_id),
	CONSTRAINT pk_CL PRIMARY KEY (collection_id, track_id)
);