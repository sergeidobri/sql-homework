/* Задание 2 */

-- 1
SELECT name, duration 
  FROM Recordings
 WHERE duration IN 
       (SELECT MAX(duration) 
       FROM Recordings);

-- 2
SELECT name
  FROM Recordings
 WHERE duration >= 210;

--3
SELECT col.name
  FROM Collections AS col
 WHERE col.year BETWEEN 2018 AND 2020;

--4
SELECT art.name
  FROM MusicalArtists AS art
 WHERE art.name LIKE '%_ _%';

--5
SELECT name 
  FROM Recordings 
 WHERE name ILIKE 'my' 
    OR name ILIKE '% my' 
	  OR name ILIKE 'my %' 
	  OR name ILIKE '% my %' 
	  OR name ILIKE 'мой' 
	  OR name ILIKE '% мой' 
	  OR name ILIKE 'мой %' 
	  OR name ILIKE '% мой %';

/* Задание 3 */

--1
  SELECT name, COUNT(*)
    FROM Jenres AS j
         LEFT JOIN ArtistsJenres AS aj
  	            ON aj.jenre_id = j.jenre_id
GROUP BY name;

--2
SELECT COUNT(*)
  FROM Recordings AS rec
       LEFT JOIN Albums AS a
              ON a.album_id = rec.album_id
           WHERE a.year BETWEEN 2019 AND 2020;

--3
  SELECT alb.name, AVG(duration)
    FROM Albums AS alb
         LEFT JOIN Recordings AS rec 
	              ON rec.album_id = alb.album_id
GROUP BY alb.name;

--4
SELECT mus_art.name
  FROM MusicalArtists AS mus_art
 WHERE mus_art.musical_artist_id NOT IN (
	     SELECT musical_artist_id 
		     FROM AlbumsArtists
         JOIN Albums ON Albums.album_id = AlbumsArtists.album_id
		    WHERE year = 2020
);

--5
  SELECT col.name 
    FROM Collections AS col
		LEFT JOIN CollectionsRecordings AS cr ON col.collection_id = cr.collection_id
		LEFT JOIN Recordings AS rec ON rec.recording_id = cr.recording_id
		LEFT JOIN Albums AS alb ON alb.album_id = rec.recording_id
		LEFT JOIN AlbumsArtists AS aa ON aa.album_id = alb.album_id
		LEFT JOIN MusicalArtists AS art ON art.musical_artist_id = aa.musical_artist_id
   WHERE art.musical_artist_id = 5
GROUP BY col.name;

/* Задание 4 (необязательное)*/

--1
SELECT alb.name 
  FROM Albums AS alb
       LEFT JOIN AlbumsArtists AS aa 
	            ON aa.album_id = alb.album_id
           WHERE aa.musical_artist_id IN 
		             (SELECT aj.musical_artist_id 
				            FROM ArtistsJenres AS aj 
				        GROUP BY musical_artist_id 
				          HAVING COUNT(*) > 2);
  
--2
SELECT rec.name 
  FROM Recordings AS rec
       LEFT JOIN CollectionsRecordings AS cr 
	          ON rec.recording_id = cr.recording_id
 WHERE cr.collection_id IS NULL;

--3
  SELECT art.name 
    FROM MusicalArtists AS art
         LEFT JOIN AlbumsArtists AS aa 
                ON art.musical_artist_id = aa.musical_artist_id
         LEFT JOIN Recordings AS rec 
                ON rec.album_id = aa.album_id
             WHERE rec.duration = (SELECT MIN(duration) 
                                     FROM Recordings)
GROUP BY art.name;

--4
  SELECT alb.name 
    FROM Albums AS alb
         LEFT JOIN Recordings AS rec 
   	            ON rec.album_id = alb.album_id
GROUP BY alb.name
  HAVING COUNT(rec.recording_id) IN 
          (SELECT MIN(total) 
		         FROM (SELECT COUNT(*) as total 
			               FROM Albums AS alb2
                          LEFT JOIN Recordings AS rec2 
						                     ON rec2.album_id = alb2.album_id
         GROUP BY alb2.name));
