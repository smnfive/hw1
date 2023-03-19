CREATE TABLE genre
(
	genre_id int GENERATED ALWAYS AS IDENTITY,
	genre_name varchar,
	musician_id int,
	
	CONSTRAINT PK_genre_genre_id PRIMARY KEY(genre_id)
);

CREATE TABLE musician
(
	musician_id int GENERATED ALWAYS AS IDENTITY,
	musician_name varchar,
	genre_id int,
	album_id int,
	
	CONSTRAINT PK_musician_musician_id PRIMARY KEY(musician_id)
);

ALTER TABLE genre
ADD CONSTRAINT FK_musician_musician_id FOREIGN KEY(musician_id) REFERENCES musician(musician_id);

ALTER TABLE musician
ADD CONSTRAINT FK_genre_genre_id FOREIGN KEY(genre_id) REFERENCES genre(genre_id);

CREATE TABLE album
(
	album_id int GENERATED ALWAYS AS IDENTITY,
	album_name varchar,
	album_year varchar(4),
	musician_id int,
	
	CONSTRAINT PK_album_album_id PRIMARY KEY(album_id),
	CONSTRAINT FK_musician_musician_id FOREIGN KEY(musician_id) REFERENCES musician(musician_id)
);

ALTER TABLE genre
ALTER COLUMN genre_name SET NOT NULL;

ALTER TABLE musician
ALTER COLUMN musician_name SET NOT NULL;

ALTER TABLE album
ALTER COLUMN album_name SET NOT NULL;

ALTER TABLE album
ALTER COLUMN album_year SET NOT NULL;

CREATE TABLE tracks
(
	track_id int GENERATED ALWAYS AS IDENTITY,
	track_name varchar NOT NULL,
	track_year varchar(4) NOT NULL,
	album_id int,
	
	CONSTRAINT PK_tracks_track_id PRIMARY KEY(track_id)
	CONSTRAINT FK_album_album_id FOREIGN KEY(album_id) REFERENCES album(album_id)
)

CREATE TABLE mix
(
	mix_id int GENERATED ALWAYS AS IDENTITY,
	mix_name varchar NOT NULL,
	mix_year varchar(4) NOT NULL,
	mix_contain text NOT NULL,
	
	CONSTRAINT PK_mix_mix_id PRIMARY KEY(mix_id)
)
	