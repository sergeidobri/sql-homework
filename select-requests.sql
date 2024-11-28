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
SELECT rec.name
  FROM Recordings AS rec
 WHERE rec.name LIKE '%my%'
    OR rec.name LIKE '%мой%';

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
  SELECT art.name 
    FROM MusicalArtists AS art
         LEFT JOIN AlbumsArtists AS aa 
	              ON art.musical_artist_id = aa.musical_artist_id
	       LEFT JOIN Albums AS a 
	              ON aa.album_id = a.album_id
		         WHERE a.year != 2020
GROUP BY art.name;

--5
SELECT col.name
  FROM Collections AS col
 WHERE col.name LIKE '%lil peep%';

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
SELECT rec1.name 
  FROM Recordings AS rec1 
 WHERE rec1.recording_id NOT IN 
       (SELECT rec2.recording_id 
	        FROM Recordings AS rec2
			         RIGHT JOIN CollectionsRecordings AS cr 
			                 ON rec2.recording_id = cr.recording_id);

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
