INSERT INTO MusicalArtists(name)
     VALUES ('MORGENSHTERN'), 
            ('Мот'), 
            ('Клава Кока'), 
            ('lil peep'), 
            ('Михаил Круг'), 
            ('Егор Крид');

INSERT INTO Jenres(name)
     VALUES ('Поп-музыка'), 
            ('Хип-хоп'), 
            ('Рэп'),
		  ('Шансон');

INSERT INTO Albums(name, year)
     VALUES ('Last One', 2022),
	 	  ('АВГУСТ НАВСЕГДА', 2024),
		  ('Неприлично о личном', 2019),
		  ('Crybaby', 2016),
		  ('Жиган-лимон', 1994),
		  ('Pussy Boy', 2021);

INSERT INTO AlbumsArtists(musical_artist_id, album_id)
     VALUES (1, 1),
            (2, 2),
            (3, 3),
            (4, 4),
            (5, 5),
            (6, 6),
            (6, 3),
		  (1, 4),
		  (2, 5);

INSERT INTO ArtistsJenres(musical_artist_id, jenre_id)
     VALUES (1, 1),
            (1, 2),
            (1, 3),
            (2, 2),
            (2, 1),
            (3, 1),
            (4, 2),
            (4, 3),
            (5, 4),
            (6, 1),
            (6, 2),
            (6, 3);

INSERT INTO Recordings(album_id, name, duration)
     VALUES (1, 'Teaser', 184),
            (2, 'Сопрано', 201),
            (4, 'skyscrapers', 220),
            (6, 'Pussy boy', 179),
            (5, 'Календарь', 325),
            (2, 'Встать', 234),
            (1, 'SHEIKH', 222),
            (3, 'Ах этот мой кошмар', 245),
            (1, 'Детство', 125);

INSERT INTO Collections(name, year)
     VALUES ('Сборник рэпа', 2018),
            ('Сборник хип-хопа', 2019),
            ('DANCE-NON-STOP', 2024),
            ('Молодежные танцы', 2022),
            ('Бессмертная классика', 2020),
            ('Best wishes, RIP lil peep', 2024);

INSERT INTO CollectionsRecordings(recording_id, collection_id)
     VALUES (1, 1),
            (1, 2),
            (1, 3),
            (2, 1),
            (2, 2),
            (3, 6),
            (4, 1),
            (4, 2),
            (4, 3),
            (4, 4),
            (5, 5),
            (6, 1),
            (6, 2),
            (7, 1),
            (7, 2),
            (7, 3),
            (7, 4);
